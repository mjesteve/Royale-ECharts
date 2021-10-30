package org.apache.royale.community.charts
{

	import org.apache.royale.community.vos.ChartDefExampleVO;

	public interface IEchartExampleBasic
	{

		function get itemChartDef():ChartDefExampleVO;
        function set itemChartDef(value:ChartDefExampleVO):void;

		function get allDesktop():Boolean;

		function activate():void;
	}
}