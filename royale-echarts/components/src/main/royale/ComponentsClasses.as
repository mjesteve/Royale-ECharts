package
{

	/**
	 *  @private
	 *  This class is used to link additional classes into rpc.swc
	 *  beyond those that are found by dependency analysis starting
	 *  from the classes specified in manifest.xml.
	 */
	internal class ComponentsClasses
	{
		COMPILE::JS
		{
		import com.echarts.beads.EChartsThemeBead; EChartsThemeBead;

		import com.echarts.controllers.EChartsController; EChartsController;
		import com.echarts.controllers.EChartsThemesController; EChartsThemesController;
		
		import com.echarts.events.EChartsEvent; EChartsEvent;
		import com.echarts.events.EChartsThemesEvent; EChartsThemesEvent;
		
		import com.echarts.models.EChartsModel; EChartsModel;
		import com.echarts.models.EChartsThemesModel; EChartsThemesModel;
		
		import com.echarts.vos.EChartsInstanceVO; EChartsInstanceVO;
		import com.echarts.vos.EChartsThemeTemplateVO; EChartsThemeTemplateVO;
		import com.echarts.vos.ChartDefExampleVO;ChartDefExampleVO;

		}
	}
}

