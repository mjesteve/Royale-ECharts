package com.iest.royale.echarts
{
	import org.apache.royale.utils.ObjectMap;
    import org.apache.royale.events.Event;
    import org.apache.royale.events.EventDispatcher;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.URLRequest;
    import org.apache.royale.net.HTTPConstants;
    import com.iest.royale.echarts.vos.EChartsThemeTemplateVO;
    import com.iest.royale.echarts.events.EChartsThemesEvent;
    import org.apache.royale.events.IEventDispatcher;
	

	[Event(name="onCompleteLoadThemeFromFile", type="com.iest.royale.echarts.events.EChartsThemesEvent")]
	[Event(name="onErrorLoadThemeFromFile", type="com.iest.royale.echarts.events.EChartsThemesEvent")]
	[Event(name="onWaitLoadThemeFromFile", type="com.iest.royale.echarts.events.EChartsThemesEvent")]
	[Event(name="onCompleteRegister", type="com.iest.royale.echarts.events.EChartsThemesEvent")]

    public class EChartsThemeLoader extends EventDispatcher
    {
		public function EChartsThemeLoader(){
			super()
		}

        //static public var loaderJSON:URLLoader;

		static protected var _themeTemplate:ObjectMap;
		static public function get themeTemplate():ObjectMap
		{
			if(_themeTemplate == null){
				_themeTemplate = new ObjectMap();
				_themeTemplate['default'] = new EChartsThemeTemplateVO('default', 'themes/thumb/defaultmin.png',null,true,false,true);
				_themeTemplate['light'] = new EChartsThemeTemplateVO('light', 'themes/thumb/lightmin.png',null,true,false,true);
				_themeTemplate['dark'] = new EChartsThemeTemplateVO('dark', 'themes/thumb/darkmin.png',null,true,false,true);
				_themeTemplate['custom'] = new EChartsThemeTemplateVO('custom', 'themes/thumb/rgb24.png',null,true,true,true);

				_themeTemplate['default-local'] = new EChartsThemeTemplateVO('default-local', 'themes/thumb/default.png');
				_themeTemplate['light-local'] = new EChartsThemeTemplateVO('light-local', 'themes/thumb/light.png');
				_themeTemplate['dark-local'] = new EChartsThemeTemplateVO('dark-local', 'themes/thumb/dark.png');

				_themeTemplate['chalk'] = new EChartsThemeTemplateVO('chalk', 'themes/thumb/chalk.png');
				_themeTemplate['essos'] = new EChartsThemeTemplateVO('essos', 'themes/thumb/essos.png');
				_themeTemplate['halloween'] = new EChartsThemeTemplateVO('halloween', 'themes/thumb/halloween.png');				
				_themeTemplate['infographic'] = new EChartsThemeTemplateVO('infographic', 'themes/thumb/infographic.png');
				_themeTemplate['macarons'] = new EChartsThemeTemplateVO('macarons', 'themes/thumb/macarons.png');
				_themeTemplate['purple-passion'] = new EChartsThemeTemplateVO('purple-passion', 'themes/thumb/purple-passion.png');
				_themeTemplate['roma'] = new EChartsThemeTemplateVO('roma', 'themes/thumb/roma.png');
				_themeTemplate['shine'] = new EChartsThemeTemplateVO('shine', 'themes/thumb/shine.png');
				_themeTemplate['vintage'] = new EChartsThemeTemplateVO('vintage', 'themes/thumb/vintage.png');
				_themeTemplate['walden'] = new EChartsThemeTemplateVO('walden', 'themes/thumb/walden.png');
				_themeTemplate['westeros'] = new EChartsThemeTemplateVO('westeros', 'themes/thumb/westeros.png');
				_themeTemplate['wonderland'] = new EChartsThemeTemplateVO('wonderland', 'themes/thumb/wonderland.png');
			}
			return _themeTemplate;
		}

		static public function itemThemeFromName(themeName:String):EChartsThemeTemplateVO
		{
			if(_themeTemplate[themeName])
                return _themeTemplate[themeName] as EChartsThemeTemplateVO;
			else
				return null;
		}

        static public function updateConfigTheme(themeName:String,themeConfig:Object):void{
            trace(">>>>> updateConfigTheme:", themeName);
            if(itemThemeFromName(themeName)){
                itemThemeFromName(themeName).jsonConfig = themeConfig;
            	trace(">>>>> updateConfigTheme SET OK");
            }
            trace(">>>>> EXIT updateConfigTheme:", themeName);
        }



        /*public function loadTheme(themeName:String,themeConfig:Object=null):void{
            trace(">>>>> loadTheme. themeName themeConfig:",themeName, themeConfig?themeConfig:'');
			if(!themeName)
				return;
			
            if(itemThemeFromName(themeName) ){
				if(!itemThemeFromName(themeName).custom){
            		trace(">>>>> loadTheme. EXIST themeName NO custom.",themeName);
                	loadFromFile(themeName);
				}else{
            		trace(">>>>> loadTheme. EXIST themeName custom.",themeName);

				}
			}
            trace(">>>>> EXIT loadTheme. themeName.",themeName);
        }*/

		private function resetVarLoader():void
		{
			loadInProgress = false;
			_registerAfterLoadTheme = false;
			_itemLoadingTheme = null;
		}

		static public var loadInProgress:Boolean = false;
		private var _registerAfterLoadTheme:Boolean = false;
		private var _itemLoadingTheme:EChartsThemeTemplateVO;		
		public function loadFromFile(themeName:String, register:Boolean=false):void
		{	
			var evt:EChartsThemesEvent;
			if(loadInProgress)
			{
				evt = new EChartsThemesEvent(EChartsThemesEvent.ON_WAIT_LOADTHEMEFROMFILE);
				evt.itemSelTheme = new EChartsThemeTemplateVO(themeName);
            	dispatchEvent(evt);	
            	trace(">>>>> EXIT loadFromFile. themeName - wait.",themeName);
			}
			else
			{	                
                loadInProgress = true;
				_registerAfterLoadTheme = register;
                _itemLoadingTheme = itemThemeFromName(themeName);
                if( _itemLoadingTheme )
                {
           		    trace(">>>>> EXIT loadFromFile. themeName.",themeName);
                    if(!_itemLoadingTheme.jsonConfig)
                    {
                        trace(">>>>> loadFromFile. EXIST themeName NO custom.",themeName);

                        var loaderJSON:URLLoader = new URLLoader();
                        //IOErrorEvent.IO_ERROR | SecurityErrorEvent.SECURITY_ERROR
                        loaderJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
                        loaderJSON.addEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);
                        //Event.COMPLETE
                        loaderJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);         
                        loaderJSON.load(new URLRequest("themes/json/"+themeName+".json"));
                        trace(">>>>> loadFromFile. serviceJSON.load themeName", themeName);				
                    }
                    else
                    {
                        trace(">>>>> loadTheme. EXIST themeName custom or preload.",_itemLoadingTheme.themeName);
                        //WIP
                        evt = new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE);
                        evt.itemSelTheme = _itemLoadingTheme;
                        dispatchEvent(evt);
						resetVarLoader();
                    }
                
                }else{
					evt = new EChartsThemesEvent(EChartsThemesEvent.ON_ERROR_LOADTHEMEFROMFILE);
					evt.itemSelTheme = new EChartsThemeTemplateVO(themeName);
					evt.status = 'The theme is not set';
					dispatchEvent(evt);
					resetVarLoader();
                }
			}
			trace(">>>>> EXIT loadFromFile. themeName, loadInProgress",themeName, loadInProgress);

		}

        private function loadThemeFromTemplateComplete(event:Event):void{
            trace("loadThemeFromTemplateComplete:", _itemLoadingTheme.themeName);
            
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);
            
			var objData:Object = (loaderDispatcher as URLLoader).data;
			var jsonData:Object = JSON.parse(objData as String);
            trace(">>>>> DATA loadThemeFromTemplateComplete _themeNameLoading:", _itemLoadingTheme.themeName, objData);
            _itemLoadingTheme.jsonConfig = jsonData;
			updateConfigTheme(_itemLoadingTheme.themeName,jsonData);

            var evt:EChartsThemesEvent = new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE);
            evt.itemSelTheme = _itemLoadingTheme;
            dispatchEvent(evt);
	
			if(_registerAfterLoadTheme)
			{		
				registerTheme(_itemLoadingTheme); 
			}
            resetVarLoader();
        } 

        private function loadThemeFromTemplateError(event:Event):void{
            trace("loadThemeFromTemplateError:", _itemLoadingTheme.themeName);
            
			trace(Object(event).text);
            
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);            
            
            var evt:EChartsThemesEvent;
			evt = new EChartsThemesEvent(EChartsThemesEvent.ON_ERROR_LOADTHEMEFROMFILE);
			evt.itemSelTheme = _itemLoadingTheme;           
            evt.status = Object(event).text as String;
            dispatchEvent(evt);
            resetVarLoader();
        } 

        private function registerTheme(itemTheme:EChartsThemeTemplateVO):void
		{
            trace(">>>>> registerTheme:", itemTheme.themeName);
            var it:EChartsThemeTemplateVO = itemThemeFromName(itemTheme.themeName);
            if(!it){
                if(addTheme(itemTheme))
					it = itemThemeFromName(itemTheme.themeName);
            }
			COMPILE::JS{
				echarts.registerTheme(it.themeName,it.jsonConfig);
			}
            trace(">>>>> registerTheme SET OK");
            it.isReg = true;
            dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_REGISTERTHEME, it));
            trace(">>>>> EXIT registerTheme:", it.themeName);
        }

		static private var countCustomTheme:int=0;
		public function addTheme(themeConfig:Object, themeName:String=""):String
		{
			var namelocal:String=themeName;
			do
			{
				if(!namelocal){
					countCustomTheme++;
					namelocal = "custom_"+countCustomTheme.toString();
				}else{
					if(itemThemeFromName(namelocal))
						namelocal="";
				}
			}
			while(namelocal && itemThemeFromName(namelocal));
			_themeTemplate[namelocal] = new EChartsThemeTemplateVO(namelocal, null, themeConfig, false, true);
			return namelocal;
		}

    }
}