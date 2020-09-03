package com.proj.example.echarts
{
	import org.apache.royale.core.StyledUIBase;
	import org.apache.royale.core.IBead;
    import org.apache.royale.events.Event;
    import com.proj.example.echarts.events.EChartsEvent;
    import com.proj.example.echarts.vos.EChartsInstanceVO;
    import org.apache.royale.core.WrappedHTMLElement;
    import org.apache.royale.html.util.addElementToWrapper;
	
	[Event(name="onConfig", type="com.proj.example.echarts.events.EChartsEvent")]
	[Event(name="onInicialize", type="com.proj.example.echarts.events.EChartsEvent")]
	/**
	 * The default property uses when additional MXML content appears within an element's
	 * definition in an MXML file.
	 */
	[DefaultProperty("instanceECharts")]

	COMPILE::JS
	public class EChartsBasicControl extends StyledUIBase
    {

		/**
		 * @royaleignorecoercion org.apache.royale.core.WrappedHTMLElement
		 * @royaleignorecoercion org.apache.royale.html.util.addElementToWrapper
         */
        override protected function createElement():WrappedHTMLElement
        {
			addElementToWrapper(this, 'div');
            return element;
        }

        public function EChartsBasicControl()
		{
			super();			
			typeNames = "";

            addEventListener("beadsAdded", beadsAddedHandler);
		}

        public function beadsAddedHandler(event:Event):void
        {
            removeEventListener("beadsAdded", beadsAddedHandler);            
        }
        
		override public function addedToParent():void
		{
			super.addedToParent();
            percentWidth = 100;
            percentHeight = 100;
		}

        private var globalECharts:EChartsLoader = EChartsLoader.instance;

        private var _autoLoad:Boolean = true;    
        /**
         *  @private.
         */
        public function set autoLoad(value:Boolean):void
        {
            _autoLoad = value;
        }
        public function get autoLoad():Boolean
        {
            return _autoLoad;
        }

        private var _isInit:Boolean;
        public function get isInit():Boolean{ return _isInit; }
        [Bindable("onInicialize")]
        public function set isInit(value:Boolean):void{ 
            _isInit = value; 
            dispatchEvent(new EChartsEvent(EChartsEvent.ON_COMPLETE_INICIALIZE));
        }

        private var _isConfigure:Boolean;
        [Bindable("onConfig")]
        public function get isConfigure():Boolean{ 
            return _isConfigure; 
        }
        public function set isConfigure(value:Boolean):void{
            _isConfigure = value; 
            dispatchEvent(new EChartsEvent(EChartsEvent.ON_COMPLETE_CONFIG));
        }

        private var _configOption:Object;
        [Bindable("configOptionChange")]
        public function get configOption():Object{ 
            return _configOption; 
        }
        public function set configOption(value:Object):void{ 
            if(_configOption != value)
            {
                if(!_configOption)
                {
                    //initialize
                    _configOption = value;
                    if(_autoLoad)
                        init();
                }
                else
                {
                    _configOption = value;
                    setOption();
                }
                
            }

        }

		private var _optsInstance:Object = null;
		public function get optsInstance():Object{ return _optsInstance; }
		public function set optsInstance(value:Object):void{ _optsInstance = value; }

        private var _instanceECharts:Object;
        public function get instanceECharts():Object{ return _instanceECharts; }
        public function set instanceECharts(value:Object):void
        {
            if( _instanceECharts === value)
                return;

            var objInstance:EChartsInstanceVO;  

            if(!value && _instanceECharts)            
            {
                //Deleted
                objInstance = new EChartsInstanceVO(_instanceECharts);
                echarts.dispose(_instanceECharts);
                dispatchEvent(new EChartsEvent(EChartsEvent.ON_DEL, objInstance));
            }
            else if(value)
            {
                objInstance = new EChartsInstanceVO(value);
                
                var idinstance:String = objInstance.id;
                if(!globalECharts.echartsInstances[idinstance])
                    globalECharts.echartsInstances[idinstance] = objInstance.jsInstance;
            }

            _instanceECharts = value;
            isInit = (_instanceECharts ? true : false);
        }
    
		/**
		 * Creates an ECharts instance, and returns an echartsInstance.
		 * @param theme Object|string
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 */
		public function init(theme:Object=null, opts:Object=null):void
		{
            if(instanceECharts) {
                clear();
            }
			if(opts)
				optsInstance = opts;
			// see echarts.init 
			instanceECharts = echarts.init(element,theme,_optsInstance);

            if(_configOption)
                setOption();
		}
		/**
		 * Configuration item, data, universal interface, all parameters and data can all be modified through setOption.
		 * @param option Configuration item and data.
		 * @param notMarge Optional; states whether not to merge with previous option; false by default, stating merging.
		 * @param lazyUpdate Optional; states whether not to update chart immediately; false by default, stating update immediately.
		 * @param silent Optional; states whether not to prevent triggering events when calling setOption; false by default, stating trigger events.
		 */
        public function setOption(config:Object=null, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            if(!config)
                config = _configOption;
            if(instanceECharts){
                instanceECharts.setOption(config,{notMerge: true, lazyUpdate: lazyUpdate, silent: silent});
                isConfigure = _configOption?true:false;
            }
        }
		/**
         * Api Royale. Update de Option Object not Merge
         * @param option 
         * @param lazyUpdate 
         * @param silent 
         */
        public function updateOption(config:Object, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            _configOption = config;
            if(!instanceECharts)
                return;

            instanceECharts.setOption(_configOption,{notMerge: false, lazyUpdate: lazyUpdate, silent: silent});
            isConfigure = _configOption?true:false;
        }
		/**
		 * Gets option object maintained in current instance, which contains configuration item and data merged 
         * from previous setOption operations by users, along with user interaction states.
		 * @return Object
		 */
        public function getOption():Object{
            if(instanceECharts){
                return instanceECharts.getOption();
            }else{
                return null;
            }
        }
		/**
		 * Clears current instance; removes all components and series in current instance.
		 */
        public function clear():void{
            if(instanceECharts){
                instanceECharts.clear();
                configOption = null;
                isConfigure = false;
            }
        }
		/**
		 * Resizes chart, which should be called manually when container size changes.
		 * @param opts Optional; { width?: number|string, height?: number|string, silent?: boolean }
         *                      width : Specify width explicitly, in pixel. If setting to null/undefined/'auto', width of dom (instance container) will be used.
         *                      height : Specify height explicitly, in pixel. If setting to null/undefined/'auto', height of dom (instance container) will be used.
         *                      silent : Specify whether or not to prevent triggering events.
		 */
        public function resize(opts:Object = null):void
        {
            if(instanceECharts){
                instanceECharts.resize(opts);
            }
        }
		/**
		 * Group name to be used in echarts.connection
		 */
        private var _group:String;
        public function get group():String{ return _group; }
        public function set group(value:String):void
        { 
            _group = value; 
            instanceECharts.group = _group;
        }
		/**
		 * Gets width of ECharts instance container
		 */
        public function getWidth():Number
        { 
            if(instanceECharts){
                return instanceECharts.getWidth();
            }else{
                return 0;
            }
        }
		/**
		 * Gets height of ECharts instance container
		 */
        public function getHeight():Number
        { 
            if(instanceECharts){
                return instanceECharts.getHeight();
            }else{
                return 0;
            }
        }
		/**
		 * Binds event-handling function.
		 * @param eventName Event names are all in lower-cases, for example, 'click', 'mousemove', 'legendselected'
		 * @param handler Event-handling function, whose format is as following: (event: Object)
		 * @param query Optional; string|Object; Condition for filtering. query enables only call handlers on graphic elements of specified components.
		 * @param context Optional; context of callback function, what this refers to.
		 */
        public function on(eventName:String, handler:Function, query:Object = null, context:Object=null):void
        {
            if(instanceECharts){                
                instanceECharts.on(eventName, handler);
            }
        }
		/**
		 * Unbind event-handler function.
		 * @param eventName Event name.
		 * @param handler Optional. The function to be unbound could be passed. Otherwise, all event functions of this type will be unbound.
		 */
        public function off(eventName:String, handler:Function = null):void
        {
            if(instanceECharts){                
                instanceECharts.off(eventName, handler);
            }
        }
                        /*
                        mychart.on('updateAxisPointer', function (event) {
                            var xAxisInfo = event.axesInfo[0];
                            if (xAxisInfo) {
                                var dimension = xAxisInfo.value + 1;
                                mychart.setOption({
                                    series: {
                                        id: 'pie',
                                        label: {
                                            formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                                        },
                                        encode: {
                                            value: dimension,
                                            tooltip: dimension
                                        }
                                    }
                                });
                            }
                        });*/

//instanceECharts.getDom
/*
instanceECharts.dispose
instanceECharts.isDisposed
instanceECharts.getConnectedDataURL
instanceECharts.getDataURL
instanceECharts.hideLoading
instanceECharts.showLoading
instanceECharts.containPixel
instanceECharts.convertFromPixel
instanceECharts.convertToPixel
instanceECharts.dispatchAction
*/
	}
}