package com.proj.example.echarts
{

    import org.apache.royale.core.Bead;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.Event;
    import org.apache.royale.net.HTTPConstants;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import com.proj.example.echarts.models.EChartsModel;
    import com.proj.example.echarts.models.EChartsThemesModel;
    import org.apache.royale.events.IEventDispatcher;
    import com.proj.example.echarts.events.EChartsThemesEvent;

    public class EChartsThemeBead extends Bead
    {
            
        [Bindable]
        [Inject(source="echartsThemesModel", required="true")]
        public var echartsThemesModel:EChartsThemesModel;

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

        private var _enabled:Boolean = true;
        public function get enabled():Boolean{ return _enabled; }
        public function set enabled(value:Boolean):void{ 
            //WIP
            _enabled = value; 
        }

        private var _themeNameLoading:String;
        private var _themeConfigLoading:Object;
        private var _lastExecute:Number = NaN;
        private var _themeNameRegistering:String;

		public function get themeInstance():Object{
            return hostComponent.themeInstance; 
        }
		public function set themeInstance(value:Object):void
        {
            if(!enabled || !echartsModel || !echartsModel.withThemesSupport)
                return;

            trace("set themeInstance BEAD "+value);
            if(typeof value == 'string')
            {
                var themename:String = value as String;
                if(themename == themeInstance as String)
                    return;

                var themeObj:EChartsThemeTemplateVO = echartsThemesModel.itemThemeFromName(themename);
                if(themeObj)
                {
                    if(themeObj.isReg)
                    {
                        trace("theme "+value+" load");
                        hostComponent.themeInstance = value;
                    }
                    else if(themeObj.jsonConfig)
                    {
                        _themeNameRegistering = themename;                        
                        (_strand as IEventDispatcher).dispatchEvent(new EChartsThemesEvent(
                            EChartsThemesEvent.ON_REGISTERTHEME,themeObj)
                        );

                    }else
                    {	
                        trace("theme "+themename+" Not load");
                        _themeNameLoading = themename;                     
                        (_strand as IEventDispatcher).dispatchEvent(new EChartsThemesEvent(
                            EChartsThemesEvent.ON_LOADTHEMEFROMFILE,themeObj)
                        );
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
          
        [EventHandler(event="EChartsThemesEvent.ON_COMPLETE_REGISTERTHEME", scope="global")]
        public function onCompleteRegister(event:EChartsThemesEvent):void
        {
            if(event.itemSelTheme.themeName != _themeNameRegistering) return;

            trace("afterRegisterThemesEvent");
            _themeNameRegistering = "";
            hostComponent.themeInstance = event.itemSelTheme;
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE", scope="global")]
        public function onCompleteLoadThemeFromFile(event:EChartsThemesEvent):void
        {
            if(event.itemSelTheme.themeName != _themeNameLoading) return;

            trace("onCompleteLoadThemeFromFile");
            
            var themeObj:EChartsThemeTemplateVO = echartsThemesModel.itemThemeFromName(_themeNameLoading);
            if(themeObj.isReg)
                hostComponent.themeInstance = event.itemSelTheme;
            else{    
                _themeNameRegistering = _themeNameLoading;                    
                (_strand as IEventDispatcher).dispatchEvent(new EChartsThemesEvent(
                    EChartsThemesEvent.ON_REGISTERTHEME,themeObj)
                );
            }
            _themeNameLoading = "";
            _lastExecute = NaN;
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_WAIT_LOADTHEMEFROMFILE", scope="global")]
        public function onWaitLoadThemeFromFile(event:EChartsThemesEvent):void
        {
            if(event.itemSelTheme.themeName != _themeNameLoading) return;

            trace("onWaitLoadThemeFromFile");
            _lastExecute = setTimeout(delayRetry,1000,event.itemSelTheme);
            trace("Id setTimeout:", _lastExecute.toString());
        }


        private function delayRetry(valueTheme:EChartsThemeTemplateVO):void{
            //We know that the Theme exists and that it was not loaded. 
            trace("delayRetry:", valueTheme);                     
            (_strand as IEventDispatcher).dispatchEvent(new EChartsThemesEvent(
                EChartsThemesEvent.ON_LOADTHEMEFROMFILE,valueTheme)
            );
            /*if(EChartsThemeTemplates.loadInProgress)
            {
                _lastExecute = setTimeout(delayRetry,1000,valueTheme);
                trace("delayRetry. loadInProgress. New Id setTimeout:", _lastExecute.toString());
            }else{
                _lastExecute = NaN;
                trace("delayRetry. NOT loadInProgress.");
                themeInstance = valueTheme;
            }ON_ERROR_LOADTHEMEFROMFILE
            trace("EXIT delayRetry:", valueTheme);*/
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
