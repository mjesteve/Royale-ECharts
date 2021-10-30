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
		}
		import org.apache.royale.community.echarts.controllers.EChartsThemesController;EChartsThemesController;
		import org.apache.royale.community.echarts.EChartsWithThemeControl;EChartsWithThemeControl;
		import org.apache.royale.community.echarts.EChartsThemeLoader;EChartsThemeLoader;
		import org.apache.royale.community.echarts.EChartsBasicControl;EChartsBasicControl;
		import org.apache.royale.community.echarts.IEChartsBasic; IEChartsBasic;
		import org.apache.royale.community.echarts.beads.EChartEventsBead;EChartEventsBead;
		import org.apache.royale.community.echarts.events.EChartsEvent;EChartsEvent;
		import org.apache.royale.community.echarts.events.EChartsThemesEvent;EChartsThemesEvent;
		import org.apache.royale.community.echarts.models.EChartsThemesModel;EChartsThemesModel;
		import org.apache.royale.community.echarts.vos.EChartsCallBackFunctionVO;EChartsCallBackFunctionVO;
		import org.apache.royale.community.echarts.vos.EChartsInstanceVO;EChartsInstanceVO;
		import org.apache.royale.community.echarts.vos.EChartsThemeTemplateVO;EChartsThemeTemplateVO;
		import org.apache.royale.community.echarts.EChartsLoader;EChartsLoader;
	}
}

