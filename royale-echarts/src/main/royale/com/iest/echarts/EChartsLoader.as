package com.iest.echarts
{
	import org.apache.royale.events.EventDispatcher;
	import org.apache.royale.utils.ObjectMap;

    [Bindable]
    public class EChartsLoader 
	{
		
        private static var _instance:EChartsLoader;
		public static function get instance():EChartsLoader{
			return _instance || (_instance = new EChartsLoader());
		}    
		/**
		 * Constructor.
		 */
		public function EChartsLoader()
		{
			if (!_instance) {
                super();
                _instance = this;
                echartsInstances = new ObjectMap();
			}else{                            
				trace('EChartsLoader error');                
				throw new Error("singleton");
            }
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

