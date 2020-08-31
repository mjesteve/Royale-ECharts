package com.proj.example.echarts
{

    import org.apache.royale.core.Bead;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.Event;
    import org.apache.royale.net.HTTPConstants;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import com.proj.example.echarts.model.EChartsModel;

    public class EChartsThemeBead extends Bead 
    {

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
         *  @royaleignorecoercion EChartsComponent
         */
        override public function set strand(value:IStrand):void 
        {
            super.strand = value;
        }
        
		protected function get hostComponent():EChartsComponent
		{
			return (_strand as EChartsComponent);
		}
        
		protected function get echartsModel():EChartsModel
		{
			return hostComponent.echartsModel;
		}

        private var _themeNameLoading:String;
        private var _themeConfigLoading:Object;
        private var _lastExecute:Number = NaN;

		public function get themeInstance():Object{
            return hostComponent.themeInstance; 
        }
		public function set themeInstance(value:Object):void
        {
            if(!echartsModel)
                return;
            if(!echartsModel.withThemesSupport)
                return;

            trace("set themeInstance BEAD "+value);
            if(typeof value == 'string')
            {
                var themename:String = value as String;
                if(themename == themeInstance as String)
                    return;

                var themeObj:EChartsThemeTemplateVO = echartsModel.itemTheme(themename);
                if(themeObj)
                {
                    if(themeObj.isReg)
                    {
                        trace("theme "+value+" load");
                        hostComponent.themeInstance = value;
                    }
                    else
                    {	
                        trace("theme "+value+" Not load");
                        _themeNameLoading = value as String;

                        if(!EChartsThemeTemplates.loadInProgress)
                        {
                            trace("NOT loadInProgress. Put load.");
                            EChartsThemeTemplates.serviceJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
                            EChartsThemeTemplates.serviceJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
                            EChartsThemeTemplates.loadTheme(_themeNameLoading);
                        }
                        else
                        {
                            trace("loadInProgress. setTimeout.");
                            _lastExecute = setTimeout(delayRetry,1000,value);
                            trace("Id setTimeout:", _lastExecute.toString());
                        }
                    }
                }else{
                    //The Theme with this name does not exist.
                }
            }
            else{
                //Unfinished. Temporary issues.
                
                //Custom Theme.
                //Retrive Name.
            }
            trace("EXIT set themeInstance BEAD (value, _themeNameLoading):", value, _themeNameLoading);
        }

        private function delayRetry(valueTheme:Object):void{
            //We know that the Theme exists and that it was not loaded. 
            trace("delayRetry:", valueTheme);
            if(EChartsThemeTemplates.loadInProgress)
            {
                _lastExecute = setTimeout(delayRetry,1000,valueTheme);
                trace("delayRetry. loadInProgress. New Id setTimeout:", _lastExecute.toString());
            }else{
                _lastExecute = NaN;
                trace("delayRetry. NOT loadInProgress.");
                themeInstance = valueTheme;
            }
            trace("EXIT delayRetry:", valueTheme);
        }

        private function loadThemeFromTemplateComplete(e:Event):void{
            trace("loadThemeFromTemplateComplete:", _themeNameLoading);
            EChartsThemeTemplates.serviceJSON.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            if(!isNaN(_lastExecute))
            {
                trace("FROM _lastExecute clearTimeout:", _lastExecute);
                clearTimeout(_lastExecute);
                _lastExecute = NaN;
            } 
            hostComponent.themeInstance = _themeNameLoading;
            _themeNameLoading = "";
            trace("EXIT loadThemeFromTemplateComplete:",  hostComponent.themeInstance);
        } 

        private function loadThemeFromTemplateError(e:Event):void{
            trace("loadThemeFromTemplateError:", _themeNameLoading);
            EChartsThemeTemplates.serviceJSON.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            if(!isNaN(_lastExecute))
            {
                clearTimeout(_lastExecute);
                _lastExecute = NaN;
            }
            trace("EXIT loadThemeFromTemplateError:",  _themeNameLoading);
            _themeNameLoading = "";
        } 


    }
}
