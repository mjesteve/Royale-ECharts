/**
 * Pending separate on model / controller with events
 */
package com.proj.example.echarts
{
	import org.apache.royale.utils.ObjectMap;
    import org.apache.royale.events.Event;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.URLRequest;
    import org.apache.royale.net.HTTPConstants;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.collections.ArrayList;

    [Bindable]
    public class EChartsThemeTemplates
    {        
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

		static public function itemTheme(themeName:String):EChartsThemeTemplateVO
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
            if(itemTheme(themeName)){
                itemTheme(themeName).jsonConfig = themeConfig;
            	trace(">>>>> updateConfigTheme SET OK");
            }
            trace(">>>>> EXIT updateConfigTheme:", themeName);
        }

		static public var loadInProgress:Boolean = false;
        static public function loadTheme(themeName:String,themeConfig:Object=null):void{
            trace(">>>>> loadTheme. themeName themeConfig:",themeName, themeConfig?themeConfig:'');
			if(!themeName)
				return;
			
            if(itemTheme(themeName) ){
				if(!itemTheme(themeName).custom){
            		trace(">>>>> loadTheme. EXIST themeName NO custom.",themeName);
                	loadFromFile(themeName);
				}else{
            		trace(">>>>> loadTheme. EXIST themeName custom.",themeName);

				}
			}
            trace(">>>>> EXIT loadTheme. themeName.",themeName);

        }

        static private var _themeNameLoading:String;
        static public var serviceJSON:URLLoader = new URLLoader();
		static private function loadFromFile(themeName:String):void
		{			
            trace(">>>>> loadFromFile. themeName loadInProgress:",themeName, loadInProgress);
			if(!loadInProgress && !itemTheme(themeName).jsonConfig)
			{
				loadInProgress = true;
				_themeNameLoading = themeName;
				serviceJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
				serviceJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);         
				serviceJSON.load(new URLRequest("themes/json/"+themeName+".json"));
            	trace(">>>>> loadFromFile. serviceJSON.load themeName", _themeNameLoading);
			} 
            trace(">>>>> EXIT loadFromFile. themeName loadInProgress:",_themeNameLoading, loadInProgress);
		}

        static private function loadThemeFromTemplateComplete(e:Event):void
		{            
            trace(">>>>> loadThemeFromTemplateComplete:", _themeNameLoading);
            serviceJSON.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
			var objData:Object = serviceJSON.data;
			var jsonData:Object = JSON.parse(objData as String);
            trace(">>>>> DATA loadThemeFromTemplateComplete _themeNameLoading:", _themeNameLoading, objData);
			updateConfigTheme(_themeNameLoading,jsonData);
			registerTheme(_themeNameLoading,jsonData); 
			loadInProgress = false;
            trace(">>>>> EXIT loadThemeFromTemplateComplete. themeName loadInProgress:",_themeNameLoading, loadInProgress);
			_themeNameLoading = "";
        } 

        static private function loadThemeFromTemplateError(e:Event):void{
            trace(">>>>> loadThemeFromTemplateError:", _themeNameLoading);
            serviceJSON.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
			loadInProgress = false;
            _themeNameLoading = "";
            trace(">>>>> EXIT loadThemeFromTemplateError");
        } 

        static public function registerTheme(themeName:String,themeConfig:Object):void{
            trace(">>>>> registerTheme:", themeName);
            if(itemTheme(themeName)){
				echarts.registerTheme(themeName,themeConfig);
            	trace(">>>>> registerTheme SET OK");
                itemTheme(themeName).isReg = true;
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
					if(itemTheme(themeName))
						themeName="";
				}
			}
			while(themeName && itemTheme(themeName));
			_themesLoad[themeName] = new EChartsThemeTemplateVO(themeName, null, themeConfig, false, true);
		}

    }
}