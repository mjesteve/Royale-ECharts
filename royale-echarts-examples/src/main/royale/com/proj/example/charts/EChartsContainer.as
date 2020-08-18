package com.proj.example.charts
{

    public class EChartsContainer extends EChartsComponent
    {
        
        public function EChartsContainer()
        {
            super();
        }

        private var _optionsInit:Object;
        public function get optionsInit():Object{ 
            return _optionsInit; 
        }
        public function set optionsInit(value:Object):void
        { 
            _optionsInit = value;
           reInit();            
        }

        [Bindable("optionsChange")]
        override public function get options():Object{ 
            return super.options; 
        }
        override public function set options(value:Object):void{
            if(!_optionsInit)
                optionsInit = value;
            
            super.options = value;
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