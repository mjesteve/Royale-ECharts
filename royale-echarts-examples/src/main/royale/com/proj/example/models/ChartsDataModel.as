////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package com.proj.example.models
{
	import org.apache.royale.collections.ArrayList;
	import com.proj.example.vos.TabBarChartVO;
	import com.proj.example.vos.ChartDefExampleVO;

	[Bindable]
	public class ChartsDataModel
	{
	
		private var _tabBarAppData:ArrayList;		
		public function get tabBarAppData():ArrayList
		{
			if(!_tabBarAppData){
				var arData:Array = new Array();

				var it:TabBarChartVO = new TabBarChartVO();
				it.hash="ecp1";
				it.thumbnail="assets/charts/ECCT_PIE001.png";				
				var descChart:ChartDefExampleVO = ECCT_PIE001;
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
							formatter: function (param) {
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
			
			var event:Object = {eventName:'updateAxisPointer', handler: function (event) {
				var xAxisInfo = event.axesInfo[0];
				if (xAxisInfo) {
					var dimension = xAxisInfo.value + 1;
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
								formatter: function(value) {
									if (value !== 0) {
										var num = Math.round(value ) ;
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
								formatter: function(v) {
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
		
	}
}
