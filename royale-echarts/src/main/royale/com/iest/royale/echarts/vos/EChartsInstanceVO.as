package com.iest.royale.echarts.vos
{

    [Bindable]
    public class EChartsInstanceVO
    {
        private var _id:String;
        public function get id():String
        {
            return _id; 
        }
        public function set id(value:String):void{ _id = value; }

        private var _jsInstance:Object;
        public function get jsInstance():Object{ return _jsInstance; }
        public function set jsInstance(value:Object):void{ 
            try
            {
                if(value)
                    _id = value['id'] as String;
                else
                    _id = "";
                _jsInstance = value; 
                    
            }
            catch (error:Error)
            {
                trace(error.message);

            }
        }

        public function EChartsInstanceVO(jsinstance:Object=null) 
        {
            jsInstance = jsinstance;
        }

    }
}

