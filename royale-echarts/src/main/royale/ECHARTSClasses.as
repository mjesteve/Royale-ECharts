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
		//import EChartsComponent; EChartsComponent;
		}
	}
}

