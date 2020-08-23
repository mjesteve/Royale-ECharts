package com.proj.example.echarts
{
	import org.apache.royale.html.Container;
	import org.apache.royale.core.UIBase;
	import org.apache.royale.net.HTTPService;
	import org.apache.royale.collections.LazyCollection;
	import org.apache.royale.collections.parsers.JSONInputParser;

	[DefaultProperty("currentInstance")]

	COMPILE::JS
	public class EChartsComponent extends Container
    {
	
        public function EChartsComponent()
		{
			super();
		}
		public var domInstance:Element = null;
        static public var serviceJSON:HTTPService;
        static public var collectionJSON:LazyCollection;
         
		/**
		 * @private
		 */
		override public function addedToParent():void
		{
			super.addedToParent();
            percentWidth = 100;
            percentHeight = 100;
			domInstance = this.element;
            
            serviceJSON = new HTTPService();
            collectionJSON = new LazyCollection();
            collectionJSON.inputParser = new JSONInputParser();
            collectionJSON.itemConverter = new ThemeDataJSONItemConverter();
            serviceJSON.addBead(collectionJSON);
            addBead(serviceJSON);
		}
        
        private var _currentInstance:Object;
        public function get currentInstance():Object{ return _currentInstance; }
        public function set currentInstance(value:Object):void{ 
            _currentInstance = value;
            isInit = (_currentInstance);            
        }
        [Bindable]
        public var isInit:Boolean;

        protected var _options:Object;
        [Bindable("optionsChange")]
        public function get options():Object{ 
            return _options; 
        }
        public function set options(value:Object):void{ 
            _options = value;
        }
        [Bindable]
        public var isConfigure:Boolean;

		private var _themeInstance:Object = null;
        [Bindable]
		public function get themeInstance():Object{
            return _themeInstance; 
        }
		public function set themeInstance(value:Object):void{ 
                         
            if(typeof value == 'string')
            {
                var idxtheme:int = -1
                if(EChartsThemes.loadTheme(this, value as String, idxtheme))
                {
                    _themeInstance = EChartsThemes.themesLoad[idxtheme];
                    echarts.registerTheme(value as String,_themeInstance);
                    return;
                }
            }else{
                //Unfinished. Temporary issues.
                //_themeInstance = value; 
            }
            
        }

		public var optsInstance:Object = null;
    
		/**
		 * Creates an ECharts instance, and returns an echartsInstance.
		 * @param theme Object|string
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 */
		public function init(theme:Object=null, opts:Object=null):void
		{
            if(isInit) {
                echarts.dispose(currentInstance);
            }
			if(theme)
				themeInstance = theme;
            else if(!themeInstance){
                themeInstance = 'default';
            }
			if(opts)
				optsInstance = opts;
			// see echarts.init 
			currentInstance = echarts.init(domInstance,themeInstance,optsInstance);
            if(_options)
                setOption(_options);
		}
		/**
		 * Configuration item, data, universal interface, all parameters and data can all be modified through setOption.
		 * @param option Configuration item and data.
		 * @param notMarge Optional; states whether not to merge with previous option; false by default, stating merging.
		 * @param lazyUpdate Optional; states whether not to update chart immediately; false by default, stating update immediately.
		 * @param silent Optional; states whether not to prevent triggering events when calling setOption; false by default, stating trigger events.
		 */
        public function setOption(option:Object, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            options = option;
            if(currentInstance){
                currentInstance.setOption(option,{notMerge: true, lazyUpdate: lazyUpdate, silent: silent});
                isConfigure = _options?true:false;
            }
        }
		/**
         * Api Royale. Update de Option Object not Merge
         * @param option 
         * @param lazyUpdate 
         * @param silent 
         */
        public function updateOption(option:Object, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            options = option;
            if(!currentInstance)
                return;

            currentInstance.setOption(option,{notMerge: false, lazyUpdate: lazyUpdate, silent: silent});
            isConfigure = _options?true:false;
        }
		/**
		 * Gets option object maintained in current instance, which contains configuration item and data merged 
         * from previous setOption operations by users, along with user interaction states.
		 * @return Object
		 */
        public function getOption():Object{
            if(currentInstance){
                return currentInstance.getOption();
            }else{
                return null;
            }
        }
		/**
		 * Clears current instance; removes all components and series in current instance.
		 */
        public function clear():void{
            if(currentInstance){
                currentInstance.clear();
                options = null;
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
            if(currentInstance){
                currentInstance.resize(opts);
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
            currentInstance.group = _group;
        }
		/**
		 * Gets width of ECharts instance container
		 */
        public function getWidth():Number
        { 
            if(currentInstance){
                return currentInstance.getWidth();
            }else{
                return 0;
            }
        }
		/**
		 * Gets height of ECharts instance container
		 */
        public function getHeight():Number
        { 
            if(currentInstance){
                return currentInstance.getHeight();
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
            if(currentInstance){                
                currentInstance.on(eventName, handler);
            }
        }
		/**
		 * Unbind event-handler function.
		 * @param eventName Event name.
		 * @param handler Optional. The function to be unbound could be passed. Otherwise, all event functions of this type will be unbound.
		 */
        public function off(eventName:String, handler:Function = null):void
        {
            if(currentInstance){                
                currentInstance.off(eventName, handler);
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

//currentInstance.getDom
/*
currentInstance.dispose
currentInstance.isDisposed
currentInstance.getConnectedDataURL
currentInstance.getDataURL
currentInstance.hideLoading
currentInstance.showLoading
currentInstance.containPixel
currentInstance.convertFromPixel
currentInstance.convertToPixel
currentInstance.dispatchAction
*/
	}
}