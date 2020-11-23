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
		import com.iest.echarts.EChartsBasicControl;EChartsBasicControl;
		import com.iest.echarts.EChartsWithThemeControl;EChartsWithThemeControl;
		import com.iest.echarts.EChartsThemeLoader;EChartsThemeLoader;
		import com.iest.echarts.controllers.EChartsThemesController;EChartsThemesController;
		}
		import com.iest.echarts.IEChartsBasic; IEChartsBasic;
		import com.iest.echarts.beads.EChartEventsBead;EChartEventsBead;
		import com.iest.echarts.events.EChartsEvent;EChartsEvent;
		import com.iest.echarts.events.EChartsThemesEvent;EChartsThemesEvent;
		import com.iest.echarts.models.EChartsThemesModel;EChartsThemesModel;
		import com.iest.echarts.vos.EChartsCallBackFunctionVO;EChartsCallBackFunctionVO;
		import com.iest.echarts.vos.EChartsInstanceVO;EChartsInstanceVO;
		import com.iest.echarts.vos.EChartsThemeTemplateVO;EChartsThemeTemplateVO;
		import com.iest.echarts.EChartsLoader;EChartsLoader;
	}
}

