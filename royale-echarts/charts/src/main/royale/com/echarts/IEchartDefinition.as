package com.echarts
{
    
	public interface IEchartDefinition
	{
		
		function get options():Object;
        function set options(value:Object):void;
        
		function optionChartInit():Object;
	}
}