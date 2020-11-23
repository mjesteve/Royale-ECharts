package echarts
{
    import echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.utils.js.loadJavascript;
	
	COMPILE::JS
	public class EChartsWithThemeControl extends EChartsBasicControl
    {

        /**
         *  Constructor.
         */
        public function EChartsWithThemeControl()
		{
			super();
            addEventListener("beadsAdded", beadsAddedHandler);
		}

        public function beadsAddedHandler(event:Event):void
        {
            removeEventListener("beadsAdded", beadsAddedHandler);  

            globalECharts.withThemesSupport = true;
        }
        
		override public function addedToParent():void
		{
			super.addedToParent();
		}

        private var _themeNameLoading:String;
		/**
		 * @param themeName string  - Default templates
		 */
        override public function set themeName(value:String):void
        {
            if(_themeName != value)
            {
                var itTheme:EChartsThemeTemplateVO = EChartsThemeLoader.itemThemeFromName(value);
                if(itTheme)
                {
                    //theme native(autoload) || registered 
                    if(itTheme.isNative || itTheme.isReg)
                    {
                        if(itTheme.custom && itTheme.isNative)
                            _themeName = null; //We respect the design applied with setOption
                        else
                            _themeName = itTheme.themeName;
                    }
                    else if(!itTheme.isReg)
                    {
                        if(itTheme.jsFormat)
                        {
                            _themeNameLoading = value;
                            loadJSTheme('themes/js/'+value+'.js');
                        }else{

                        }
                    }else{

                    }

                }else{
                    //Add new theme
                }
            }
        }

        protected function loadJSTheme(srcJSTheme:String):void{
            loadJavascript(srcJSTheme,completeLoadJSTheme);
        }

        protected function completeLoadJSTheme(event:Event):void{
             _themeName = _themeNameLoading;
             var itTheme:EChartsThemeTemplateVO = EChartsThemeLoader.itemThemeFromName(_themeName);
             itTheme.isReg = true;
             _themeNameLoading = "";
        }
    
		/**
		 * Update Theme Instance Echarts.
		 */
        override public function UpdateTheme(themename:String=null):void
        {
            if(!_instanceECharts) 
                return;

            if(_themeName == themename)
                return;

            if(_oldThemeName == _themeName) //Current theme applied
                instanceECharts = null;
            else //Theme pending to apply
                clear();
            
            themeName = themename;

			init(true);
        }

	}
}