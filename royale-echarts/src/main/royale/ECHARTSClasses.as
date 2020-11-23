package 
{

	/**
	 *  @private
	 *  This class is used to link additional classes into rpc.swc
	 *  beyond those that are found by dependency analysis starting
	 *  from the classes specified in manifest.xml.
	 */
	internal class ECHARTSClasses
	{
		COMPILE::JS
		{
		import echarts; echarts;
		import echarts.IEChartsBasic; IEChartsBasic;
		import echarts.beads.EChartEventsBead;EChartEventsBead;
		import echarts.controllers.EChartsThemesController;EChartsThemesController;
		import echarts.events.EChartsEvent;EChartsEvent;
		import echarts.events.EChartsThemesEvent;EChartsThemesEvent;
		import echarts.models.EChartsThemesModel;EChartsThemesModel;
		import echarts.vos.EChartsCallBackFunctionVO;EChartsCallBackFunctionVO;
		import echarts.vos.EChartsInstanceVO;EChartsInstanceVO;
		import echarts.vos.EChartsThemeTemplateVO;EChartsThemeTemplateVO;
		import echarts.EChartsBasicControl;EChartsBasicControl;
		import echarts.EChartsLoader;EChartsLoader;
		import echarts.EChartsThemeLoader;EChartsThemeLoader;
		import echarts.EChartsWithThemeControl;EChartsWithThemeControl;
		}
	}
}

