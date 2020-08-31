package com.proj.example.charts
{
    
	import com.proj.example.vos.ChartDefExampleVO;
	import com.proj.example.echarts.EChartsContainer;

	public interface IEchartDefinitionTemplate
	{
		
		function get itemChartDef():ChartDefExampleVO;
        function set itemChartDef(value:ChartDefExampleVO):void;
        
        function get chartComponent():EChartsContainer;
		
	}
}