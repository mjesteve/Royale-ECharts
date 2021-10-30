package
{

	/**
	 * @externs
	 */
	COMPILE::JS
	public class echarts{

		/**
		 * <inject_script>
		 * var script = document.createElement("script");
		 * //script.setAttribute("src", "https://cdn.jsdelivr.net/npm/echarts@5.2.1/dist/echarts.min.js");
		 * //script.setAttribute("crossorigin","anonymous");
		 * script.setAttribute("src", "js/echarts.js");
		 * document.head.appendChild(script);
		 * 
		 * //script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/echarts/5.0.0-alpha.2/echarts.min.js");
		 * //script.setAttribute("integrity","sha512-TRh7pogfkvYZVIuppkrYA8WHLHwaqW2wONk+r4dtG+W0CDGrUUIictWnI8D2zCN/5Qcwmci4eTHRJpQ4jReJdA==");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * </inject_script>
		*/
        public function echarts(){
		}
		/**
		 * Creates an ECharts instance, and returns an echartsInstance. You shall not initialize multiple ECharts instances on a single container.
		 * @param dom		HTMLDivElement|HTMLCanvasElement. 
		 * 					Instance container, usually is a div element with height and width defined.
		 * 					If div is hidden, ECharts initialization tends to fail due to the lack of width and height information. In this case, 
		 * 					you can explicitly specify style.width and style.height of div, or manually call echartsInstance.resize [1] after showing div.
		 * 					[1] https://echarts.apache.org/en/api.html#echartsInstance.resize
		 * 
		 * @param theme? 	Object|string
		 * 					Theme to be applied. This can be a configuring object of a theme, or a theme name registered through echarts.registerTheme [1]
		 * 					See Overview of Style Customization. [2]
		 *  				[1] https://echarts.apache.org/en/api.html#echarts.registerTheme
		 * 					[2] https://echarts.apache.org/en/tutorial.html#Overview%20of%20Style%20Customization
		 * 
		 * @param opts? 	Object. Optional chart configurations; which may contain:
		 * 					{ 
		 * 					devicePixelRatio?	number. 		Ratio of one physical pixel to the size of one device independent pixels. Browser's window.devicePixelRatio is used by default.
		 * 					, renderer?			string.  		Supports 'canvas' or 'svg'. See Render by Canvas or SVG. [https://echarts.apache.org/en/tutorial.html#Render%20by%20Canvas%20or%20SVG]
		 * 					, useDirtyRect?		boolean.		Enable dirty rectangle rendering or not, false by default. See New features in ECharts 5. [https://echarts.apache.org/en/tutorial.html#New%20features%20in%20ECharts%205]
		 * 					, width?			number|string	Specify width explicitly, in pixel. If setting to null/undefined/'auto', width of dom (instance container) will be used.
		 * 					
		 * 					, height?			number|string	Specify height explicitly, in pixel. If setting to null/undefined/'auto', height of dom (instance container) will be used.
		 * 					, locale?			string			Specify the locale. There are two builtins: 'ZH' and 'EN'. 
		 * 														Or you can use echarts.registerLocale to register a new locale. [https://echarts.apache.org/en/api.html#echarts.registerLocale]
		 * 														Or supported locales can be referenced in src/i18n.
		 * 					}
		 * 					
		 * @return echartsInstance
		 */
		public static function init(dom:Element,theme:Object=null, opts:Object=null):Object { return null; }
		/**
		 * Connects interaction of multiple chart series.
		 * @param group 	string|Array	Group id, or array of chart instance.
		 */
		public static function connect(group:Object=null):void{}
		/**
		 * Disconnects interaction of multiple chart series. To have one single instance to be removed, you can set group of chart instance to be null.
		 * @param group 	string	group id.
		 */
		public static function disconnect(group:String=null):void{}
		/**
		 * Destroys chart instance, after which the instance cannot be used any more.
		 * @param target 	ECharts|HTMLDivElement|HTMLCanvasElement
		 * 					Destroys chart instance, after which the instance cannot be used any more.
		 */
		public static function dispose(target:Object=null):void{}
		/**
		 * Returns chart instance of dom container.
		 * @param getInstanceByDom 	HTMLDivElement|HTMLCanvasElement	Returns chart instance of dom container.
		 * @return Element
		 */
		public static function getInstanceByDom(getInstanceByDom:Object=null):Object{ return null;}
		/**
		 * Use components. Used with the new tree-shaking API. Since 5.0.1
		 * NOTE: echarts.use must be used before eharts.init
		 * @param components 	Array of components
		 * 
		 * TODO. See Use ECharts with bundler and NPM for more detailed explaination. [https://echarts.apache.org/en/tutorial.html#Use%20ECharts%20with%20bundler%20and%20NPM]
		 */
		public static function use(components:Array):void{}
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
		 * @param themeName	string
		 * @param theme 	Object
		 */
		public static function registerTheme(themeName:String, theme:Object):void{}
		/**
		 * Registers a theme, should be specified when initialize the chart instance. Since 5.0.0
		 * Registers a locale, should be specified when initialize the chart instance. See the format in src/i18n/langEN.ts
		 * @param themeName	string
		 * @param theme 	Object
		 */
		public static function registerLocale(locale:String, localeCfg:Object):void{}

	}
}