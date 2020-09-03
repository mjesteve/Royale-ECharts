package com.proj.example.charts
{
    
	import com.proj.example.vos.ChartDefExampleVO;

	public interface IEchartExampleBasic
	{
		
		function get itemChartDef():ChartDefExampleVO;
        function set itemChartDef(value:ChartDefExampleVO):void;

		function refresh():void;
	}
}