package echarts.controllers
{
    import org.apache.royale.core.IBeadController;
    import org.apache.royale.core.IBeadModel;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.EventDispatcher;
    import echarts.models.EChartsThemesModel;
    import org.apache.royale.events.IEventDispatcher;
    import echarts.events.EChartsThemesEvent;
    import echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.net.HTTPConstants;
    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.URLRequest;

    public class EChartsThemesController extends EventDispatcher implements IBeadController
	{
		protected var _model:IBeadModel;

        public function get model():EChartsThemesModel {
            return _model as EChartsThemesModel;
        }

        [Inject]
        public function setModel(value:EChartsThemesModel):void {
            _model = value;
        }

        [Dispatcher]
        public var dispatcher:IEventDispatcher;

        /**
		 * Constructor.
		 */
		public function EChartsThemesController()
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
            dispatcher.addEventListener(EChartsThemesEvent.ON_INICIALIZE,initialize);
		}

		[EventHandler(event="EChartsThemesEvent.ON_INICIALIZE", properties = "itemSelTheme", scope="global")]
        public function initialize(itemSelTheme:EChartsThemeTemplateVO):void{
            //Load theme by default
            model.init();
            if(itemSelTheme)
                onLoadThemeFromFile(new EChartsThemeTemplateVO('default'));
            else
            {                
                model.initComplete = true;
                dispatcher.dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_AFTERINICIALIZE));
            }

        }

		[EventHandler(event="EChartsThemesEvent.ON_LOADTHEMEFROMFILE", properties = "itemSelTheme", scope="global")]
        public function onLoadThemeFromFile(itemSelTheme:EChartsThemeTemplateVO):void
        {
            if(!itemSelTheme || !itemSelTheme.themeName)
                return;

            trace(">>>>> ON_LOADTHEMEFROMFILE. themeName :", itemSelTheme.themeName, model.loadInProgress);
			var evt:EChartsThemesEvent;
			if(model.loadInProgress)
			{
				evt = new EChartsThemesEvent(EChartsThemesEvent.ON_WAIT_LOADTHEMEFROMFILE);
				evt.itemSelTheme = itemSelTheme;
            	dispatcher.dispatchEvent(evt);	
            	trace(">>>>> EXIT loadFromFile. themeName - wait.",itemSelTheme.themeName);
			}
			else
			{	                
                model.loadInProgress = true;
                model.itemLoadingTheme = model.itemThemeFromName(itemSelTheme.themeName);
                if( model.itemLoadingTheme )
                {
           		    trace(">>>>> EXIT loadFromFile. themeName.",itemSelTheme.themeName);
                    if(!model.itemLoadingTheme.jsonConfig)
                    {
                        trace(">>>>> loadFromFile. EXIST themeName NO custom.",itemSelTheme.themeName);

                        var loaderJSON:URLLoader = new URLLoader();
                        //IOErrorEvent.IO_ERROR | SecurityErrorEvent.SECURITY_ERROR
                        loaderJSON.addEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
                        loaderJSON.addEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);
                        //Event.COMPLETE
                        loaderJSON.addEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);         
                        loaderJSON.load(new URLRequest("themes/json/"+itemSelTheme.themeName+".json"));
                        trace(">>>>> loadFromFile. serviceJSON.load themeName", itemSelTheme.themeName);				
                    }
                    else
                    {
                        trace(">>>>> loadTheme. EXIST themeName custom or preload.",model.itemLoadingTheme.themeName);
                        //WIP
                        evt = new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE);
                        evt.itemSelTheme = model.itemLoadingTheme;
                        dispatcher.dispatchEvent(evt);
                        model.loadInProgress = false;
                        model.itemLoadingTheme = null;
                    }
                
                }else{
                    //WIP
                    model.loadInProgress = false;
                }
			}
			
        } 

        private function loadThemeFromTemplateComplete(event:Event):void{
            trace("loadThemeFromTemplateComplete:", model.itemLoadingTheme.themeName);
            
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);
            
			var objData:Object = (loaderDispatcher as URLLoader).data;
			var jsonData:Object = JSON.parse(objData as String);
            trace(">>>>> DATA loadThemeFromTemplateComplete _themeNameLoading:", model.itemLoadingTheme.themeName, objData);
            model.itemLoadingTheme.jsonConfig = jsonData;
			updateConfigTheme(model.itemLoadingTheme.themeName,jsonData);

            if(model.initComplete)
            {
                var evt:EChartsThemesEvent = new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_LOADTHEMEFROMFILE);
                evt.itemSelTheme = model.itemLoadingTheme;
                dispatcher.dispatchEvent(evt);
            }else
            {
                registerTheme(model.itemLoadingTheme);
                model.initComplete = true;
                dispatcher.dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_AFTERINICIALIZE));
                trace("theme default init", model.themesLoad[ model.itemLoadingTheme.themeName]);
            }
            model.loadInProgress = false;
            model.itemLoadingTheme = null;
        } 

        private function loadThemeFromTemplateError(event:Event):void{
            trace("loadThemeFromTemplateError:", model.itemLoadingTheme.themeName);
            
			trace(Object(event).text);
            
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadThemeFromTemplateComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadThemeFromTemplateError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadThemeFromTemplateError);            
            
            var evt:EChartsThemesEvent;
            if(model.initComplete)
            {
                evt = new EChartsThemesEvent(EChartsThemesEvent.ON_ERROR_LOADTHEMEFROMFILE);
                evt.itemSelTheme = model.itemLoadingTheme;
            }else
            {
                model.initComplete = true;
                evt = new EChartsThemesEvent(EChartsThemesEvent.ON_AFTERINICIALIZE);
            }
            evt.status = Object(event).text as String;
            dispatcher.dispatchEvent(evt);
            model.loadInProgress = false;
            model.itemLoadingTheme = null;
        } 

        public function updateConfigTheme(themeName:String,themeConfig:Object):void{
            trace(">>>>> updateConfigTheme:", themeName);
            if(model.itemThemeFromName(themeName)){
                model.itemThemeFromName(themeName).jsonConfig = themeConfig;
            	trace(">>>>> updateConfigTheme SET OK");
            }
            trace(">>>>> EXIT updateConfigTheme:", themeName);
        }


		[EventHandler(event="EChartsThemesEvent.ON_REGISTERTHEME", properties = "itemSelTheme", scope="global")]
        protected function registerTheme(itemSelTheme:EChartsThemeTemplateVO):void{
            if(!itemSelTheme || !itemSelTheme.themeName) return;

            trace(">>>>> registerTheme:", itemSelTheme.themeName);
            var it:EChartsThemeTemplateVO = model.itemThemeFromName(itemSelTheme.themeName);

            if(!it){
                addTheme(itemSelTheme);
                it = itemSelTheme;
            }
			echarts.registerTheme(it.themeName,it.jsonConfig);
            trace(">>>>> registerTheme SET OK");
            it.isReg = true;
            if(model.initComplete)
                dispatcher.dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_COMPLETE_REGISTERTHEME, it));
            trace(">>>>> EXIT registerTheme:", it.themeName);
        }

		[EventHandler(event="EChartsThemesEvent.ON_ADD", properties = "itemSelTheme", scope="global")]
        public function addTheme(itemSelTheme:EChartsThemeTemplateVO):void
        {
            if(!itemSelTheme) return;

            var themeName:String = itemSelTheme.themeName;
			do
			{
				if(!themeName)
                {
					model.countCustomTheme++;
					themeName = "custom_"+model.countCustomTheme.toString();
				}else 
                    if(model.itemThemeFromName(themeName))
						themeName="";
			}while(!themeName || model.itemThemeFromName(themeName));

            itemSelTheme.themeName = themeName;
            itemSelTheme.isReg = false;
            itemSelTheme.custom = true;
            model.themesLoad[themeName] = itemSelTheme;

            dispatcher.dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_AFTERADD, itemSelTheme));
			
        } 

		[EventHandler(event="EChartsThemesEvent.ON_DEL", properties = "itemSelTheme", scope="global")]
        public function delTheme(itemSelTheme:EChartsThemeTemplateVO):void
        {
           

            dispatcher.dispatchEvent(new EChartsThemesEvent(EChartsThemesEvent.ON_AFTERDEL));
			
        } 

		
    }
}
