package com.proj.example.echarts.events
{
	import org.apache.royale.events.Event;
	import com.proj.example.echarts.vos.EChartsInstanceVO;
	import com.proj.example.echarts.vos.EChartsThemeTemplateVO;

	public class EChartsEvent extends Event
    {
		public static const ON_COMPLETE_INICIALIZE:String = "onCompleteInicialize";
		public static const ON_COMPLETE_CONFIG:String = "onCompleteConfig";
		
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
		
        /*Mouse Events */
        public static const CLICK:String = "click";
        public static const DBLCLICK:String = "dblclick";

        public static const MOUSEDOWN:String = "mousedown";
        public static const MOUSEMOVE:String = "mousemove";
        public static const MOUSEUP:String = "mouseup";
        public static const MOUSEOVER:String = "mouseover";
        public static const MOUSEOUT:String = "mouseout";

        public static const GLOBALOUT:String = "globalout";
        public static const CONTEXTMENU:String = "contextmenu";

        /*Component Events */
        public static const LEGENDSELECTCHANGED:String = "legendselectchanged";
        public static const LEGENDSELECTED:String = "legendselected";
        public static const LEGENDUNSELECTED:String = "legendunselected";
        public static const LEGENDSELECTALL:String = "legendselectall";
        public static const LEGENDINVERSESELECT:String = "legendinverseselect";
        public static const LEGENDSCROLL:String = "legendscroll";

        public static const DATAZOOM:String = "datazoom";
        public static const DATARANGESELECTED:String = "datarangeselected";

        public static const TIMELINECHANGED:String = "timelinechanged";
        public static const TIMELINEPLAYCHANGED:String = "timelineplaychanged";

        public static const RESTORE:String = "restore";

        public static const DATAVIEWCHANGED:String = "dataviewchanged";
        
        public static const MAGICTYPECHANGED:String = "magictypechanged";

        public static const PIESELECTCHANGED:String = "pieselectchanged";
        public static const PIESELECTED:String = "pieselected";
        public static const PIEUNSELECTED:String = "pieunselected";

        public static const MAPSELECTCHANGED:String = "mapselectchanged";
        public static const MAPSELECTED:String = "mapselected";
        public static const MAPUNSELECTED:String = "mapunselected";

        public static const AXISAREASELECTED:String = "axisareaselected";

        public static const FOCUSNODEADJACENCY:String = "focusnodeadjacency";
        public static const UNFOCUSNODEADJACENCY:String = "unfocusnodeadjacency";

        public static const BRUSH:String = "brush";
        public static const BRUSHEND:String = "brushEnd";
        public static const BRUSHSELECTED:String = "brushselected";

        public static const GLOBALCURSORTAKEN:String = "globalcursortaken";

        public static const RENDERED:String = "rendered";
        public static const FINISHED:String = "finished";
    }
}