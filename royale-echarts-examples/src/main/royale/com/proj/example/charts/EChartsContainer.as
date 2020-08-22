package com.proj.example.charts
{

    public class EChartsContainer extends EChartsComponent
    {
        
        public function EChartsContainer()
        {
            super();
        }

        public var autoLoad:Boolean = true;

        private var _optionsInit:Object;

        [Bindable("__NoChangeEvent__")]
        public function get optionsInit():Object{ 
            return _optionsInit; 
        }
        public function set optionsInit(value:Object):void
        { 
            _optionsInit = value;
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
                setOption(_optionsInit);                
                resize({width: 'auto', height: 'auto'});
            }
        }

    }
}