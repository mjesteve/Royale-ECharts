package com.echarts.charts
{
    
	import com.echarts.components.vos.ChartDefExampleVO;
	import com.echarts.components.EChartsContainer;

	public interface IEchartDefinitionTemplate
	{
		
		function get itemChartDef():ChartDefExampleVO;
        function set itemChartDef(value:ChartDefExampleVO):void;
        
        function get chartComponent():EChartsContainer;
		
	}
}