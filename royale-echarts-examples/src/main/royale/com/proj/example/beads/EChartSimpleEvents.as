package com.proj.example.beads
{	
	
	/**
	 * SizeChangedBeadWP is a class that handles the size and positioning of the
	 * elements of a DataGrid. This includes the ButtonBar used for the column
	 * headers and the Lists that are the columns.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9.8
	 */
	import org.apache.royale.core.IBead;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.core.Strand;
	import org.apache.royale.events.Event;
	import org.apache.royale.events.IEventDispatcher;
	import org.apache.royale.core.IRenderedObject;
	import com.proj.example.echarts.EChartsWithThemeControl;
	import com.proj.example.echarts.events.EChartsEvent;

	public class EChartSimpleEvents  extends Strand implements IBead
	{
		/**
		 *  constructor
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.7
		 */

		public function EChartSimpleEvents()
		{
			
		}
        private var _strand:IStrand;
        
		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
        public function get strand():IStrand
        {
            return _strand;
        }
        

		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 *  @royaleignorecoercion org.apache.royale.events.IEventDispatcher
		 */

		public function set strand(value:IStrand):void
		{
            _strand = value;
			COMPILE::JS
			{
                		
            /*Mouse Events */
            CLICK = CLICK
            DBLCLICK = DBLCLICK

            MOUSEDOWN = MOUSEDOWN
            MOUSEMOVE = MOUSEMOVE
            MOUSEUP = MOUSEUP
            MOUSEOVER = MOUSEOVER
            MOUSEOUT = MOUSEOUT

            GLOBALOUT = GLOBALOUT
            CONTEXTMENU = CONTEXTMENU

            /*Component Events */
            LEGENDSELECTCHANGED = LEGENDSELECTCHANGED
            LEGENDSELECTED = LEGENDSELECTED
            LEGENDUNSELECTED = LEGENDUNSELECTED
            LEGENDSELECTALL = LEGENDSELECTALL
            LEGENDINVERSESELECT = LEGENDINVERSESELECT
            LEGENDSCROLL = LEGENDSCROLL

            DATAZOOM = DATAZOOM
            DATARANGESELECTED = DATARANGESELECTED

            TIMELINECHANGED = TIMELINECHANGED
            TIMELINEPLAYCHANGED = TIMELINEPLAYCHANGED

            RESTORE = RESTORE

            DATAVIEWCHANGED = DATAVIEWCHANGED
            
            MAGICTYPECHANGED = MAGICTYPECHANGED

            PIESELECTCHANGED = PIESELECTCHANGED
            PIESELECTED = PIESELECTED
            PIEUNSELECTED = PIEUNSELECTED

            MAPSELECTCHANGED = MAPSELECTCHANGED
            MAPSELECTED = MAPSELECTED
            MAPUNSELECTED = MAPUNSELECTED

            AXISAREASELECTED = AXISAREASELECTED

            FOCUSNODEADJACENCY = FOCUSNODEADJACENCY
            UNFOCUSNODEADJACENCY = UNFOCUSNODEADJACENCY

            BRUSH = BRUSH
            BRUSHEND = BRUSHEND
            BRUSHSELECTED = BRUSHSELECTED

            GLOBALCURSORTAKEN = GLOBALCURSORTAKEN

            RENDERED = RENDERED
            FINISHED = FINISHED
			}
		}


        /*Mouse Events */
        private var _CLICK:Function;
        public function get CLICK():Function { return _CLICK; }
        public function set CLICK(value:Function):void {
            _CLICK = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.CLICK, value);
            }
        }

        private var _DBLCLICK:Function
        public function get DBLCLICK():Function { return _DBLCLICK; }
        public function set DBLCLICK(value:Function):void {
            _DBLCLICK = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.DBLCLICK, value);
            }
        }
        
        private var _MOUSEDOWN:Function
        public function get MOUSEDOWN():Function { return _MOUSEDOWN; }
        public function set MOUSEDOWN(value:Function):void {
            _MOUSEDOWN = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MOUSEDOWN, value);
            }
        }
                
        private var _MOUSEMOVE:Function
        public function get MOUSEMOVE():Function { return _MOUSEMOVE; }
        public function set MOUSEMOVE(value:Function):void {
            _MOUSEMOVE = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MOUSEMOVE, value);
            }
        }
                  
        private var _MOUSEUP:Function
        public function get MOUSEUP():Function { return _MOUSEUP; }
        public function set MOUSEUP(value:Function):void {
            _MOUSEUP = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MOUSEUP, value);
            }
        }
               
        private var _MOUSEOVER:Function
        public function get MOUSEOVER():Function { return _MOUSEOVER; }
        public function set MOUSEOVER(value:Function):void {
            _MOUSEOVER = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MOUSEOVER, value);
            }
        }
     
        private var _MOUSEOUT:Function
        public function get MOUSEOUT():Function { return _MOUSEOUT; }
        public function set MOUSEOUT(value:Function):void {
            _MOUSEOUT = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MOUSEOUT, value);
            }
        }
 
        private var _GLOBALOUT:Function
        public function get GLOBALOUT():Function { return _GLOBALOUT; }
        public function set GLOBALOUT(value:Function):void {
            _GLOBALOUT = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.GLOBALOUT, value);
            }
        }

        private var _CONTEXTMENU:Function
        public function get CONTEXTMENU():Function { return _CONTEXTMENU; }
        public function set CONTEXTMENU(value:Function):void {
            _CONTEXTMENU = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.CONTEXTMENU, value);
            }
        }

        /*Component Events */
        private var _LEGENDSELECTCHANGED:Function
        public function get LEGENDSELECTCHANGED():Function { return _LEGENDSELECTCHANGED; }
        public function set LEGENDSELECTCHANGED(value:Function):void {
            _LEGENDSELECTCHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDSELECTCHANGED, value);
            }
        }

        private var _LEGENDSELECTED:Function
        public function get LEGENDSELECTED():Function { return _LEGENDSELECTED; }
        public function set LEGENDSELECTED(value:Function):void {
            _LEGENDSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDSELECTED, value);
            }
        }
        
        private var _LEGENDUNSELECTED:Function
        public function get LEGENDUNSELECTED():Function { return _LEGENDUNSELECTED; }
        public function set LEGENDUNSELECTED(value:Function):void {
            _LEGENDUNSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDUNSELECTED, value);
            }
        }
                       
        private var _LEGENDSELECTALL:Function
        public function get LEGENDSELECTALL():Function { return _LEGENDSELECTALL; }
        public function set LEGENDSELECTALL(value:Function):void {
            _LEGENDSELECTALL = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDSELECTALL, value);
            }
        }
                               
        private var _LEGENDINVERSESELECT:Function
        public function get LEGENDINVERSESELECT():Function { return _LEGENDINVERSESELECT; }
        public function set LEGENDINVERSESELECT(value:Function):void {
            _LEGENDINVERSESELECT = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDINVERSESELECT, value);
            }
        }
                               
        private var _LEGENDSCROLL:Function
        public function get LEGENDSCROLL():Function { return _LEGENDSCROLL; }
        public function set LEGENDSCROLL(value:Function):void {
            _LEGENDSCROLL = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.LEGENDSCROLL, value);
            }
        }
                                       
        private var _DATAZOOM:Function
        public function get DATAZOOM():Function { return _DATAZOOM; }
        public function set DATAZOOM(value:Function):void {
            _DATAZOOM = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.DATAZOOM, value);
            }
        }

        private var _DATARANGESELECTED:Function
        private function get DATARANGESELECTED():Function { return _DATARANGESELECTED; }
        private function set DATARANGESELECTED(value:Function):void {
            _DATARANGESELECTED = value; 
            if (strand && value){
                (strand as Object).on(EChartsEvent.DATARANGESELECTED, value);
            }
        }

        private var _TIMELINECHANGED:Function
        private function get TIMELINECHANGED():Function { return _TIMELINECHANGED; }
        private function set TIMELINECHANGED(value:Function):void
        {
        	_TIMELINECHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.TIMELINECHANGED, value);
            }
        }

        private var _TIMELINEPLAYCHANGED:Function
        private function get TIMELINEPLAYCHANGED():Function { return _TIMELINEPLAYCHANGED; }
        private function set TIMELINEPLAYCHANGED(value:Function):void
        {
        	_TIMELINEPLAYCHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.TIMELINEPLAYCHANGED, value);
            }
        }

        private var _RESTORE:Function
        private function get RESTORE():Function { return _RESTORE; }
        private function set RESTORE(value:Function):void
        {
        	_RESTORE = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.RESTORE, value);
            }
        }

        private var _DATAVIEWCHANGED:Function
        private function get DATAVIEWCHANGED():Function { return _DATAVIEWCHANGED; }
        private function set DATAVIEWCHANGED(value:Function):void
        {
        	_DATAVIEWCHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.DATAVIEWCHANGED, value);
            }
        }
                
        private var _MAGICTYPECHANGED:Function
        private function get MAGICTYPECHANGED():Function { return _MAGICTYPECHANGED; }
        private function set MAGICTYPECHANGED(value:Function):void
        {
        	_MAGICTYPECHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MAGICTYPECHANGED, value);
            }
        }

        private var _PIESELECTCHANGED:Function
        private function get PIESELECTCHANGED():Function { return _PIESELECTCHANGED; }
        private function set PIESELECTCHANGED(value:Function):void
        {
        	_PIESELECTCHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.PIESELECTCHANGED, value);
            }
        }

        private var _PIESELECTED:Function
        private function get PIESELECTED():Function { return _PIESELECTED; }
        private function set PIESELECTED(value:Function):void
        {
        	_PIESELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.PIESELECTED, value);
            }
        }

        private var _PIEUNSELECTED:Function
        private function get PIEUNSELECTED():Function { return _PIEUNSELECTED; }
        private function set PIEUNSELECTED(value:Function):void
        {
        	_PIEUNSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.PIEUNSELECTED, value);
            }
        }

        private var _MAPSELECTCHANGED:Function
        private function get MAPSELECTCHANGED():Function { return _MAPSELECTCHANGED; }
        private function set MAPSELECTCHANGED(value:Function):void
        {
        	_MAPSELECTCHANGED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MAPSELECTCHANGED, value);
            }
        }

        private var _MAPSELECTED:Function
        private function get MAPSELECTED():Function { return _MAPSELECTED; }
        private function set MAPSELECTED(value:Function):void
        {
        	_MAPSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MAPSELECTED, value);
            }
        }

        private var _MAPUNSELECTED:Function
        private function get MAPUNSELECTED():Function { return _MAPUNSELECTED; }
        private function set MAPUNSELECTED(value:Function):void
        {
        	_MAPUNSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.MAPUNSELECTED, value);
            }
        }

        private var _AXISAREASELECTED:Function
        private function get AXISAREASELECTED():Function { return _AXISAREASELECTED; }
        private function set AXISAREASELECTED(value:Function):void
        {
        	_AXISAREASELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.AXISAREASELECTED, value);
            }
        }

        private var _FOCUSNODEADJACENCY:Function
        private function get FOCUSNODEADJACENCY():Function { return _FOCUSNODEADJACENCY; }
        private function set FOCUSNODEADJACENCY(value:Function):void
        {
        	_FOCUSNODEADJACENCY = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.FOCUSNODEADJACENCY, value);
            }
        }

        private var _UNFOCUSNODEADJACENCY:Function
        private function get UNFOCUSNODEADJACENCY():Function { return _UNFOCUSNODEADJACENCY; }
        private function set UNFOCUSNODEADJACENCY(value:Function):void
        {
        	_UNFOCUSNODEADJACENCY = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.UNFOCUSNODEADJACENCY, value);
            }
        }

        private var _BRUSH:Function
        private function get BRUSH():Function { return _BRUSH; }
        private function set BRUSH(value:Function):void
        {
        	_BRUSH = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.BRUSH, value);
            }
        }
        private var _BRUSHEND:Function
        private function get BRUSHEND():Function { return _BRUSHEND; }
        private function set BRUSHEND(value:Function):void
        {
        	_BRUSHEND = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.BRUSHEND, value);
            }
        }
        private var _BRUSHSELECTED:Function
        private function get BRUSHSELECTED():Function { return _BRUSHSELECTED; }
        private function set BRUSHSELECTED(value:Function):void
        {
        	_BRUSHSELECTED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.BRUSHSELECTED, value);
            }
        }

        private var _GLOBALCURSORTAKEN:Function
        private function get GLOBALCURSORTAKEN():Function { return _GLOBALCURSORTAKEN; }
        private function set GLOBALCURSORTAKEN(value:Function):void
        {
        	_GLOBALCURSORTAKEN = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.GLOBALCURSORTAKEN, value);
            }
        }

        private var _RENDERED:Function
        private function get RENDERED():Function { return _RENDERED; }
        private function set RENDERED(value:Function):void
        {
        	_RENDERED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.RENDERED, value);
            }
        }
        private var _FINISHED:Function
        private function get FINISHED():Function { return _FINISHED; }
        private function set FINISHED(value:Function):void
        {
        	_FINISHED = value;
            if (strand && value){
                (strand as Object).on(EChartsEvent.FINISHED, value);
            }
        }
	}
}
