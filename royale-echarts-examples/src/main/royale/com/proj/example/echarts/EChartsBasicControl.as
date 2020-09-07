package com.proj.example.echarts
{
	import org.apache.royale.core.StyledUIBase;
    import org.apache.royale.events.Event;
    import com.proj.example.echarts.events.EChartsEvent;
    import com.proj.example.echarts.vos.EChartsInstanceVO;
    import org.apache.royale.core.WrappedHTMLElement;
    import org.apache.royale.html.util.addElementToWrapper;
    import org.apache.royale.core.UIBase;
    import org.apache.royale.utils.sendEvent;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.html.elements.B;
	
    /**
     *  Indicates that the initialization of the EChartsInstance is complete.  
     */
	[Event(name="onCompleteInicialize", type="com.proj.example.echarts.events.EChartsEvent")]
    /**
     *  Indicates that the configuration of the EChartsInstance is complete.  
     */
	[Event(name="onCompleteConfig", type="com.proj.example.echarts.events.EChartsEvent")]
	/**
	 * The default property uses when additional MXML content appears within an element's
	 * definition in an MXML file.
	 */
	[DefaultProperty("instanceECharts")]

	COMPILE::JS
	public class EChartsBasicControl extends UIBase
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

        /**
         *  Constructor.
         */
        public function EChartsBasicControl()
		{
			super();			
			typeNames = "";
            //test
            addEventListener("beadsAdded", beadsAddedHandler);
		}

        //test
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
		/**
		 * Dispatches a "layoutNeeded" event
		 */
		public function layoutNeeded():void
		{
			sendEvent(this,"layoutNeeded");
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
        [Bindable("onCompleteInicialize")]
        public function set isInit(value:Boolean):void{ 
            _isInit = value; 
            dispatchEvent(new EChartsEvent(EChartsEvent.ON_COMPLETE_INICIALIZE));
        }

        private var _isConfigure:Boolean;
        [Bindable("onCompleteConfig")]
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
        public function set configOption(value:Object):void
        { 
            if(_configOption != value)
            {
                _configOption = value;                
            }

        }

        //For now we only deal with named themes
        private var _oldThemeName:String = '';
		/**
		 * @param theme Object|string
		 */
        private var _themeName:String = 'default';
        [Bindable("themeNameChange")]
        public function get themeName():String{ return _themeName; }
        public function set themeName(value:String):void
        {
            if(_themeName != value){

                var itTheme:EChartsThemeTemplateVO = EChartsThemeLoader.itemThemeFromName(value);
                if(itTheme)
                {
                    //theme native or template
                    if(itTheme.isNative){
                        _themeName = itTheme.themeName;
                    }else{
                        //Load template
                    }

                }
            }
        }

		/**
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 */
		private var _optsInstance:Object = null;
        [Bindable("optsInstanceChange")]
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
                if(globalECharts.echartsInstances[objInstance.id])
                    delete globalECharts.echartsInstances[objInstance.id];
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
    
        private var _initiationInProcess:Boolean = false;
		/**
		 * Creates an ECharts instance, and returns an echartsInstance.
		 * @param make Configuration item and data after init.
		 */
		public function init(make:Boolean = false):void
		{
            if(_initiationInProcess)
                return;

            _initiationInProcess = true;

            if(_instanceECharts)
            {
                if(_oldThemeName == _themeName) //Current theme applied
                    instanceECharts = null;
                else //Theme pending to apply
                    clear();
            }
			// see echarts.init 
			instanceECharts = echarts.init(element,_themeName,_optsInstance);
            
            _oldThemeName = _themeName;
            
            if(make)
                setOption(_configOption);
            
            _initiationInProcess = false;
		}
    
		/**
		 * Update Theme Instance Echarts.
		 */
        public function UpdateTheme(themeName:String=null):void
        {
            if(!_instanceECharts) 
                return;

            if(_themeName == themeName)
                return;

            if(_oldThemeName == _themeName) //Current theme applied
                instanceECharts = null;
            else //Theme pending to apply
                clear();
            
            _themeName = themeName;

			init(true);
        }
		/**
		 * Configuration item, data, universal interface, all parameters and data can all be modified through setOption.
		 * @param option Configuration item and data.
		 * @param lazyUpdate Optional; states whether not to update chart immediately; false by default, stating update immediately.
		 * @param silent Optional; states whether not to prevent triggering events when calling setOption; false by default, stating trigger events.
         * 
         * 
		 * @param notMarge Optional; states whether not to merge with previous option; false by default, stating merging.
		 */
        public function setOption(config:Object=null, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            if(!_instanceECharts)
                return;

            if(!_initiationInProcess)
                clear();
            
            _configOption = config;
                
            _instanceECharts.setOption(_configOption,{notMerge: true, lazyUpdate: lazyUpdate, silent: silent});
            isConfigure = true;
        }
		/**
         * Api Royale. Update de Option Object Merge
         * @param option 
         * @param lazyUpdate 
         * @param silent 
         */
        public function updateOption(config:Object, lazyUpdate:Boolean=false, silent:Boolean=false):void
        {
            if(!_instanceECharts)
                return;

            _configOption = config;

            _instanceECharts.setOption(_configOption,{notMerge: false, lazyUpdate: lazyUpdate, silent: silent});
            isConfigure = true;
        }
		/**
         * Api Royale. Refresh de Option Object Merge
         * @param requestInitialize 
         * @param requestConfig 
         * @param adjustSize 
         */
        public function refreshOption(requestInitialize:Boolean = false, requestConfig:Boolean = false, adjustSize:Boolean = false):void
        {
            if(!_instanceECharts){
                if(requestInitialize){
                    init(true);
                    if(adjustSize)
                        resize();
                }
                return;                    
            }

            if(!isConfigure){
                if(requestConfig)
                    setOption(true);
            }
            else if(requestConfig)
                updateOption(_configOption);

            if(adjustSize)
                resize();
        }
		/**
		 * Gets option object maintained in current instance, which contains configuration item and data merged 
         * from previous setOption operations by users, along with user interaction states.
		 * @return Object
		 */
        public function getOption():Object{
            if(_instanceECharts){
                return _instanceECharts.getOption();
            }else{
                return null;
            }
        }
		/**
		 * Clears current instance; removes all components and series in current instance.
		 */
        public function clear():void{
            if(_instanceECharts && _isConfigure){
                _instanceECharts.clear();
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
            if(_instanceECharts){
                _instanceECharts.resize(opts);
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
            _instanceECharts.group = _group;
        }
		/**
		 * Gets width of ECharts instance container
		 */
        public function getWidth():Number
        { 
            if(_instanceECharts){
                return _instanceECharts.getWidth();
            }else{
                return 0;
            }
        }
		/**
		 * Gets height of ECharts instance container
		 */
        public function getHeight():Number
        { 
            if(_instanceECharts){
                return _instanceECharts.getHeight();
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
            if(_instanceECharts){                
                _instanceECharts.on(eventName, handler);
            }
        }
		/**
		 * Unbind event-handler function.
		 * @param eventName Event name.
		 * @param handler Optional. The function to be unbound could be passed. Otherwise, all event functions of this type will be unbound.
		 */
        public function off(eventName:String, handler:Function = null):void
        {
            if(_instanceECharts){                
                _instanceECharts.off(eventName, handler);
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