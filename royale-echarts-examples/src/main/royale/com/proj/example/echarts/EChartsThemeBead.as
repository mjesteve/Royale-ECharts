package com.proj.example.echarts
{

    import org.apache.royale.core.IBead;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.Event;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.URLRequest;
    import org.apache.royale.events.ItemRemovedEvent;

    public class EChartsThemeBead implements IBead {

        protected var _strand:IStrand;

        public function EChartsThemeBead() {
            super();
        }

        /**
         *  @copy org.apache.royale.core.IBead#strand
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.8
         */
        public function set strand(value:IStrand):void {
            _strand = value;
            //(_strand as EChartsComponent).addEventListener('themeInstanceChange', themeInstanceChange);
            hostElement.withThemeBead = true;
        }

        private var _themeNameLoading:String;
		private var _themeInstance:Object;
		public function get themeInstance():Object{
            return _themeInstance; 
        }
		public function set themeInstance(value:Object):void
        {
            if(typeof value == 'string')
            {
                var themename:String = value as String;
                if(themename == _themeInstance as String)
                    return;

                var themeObj:Object = EChartsThemeTemplates.themesLoad[themename];
                if(themeObj)
                {
                    _themeInstance = value;
                    if(themeObj.isReg){
                        hostElement.themeInstance = value;                                              
                    }else{	
                        _themeNameLoading = themename;
                        var xmlLoader:URLLoader = new URLLoader();
                        xmlLoader.addEventListener(Event.COMPLETE, loadXML);
                        xmlLoader.load(new URLRequest("themes/json/"+value+".json"));
                    }
                }
            }else{
                //Unfinished. Temporary issues.
                //_themeInstance = value; 
            }
        }

        private function loadXML(e:Event):void{
            var objData:Object = e.target.data;
            var jsonData:Object = JSON.parse(objData as String);
            EChartsThemeTemplates.updateTheme(_themeNameLoading,jsonData);
            hostElement.loadThemeComplete(_themeNameLoading);           
        } 


        protected function themeInstanceChange(event:Event):void 
        {
            trace("themeCHANGEEEEEEEEEEEEEEEEEEEEEEEE");
        }
        
		protected function get hostElement():EChartsComponent
		{
			return (_strand as EChartsComponent);
		}


    }
}
