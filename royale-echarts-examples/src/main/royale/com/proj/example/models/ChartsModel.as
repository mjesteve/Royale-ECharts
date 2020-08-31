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
	public class ChartsModel
	{
	
		private var _tabBarAppData:ArrayList;		
		public function get tabBarAppData():ArrayList
		{
			if(!_tabBarAppData){
				var arData:Array = new Array();
				var it:TabBarChartVO = new TabBarChartVO();
				it.hash="ecp1";
				it.thumbnail="assets/charts/xCFIVk5Ebk.png";				
				var descChart:ChartDefExampleVO = ECC_PIE001;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				it = new TabBarChartVO();
				it.hash="ecp2";
				it.thumbnail="assets/charts/xlZeV3FwQM.png";
				descChart = ECC_PIE002;
				it.label = descChart.title;
				it.description = descChart.title + '\n' + descChart.subtitle;
				arData.push(it);

				_tabBarAppData = new ArrayList(arData);
			}
			return _tabBarAppData;
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

		private var _ECCT_PIE001:ChartDefExampleVO;
		public function get ECCT_PIE001():ChartDefExampleVO
		{
			if(!_ECCT_PIE001){
				_ECCT_PIE001 = new ChartDefExampleVO();
				_ECCT_PIE001.themeName = 'halloween';
				_ECCT_PIE001.autoLoad = false;
				_ECCT_PIE001.optionChartInit = {
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
			return _ECCT_PIE001;
		}

		private var _ECC_PIE002:ChartDefExampleVO;
		public function get ECC_PIE002():ChartDefExampleVO
		{
			if(!_ECC_PIE002){
				_ECC_PIE002 = new ChartDefExampleVO();
				_ECC_PIE002.themeName = 'vintage';
				_ECC_PIE002.autoLoad = false;
				_ECC_PIE002.optionChartInit = {
					tooltip: {
						trigger:'item',
						formatter:'{a} <br/>{b}: {c} ({d}%)'
					},
					legend: {
						orient:'vertical',
						left: 10,
						data: ['Direct','Marketing Advertising','Search Engine','Email Marketing','Affiliate Advertising',
						'Video Advertising','Baidu','Google','Bing','Other']
					},
					series: [
						{
							name:'Access Source',
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
								{value: 1548, name:'search engine'}
							]
						},
						{
							name:'Access Source',
							type:'pie',
							radius: ['40%', '55%'],
							label: {
								formatter:'{a|{a}}{abg|}\n{hr|}\n {b|{b}:}{c} {per|{d}%}',
								backgroundColor:'#eee',
								borderColor:'#aaa',
								borderWidth: 1,
								borderRadius: 4,
								// shadowBlur:3,
								// shadowOffsetX: 2,
								// shadowOffsetY: 2,
								// shadowColor:'#999',
								// padding: [0, 7],
								rich: {
									a: {
										color:'#999',
										lineHeight: 22,
										align:'center'
									},
									// abg: {
									// backgroundColor:'#333',
									// width: '100%',
									// align:'right',
									// height: 22,
									// borderRadius: [4, 4, 0, 0]
									// },
									hr: {
										borderColor:'#aaa',
										width: '100%',
										borderWidth: 0.5,
										height: 0
									},
									b: {
										fontSize: 16,
										lineHeight: 33
									},
									per: {
										color:'#eee',
										backgroundColor:'#334455',
										padding: [2, 4],
										borderRadius: 2
									}
								}
							},
							data: [
								{value: 335, name:'Direct'},
								{value: 310, name:'Mail marketing'},
								{value: 234, name:'Affiliate Ads'},
								{value: 135, name:'Video ad'},
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
		
	}
}
