package com.echarts.components
{

	//[DefaultProperty("currentInstance")]
    public class EChartsContainer extends EChartsComponent
    {
        
        public function EChartsContainer()
        {
            super();
        }

        public var _autoLoad:Boolean;

        [Bindable("__NoChangeEvent__")]
        public function get autoLoad():Boolean{ 
            return _autoLoad; 
        }
        public function set autoLoad(value:Boolean):void
        { 
            _autoLoad = value;
            if (_autoLoad && !isConfigure && _optionChartInit)
                reInit();
        }

        private var _optionChartInit:Object;

        [Bindable("__NoChangeEvent__")]
        public function get optionChartInit():Object{ 
            return _optionChartInit; 
        }
        public function set optionChartInit(value:Object):void
        { 
            _optionChartInit = value;
            if (autoLoad)
                reInit();
        }

        public function reInit():void
        {            
            if(!currentInstance)
                init();
            else
                clear();

            if(currentInstance){
                setOption(_optionChartInit);                
                resize({width: 'auto', height: 'auto'});
            }
        }

    }
}