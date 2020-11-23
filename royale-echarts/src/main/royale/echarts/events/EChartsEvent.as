package echarts.events
{
	import org.apache.royale.events.Event;
	import echarts.vos.EChartsInstanceVO;
	import echarts.vos.EChartsThemeTemplateVO;

	public class EChartsEvent extends Event
    {
		public static const ON_COMPLETE_INICIALIZE:String = "onCompleteInicialize";
		public static const ON_COMPLETE_CONFIG:String = "onCompleteConfig";
		public static const ON_UPDATE_CONFIG:String = "onUpdateConfig";
		
		public static const ON_DISPOSE_INSTANCE:String = "onDisposeInstance";
        
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
        public static const UPDATEAXISPOINTER:String = "updateAxisPointer";

        public static const FOCUSNODEADJACENCY:String = "focusnodeadjacency";
        public static const UNFOCUSNODEADJACENCY:String = "unfocusnodeadjacency";

        /** Event triggered after action brush dispatched.*/
        public static const BRUSH:String = "brush";
        /** Event triggered after action brushEnd dispatched.*/
        public static const BRUSHEND:String = "brushEnd";
        /** Notice what are selected.
         * This event will be triggered when dispatchAction called, or use do brush behavior.
         * But this event will not be triggered in setOption.
        */
        public static const BRUSHSELECTED:String = "brushselected";
        public static const BRUSHSELECT:String = "brushselect";

        public static const GLOBALCURSORTAKEN:String = "globalcursortaken";

        public static const RENDERED:String = "rendered";
        public static const FINISHED:String = "finished";

        public static const SUNBURSTHIGHLIGHT:String = "sunbursthighlight";
        public static const SUNBURSTUNHIGHLIGHT:String = "sunbursunthighlight";

        public static const GEOSELECTCHANGE:String = "geoselectchanged"; //Action link geoToggleSelect
        public static const GEOSELECTED:String = "geoselected"; //Action link geoSelect
        public static const GEOUNSELECTED:String = "geounselected"; //Action link geoUnSelect
        

        /* Chart Actions */
        /** Highlights the given graphic element.*/
        public static const ACTION_HIGHLIGHT:String = "highlight"; 
        public static const ACTION_SUNBURST_HIGHLIGHT:String = "sunburstHighlight"; 
        public static const ACTION_SUNBURST_UNHIGHLIGHT:String = "sunburstUnhighlight";

        /** Cancels highlighting graphic element.*/
        public static const ACTION_DOWNPLAY:String = "downplay";
        /** Actions related to legend component, which should include legend component before use.*/
        public static const ACTION_LEGEND:String = "legend";
        /** Actions related to tooltip component, which should include tooltip component before use.*/
        public static const ACTION_TOOLTIP:String = "tooltip";
        /** Actions related to data region zoom component, which should include data region zoom component before use.*/
        public static const ACTION_DATAZOOM:String = "dataZoom";
        /** Actions related to visual mapping component, which should include visual mapping component before use.*/
        public static const ACTION_VISUALMAP:String = "visualMap";
        /** Actions related to timeline component, which should include timeline component before use.*/
        public static const ACTION_TIMELINE:String = "timeline";
        /** Actions related to toolbox component, which should include toolbox component before use. */
        public static const ACTION_TOOLBOX:String = "toolbox";
        
        /** Selects the specified pie chart.
         * EVENT: pieselected
        */
        public static const ACTION_PIE_PIESELECT:String = "pieSelect";
        /** Cancels selecting specified pie chart.
         * EVENT: pieunselected
        */
        public static const ACTION_PIE_UNPIESELECT:String = "pieUnSelect";
        /** Toggles selecting status of specified pie chart.
         * EVENT: pieselectchanged
        */
        public static const ACTION_PIE_PIETOGGLESELECT:String = "pieToggleSelect";

        /** Actions related to map, which should include map before use.*/
        public static const ACTION_MAP:String = "map";
        /** Actions related to graph, which should include graph before use.*/
        public static const ACTION_GRAPH:String = "graph";
        /** brush related actions.*/
        public static const ACTION_BRUSH:String = "brush";

        public static const ACTION_GEOSELECTCHANGE:String = "geoToggleSelect"; //Action link geoselectchanged
        public static const ACTION_GEOSELECTED:String = "geoSelect"; //Action link geoselected
        public static const ACTION_GEOUNSELECTED:String = "geoUnSelect"; //Action link geounselected
    }
}