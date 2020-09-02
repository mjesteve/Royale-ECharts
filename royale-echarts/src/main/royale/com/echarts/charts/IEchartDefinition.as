package com.echarts.charts
{
    
	public interface IEchartDefinition
	{
		
		function get options():Object;
        function set options(value:Object):void;
        
		function optionChartInit():Object;
	}
}