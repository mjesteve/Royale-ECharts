package com.echarts.events
{
	import org.apache.royale.events.Event;
	import com.echarts.vos.EChartsInstanceVO;
	import com.echarts.vos.EChartsThemeTemplateVO;

	public class EChartsThemesEvent extends Event
    {
		
		public static const ON_INICIALIZE:String = "onInicialize";
		public static const ON_AFTERINICIALIZE:String = "onAfterInicialize";

		public static const ON_ADD:String = "onAdd";
		public static const ON_AFTERADD:String = "onAfterAdd";

		public static const ON_DEL:String = "onDel";
		public static const ON_AFTERDEL:String = "onAfterDel";

		public static const ON_LOADTHEMEFROMFILE:String = "onLoadThemeFromFile";
		public static const ON_WAIT_LOADTHEMEFROMFILE:String = "onWaitLoadThemeFromFile";
		public static const ON_COMPLETE_LOADTHEMEFROMFILE:String = "onCompleteLoadThemeFromFile";
		public static const ON_ERROR_LOADTHEMEFROMFILE:String = "onErrorLoadThemeFromFile";

		public static const ON_REGISTERTHEME:String = "onRegister";
		public static const ON_COMPLETE_REGISTERTHEME:String = "onCompleteRegister";

		public function EChartsThemesEvent(type:String,itemSelTheme:EChartsThemeTemplateVO = null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.itemSelTheme = itemSelTheme;
		}

		public var itemSelTheme:EChartsThemeTemplateVO;
        public var status:String;
    }
}