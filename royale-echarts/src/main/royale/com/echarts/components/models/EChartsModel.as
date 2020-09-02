package com.echarts.components.models
{
	import org.apache.royale.core.IBeadModel;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.events.EventDispatcher;
	import org.apache.royale.utils.ObjectMap;

    [Bindable]
    public class EChartsModel extends EventDispatcher implements IBeadModel
	{
		
        private static var _instance:EChartsModel;
		public static function get instance():EChartsModel{
			return _instance || (_instance = new EChartsModel());
		}    
		/**
		 * Constructor.
		 */
		public function EChartsModel()
		{
			if (!_instance) {
                super();
                _instance = this;
                echartsInstances = new ObjectMap();
			}else{                            
				trace('EChartsModel error');                
				throw new Error("singleton");
            }
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
		public function set strand(value:IStrand):void
		{
			_strand = value;
		}    

		public var initComplete:Boolean = false;

		//key: instance.id - value: instance.jsInstance
        public var echartsInstances:ObjectMap;

		private var _withThemesSupport:Boolean = true;
		public function get withThemesSupport():Boolean{ return _withThemesSupport; }
		public function set withThemesSupport(value:Boolean):void
		{ 
			_withThemesSupport = value;
		}
		public var themeNameTemplateDefault:String = 'default';
    }
}

