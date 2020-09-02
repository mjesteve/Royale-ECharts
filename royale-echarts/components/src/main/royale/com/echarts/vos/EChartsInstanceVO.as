package com.echarts.vos
{

    [Bindable]
    public class EChartsInstanceVO
    {
        private var _id:String;
        public function get id():String
        {
            if(!_id && _jsInstance)
                _id = _jsInstance.id;
            return _id; 
        }
        public function set id(value:String):void{ _id = value; }

        private var _jsInstance:Object;
        public function get jsInstance():Object{ return _jsInstance; }
        public function set jsInstance(value:Object):void{ 
            _jsInstance = value; 
            if(!_id)
                _id = _jsInstance.id;
        }
        
        public var isInit:Boolean;

        public function EChartsInstanceVO(jsInstance:Object=null) 
        {
            this.jsInstance = jsInstance;
        }

    }
}

