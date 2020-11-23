package com.iest.royale.echarts.beads
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
	import org.apache.royale.events.IEventDispatcher;
	import com.iest.royale.echarts.events.EChartsEvent;
	import com.iest.royale.echarts.IEChartsBasic;
	import com.iest.royale.echarts.vos.EChartsCallBackFunctionVO;

	public class EChartEventsBead  extends Strand implements IBead
	{
		/**
		 *  constructor
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.7
		 */

		public function EChartEventsBead()
		{
			_callBacksEventPending = new Array();
            _callBacksEvents = new Array();
		}
        private var _strand:IStrand;
        
        private var _callBacksEventPending:Array;
        private var _callBacksEvents:Array;

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

            (_strand as IEventDispatcher).addEventListener(EChartsEvent.ON_COMPLETE_INICIALIZE, completInitHandler);
            (_strand as IEventDispatcher).addEventListener(EChartsEvent.ON_DISPOSE_INSTANCE, disposeInstanceHandler);	
		}        
        
        public function get echartHostComponent():IEChartsBasic
        {
            return IEChartsBasic(_strand);
        }

        private var idInstance:String;
        private function completInitHandler(event:EChartsEvent):void
        { 
            //Pending to find out ... echarts respects callBack mappings when re-initializing an instance? 
            //(when re-initializing the id of EChartsInstance changes, I think it's another object)

            var idInstanceInit:String = echartHostComponent.instanceECharts['id'] as String;
            if(idInstance == idInstanceInit)            
                return;

            idInstance = idInstanceInit;

            if(_callBacksEventPending && _callBacksEventPending.length>0)
            { 
                for(var index:int = 0; index < _callBacksEventPending.length; index++)
                {
                    var element:EChartsCallBackFunctionVO = _callBacksEventPending[index] as EChartsCallBackFunctionVO;
                    addCallBack(element.eventName, element.handler, index);
                    index--;
                }
            }

        }

        private function disposeInstanceHandler(event:EChartsEvent):void
        { 
            if(event.echartInstance.id == idInstance)
            {
                //We leave the events pending to be remapped
                if(_callBacksEvents && _callBacksEvents.length>0)
                { 
                    for(var index:int = 0; index < _callBacksEvents.length; index++)
                    {
                        var element:EChartsCallBackFunctionVO = _callBacksEvents[index] as EChartsCallBackFunctionVO;
                        //Is it necessary? echart carries over the mappings from one instance to the next?
                        removeCallBack(element.eventName, element.handler, index);
                        index--;
                    }
                }
                idInstance = null;
            }
        }

        private function addCallBack(eventName:String, handler:Function, indexPending:int = -1):void
        {
            echartHostComponent.on(eventName, handler);

            if(indexPending != -1)
            {
                _callBacksEventPending.removeAt(indexPending);
            }
            else if(_callBacksEventPending.length>0)
            {       
                for(var index:int = 0; index < _callBacksEventPending.length; index++)
                {
                    var element:EChartsCallBackFunctionVO = _callBacksEventPending[index] as EChartsCallBackFunctionVO;
                    if(element.eventName == eventName)
                    {
                        _callBacksEventPending.removeAt(index);
                        index--;
                        break;
                    }
                }                
            }

            _callBacksEvents.push(new EChartsCallBackFunctionVO(eventName, handler));

        }

        private function removeCallBack(eventName:String, handler:Function, indexRemoved:int = -1, restore:Boolean = true):void
        {
            echartHostComponent.off(eventName, handler);
            
            if(indexRemoved != -1)
            {
                _callBacksEvents.removeAt(indexRemoved);
            }
            else if(_callBacksEvents.length>0)
            { 
                for(var index:int = 0; index < _callBacksEvents.length; index++)
                {
                    var element:EChartsCallBackFunctionVO = _callBacksEvents[index] as EChartsCallBackFunctionVO;
                    if(element.eventName == eventName)
                    {
                        _callBacksEvents.removeAt(index);
                        index--;
                        break;
                    }
                }
            }           
            
            if(restore)
                _callBacksEventPending.push(new EChartsCallBackFunctionVO(eventName, handler));

        }

        public function setEventHandler(eventName:String, actualFunction:Function, newFunction:Function):void
        {
            if(actualFunction != newFunction)
            {
                if(newFunction)
                {
                    actualFunction = newFunction;
                    if (_strand && echartHostComponent.isInit)
                    {
                        addCallBack(eventName, actualFunction);
                    }
                    else{
                        var listenerExiste:Boolean = false;
                        
                        //search in arrayListener echartsInstance js <-- PENDING                        
                        var len:int = _callBacksEventPending.length;                        
                        for(var index:int = 0; index < len; index++)
                        {
                            var element:EChartsCallBackFunctionVO = _callBacksEventPending[index] as EChartsCallBackFunctionVO;
                            if(element.eventName == eventName)
                            {
                                listenerExiste = true;
                                element.handler = actualFunction;
                                break;
                            }                            
                        }
                        if(!listenerExiste)
                            _callBacksEventPending.push(new EChartsCallBackFunctionVO(eventName, actualFunction));                            
                    }

                }else if(_strand)
                {
                    removeCallBack(eventName, actualFunction, -1, false);
                    actualFunction = null;
                }

            }
        }
		
        /*Mouse Events */
        private var _CLICK:Function;
        public function get CLICK():Function { return _CLICK; }
        public function set CLICK(value:Function):void 
        {
            setEventHandler(EChartsEvent.CLICK, _CLICK, value);
        }

        private var _DBLCLICK:Function
        public function get DBLCLICK():Function { return _DBLCLICK; }
        public function set DBLCLICK(value:Function):void 
        {
            setEventHandler(EChartsEvent.DBLCLICK, _DBLCLICK, value);
        }
        
        private var _MOUSEDOWN:Function
        public function get MOUSEDOWN():Function { return _MOUSEDOWN; }
        public function set MOUSEDOWN(value:Function):void 
        {
            setEventHandler(EChartsEvent.MOUSEDOWN, _MOUSEDOWN, value);
        }
                
        private var _MOUSEMOVE:Function
        public function get MOUSEMOVE():Function { return _MOUSEMOVE; }
        public function set MOUSEMOVE(value:Function):void
        {
            setEventHandler(EChartsEvent.MOUSEMOVE, _MOUSEMOVE, value);
        }
                  
        private var _MOUSEUP:Function
        public function get MOUSEUP():Function { return _MOUSEUP; }
        public function set MOUSEUP(value:Function):void 
        {
            setEventHandler(EChartsEvent.MOUSEUP, _MOUSEUP, value);
        }
               
        private var _MOUSEOVER:Function
        public function get MOUSEOVER():Function { return _MOUSEOVER; }
        public function set MOUSEOVER(value:Function):void 
        {
            setEventHandler(EChartsEvent.MOUSEOVER, _MOUSEOVER, value);
        }
     
        private var _MOUSEOUT:Function
        public function get MOUSEOUT():Function { return _MOUSEOUT; }
        public function set MOUSEOUT(value:Function):void 
        {
            setEventHandler(EChartsEvent.MOUSEOUT, _MOUSEOUT, value);
        }
 
        private var _GLOBALOUT:Function
        public function get GLOBALOUT():Function { return _GLOBALOUT; }
        public function set GLOBALOUT(value:Function):void 
        {
            setEventHandler(EChartsEvent.GLOBALOUT, _GLOBALOUT, value);
        }

        private var _CONTEXTMENU:Function
        public function get CONTEXTMENU():Function { return _CONTEXTMENU; }
        public function set CONTEXTMENU(value:Function):void 
        {
            setEventHandler(EChartsEvent.CONTEXTMENU, _CONTEXTMENU, value);
        }

        /*Component Events */
        private var _LEGENDSELECTCHANGED:Function
        public function get LEGENDSELECTCHANGED():Function { return _LEGENDSELECTCHANGED; }
        public function set LEGENDSELECTCHANGED(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDSELECTCHANGED, _LEGENDSELECTCHANGED, value);
        }

        private var _LEGENDSELECTED:Function
        public function get LEGENDSELECTED():Function { return _LEGENDSELECTED; }
        public function set LEGENDSELECTED(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDSELECTED, _LEGENDSELECTED, value);
        }
        
        private var _LEGENDUNSELECTED:Function
        public function get LEGENDUNSELECTED():Function { return _LEGENDUNSELECTED; }
        public function set LEGENDUNSELECTED(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDUNSELECTED, _LEGENDUNSELECTED, value);
        }
                       
        private var _LEGENDSELECTALL:Function
        public function get LEGENDSELECTALL():Function { return _LEGENDSELECTALL; }
        public function set LEGENDSELECTALL(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDSELECTALL, _LEGENDSELECTALL, value);
        }
                               
        private var _LEGENDINVERSESELECT:Function
        public function get LEGENDINVERSESELECT():Function { return _LEGENDINVERSESELECT; }
        public function set LEGENDINVERSESELECT(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDINVERSESELECT, _LEGENDINVERSESELECT, value);
        }
                               
        private var _LEGENDSCROLL:Function
        public function get LEGENDSCROLL():Function { return _LEGENDSCROLL; }
        public function set LEGENDSCROLL(value:Function):void 
        {
            setEventHandler(EChartsEvent.LEGENDSCROLL, _LEGENDSCROLL, value);
        }
                                       
        private var _DATAZOOM:Function
        public function get DATAZOOM():Function { return _DATAZOOM; }
        public function set DATAZOOM(value:Function):void 
        {
            setEventHandler(EChartsEvent.DATAZOOM, _DATAZOOM, value);
        }

        private var _DATARANGESELECTED:Function
        public function get DATARANGESELECTED():Function { return _DATARANGESELECTED; }
        public function set DATARANGESELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.DATARANGESELECTED, _DATARANGESELECTED, value);
        }

        private var _TIMELINECHANGED:Function
        public function get TIMELINECHANGED():Function { return _TIMELINECHANGED; }
        public function set TIMELINECHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.TIMELINECHANGED, _TIMELINECHANGED, value);
        }

        private var _TIMELINEPLAYCHANGED:Function
        public function get TIMELINEPLAYCHANGED():Function { return _TIMELINEPLAYCHANGED; }
        public function set TIMELINEPLAYCHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.TIMELINEPLAYCHANGED, _TIMELINEPLAYCHANGED, value);
        }

        private var _RESTORE:Function
        public function get RESTORE():Function { return _RESTORE; }
        public function set RESTORE(value:Function):void
        {
            setEventHandler(EChartsEvent.RESTORE, _RESTORE, value);
        }

        private var _DATAVIEWCHANGED:Function
        public function get DATAVIEWCHANGED():Function { return _DATAVIEWCHANGED; }
        public function set DATAVIEWCHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.DATAVIEWCHANGED, _DATAVIEWCHANGED, value);
        }
                
        private var _MAGICTYPECHANGED:Function
        public function get MAGICTYPECHANGED():Function { return _MAGICTYPECHANGED; }
        public function set MAGICTYPECHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.MAGICTYPECHANGED, _MAGICTYPECHANGED, value);
        }

        private var _PIESELECTCHANGED:Function
        public function get PIESELECTCHANGED():Function { return _PIESELECTCHANGED; }
        public function set PIESELECTCHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.PIESELECTCHANGED, _PIESELECTCHANGED, value);
        }

        private var _PIESELECTED:Function
        public function get PIESELECTED():Function { return _PIESELECTED; }
        public function set PIESELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.PIESELECTED, _PIESELECTED, value);
        }

        private var _PIEUNSELECTED:Function
        public function get PIEUNSELECTED():Function { return _PIEUNSELECTED; }
        public function set PIEUNSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.PIEUNSELECTED, _PIEUNSELECTED, value);
        }

        private var _MAPSELECTCHANGED:Function
        public function get MAPSELECTCHANGED():Function { return _MAPSELECTCHANGED; }
        public function set MAPSELECTCHANGED(value:Function):void
        {
            setEventHandler(EChartsEvent.MAPSELECTCHANGED, _MAPSELECTCHANGED, value);
        }

        private var _MAPSELECTED:Function
        public function get MAPSELECTED():Function { return _MAPSELECTED; }
        public function set MAPSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.MAPSELECTED, _MAPSELECTED, value);
        }

        private var _MAPUNSELECTED:Function
        public function get MAPUNSELECTED():Function { return _MAPUNSELECTED; }
        public function set MAPUNSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.MAPUNSELECTED, _MAPUNSELECTED, value);
        }

        private var _AXISAREASELECTED:Function
        public function get AXISAREASELECTED():Function { return _AXISAREASELECTED; }
        public function set AXISAREASELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.AXISAREASELECTED, _AXISAREASELECTED, value);
        }
        
        private var _UPDATEAXISPOINTER:Function
        public function get UPDATEAXISPOINTER():Function { return _UPDATEAXISPOINTER; }
        public function set UPDATEAXISPOINTER(value:Function):void
        {
            setEventHandler(EChartsEvent.UPDATEAXISPOINTER, _UPDATEAXISPOINTER, value);
        }

        private var _FOCUSNODEADJACENCY:Function
        public function get FOCUSNODEADJACENCY():Function { return _FOCUSNODEADJACENCY; }
        public function set FOCUSNODEADJACENCY(value:Function):void
        {
            setEventHandler(EChartsEvent.FOCUSNODEADJACENCY, _FOCUSNODEADJACENCY, value);
        }

        private var _UNFOCUSNODEADJACENCY:Function
        public function get UNFOCUSNODEADJACENCY():Function { return _UNFOCUSNODEADJACENCY; }
        public function set UNFOCUSNODEADJACENCY(value:Function):void
        {
            setEventHandler(EChartsEvent.UNFOCUSNODEADJACENCY, _UNFOCUSNODEADJACENCY, value);
        }
        
        private var _SUNBURSTHIGHLIGHT:Function
        public function get SUNBURSTHIGHLIGHT():Function { return _SUNBURSTHIGHLIGHT; }
        public function set SUNBURSTHIGHLIGHT(value:Function):void
        {
            setEventHandler(EChartsEvent.SUNBURSTHIGHLIGHT, _BRUSH, value);
        }
        
        private var _SUNBURSTUNHIGHLIGHT:Function
        public function get SUNBURSTUNHIGHLIGHT():Function { return _SUNBURSTUNHIGHLIGHT; }
        public function set SUNBURSTUNHIGHLIGHT(value:Function):void
        {
            setEventHandler(EChartsEvent.SUNBURSTHIGHLIGHT, _BRUSH, value);
        }

        private var _BRUSH:Function
        public function get BRUSH():Function { return _BRUSH; }
        public function set BRUSH(value:Function):void
        {
            setEventHandler(EChartsEvent.BRUSH, _BRUSH, value);
        }

        private var _BRUSHEND:Function
        public function get BRUSHEND():Function { return _BRUSHEND; }
        public function set BRUSHEND(value:Function):void
        {
            setEventHandler(EChartsEvent.BRUSHEND, _BRUSHEND, value);
        }

        private var _BRUSHSELECTED:Function
        public function get BRUSHSELECTED():Function { return _BRUSHSELECTED; }
        public function set BRUSHSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.BRUSHSELECTED, _BRUSHSELECTED, value);
        }

        private var _GLOBALCURSORTAKEN:Function
        public function get GLOBALCURSORTAKEN():Function { return _GLOBALCURSORTAKEN; }
        public function set GLOBALCURSORTAKEN(value:Function):void
        {
            setEventHandler(EChartsEvent.GLOBALCURSORTAKEN, _GLOBALCURSORTAKEN, value);
        }

        private var _RENDERED:Function
        public function get RENDERED():Function { return _RENDERED; }
        public function set RENDERED(value:Function):void
        {
            setEventHandler(EChartsEvent.RENDERED, _RENDERED, value);
        }

        private var _FINISHED:Function
        public function get FINISHED():Function { return _FINISHED; }
        public function set FINISHED(value:Function):void
        {
            setEventHandler(EChartsEvent.FINISHED, _FINISHED, value);
        }

        private var _GEOSELECTCHANGE:Function
        public function get GEOSELECTCHANGE():Function { return _GEOSELECTCHANGE; }
        public function set GEOSELECTCHANGE(value:Function):void
        {
            setEventHandler(EChartsEvent.GEOSELECTCHANGE, _GEOSELECTCHANGE, value);
        }

        private var _GEOSELECTED:Function
        public function get GEOSELECTED():Function { return _GEOSELECTED; }
        public function set GEOSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.GEOSELECTED, _GEOSELECTED, value);
        }

        private var _GEOUNSELECTED:Function
        public function get GEOUNSELECTED():Function { return _GEOUNSELECTED; }
        public function set GEOUNSELECTED(value:Function):void
        {
            setEventHandler(EChartsEvent.GEOUNSELECTED, _GEOUNSELECTED, value);
        }
	}
}
