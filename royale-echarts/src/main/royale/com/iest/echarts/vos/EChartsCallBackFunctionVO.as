package com.iest.echarts.vos
{

    [Bindable]
    public class EChartsCallBackFunctionVO
    {
        public var eventName:String;
        public var handler:Function;

        public function EChartsCallBackFunctionVO(eventName:String,handler:Function=null) 
        {
            this.eventName = eventName;
            this.handler = handler;
        }

    }
}

