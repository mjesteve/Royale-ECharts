package com.echarts.controllers
{
    import org.apache.royale.core.IBeadController;
    import org.apache.royale.core.IBeadModel;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.EventDispatcher;
    import com.echarts.models.EChartsModel;
    import org.apache.royale.events.IEventDispatcher;
    import com.echarts.events.EChartsEvent;
    import com.echarts.vos.EChartsInstanceVO;
    import com.echarts.vos.EChartsThemeTemplateVO;
    import org.apache.royale.net.HTTPConstants;
    import com.echarts.models.EChartsThemesModel;
    import com.echarts.events.EChartsThemesEvent;
    import mx.net.SharedObjectFlushStatus;

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
            
        [Bindable]
        [Inject(source="echartsThemesModel", required="true")]
        public var echartsThemesModel:EChartsThemesModel;

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
            if(withThemesSupport)                
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
