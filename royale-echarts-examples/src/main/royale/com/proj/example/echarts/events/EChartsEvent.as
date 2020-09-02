package com.proj.example.echarts.events
{
	import org.apache.royale.events.Event;
	import com.proj.example.echarts.vos.EChartsInstanceVO;
	import com.proj.example.echarts.vos.EChartsThemeTemplateVO;

	public class EChartsEvent extends Event
    {
		
		public static const ON_INICIALIZE:String = "onInicialize";
		public static const ON_AFTERINICIALIZE:String = "onAfterInicialize";

		public static const ON_ADD:String = "onAdd";
		public static const ON_AFTERADD:String = "onAfterAdd";

		public static const ON_DEL:String = "onDel";
		public static const ON_AFTERDEL:String = "onAfterDel";

		public function EChartsEvent(type:String, echartInstance:EChartsInstanceVO = null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.echartInstance = echartInstance;
		}
						
        public var echartInstance:EChartsInstanceVO;
		public var withThemesSupport:Boolean = false;
		public var itemSelTheme:EChartsThemeTemplateVO;
        public var status:String;
    }
}