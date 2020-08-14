package
{
	/**
	 * @externs
	 */
	COMPILE::JS
	public class echarts{
//echarts.min.formatted.js | echarts.min_5.0.js | echarts_4.8.js
		/**
		 * <inject_script>
		 * var script = document.createElement("script");
		 * script.setAttribute("src", "js/echarts.min_5.0.js");
		 * document.head.appendChild(script);
		 * </inject_script>
		*/
        public function echarts(){}
		/**
		 * Creates an ECharts instance, and returns an echartsInstance. You shall not initialize multiple ECharts instances on a single container.
		 * @param dom HTMLDivElement|HTMLCanvasElement
		 * @param theme Object|string
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 * @return echartsInstance
		 */
		public static function init(dom:Element=null,theme:String=null, opts:Object=null):Object { return null; }
		/**
		 * Connects interaction of multiple chart series.
		 * @param group string|Array
		 */
		public static function connect(group:Object=null):void{}
		/**
		 * Disconnects interaction of multiple chart series. To have one single instance to be removed, you can set group of chart instance to be null.
		 * @param group string
		 */
		public static function disconnect(group:String=null):void{}
		/**
		 * Destroys chart instance, after which the instance cannot be used any more.
		 * @param target ECharts|HTMLDivElement|HTMLCanvasElement
		 */
		public static function dispose(target:Object=null):void{}
		/**
		 * Returns chart instance of dom container.
		 * @param getInstanceByDom HTMLDivElement|HTMLCanvasElement
		 * @return Element
		 */
		public static function getInstanceByDom(getInstanceByDom:Object=null):Object{ return null;}
		/**
		 * Registers available maps. This can only be used after including geo component or chart series of map.
		 * @param mapName Map name, referring to map value set in geo component or map.
		 * @param geoJson Data in GeoJson format. See https://geojson.org/ for more format information.
		 * @param specialAreas Optional; zoomed part of a specific area in the map for better visual effect.
		 */
		public static function registerMap(mapName:String=null, geoJson:Object=null, specialAreas:Object=null):void{}
		/**
		 * Get a registered map in the following format:
		 * {
		 * 	// geoJson data of the map
		 * 	geoJson: Object,
		 * 	// special area, see registerMap() for more information
		 * 	specialAreas: Object
		 * }
		 * @param mapName Map name
		 */
		public static function getMap(mapName:String=null):void{}
		/**
		 * Registers a theme, should be specified when initialize the chart instance.
		 * @param themeName 
		 * @param theme 
		 */
		public static function registerTheme(themeName:String=null, theme:Object=null):void{}
		
	}
}