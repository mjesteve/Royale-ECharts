package org.apache.royale.community.models
{
	import org.apache.royale.collections.ArrayList;
	import org.apache.royale.community.vos.TabBarChartVO;
	import org.apache.royale.community.vos.ChartDefExampleVO;
	import org.apache.royale.community.charts.EC_SUNBURST6;
	import org.apache.royale.community.charts.ECT_CUSTOM4;
	import org.apache.royale.events.IEventDispatcher;
	import org.apache.royale.community.charts.covid.ECT_COVIDMAP_0;
	import org.apache.royale.community.charts.covid.ECT_COVIDMAP_1;

	[Bindable]
	public class ChartsDataModel
	{

		private var _tabBarAppData:ArrayList;
		public function get tabBarAppData():ArrayList
		{
			if(!_tabBarAppData){
				var arData:Array = new Array();
				var it:TabBarChartVO;
				var descChart:ChartDefExampleVO;

				it = new TabBarChartVO();
				it.hash="ecp7";
				it.thumbnail="assets/charts/ECT_COVIDMAP_0.png";
				descChart = ECCT_COVIDMAP_1;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp6";
				it.thumbnail="assets/charts/ECCT_CUSTOM4.png";
				descChart = ECCT_CUSTOM4;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp0";
				it.thumbnail="assets/charts/EC_SUNBURST6.png";
				descChart = ECCT_SUNBURST6;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp1";
				it.thumbnail="assets/charts/ECCT_PIE001.png";
				descChart = ECCT_PIE001;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp2";
				it.thumbnail="assets/charts/ECC_PIE002.png";
				descChart = ECC_PIE002;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp3";
				it.thumbnail="assets/charts/ECCT_CUSTOM1.png";
				descChart = ECCT_CUSTOM1;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp4";
				it.thumbnail="assets/charts/ECCT_CUSTOM2.png";
				descChart = ECCT_CUSTOM2;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp5";
				it.thumbnail="assets/charts/ECCT_CUSTOM3.png";
				descChart = ECCT_CUSTOM3;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				_tabBarAppData = new ArrayList(arData);
			}
			return _tabBarAppData;
		}

		private var _ECCT_PIE001:ChartDefExampleVO;
		public function get ECCT_PIE001():ChartDefExampleVO
		{
			if(!_ECCT_PIE001){
				_ECCT_PIE001 = new ChartDefExampleVO();
				_ECCT_PIE001.title = "Custom Pie Rose";
				_ECCT_PIE001.subtitle = "(Auto-Load chart)";
				_ECCT_PIE001.themeName = 'custom';
				_ECCT_PIE001.autoLoad = true;
				_ECCT_PIE001.optionChartInit = {
					toolbox: getToolBoxStd(false),
					visualMap: {
						show: false,
						min: 80,
						max: 600,
						inRange: {
							colorLightness: [0, 1]
						}
					},
					series: [
						{
							name:'Access source',
							type:'pie',
							radius: '55%',
							data:[
								{value:235, name:'Video ad'},
								{value:274, name:'Affiliate Advertising'},
								{value:310, name:'Mail marketing'},
								{value:335, name:'Direct access'},
								{value:400, name:'search engine'}
							],
							roseType:'angle',
							itemStyle: {
								normal: {
									color:'#c23531',
									shadowBlur: 200,
									shadowColor:'rgba(0, 0, 0, 0.5)'
								}
							}
						}
					]
				};
			}
			return _ECCT_PIE001;
		}

		private function getToolBoxStd(withtooltip:Boolean = true, withdataview:Boolean = true):Object
		{
			var obj:Object = new Object();
			obj = {
						show: true, right: 5, top: 5,
						showTitle: !withtooltip, // hide the default text so they don't overlap each other
						feature: {
							saveAsImage: {show: true, title: 'Save As Image'},
							restore: {show: withdataview, title: 'Restore'},
							dataView: {show: withdataview, readOnly: false, title: 'Data View'}
						},
						tooltip: { // same as option.tooltip
							show: withtooltip,
							formatter: function (param:*):void {
								return param.title;
							},
							backgroundColor: '#eee',
							textStyle: {color:'#999',fontSize: 12},
							extraCssText: 'box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);' // user-defined CSS styles
						}
					};
			return obj;
		}
		private var _ECC_PIE002:ChartDefExampleVO;
		public function get ECC_PIE002():ChartDefExampleVO
		{
			if(!_ECC_PIE002){
				_ECC_PIE002 = new ChartDefExampleVO();
				_ECC_PIE002.title = "Nested Pies";
				_ECC_PIE002.subtitle = "(Manual loading)";
				_ECC_PIE002.themeName = 'default';
				_ECC_PIE002.autoLoad = false;
				_ECC_PIE002.optionChartInit = {
					toolbox: getToolBoxStd(true),
					tooltip: {
						trigger:'item',
						formatter:'{a} <br/>{b}: {c} ({d}%)'
					},
					legend: {
						orient:'vertical',
						left: 5, top: 5,
						data: ['Direct','Marketing Ads','Search Engine','Mail Marketing','Affiliate Ads','Video Ads','Baidu','Google','Bing','Other']
					},
					series: [
						{
							name:'Access source Level 1',
							type:'pie',
							selectedMode:'single',
							radius: [0, '30%'],
							label: {
								position:'inner'
							},
							labelLine: {
								show: false
							},
							data: [
								{value: 335, name:'Direct', selected: true},
								{value: 679, name:'Marketing Ads'},
								{value: 1548, name:'Search Engine'}
							]
						},
						{
							name:'Access source Level 2',
							type:'pie',
							radius: ['40%', '55%'],
							label: {
								alignTo: 'none', position:'outer', distanceToLabelLine: 10,
								formatter:'{a|{a}}{abg|}\n{hr|}\n {b|{b}: {c}} {per|{d}%}',
								backgroundColor:'#eee',
								borderColor:'#aaa',
								borderWidth: 1,
								borderRadius: 4,
								rich: {
									a: {
										color:'#999',
										lineHeight: 22,
										align:'center'
									},
									hr: {
										borderColor:'#aaa',
										width: '100%',
										borderWidth: 0.5,
										height: 0
									},
									b: {
										color:'#000',
										fontSize: 12,
										lineHeight: 33
									},
									per: {
										fontSize: 12,
										color:'#eee',
										backgroundColor:'#334455',
										padding: [4, 4],
										borderRadius: 2
									}
								}
							},
							data: [
								{value: 335, name:'Direct'},
								{value: 310, name:'Mail Marketing'},
								{value: 234, name:'Affiliate Ads'},
								{value: 135, name:'Video Ads'},
								{value: 1048, name:'Baidu'},
								{value: 251, name:'Google'},
								{value: 147, name:'Bing'},
								{value: 102, name:'Other'}
							]
						}
					]
				};
			}
			return _ECC_PIE002;
		}

		private var _ECCT_CUSTOM1:ChartDefExampleVO;
		public function get ECCT_CUSTOM1():ChartDefExampleVO
		{
			if(!_ECCT_CUSTOM1){
				_ECCT_CUSTOM1 = new ChartDefExampleVO();
				_ECCT_CUSTOM1.title = "Dataset link";
				_ECCT_CUSTOM1.subtitle = "(To interact)";
				_ECCT_CUSTOM1.themeName = 'default';
				_ECCT_CUSTOM1.autoLoad = true;
				_ECCT_CUSTOM1.optionChartInit = {
					toolbox: getToolBoxStd(false),
					legend: {},
					tooltip: {
						trigger: 'axis',
						showContent: false
					},
					dataset: {
						source: [
							['product', '2014', '2015', '2016', '2018', '2019', '2020'],
							['Matcha Latte', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
							['Milk Tea', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
							['Cheese Cocoa', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
							['Walnut Brownie', 55.2, 67.1, 69.2, 72.4, 53.9, 39.1]
						]
					},
					xAxis: {type: 'category'},
					yAxis: {gridIndex: 0},
					grid: {top: '55%'},
					series: [
						{type: 'line', smooth: true, seriesLayoutBy: 'row'},
						{type: 'line', smooth: true, seriesLayoutBy: 'row'},
						{type: 'line', smooth: true, seriesLayoutBy: 'row'},
						{type: 'line', smooth: true, seriesLayoutBy: 'row'},
						{
							type: 'pie',
							id: 'pie',
							radius: '30%',
							center: ['50%', '25%'],
							label: {
								formatter: '{b}: {@2014} ({d}%)'
							},
							encode: {
								itemName: 'product',
								value: '2014',
								tooltip: '2014'
							}
						}
					]
				};
			}

			var event:Object = {eventName:'updateAxisPointer', handler: function (event:*):void {
				var xAxisInfo:Object = event.axesInfo[0];
				if (xAxisInfo) {
					var dimension:int = xAxisInfo.value + 1;
					this.setOption({
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
				}}};
			_ECCT_CUSTOM1.eventHandlers = new Array();
			_ECCT_CUSTOM1.eventHandlers.push(event);

			return _ECCT_CUSTOM1;
		}

		private var _ECCT_CUSTOM2:ChartDefExampleVO;
		public function get ECCT_CUSTOM2():ChartDefExampleVO
		{
			if(!_ECCT_CUSTOM2){

				var firstColor:String = 'rgba(255,238,81,1)';
				var dataArr:int = 0;

				_ECCT_CUSTOM2 = new ChartDefExampleVO();
				_ECCT_CUSTOM2.title = "Dashboard with progress bar";
				_ECCT_CUSTOM2.subtitle = "(To interact)";
				_ECCT_CUSTOM2.themeName = 'custom';
				_ECCT_CUSTOM2.autoLoad = true;
				_ECCT_CUSTOM2.optionChartInit = {
					toolbox: getToolBoxStd(false, false),
    				backgroundColor: "#e6b600",
    				tooltip: { formatter: "{a} <br/>{b} : {c}%"},
					series: [
						{
							name: "Internal progress bar",
							type: "gauge",
							radius: '60%',
							splitNumber: 10,
							axisLine: {
								lineStyle: {
									color: [ [dataArr / 100, firstColor], [1, "#fcfab6"] ], width: 8
								}
							},
							axisLabel: {show: false},
							axisTick: {show: false},
							splitLine: {show: false},
							itemStyle: {show: false},
							detail: {
								formatter: function(value:Number):String {
									if (value !== 0) {
										var num:Number = Math.round(value ) ;
										return parseInt(num).toFixed(0)+"%";
									} else {
										return "0%";
									}
								},
								offsetCenter: [0, 82],
								textStyle: {
									padding: [0, 0, 0, 0],
									fontSize: 18,
									fontWeight: '700',
									color: firstColor
								}
							},
							title: {
								show: false,
								offsetCenter: [0, 46], // x, y，Unit px
								textStyle: {
									color: "#fff",
									fontSize: 14, //Title text size on the dial
									fontWeight: 400,
									fontFamily: 'PingFangSC'
								}
							},
							data: [{name: "title",	value: dataArr}],
							pointer: {show: true,length: '75%',	radius: '20%',
								width: 10 //Pointer thickness
							},
							animationDuration: 4000
						},
						{
							name: 'External scale',
							type: 'gauge',
							//  center: ['20%', '50%'],
							radius: '80%',min: 0, //minimum scale
							max: 100, //Maximum scale
							splitNumber: 10, //Number of scales
							startAngle: 225,
							endAngle: -45,
							axisLine: {
								show: true,
								lineStyle: {width: 1,color: [[1,'rgba(0,0,0,0)']]}
							}, //Dashboard axis
							axisLabel: {
								show: true,	color:'#f2f576',distance: 25, textStyle: {fontSize: 14},
								formatter: function(v:Number):String {
									switch (v +'') {
										case '0':
											return '0';
										case '10':
											return '10';
										case '20':
											return '20';
										case '30':
											return '30';
										case '40':
											return '40';
										case '50':
											return '50';
										case '60':
											return '60';
										case '70':
											return '70';
										case '80':
											return '80';
										case '90':
											return '90';
										case '100':
											return '100';
									}
								}
							}, //scale label.
							axisTick: {	show: true,	splitNumber: 7,	length: -8,
								lineStyle: {
									color: firstColor, //The color gradient function does not work
									width: 1
								}
							}, //scale style
							splitLine: {show: true,	length: -20,
								lineStyle: {color: firstColor //The color gradient function does not work
								}
							}, //Divider line style
							detail: {show: false},
							pointer: {show: false}
						}
					]
				};
			}

			return _ECCT_CUSTOM2;
		}

		private var _ECCT_CUSTOM3:ChartDefExampleVO;
		public function get ECCT_CUSTOM3():ChartDefExampleVO
		{
			if(!_ECCT_CUSTOM3){

				var firstColor:String = '#468EFD';
				var dataArr:int = 0;

				_ECCT_CUSTOM3 = new ChartDefExampleVO();
				_ECCT_CUSTOM3.title = "Schedule Dashboard";
				_ECCT_CUSTOM3.subtitle = "How much has been worked?";
				_ECCT_CUSTOM3.themeName = 'custom';
				_ECCT_CUSTOM3.autoLoad = true;
				_ECCT_CUSTOM3.optionChartInit = {
					tooltip: {
						formatter: function (params:*):String {
							var m:int = params.value[1] % 60;
							var h:int = ( params.value[1]-m)/60;
							var nextDay:Boolean = false;
							if(h>=24){
								nextDay = true;
								h-=24;
							}
							if(m<0){
								m *= -1;
							}
							var inicio:String = (nextDay?"+":"") + h.toString() + ":" + (m<10?"0":"") + m.toString();
							m = params.value[1] % 60;
							h = ( params.value[2]-m)/60;
							nextDay = false;
							if(h>=24){
								nextDay = true;
								h-=24;
							}
							if(m<0){
								m *= -1;
							}
							var final:String = (nextDay?"+":"") + h.toString() + ":" + (m<10?"0":"") + m.toString();
							return '<p>' + params.marker + params.name + ' Start: ' +  inicio + 'h</p>' + '<p>' + params.marker + params.name + '  End: ' + final + 'h</p>';
						}
					},
					dataZoom: [{
						type: 'slider',
						interval:60,
						startValue:0,
						endValue:60,
						filterMode: 'weakFilter',
						height: 20,
						start: 35,
						end: 65,
						handleIcon: 'M10.7,11.9H9.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4h1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
						handleSize: '80%',
						showDetail: false
					}],
					grid: {
						height: 300
					},
					xAxis: {
						type: 'value',
						position: 'top',
						splitLine: {
							lineStyle: {
								color: ['#E9EDFF']
							}
						},
						interval:60
						,
						axisLine: {
							show: false
						},
						axisTick: {
							lineStyle: {
								color: '#929ABA'
							}
						},
						axisLabel: {
							color: '#929ABA',
							inside: false,
							align: 'center',
							formatter: (function(value:Number):String{
								var m:int = value % 60;
								var h:int = ( value-m)/60;
								var nextDay:Boolean = false;
								if(h>=24){
									nextDay = true;
									h-=24;
								}
								if(m<0){
									m *= -1;
								}
								return (nextDay?"+":"") + h.toString() + ":" + (m<10?"0":"") + m.toString();
							})
						},
						min: -720,
						max:2160
					},
					yAxis: {
        				data: ['Schedules Slots', 'Courtesies', 'Flexibilities', 'Breaks', 'Schedule'],
						axisTick: {show: false},
						splitLine: {show: false},
						axisLine: {show: false},
						axisLabel: {show: false}
					},
					series: [{
						type: 'custom',
						renderItem: function (params:Object, api:Object):Object {
							var categoryIndex:int = api.value(0);
							var start:Object = api.coord([api.value(1), categoryIndex]);
							var end:Object = api.coord([api.value(2), categoryIndex]);
							var height:Number = api.size([0, 1])[1] * 0.6;

							var rectShape:Object = (echarts as Object).graphic.clipRectByRect({
								x: start[0],
								y: start[1] - height / 2,
								width: end[0] - start[0],
								height: height
							}, {
								x: params.coordSys.x,
								y: params.coordSys.y,
								width: params.coordSys.width,
								height: params.coordSys.height
							});
							var diff:Number = ((api.value(2) - api.value(1) - api.value(3))/2 );
							var auxStart:Object = api.coord([ api.value(1) + diff, categoryIndex]);
							var auxEnd:Object = api.coord([ api.value(2) - diff, categoryIndex]);
							var shapeAux:Object =  (echarts as Object).graphic.clipRectByRect({
								x: auxStart[0],
								y: auxStart[1] - height / 2,
								width: auxEnd[0] - auxStart[0],
								height: height
							}, {
								x: params.coordSys.x,
								y: params.coordSys.y,
								width: params.coordSys.width,
								height: params.coordSys.height
							});
							var mins:Number =  api.value(2) - api.value(1);
							var m:Number = mins % 60;
							var h:Number = ( mins-m)/60;
							return rectShape && {
								type: 'group',
								children: [{
									type: 'rect',
									shape: rectShape,
									style: api.style({
									})
								} ,
								{
									type: 'rect',
									shape: shapeAux,
									style: api.style({
										color:'#fff',
										text:h.toString() + ":" + (m<10?"0":"") + m.toString(),
										textFill: '#fff'
									})
								}]
							};
						},
						itemStyle: {
							opacity: 0.8
						},
						encode: {
							x: [1, 2],
							y: 0
						},
						data: [{name:'Time', value:[0,485,900,415],itemStyle: {normal: {color: '#0066ff'}}},
						{name:'Time', value:[0,960,1045,85],itemStyle: {normal: {color: '#0066ff'}}},
						{name:'Courtesy', value:[1,990,1080,90],itemStyle: {normal: {color: '#993399'}}},
						{name:'Courtesy', value:[1,420,510,90],itemStyle: {normal: {color: '#993399'}}},
						{name:'Flexibility', value:[2,990,1080,90],itemStyle: {normal: {color: '#ffcc00'}}},
						{name:'Flexibility', value:[2,420,510,90],itemStyle: {normal: {color: '#ffcc00'}}},
						{name:'Break', value:[3,840,960,80],itemStyle: {normal: {color: '#339933'}}},
						{name:'Schedule', value:[4,480,1020,540],itemStyle: {normal: {color: '#cc3300'}}}]
					}]
				};
			}

			return _ECCT_CUSTOM3;
		}

			var HEIGHT_RATIO = 0.6;
			var DIM_CATEGORY_INDEX = 0;
			var DIM_TIME_ARRIVAL = 1;
			var DIM_TIME_DEPARTURE = 2;
			var DATA_ZOOM_AUTO_MOVE_THROTTLE = 30;
			var DATA_ZOOM_X_INSIDE_INDEX = 1;
			var DATA_ZOOM_Y_INSIDE_INDEX = 3;
			var DATA_ZOOM_AUTO_MOVE_SPEED = 0.2;
			var DATA_ZOOM_AUTO_MOVE_DETECT_AREA_WIDTH = 30;

			var _draggable;
			var _draggingEl;
			var _dropShadow;
			var _draggingCursorOffset = [0, 0];
			var _draggingTimeLength;
			var _draggingRecord;
			var _dropRecord;
			var _cartesianXBounds = [];
			var _cartesianYBounds = [];
			var _rawData;
			var _autoDataZoomAnimator;
		
		private var _ECCT_CUSTOM3BIS:ChartDefExampleVO;
		public function get ECCT_CUSTOM3BIS():ChartDefExampleVO
		{


			if(!_ECCT_CUSTOM3BIS){
				
				var firstColor:String = '#468EFD';
				var dataArr:int = 0;

				_ECCT_CUSTOM3BIS = new ChartDefExampleVO();
				_ECCT_CUSTOM3BIS.title = "Schedule Dashboard";
				_ECCT_CUSTOM3BIS.subtitle = "How much has been worked?";
				_ECCT_CUSTOM3BIS.themeName = 'custom';
				_ECCT_CUSTOM3BIS.autoLoad = true;
				_ECCT_CUSTOM3BIS.optionChartInit ={
					tooltip: {
					},
					animation: false,
					toolbox: {
						left: 20,
						top: 0,
						itemSize: 20,
						feature: {
							myDrag: {
								show: true,
								title: 'Make bars\ndraggable',
								icon: 'path://M990.55 380.08 q11.69 0 19.88 8.19 q7.02 7.01 7.02 18.71 l0 480.65 q-1.17 43.27 -29.83 71.93 q-28.65 28.65 -71.92 29.82 l-813.96 0 q-43.27 -1.17 -72.5 -30.41 q-28.07 -28.07 -29.24 -71.34 l0 -785.89 q1.17 -43.27 29.24 -72.5 q29.23 -29.24 72.5 -29.24 l522.76 0 q11.7 0 18.71 7.02 q8.19 8.18 8.19 18.71 q0 11.69 -7.6 19.29 q-7.6 7.61 -19.3 7.61 l-518.08 0 q-22.22 1.17 -37.42 16.37 q-15.2 15.2 -15.2 37.42 l0 775.37 q0 23.39 15.2 38.59 q15.2 15.2 37.42 15.2 l804.6 0 q22.22 0 37.43 -15.2 q15.2 -15.2 16.37 -38.59 l0 -474.81 q0 -11.7 7.02 -18.71 q8.18 -8.19 18.71 -8.19 l0 0 ZM493.52 723.91 l-170.74 -170.75 l509.89 -509.89 q23.39 -23.39 56.13 -21.05 q32.75 1.17 59.65 26.9 l47.94 47.95 q25.73 26.89 27.49 59.64 q1.75 32.75 -21.64 57.3 l-508.72 509.9 l0 0 ZM870.09 80.69 l-56.13 56.14 l94.72 95.9 l56.14 -57.31 q8.19 -9.35 8.19 -21.05 q-1.17 -12.86 -10.53 -22.22 l-47.95 -49.12 q-10.52 -9.35 -23.39 -9.35 q-11.69 -1.17 -21.05 7.01 l0 0 ZM867.75 272.49 l-93.56 -95.9 l-380.08 380.08 l94.73 94.73 l378.91 -378.91 l0 0 ZM322.78 553.16 l38.59 39.77 l-33.92 125.13 l125.14 -33.92 l38.59 38.6 l-191.79 52.62 q-5.85 1.17 -12.28 0 q-6.44 -1.17 -11.11 -5.84 q-4.68 -4.68 -5.85 -11.7 q-2.34 -5.85 0 -11.69 l52.63 -192.97 l0 0 Z'
							}
						}
					},
					title: {
						text: 'Gantt of Airport Flight',
						left: 'center'
					},
					dataZoom: [{
						type: 'slider',
						xAxisIndex: 0,
						filterMode: 'weakFilter',
						height: 20,
						bottom: 0,
						start: 0,
						end: 26,
						handleIcon: 'path://M10.7,11.9H9.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4h1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
						handleSize: '80%',
						showDetail: false
					}, {
						type: 'inside',
						id: 'insideX',
						xAxisIndex: 0,
						filterMode: 'weakFilter',
						start: 0,
						end: 26,
						zoomOnMouseWheel: false,
						moveOnMouseMove: true
					}, {
						type: 'slider',
						yAxisIndex: 0,
						zoomLock: true,
						width: 10,
						right: 10,
						top: 70,
						bottom: 20,
						start: 95,
						end: 100,
						handleSize: 0,
						showDetail: false
					}, {
						type: 'inside',
						id: 'insideY',
						yAxisIndex: 0,
						start: 95,
						end: 100,
						zoomOnMouseWheel: false,
						moveOnMouseMove: true,
						moveOnMouseWheel: true
					}],
					grid: {
						show: true,
						top: 70,
						bottom: 20,
						left: 100,
						right: 20,
						backgroundColor: '#fff',
						borderWidth: 0
					},
					xAxis: {
						type: 'time',
						position: 'top',
						splitLine: {
							lineStyle: {
								color: ['#E9EDFF']
							}
						},
						axisLine: {
							show: false
						},
						axisTick: {
							lineStyle: {
								color: '#929ABA'
							}
						},
						axisLabel: {
							color: '#929ABA',
							inside: false,
							align: 'center'
						}
					},
					yAxis: {
						axisTick: {show: false},
						splitLine: {show: false},
						axisLine: {show: false},
						axisLabel: {show: false},
						min: 0,
						max: _rawData.parkingApron.data.length
					},
					series: [{
						id: 'flightData',
						type: 'custom',
						renderItem: function (params:Object, api:Object):Object {
							var categoryIndex = api.value(DIM_CATEGORY_INDEX);
							var timeArrival = api.coord([api.value(DIM_TIME_ARRIVAL), categoryIndex]);
							var timeDeparture = api.coord([api.value(DIM_TIME_DEPARTURE), categoryIndex]);

							var coordSys = params.coordSys;
							_cartesianXBounds[0] = coordSys.x;
							_cartesianXBounds[1] = coordSys.x + coordSys.width;
							_cartesianYBounds[0] = coordSys.y;
							_cartesianYBounds[1] = coordSys.y + coordSys.height;

							var barLength = timeDeparture[0] - timeArrival[0];
							// Get the heigth corresponds to length 1 on y axis.
							var barHeight = api.size([0, 1])[1] * HEIGHT_RATIO;
							var x = timeArrival[0];
							var y = timeArrival[1] - barHeight;

							var flightNumber = api.value(3) + '';
							var flightNumberWidth = (echarts as Object).format.getTextRect(flightNumber).width;
							var text = (barLength > flightNumberWidth + 40 && x + barLength >= 180)
								? flightNumber : '';

							var rectNormal = clipRectByRect(params, {
								x: x, y: y, width: barLength, height: barHeight
							});
							var rectVIP = clipRectByRect(params, {
								x: x, y: y, width: (barLength) / 2, height: barHeight
							});
							var rectText = clipRectByRect(params, {
								x: x, y: y, width: barLength, height: barHeight
							});

							return {
								type: 'group',
								children: [{
									type: 'rect',
									ignore: !rectNormal,
									shape: rectNormal,
									style: api.style()
								}, {
									type: 'rect',
									ignore: !rectVIP && !api.value(4),
									shape: rectVIP,
									style: api.style({fill: '#ddb30b'})
								}, {
									type: 'rect',
									ignore: !rectText,
									shape: rectText,
									style: api.style({
										fill: 'transparent',
										stroke: 'transparent',
										text: text,
										textFill: '#fff'
									})
								}]
							};
						},
						dimensions: _rawData.flight.dimensions,
						encode: {
							x: [DIM_TIME_ARRIVAL, DIM_TIME_DEPARTURE],
							y: DIM_CATEGORY_INDEX,
							tooltip: [DIM_CATEGORY_INDEX, DIM_TIME_ARRIVAL, DIM_TIME_DEPARTURE]
						},
						data: _rawData.flight.data
					}, {
						type: 'custom',
						renderItem: function (params:Object, api:Object):Object {
							var y = api.coord([0, api.value(0)])[1];
							if (y < params.coordSys.y + 5) {
								return null;
							}
							return {
								type: 'group',
								position: [
									10,
									y
								],
								children: [{
									type: 'path',
									shape: {
										d: 'M0,0 L0,-20 L30,-20 C42,-20 38,-1 50,-1 L70,-1 L70,0 Z',
										x: 0,
										y: -20,
										width: 90,
										height: 20,
										layout: 'cover'
									},
									style: {
										fill: '#368c6c'
									}
								}, {
									type: 'text',
									style: {
										x: 24,
										y: -3,
										text: api.value(1),
										textVerticalAlign: 'bottom',
										textAlign: 'center',
										textFill: '#fff'
									}
								}, {
									type: 'text',
									style: {
										x: 75,
										y: -2,
										textVerticalAlign: 'bottom',
										textAlign: 'center',
										text: api.value(2),
										textFill: '#000'
									}
								}]
							};
						},
						dimensions: _rawData.parkingApron.dimensions,
						encode: {
							x: -1, // Then this series will not controlled by x.
							y: 0
						},
						data: _rawData.parkingApron.data.map(function (item, index) {
							return [index].concat(item);
						})
					}]
				};
			}
			return _ECCT_CUSTOM3BIS;
		}
		public function renderGanttItem(params, api):Object {
			var categoryIndex = api.value(DIM_CATEGORY_INDEX);
			var timeArrival = api.coord([api.value(DIM_TIME_ARRIVAL), categoryIndex]);
			var timeDeparture = api.coord([api.value(DIM_TIME_DEPARTURE), categoryIndex]);

			var coordSys = params.coordSys;
			_cartesianXBounds[0] = coordSys.x;
			_cartesianXBounds[1] = coordSys.x + coordSys.width;
			_cartesianYBounds[0] = coordSys.y;
			_cartesianYBounds[1] = coordSys.y + coordSys.height;

			var barLength = timeDeparture[0] - timeArrival[0];
			// Get the heigth corresponds to length 1 on y axis.
			var barHeight = api.size([0, 1])[1] * HEIGHT_RATIO;
			var x = timeArrival[0];
			var y = timeArrival[1] - barHeight;

			var flightNumber = api.value(3) + '';
			var flightNumberWidth = (echarts as Object).format.getTextRect(flightNumber).width;
			var text = (barLength > flightNumberWidth + 40 && x + barLength >= 180)
				? flightNumber : '';

			var rectNormal = clipRectByRect(params, {
				x: x, y: y, width: barLength, height: barHeight
			});
			var rectVIP = clipRectByRect(params, {
				x: x, y: y, width: (barLength) / 2, height: barHeight
			});
			var rectText = clipRectByRect(params, {
				x: x, y: y, width: barLength, height: barHeight
			});

			return {
				type: 'group',
				children: [{
					type: 'rect',
					ignore: !rectNormal,
					shape: rectNormal,
					style: api.style()
				}, {
					type: 'rect',
					ignore: !rectVIP && !api.value(4),
					shape: rectVIP,
					style: api.style({fill: '#ddb30b'})
				}, {
					type: 'rect',
					ignore: !rectText,
					shape: rectText,
					style: api.style({
						fill: 'transparent',
						stroke: 'transparent',
						text: text,
						textFill: '#fff'
					})
				}]
			};
		}

		private function clipRectByRect(params, rect):Object {
			return (echarts as Object).graphic.clipRectByRect(rect, {
				x: params.coordSys.x,
				y: params.coordSys.y,
				width: params.coordSys.width,
				height: params.coordSys.height
			});
		}

		private var _ECC_PIE001:ChartDefExampleVO;
		public function get ECC_PIE001():ChartDefExampleVO
		{
			if(!_ECC_PIE001){
				_ECC_PIE001 = new ChartDefExampleVO();
				_ECC_PIE001.themeName = 'halloween';
				_ECC_PIE001.autoLoad = true;
				_ECC_PIE001.optionChartInit = {
					"backgroundColor": "#2c343c",
					"animation": true,
					"animationThreshold": 2000,
					"animationDuration": 1000,
					"animationEasing": "cubicOut",
					"animationDelay": 0,
					"animationDurationUpdate": 300,
					"animationEasingUpdate": "cubicOut",
					"animationDelayUpdate": 0,
					"color": [
						"#c23531",
						"#2f4554",
						"#61a0a8",
						"#d48265",
						"#749f83",
						"#ca8622",
						"#bda29a",
						"#6e7074",
						"#546570",
						"#c4ccd3",
						"#f05b72",
						"#ef5b9c",
						"#f47920",
						"#905a3d",
						"#fab27b",
						"#2a5caa",
						"#444693",
						"#726930",
						"#b2d235",
						"#6d8346",
						"#ac6767",
						"#1d953f",
						"#6950a1",
						"#918597"
					],
					"series": [
						{
							"type": "pie",
							"name": "Access Source",
							"clockwise": true,
							"data": [
								{"name": "Video Ads","value": 235},
								{"name": "Affiliate Advertising","value": 274},
								{"name": "Mail Marketing","value": 310},
								{"name": "Direct access","value": 335},
								{"name": "Search Engine","value": 400}
							],
							"radius": "55%",
							"center": ["50%","50%"],
							"roseType": "radius",
							"label": {
								"show": true,
								"position": "top",
								"color": "rgba(255, 255, 255, 0.3)",
								"margin": 8
							},
							"tooltip": {
								"show": true,
								"trigger": "item",
								"triggerOn": "mousemove|click",
								"axisPointer": {
									"type": "line"
								},
								"formatter": "{a} <br/>{b}: {c} ({d}%)",
								"textStyle": {
									"fontSize": 14
								},
								"borderWidth": 0
							},
							"rippleEffect": {
								"show": true,
								"brushType": "stroke",
								"scale": 2.5,
								"period": 4
							}
						}
					],
					"legend": [
						{
							"data": ["Video Ads","Affiliate Advertising","Mail Marketing","direct interview","search engine"],
							"selected": {},
							"show": false,
							"padding": 5,	"itemGap": 10,	"itemWidth": 25,	"itemHeight": 14
						}
					],
					"tooltip": {
						"show": true,
						"trigger": "item",
						"triggerOn": "mousemove|click",
						"axisPointer": {
							"type": "line"
						},
						"textStyle": {
							"fontSize": 14
						},
						"borderWidth": 0
					},
					"title": [
						{
							"text": "Customized Pie",
							"left": "center",
							"top": "20",
							"padding": 5,
							"itemGap": 10,
							"textStyle": {
								"color": "#fff"
							}
						}
					]
				};
			}
			return _ECC_PIE001;
		}

		private var _ECCT_SUNBURST6:ChartDefExampleVO;
		public function get ECCT_SUNBURST6():ChartDefExampleVO
		{
			if(!_ECCT_SUNBURST6){
				_ECCT_SUNBURST6 = new ChartDefExampleVO();
				_ECCT_SUNBURST6.title = "Sunburst";
				_ECCT_SUNBURST6.subtitle = "(dispatch Action)";
				_ECCT_SUNBURST6.themeName = 'custom';
				_ECCT_SUNBURST6.autoLoad = true;
				var defchar:EC_SUNBURST6 = new EC_SUNBURST6();
				defchar.optionChartInit();
				_ECCT_SUNBURST6.optionChartInit = defchar.options;
			}
			return _ECCT_SUNBURST6;
		}

		private var _ECCT_CUSTOM4:ChartDefExampleVO;
		public function get ECCT_CUSTOM4():ChartDefExampleVO
		{
			if(!_ECCT_CUSTOM4){
				_ECCT_CUSTOM4 = new ChartDefExampleVO();
				_ECCT_CUSTOM4.title = "Sensor Layout Plan";
				_ECCT_CUSTOM4.subtitle = "(JS to AS3 transpilation)";
				_ECCT_CUSTOM4.themeName = 'custom';
				_ECCT_CUSTOM4.autoLoad = true;
				var defchar:ECT_CUSTOM4 = new ECT_CUSTOM4();
				_ECCT_CUSTOM4.nameMap = defchar.nameMap;
				defchar.addEventListener("onCompleteInit", loadCUSTOM4);
				defchar.addEventListener("onErrorInit", loadErrorCUSTOM4);
				defchar.optionChartInit();
				//_ECCT_CUSTOM4.optionChartInit = defchar.options;
			}
			return _ECCT_CUSTOM4;
		}

		private function loadCUSTOM4(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.currentTarget);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCUSTOM4);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCUSTOM4);

			_ECCT_CUSTOM4.registerMap = (loaderDispatcher as ECT_CUSTOM4).geoMap;
			_ECCT_CUSTOM4.optionChartInit = (loaderDispatcher as ECT_CUSTOM4).options;

		}

		private function loadErrorCUSTOM4(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCUSTOM4);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCUSTOM4);
			_ECCT_CUSTOM4.optionChartInit = {};
		}

		private var _ECCT_COVIDMAP:ChartDefExampleVO;
		public function get ECCT_COVIDMAP():ChartDefExampleVO
		{
			if(!_ECCT_COVIDMAP){
				_ECCT_COVIDMAP = new ChartDefExampleVO();
				_ECCT_COVIDMAP.title = "COVID-19 Dashboard by the Center for Systems Science and Engineering (CSSE)";
				_ECCT_COVIDMAP.subtitle = "at Johns Hopkins University (JHU)";
				_ECCT_COVIDMAP.themeName = 'custom';
				_ECCT_COVIDMAP.autoLoad = true;
				var defchar:ECT_COVIDMAP_0 = new ECT_COVIDMAP_0();
				_ECCT_COVIDMAP.nameMap = defchar.nameMap;
				defchar.addEventListener("onCompleteInit", loadCOVIDMAP);
				defchar.addEventListener("onErrorInit", loadErrorCOVIDMAP);
				defchar.optionChartInit();
			}
			return _ECCT_COVIDMAP;
		}

		private function loadCOVIDMAP(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.currentTarget);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCOVIDMAP);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCOVIDMAP);

			_ECCT_COVIDMAP.registerMap = (loaderDispatcher as ECT_COVIDMAP_0).geoMap;
			_ECCT_COVIDMAP.optionChartInit = (loaderDispatcher as ECT_COVIDMAP_0).options;

		}

		private function loadErrorCOVIDMAP(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCOVIDMAP);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCOVIDMAP);
			_ECCT_COVIDMAP.optionChartInit = {};
		}

		private var _ECCT_COVIDMAP_1:ChartDefExampleVO;
		public function get ECCT_COVIDMAP_1():ChartDefExampleVO
		{
			if(!_ECCT_COVIDMAP_1){
				_ECCT_COVIDMAP_1 = new ChartDefExampleVO();
				_ECCT_COVIDMAP_1.title = "COVID-19 Dashboard";
				_ECCT_COVIDMAP_1.subtitle = "(Confirmed Cases)";
				_ECCT_COVIDMAP_1.themeName = 'custom';
				_ECCT_COVIDMAP_1.autoLoad = true;

				var defchar:ECT_COVIDMAP_1 = new ECT_COVIDMAP_1();
				_ECCT_COVIDMAP_1.nameMap = defchar.nameMap;

				defchar.addEventListener("onCompleteInit", loadCOVIDMAP_1);
				defchar.addEventListener("onErrorInit", loadErrorCOVIDMAP_1);

				defchar.optionChartInit();
			}
			return _ECCT_COVIDMAP_1;
		}

		private function loadCOVIDMAP_1(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.currentTarget);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCOVIDMAP_1);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCOVIDMAP_1);

			_ECCT_COVIDMAP_1.classDataMap = (loaderDispatcher as ECT_COVIDMAP_1);
			_ECCT_COVIDMAP_1.registerMap = (loaderDispatcher as ECT_COVIDMAP_1).geoMap;
			_ECCT_COVIDMAP_1.optionChartInit = (loaderDispatcher as ECT_COVIDMAP_1).options;

		}

		private function loadErrorCOVIDMAP_1(event:Event):void
		{
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener("onCompleteInit", loadCOVIDMAP_1);
            loaderDispatcher.removeEventListener("onErrorInit", loadErrorCOVIDMAP_1);
			_ECCT_COVIDMAP_1.optionChartInit = {};
		}

	}
}
