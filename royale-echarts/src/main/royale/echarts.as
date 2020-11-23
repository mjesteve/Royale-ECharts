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
		 * //echarts.min.formatted.js | echarts.min_5.0.js | echarts-en-4.9.js | echarts-5.0.0-alpha.2.js
		 * script.setAttribute("src", "js/echarts-en-4.9.js");
		 * 
		 * //script.setAttribute("src", "https://cdn.jsdelivr.net/npm/echarts@4.9.0/dist/echarts.js");
		 * //script.setAttribute("src", "https://cdn.jsdelivr.net/npm/echarts@4.9.0/dist/echarts.min.js");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * document.head.appendChild(script);
		 * 
		 * //script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/echarts/5.0.0-alpha.2/echarts.min.js");
		 * //script.setAttribute("integrity","sha512-TRh7pogfkvYZVIuppkrYA8WHLHwaqW2wONk+r4dtG+W0CDGrUUIictWnI8D2zCN/5Qcwmci4eTHRJpQ4jReJdA==");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * //script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/echarts/5.0.0-alpha.1/echarts.js");
		 * //script.setAttribute("integrity","sha512-n2gjFomIFcQSkwMN5uuPlxcvbf5Ip2ZnEBO4myHTzn6dZyMT8G6peNUL7iZcKZfESBGpdE63rN1OeVAlrFQ8VA==");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * //script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/echarts/5.0.0-alpha.1/echarts.min.js");
		 * //script.setAttribute("integrity","sha512-wVpBaJluJNXD8CXm5jrr/GATUJiyfxwWKkcilnn0w1D9CbLqkVGNkTVr4w7vGsFEE0riSPLP5oi4hAxG3l8SVA==");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * //script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/echarts/4.9.0-rc.1/echarts-en.min.js");
		 * //script.setAttribute("integrity","sha512-yT7ns3Drvl+Fi4DxGXYOGF7CtPX94lhBcgjDRTeZWaaD4MUMQ1eFI4lH2eQx1CYMuxwyN+vPvUeukycLcBkT8Q==");
		 * //script.setAttribute("crossorigin","anonymous");
		 * 
		 * //src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.9.0-rc.1/echarts.min.js" integrity="sha512-q0nIjE1LHEOioBDYuyhml+xxTm+ftiPuzdWgEgwq5g3YAZ5CWDmjDUs4t7pFeWnvFQe7eLQg/+PepPbacIDtkA==" crossorigin="anonymous">
		 * //src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.8.0/echarts.min.js" integrity="sha512-OvWfXEXFlgwaMYESoKZRrPGq9Ndjcf7pMgp+NjbUNeqEA1OOOUbLgquJGOzvh7H78qinNObGwRiFIj22es61Eg==" crossorigin="anonymous">
		 * //src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.8.0/echarts-en.min.js" integrity="sha512-bHJjukAEXqiJdnUlb1I2Oios4izlP1da7mpUIeogj26NjAmT/EEbcDn0AlnAE+eOaJyQAsPy5FIzw4dhfe8o4A==" crossorigin="anonymous">
		 * 
		 * </inject_script>
		*/
        public function echarts(){
		}
		/**
		 * Creates an ECharts instance, and returns an echartsInstance. You shall not initialize multiple ECharts instances on a single container.
		 * @param dom HTMLDivElement|HTMLCanvasElement
		 * @param theme Object|string
		 * @param opts { devicePixelRatio?: number,  renderer?: string, width?: number|string, height?: number|string }
		 * @return echartsInstance
		 */
		public static function init(dom:Element=null,theme:Object=null, opts:Object=null):Object { return null; }
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