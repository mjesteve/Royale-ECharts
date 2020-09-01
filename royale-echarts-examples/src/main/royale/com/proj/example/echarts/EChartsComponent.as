package com.proj.example.echarts
{
	import org.apache.royale.html.Container;
	import org.apache.royale.core.IBead;
    import org.apache.royale.events.Event;
    import com.proj.example.echarts.models.EChartsModel;
    import com.proj.example.echarts.events.EChartsEvent;
    import com.proj.example.echarts.vos.EChartsInstanceVO;
    import com.proj.example.echarts.models.EChartsThemesModel;
    import com.proj.example.echarts.beads.EChartsThemeBead;
    import com.proj.example.echarts.events.EChartsThemesEvent;

	//[DefaultProperty("currentInstance")]

	COMPILE::JS
	public class EChartsComponent extends Container
    {
        [Bindable]
        [Inject(source="echartsModel", required="true")]
        public var echartsModel:EChartsModel;

        [Bindable]
        [Inject(source="echartsThemesModel", required="true")]
        public var echartsThemesModel:EChartsThemesModel;
	
       /* private var _echartsModel:EChartsModel;
        [Bindable]
        public function get echartsModel():EChartsModel{ return _echartsModel; }
        public function set echartsModel(value:EChartsModel):void{ _echartsModel = value; }
         
        private var _echartsThemesModel:EChartsThemesModel;
        [Bindable]
        public function get echartsThemesModel():EChartsThemesModel{ return _echartsThemesModel; }
        public function set echartsThemesModel(value:EChartsThemesModel):void{ _echartsThemesModel = value; }
        */
        public function EChartsComponent()
		{
			super();
            addEventListener("beadsAdded", beadsAddedHandler);
		}
		public var domInstance:Element = null;
        
		/**
		 * @private
		 */
		override public function addedToParent():void
		{
			super.addedToParent();
            percentWidth = 100;
            percentHeight = 100;
			domInstance = this.element;
		}

        private var _themeBead:EChartsThemeBead;
        public function beadsAddedHandler(event:Event):void
        {
            removeEventListener("beadsAdded", beadsAddedHandler);
            
            var ibeadact:IBead = this.getBeadByType(EChartsThemeBead);
            if(ibeadact)
            {
                _themeBead = ibeadact as EChartsThemeBead;
            }
            
        }
          
        [EventHandler(event="EChartsEvent.ON_AFTERINICIALIZE", scope="global")]
        public function echartsAfterInitEvent(event:EChartsEvent):void
        {
            trace("afterinit in component");
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE", scope="global")]
        public function onCompleteLoadThemeFromFile(event:EChartsThemesEvent):void
        {
            trace("onCompleteLoadThemeFromFile");
            /*if(event.itemSelTheme.themeName != _themeNameLoading) return;

            
            var themeObj:EChartsThemeTemplateVO = echartsThemesModel.itemThemeFromName(_themeNameLoading);
            if(themeObj.isReg)
                hostComponent.themeInstance = event.itemSelTheme;
            else{    
                _themeNameRegistering = _themeNameLoading;                    
                dispatcher.dispatchEvent(new EChartsThemesEvent(
                    EChartsThemesEvent.ON_REGISTERTHEME,themeObj)
                );
            }
            _themeNameLoading = "";
            if(!isNaN(_lastExecute))
            {
                clearTimeout(_lastExecute);
                _lastExecute = NaN;
            }*/
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_COMPLETE_REGISTERTHEME", scope="global")]
        public function onCompleteRegister(event:EChartsThemesEvent):void
        {
            trace("afterRegisterThemesEvent");
            /*if(event.itemSelTheme.themeName != _themeNameRegistering) return;

            _themeNameRegistering = "";
            hostComponent.themeInstance = event.itemSelTheme;*/
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_WAIT_LOADTHEMEFROMFILE", scope="global")]
        public function onWaitLoadThemeFromFile(event:EChartsThemesEvent):void
        {
            trace("onWaitLoadThemeFromFile");
            /*if(event.itemSelTheme.themeName != _themeNameLoading) return;

            _lastExecute = setTimeout(delayRetry,1000,event.itemSelTheme);
            trace("Id setTimeout:", _lastExecute.toString());*/
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_ERROR_LOADTHEMEFROMFILE", scope="global")]
        private function onErrorLoadThemeFromFile(e:Event):void{
            trace("onErrorLoadThemeFromFile:");
            /*if(!isNaN(_lastExecute))
            {
                clearTimeout(_lastExecute);
                _lastExecute = NaN;
            }
            trace("EXIT onErrorLoadThemeFromFile:",  _themeNameLoading);
            _themeNameLoading = "";*/
        } 

        private var _currentInstance:Object;
        public function get currentInstance():Object{ return _currentInstance; }
        public function set currentInstance(value:Object):void
        {
            var objInstance:EChartsInstanceVO;  

            if(!value && _currentInstance){
                objInstance = new EChartsInstanceVO(_currentInstance);
                echarts.dispose(_currentInstance);
                dispatchEvent(new EChartsEvent(EChartsEvent.ON_DEL, objInstance));
            }
            else if(value)
            {
                objInstance = new EChartsInstanceVO(value);
                dispatchEvent(new EChartsEvent(EChartsEvent.ON_ADD, objInstance));
            }

            _currentInstance = value;
            isInit = (_currentInstance ? true : false);
        }

        [Bindable]
        public var isInit:Boolean;

		private var _themeInstance:Object;
        [Bindable("themeInstanceChange")]
		public function get themeInstance():Object{
            return _themeInstance; 
        }
		public function set themeInstance(value:Object):void
        {
            if(_themeInstance === value)
                return;

            _themeInstance = value; 
            if(_themeBead)
                init(value);
        }

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

		public var optsInstance:Object = null;
    
		/**
		 * Creates an ECharts instance, and returns an echartsInstance.
		 * @param theme Object|string
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 */
		public function init(theme:Object=null, opts:Object=null):void
		{
            if(currentInstance) {
                currentInstance = null;
            }
			if(theme)
				themeInstance = theme;
            else if(!_themeInstance){
                //themeInstance = 'default';
            }
			if(opts)
				optsInstance = opts;
			// see echarts.init 
			currentInstance = echarts.init(domInstance,_themeInstance,optsInstance);
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