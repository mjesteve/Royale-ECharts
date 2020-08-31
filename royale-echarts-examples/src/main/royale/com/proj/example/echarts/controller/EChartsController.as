package com.proj.example.echarts.controller
{
    import org.apache.royale.core.IBeadController;
    import org.apache.royale.core.IBeadModel;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.EventDispatcher;
    import com.proj.example.echarts.model.EChartsModel;
    import org.apache.royale.events.IEventDispatcher;
    import com.proj.example.echarts.events.EChartsEvent;
    import com.proj.example.echarts.vos.EChartsInstanceVO;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.HTTPConstants;
    import org.apache.royale.net.URLRequest;

    public class EChartsController extends EventDispatcher implements IBeadController
	{
		protected var _model:IBeadModel;

        public function get model():EChartsModel {
            return _model as EChartsModel;
        }

        [Inject]
        public function setModel(value:EChartsModel):void {
            _model = value;
        }

        [Dispatcher]
        public var dispatcher:IEventDispatcher;

        /**
		 * Constructor.
		 */
		public function EChartsController()
		{
			super();
		}

		protected var _strand:IStrand;

		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function set strand(value:IStrand):void
		{
			_strand = value;
			_model = _strand.getBeadByType(IBeadModel) as IBeadModel;
		}

		[EventHandler(event="EChartsEvent.ON_INICIALIZE", properties = "withThemesSupport", scope="global")]
        public function initialize(withThemesSupport:Boolean):void{
            //model.resetModel();
            //source();
			model.withThemesSupport = withThemesSupport;
			model.initComplete = true;
            dispatcher.dispatchEvent(new EChartsEvent(EChartsEvent.ON_AFTERINICIALIZE));

        }

		[EventHandler(event="EChartsEvent.ON_ADD", properties = "echartInstance", scope="global")]
        public function addInstance(echartInstance:EChartsInstanceVO=null):void
        {
            if(!echartInstance)
                return;
            var idinstance:String = echartInstance.id;
			if(!model.echartsInstances[idinstance])
                model.echartsInstances[idinstance] = echartInstance.jsInstance;

            dispatcher.dispatchEvent(new EChartsEvent(EChartsEvent.ON_AFTERADD));
			
        } 

		[EventHandler(event="EChartsEvent.ON_DEL", properties = "echartInstance", scope="global")]
        public function delInstance(echartInstance:EChartsInstanceVO):void
        {
            if(!echartInstance)
                return;
            var idinstance:String = echartInstance.id;
			if(model.echartsInstances[idinstance])
			{				
                //echarts.dispose(echartInstance.jsInstance);
                delete model.echartsInstances[idinstance];
			}

            dispatcher.dispatchEvent(new EChartsEvent(EChartsEvent.ON_AFTERDEL));
			
        } 

		[EventHandler(event="EChartsEvent.ON_LOADTHEMEFROMFILE", properties = "echartInstance,itemSelTheme", scope="global")]
        public function onLoadThemeFromFile(echartInstance:EChartsInstanceVO, itemSelTheme:EChartsThemeTemplateVO):void
        {
            if(!model.withThemesSupport || !itemSelTheme || !itemSelTheme.themeName)
                return;

            trace(">>>>> ON_LOADTHEMEFROMFILE. themeName :", itemSelTheme.themeName, model.loadInProgress);
			var evt:EChartsEvent;
			if(model.loadInProgress)
			{
				evt = new EChartsEvent(EChartsEvent.ON_WAIT_LOADTHEMEFROMFILE);
				evt.echartInstance = echartInstance;
            	dispatcher.dispatchEvent(evt);	
            	trace(">>>>> EXIT loadFromFile. themeName - wait.",itemSelTheme.themeName);
			}
			else
			{
				model.itemLoadingTheme = model.itemTheme(itemSelTheme.themeName);

				if( model.itemLoadingTheme )
				{
					if(!model.itemLoadingTheme.jsonConfig){
						trace(">>>>> loadFromFile. EXIST themeName NO custom.  loadInProgress",itemSelTheme.themeName, model.loadInProgress);

						model.loadInProgress = true;
						model.serviceJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
						model.serviceJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);         
						model.serviceJSON.load(new URLRequest("themes/json/"+model.itemLoadingTheme.themeName+".json"));
						trace(">>>>> loadFromFile. serviceJSON.load themeName", model.itemLoadingTheme.themeName);
					
					}else{
						trace(">>>>> loadTheme. EXIST themeName custom or preload.",model.itemLoadingTheme.themeName);

					}
            
				}else{
					
				}
           		trace(">>>>> EXIT loadFromFile. themeName.",itemSelTheme.themeName);

			}
        } 

        private function loadThemeFromTemplateComplete(e:Event):void{
            trace("loadThemeFromTemplateComplete:", model.itemLoadingTheme.themeName);

            model.serviceJSON.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            
			var objData:Object = model.serviceJSON.data;
			var jsonData:Object = JSON.parse(objData as String);
            trace(">>>>> DATA loadThemeFromTemplateComplete _themeNameLoading:", model.itemLoadingTheme.themeName, objData);
			
			updateConfigTheme(model.itemLoadingTheme.themeName,jsonData);
			registerTheme(model.itemLoadingTheme.themeName,jsonData); 
			model.loadInProgress = false;
            trace(">>>>> EXIT loadThemeFromTemplateComplete. themeName loadInProgress:",model.itemLoadingTheme.themeName, model.loadInProgress);
			model.itemLoadingTheme.themeName = "";
        } 

        private function loadThemeFromTemplateError(e:Event):void{
            trace("loadThemeFromTemplateError:", _themeNameLoading);
            EChartsThemeTemplates.serviceJSON.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            if(!isNaN(_lastExecute))
            {
                clearTimeout(_lastExecute);
                _lastExecute = NaN;
            }
            trace("EXIT loadThemeFromTemplateError:",  _themeNameLoading);
            _themeNameLoading = "";
        } 

		
    }
}
