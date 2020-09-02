package com.proj.example.echarts.controllers
{
    import org.apache.royale.core.IBeadController;
    import org.apache.royale.core.IBeadModel;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.EventDispatcher;
    import com.proj.example.echarts.models.EChartsModel;
    import org.apache.royale.events.IEventDispatcher;
    import com.proj.example.echarts.events.EChartsEvent;
    import com.proj.example.echarts.vos.EChartsInstanceVO;
    import com.proj.example.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.net.HTTPConstants;
    import com.proj.example.echarts.models.EChartsThemesModel;
    import com.proj.example.echarts.events.EChartsThemesEvent;
    import mx.net.SharedObjectFlushStatus;
    import com.proj.example.echarts.IBeadThemeController;

    public class EChartsController extends EventDispatcher implements IBeadController
	{
		protected var _model:IBeadModel;

        public function get model():EChartsModel {
            return _model as EChartsModel;
        }

        public function get dispatcher():IEventDispatcher
        {
            return _strand as IEventDispatcher;
        }

        /**
		 * Constructor.
		 */
		public function EChartsController()
		{
			super();
            addEventListener("beadsAdded", beadsAddedHandler);
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
            dispatcher.addEventListener(EChartsEvent.ON_INICIALIZE,initializeEcharts);
            themesController = new EChartsThemesController();
            themesController.setModel(new EChartsThemesModel);
            _strand.addBead(themesController);
		}

        protected var themesController:EChartsThemesController;

        private function beadsAddedHandler(event:Event):void
        {
            trace(event)
        }

		//[EventHandler(event="EChartsEvent.ON_INICIALIZE", properties = "withThemesSupport", scope="global")]
        protected function initializeEcharts(event:EChartsEvent):void{
            var withThemesSupport:Boolean = event.withThemesSupport;
            if(withThemesSupport)
            {

            }

			model.withThemesSupport = event.withThemesSupport;
            if(event.withThemesSupport)                
                dispatcher.dispatchEvent(new EChartsThemesEvent(
                    EChartsThemesEvent.ON_INICIALIZE, 
                    new EChartsThemeTemplateVO(model.themeNameTemplateDefault)));
            else{ 
			    model.initComplete = true;
                dispatcher.dispatchEvent(new EChartsEvent(EChartsEvent.ON_AFTERINICIALIZE));
            }
        }
          
        [EventHandler(event="EChartsThemesEvent.ON_AFTERINICIALIZE", scope="global")]
        public function afterInitThemesEvent(event:EChartsThemesEvent):void
        {
            trace("afterInitThemesEvent");
            model.initComplete = true;
            if(event.status){
                trace("Error: "+ event.status);
                model.withThemesSupport = false;
            }
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

		
    }
}
