package com.proj.example.echarts
{
    
    
	public interface IEChartsBasic
	{
		[Event(name="onCompleteInicialize", type="com.proj.example.echarts.events.EChartsEvent")];
        [Event(name="onCompleteConfig", type="com.proj.example.echarts.events.EChartsEvent")];
        
		function get isInit():Boolean;
        function set isInit(value:Boolean):void;
		
		function get isConfigure():Boolean;
        function set isConfigure(value:Boolean):void;

		function get configOption():Object;
        function set configOption(value:Object):void;

		function get instanceECharts():Object;
        function set instanceECharts(value:Object):void;
        
		function init(make:Boolean = false):void;
		function setOption(config:Object=null, lazyUpdate:Boolean=false, silent:Boolean=false):void;
        function getOption():Object;
        function clear():void;
        function resize(opts:Object = null):void;
        function on(eventName:String, handler:Function, query:Object = null, context:Object=null):void;
        function off(eventName:String, handler:Function = null):void;
	}
}