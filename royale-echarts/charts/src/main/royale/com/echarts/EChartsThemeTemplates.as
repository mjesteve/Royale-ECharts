/**
 * Pending separate on model / controller with events
 */
package com.echarts
{
	import org.apache.royale.utils.ObjectMap;
    import org.apache.royale.events.Event;
    import org.apache.royale.events.EventDispatcher;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.URLRequest;
    import org.apache.royale.net.HTTPConstants;
    import com.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.collections.ArrayList;
    import com.echarts.echarts;

    public class EChartsThemeTemplates extends EventDispatcher
    {
		public function EChartsThemeTemplates(){
			super()
		}

        static public var serviceJSON:URLLoader = new URLLoader();

		static private var _themesLoad:ObjectMap;
		static public function get themesLoad():ObjectMap
		{
			if(_themesLoad == null){
				_themesLoad = new ObjectMap();
				_themesLoad['default'] = new EChartsThemeTemplateVO('default', 'themes/thumb/default.png');
				_themesLoad['chalk'] = new EChartsThemeTemplateVO('chalk', 'themes/thumb/chalk.png');
				_themesLoad['dark'] = new EChartsThemeTemplateVO('dark', 'themes/thumb/dark.png');
				_themesLoad['essos'] = new EChartsThemeTemplateVO('essos', 'themes/thumb/essos.png');
				_themesLoad['halloween'] = new EChartsThemeTemplateVO('halloween', 'themes/thumb/halloween.png');				
				_themesLoad['infographic'] = new EChartsThemeTemplateVO('infographic', 'themes/thumb/infographic.png');
				_themesLoad['macarons'] = new EChartsThemeTemplateVO('macarons', 'themes/thumb/macarons.png');
				_themesLoad['purple-passion'] = new EChartsThemeTemplateVO('purple-passion', 'themes/thumb/purple-passion.png');
				_themesLoad['roma'] = new EChartsThemeTemplateVO('roma', 'themes/thumb/roma.png');
				_themesLoad['shine'] = new EChartsThemeTemplateVO('shine', 'themes/thumb/shine.png');
				_themesLoad['vintage'] = new EChartsThemeTemplateVO('vintage', 'themes/thumb/vintage.png');
				_themesLoad['walden'] = new EChartsThemeTemplateVO('walden', 'themes/thumb/walden.png');
				_themesLoad['westeros'] = new EChartsThemeTemplateVO('westeros', 'themes/thumb/westeros.png');
				_themesLoad['wonderland'] = new EChartsThemeTemplateVO('wonderland', 'themes/thumb/wonderland.png');
			}
			return _themesLoad;
		}

		static public function itemThemeFromName(themeName:String):EChartsThemeTemplateVO
		{
			if(_themesLoad[themeName])
                return _themesLoad[themeName] as EChartsThemeTemplateVO;
			else
				return null;
		}

		static public function themesLoadArrayList():ArrayList
		{
			var ar:ArrayList = new ArrayList();
			var dic:ObjectMap = themesLoad;
			for(var key:String in dic)
			{
				if(_themesLoad[key] is EChartsThemeTemplateVO)
					ar.addItem(_themesLoad[key] as EChartsThemeTemplateVO);
			}
			return ar;
		}

        static public function updateConfigTheme(themeName:String,themeConfig:Object):void{
            trace(">>>>> updateConfigTheme:", themeName);
            if(itemThemeFromName(themeName)){
                itemThemeFromName(themeName).jsonConfig = themeConfig;
            	trace(">>>>> updateConfigTheme SET OK");
            }
            trace(">>>>> EXIT updateConfigTheme:", themeName);
        }

		static public var loadInProgress:Boolean = false;
        static public function loadTheme(themeName:String,themeConfig:Object=null):void{
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

        }

		static public var itemLoadingTheme:EChartsThemeTemplateVO;
		
		static private function loadFromFile(themeName:String):void
		{			
            trace(">>>>> loadFromFile. themeName loadInProgress:",themeName, loadInProgress);
			if(loadInProgress) return;

			itemLoadingTheme = itemThemeFromName(themeName);
			if( itemLoadingTheme )
			{
				if(!itemLoadingTheme.jsonConfig)
				{
					trace(">>>>> loadFromFile. EXIST themeName NO custom.",themeName);
					loadInProgress = true;
					serviceJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
					serviceJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);         
					serviceJSON.load(new URLRequest("themes/json/"+themeName+".json"));
					trace(">>>>> loadFromFile. serviceJSON.load themeName", itemLoadingTheme.themeName);				
				}
				else
				{
					trace(">>>>> loadTheme. EXIST themeName custom or preload.",itemLoadingTheme.themeName);
					//WIP
				}
            
			}else{
				//WIP
			}
			trace(">>>>> EXIT loadFromFile. themeName, loadInProgress",themeName, loadInProgress);

		}

        static private function loadThemeFromTemplateComplete(e:Event):void
		{            
            trace(">>>>> loadThemeFromTemplateComplete:", itemLoadingTheme.themeName);
            serviceJSON.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);

			var objData:Object = serviceJSON.data;
			var jsonData:Object = JSON.parse(objData as String);
            trace(">>>>> DATA loadThemeFromTemplateComplete _themeNameLoading:", itemLoadingTheme.themeName, objData);

			updateConfigTheme(itemLoadingTheme.themeName,jsonData);			
			registerTheme(itemLoadingTheme.themeName,jsonData); 
			loadInProgress = false;
            trace(">>>>> EXIT loadThemeFromTemplateComplete. themeName loadInProgress:",itemLoadingTheme.themeName, loadInProgress);
			itemLoadingTheme = null;
        } 

        static private function loadThemeFromTemplateError(e:Event):void{
            trace(">>>>> loadThemeFromTemplateError:", itemLoadingTheme.themeName);
            serviceJSON.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
			loadInProgress = false;
			itemLoadingTheme = null;
            trace(">>>>> EXIT loadThemeFromTemplateError");
        } 

        static public function registerTheme(themeName:String,themeConfig:Object):void{
            trace(">>>>> registerTheme:", themeName);
            if(itemThemeFromName(themeName)){
				echarts.registerTheme(themeName,themeConfig);
            	trace(">>>>> registerTheme SET OK");
                itemThemeFromName(themeName).isReg = true;
            }
            trace(">>>>> EXIT registerTheme:", themeName);
        }

		static private var countCustomTheme:int=0;
		static public function addTheme(themeConfig:Object, themeName:String=""):void
		{
			do
			{
				if(!themeName){
					countCustomTheme++;
					themeName = "custom_"+countCustomTheme.toString();
				}else{
					if(itemThemeFromName(themeName))
						themeName="";
				}
			}
			while(themeName && itemThemeFromName(themeName));
			_themesLoad[themeName] = new EChartsThemeTemplateVO(themeName, null, themeConfig, false, true);
		}

    }
}