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
		import com.iest.royale.echarts.EChartsBasicControl;EChartsBasicControl;
		import com.iest.royale.echarts.EChartsWithThemeControl;EChartsWithThemeControl;
		import com.iest.royale.echarts.EChartsThemeLoader;EChartsThemeLoader;
		import com.iest.royale.echarts.controllers.EChartsThemesController;EChartsThemesController;
		}
		import com.iest.royale.echarts.IEChartsBasic; IEChartsBasic;
		import com.iest.royale.echarts.beads.EChartEventsBead;EChartEventsBead;
		import com.iest.royale.echarts.events.EChartsEvent;EChartsEvent;
		import com.iest.royale.echarts.events.EChartsThemesEvent;EChartsThemesEvent;
		import com.iest.royale.echarts.models.EChartsThemesModel;EChartsThemesModel;
		import com.iest.royale.echarts.vos.EChartsCallBackFunctionVO;EChartsCallBackFunctionVO;
		import com.iest.royale.echarts.vos.EChartsInstanceVO;EChartsInstanceVO;
		import com.iest.royale.echarts.vos.EChartsThemeTemplateVO;EChartsThemeTemplateVO;
		import com.iest.royale.echarts.EChartsLoader;EChartsLoader;
	}
}

