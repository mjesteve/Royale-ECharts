package com.proj.example.echarts
{
    
	public interface IEchartDefinition
	{
		
		function get options():Object;
        function set options(value:Object):void;
        
		function optionsInit():Object;
	}
}