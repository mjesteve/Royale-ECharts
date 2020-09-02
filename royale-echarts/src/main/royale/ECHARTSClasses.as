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
		import com.echarts.echarts; echarts;
		import com.echarts.charts.EC_BAR001; EC_BAR001;
		import com.echarts.charts.EC_BAR002; EC_BAR002;
		import com.echarts.charts.EC_BAR003; EC_BAR003;
		import com.echarts.charts.EC_LINE001; EC_LINE001;
		import com.echarts.charts.EC_LINE002; EC_LINE002;
		import com.echarts.charts.EC_PIE001; EC_PIE001;
		import com.echarts.charts.EC_PIE002; EC_PIE002;
		import com.echarts.charts.ECC_PIE001; ECC_PIE001;
		import com.echarts.charts.ECC_PIE002; ECC_PIE002;
		import com.echarts.charts.IEchartDefinition; IEchartDefinition;
		import com.echarts.charts.IEchartDefinitionTemplate; IEchartDefinitionTemplate;

		import com.echarts.components.beads.EChartsThemeBead; EChartsThemeBead;

		import com.echarts.components.controllers.EChartsController; EChartsController;
		import com.echarts.components.controllers.EChartsThemesController; EChartsThemesController;
		
		import com.echarts.components.events.EChartsEvent; EChartsEvent;
		import com.echarts.components.events.EChartsThemesEvent; EChartsThemesEvent;
		
		import com.echarts.components.models.EChartsModel; EChartsModel;
		import com.echarts.components.models.EChartsThemesModel; EChartsThemesModel;
		
		import com.echarts.components.vos.EChartsInstanceVO; EChartsInstanceVO;
		import com.echarts.components.vos.EChartsThemeTemplateVO; EChartsThemeTemplateVO;
		import com.echarts.components.vos.ChartDefExampleVO;ChartDefExampleVO;

		import com.echarts.components.EChartsComponent; EChartsComponent;
		import com.echarts.components.EChartsContainer; EChartsContainer;
		import com.echarts.components.EChartsThemeTemplates; EChartsThemeTemplates;

		//import EChartsComponent; EChartsComponent;
		}
	}
}

