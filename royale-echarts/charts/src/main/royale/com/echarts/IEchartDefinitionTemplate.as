package com.echarts
{
    
	import com.echarts.vos.ChartDefExampleVO;
	import com.echarts.EChartsContainer;

	public interface IEchartDefinitionTemplate
	{
		
		function get itemChartDef():ChartDefExampleVO;
        function set itemChartDef(value:ChartDefExampleVO):void;
        
        function get chartComponent():EChartsContainer;
		
	}
}