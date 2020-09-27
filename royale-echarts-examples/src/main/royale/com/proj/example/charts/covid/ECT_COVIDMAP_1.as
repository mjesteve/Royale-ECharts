package com.proj.example.charts.covid
{

    import org.apache.royale.net.URLLoader;
    import org.apache.royale.net.HTTPConstants;
    import org.apache.royale.net.URLRequest;
    import org.apache.royale.events.IEventDispatcher;
    import org.apache.royale.events.EventDispatcher;
    import com.proj.example.charts.IEchartDefinition;
    import org.apache.royale.collections.ArrayList;

	[Event(name="onCompleteInit", type="org.apache.royale.events.Event")]
	[Event(name="onErrorInit", type="org.apache.royale.events.Event")]

    public class ECT_COVIDMAP_1 extends EventDispatcher implements IEchartDefinition
    {
        public function ECT_COVIDMAP_1(){}

        private var _options:Object;
        [Binding]
        public function get options():Object{ 
            return _options; 
        }
        public function set options(value:Object):void{ _options = value; }
        
        
        public function optionChartInit():Object
        {
            prepareMakeData();
            
            return options;
        }
        
            //url = "https://winpluscloud.com/WPNetSuitePlus/assets/data-COVITMAP_0.json";
        public var uploadedDataURL:String = "assets/charts/data-COVIDMAP_0.json";

        private var d1:Object = ECT_COVIDMAP_1_data.d1;
        private var d2:Object = ECT_COVIDMAP_1_data.d2;        
        private var d3:Object = ECT_COVIDMAP_1_data.d3;
        private var d4:Object = ECT_COVIDMAP_1_data.d4;
        private var d5:Object = ECT_COVIDMAP_1_data.d5;
        private var d6:Object = ECT_COVIDMAP_1_data.d6;
        private var d7:Object = ECT_COVIDMAP_1_data.d7;
        private var d8:Object = ECT_COVIDMAP_1_data.d8;
        private var d9:Object = ECT_COVIDMAP_1_data.d9;
        
        private var year:Array = ECT_COVIDMAP_1_data.year;
        private var mapData:Array = [
            [],
            [],
            [],
            [],
            [],
            [],
            [],
            [],
            []
        ];
        private var categoryData:Array = [];
        private var barData:Array = [];

        public function prepareMakeData():void
        {
            loadDataJSON();
        }
        
        public var geoMap:Object;
        public var nameMap:String = "world";              
        private var geoCoordMap:Object = ECT_COVIDMAP_1_data.geoCoordMap;

        private function loadDataJSON():void
        {
            var loaderJSON:URLLoader = new URLLoader();
            loaderJSON.addEventListener(HTTPConstants.IO_ERROR, loadJsonDataError);
            loaderJSON.addEventListener(HTTPConstants.SECURITY_ERROR, loadJsonDataError);
            loaderJSON.addEventListener(HTTPConstants.COMPLETE, loadJsonDataComplete);         
            loaderJSON.load(new URLRequest(uploadedDataURL));
        }

        private function loadJsonDataComplete(event:Event):void
        {   
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadJsonDataComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadJsonDataError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadJsonDataError);
            
			var objData:Object = (loaderDispatcher as URLLoader).data;
            geoMap = JSON.parse(objData as String);
            _options = makeData();
            dispatchEvent(new Event("onCompleteInit"));
        } 

        private function loadJsonDataError(event:Event):void{
            
            var loaderDispatcher:IEventDispatcher = IEventDispatcher(event.target);
            loaderDispatcher.removeEventListener(HTTPConstants.COMPLETE, loadJsonDataComplete);
            loaderDispatcher.removeEventListener(HTTPConstants.IO_ERROR, loadJsonDataError);
            loaderDispatcher.removeEventListener(HTTPConstants.SECURITY_ERROR, loadJsonDataError);            
            
            trace('Error in load json data...');
            dispatchEvent(new Event("onErrorInit"));
        } 

        public var legendCountryData:Array;

        public function makeData():Object
        {
            var key:Object;

            /**
             * geoCoordMap  {nameCountry:String, geoCoord:Array}
             *  'Andorra': [1.601554, 42.546245],
             */
			var keyold:Object;
			var acumkey:Number = 0;
			legendCountryData = new Array();
			

            for (key in geoCoordMap) {
				// itera. countries
                trace('key: ',key)

				if( key && !keyold)
					keyold = key;

				if(key !== keyold)
				{
					legendCountryData.push({name:keyold as String, value: acumkey});
					acumkey = 0;
					keyold = key;
				}
                if (key in d1) {
					acumkey = acumkey + d1[key];
                    mapData[0].push({ "year": '2020-01',
                        "name": key,
                        "value": d1[key]
                    });
                }

                if (key in d2) {
					acumkey = acumkey + d2[key];
                    mapData[1].push({
                        "year": '2020-02',
                        "name": key,
                        "value": d2[key]
                    });
                }

                if (key in d3) {
					acumkey = acumkey + d3[key];
                    mapData[2].push({
                        "year": '2020-03',
                        "name": key,
                        "value": d3[key]
                    });
                }

                if (key in d4) {
					acumkey = acumkey + d4[key];
                    mapData[3].push({
                        "year": '2020-04',
                        "name": key,
                        "value": d4[key]
                    });
                }

                if (key in d5) {
					acumkey = acumkey + d5[key];
                    mapData[4].push({
                        "year": '2020-05',
                        "name": key,
                        "value": d5[key]
                    });
                }

                if (key in d6) {
					acumkey = acumkey + d6[key];
                    mapData[5].push({
                        "year": '2020-06',
                        "name": key,
                        "value": d6[key]
                    });
                }

                if (key in d7) {
					acumkey = acumkey + d7[key];
                    mapData[6].push({
                        "year": '2020-07',
                        "name": key,
                        "value": d7[key]
                    });
                }
                if (key in d8) {
					acumkey = acumkey + d8[key];
                    mapData[7].push({
                        "year": '2020-08',
                        "name": key,
                        "value": d8[key]
                    });
                }
                if (key in d9) {
					acumkey = acumkey + d9[key];
                    mapData[8].push({
                        "year": '2020-09',
                        "name": key,
                        "value": d9[key]
                    });
                }
            }
			legendCountryData.push({name:key as String, value: acumkey});
			legendCountryData.sort(function sortNumber(a:Object, b:Object):int {
                return b.value - a.value;
            });
			
            for (var i:int = 0; i < mapData.length; i++) {

                mapData[i].sort(function sortNumber(a:Object, b:Object):int {
                    return b.value - a.value;
                });
                barData.push([]);
                categoryData.push([]);
                var mapDataLength:Number = mapData[i].length;
                if (mapDataLength > 20) {
                    mapDataLength = 20;
                }
                for (var j:int = 0; j < mapDataLength; j++) {
                    if (mapData[i][j].value > 0) {
                        barData[i].push(mapData[i][j].value);
                        categoryData[i].push(mapData[i][j].name);
                    }
                }
                barData[i].reverse();
                categoryData[i].reverse();
            }

            var optionXyMap01:Object = {
				timeline: {
					data: year,
					axisType: 'category',
					autoPlay: true,
					playInterval: 3000,
					left: '30',
					bottom: '30',
					width: '80%',
					label: {
						normal: {
							textStyle: {
								color: 'rgba(147, 235, 248, 1)'
							}
						},
						emphasis: {
							textStyle: {
								color: '#fff'
							}
						}
					},
					symbolSize: 10,
					lineStyle: {
						color: 'rgba(147, 235, 248, 1)'
					},
					checkpointStyle: {
						borderColor: 'rgba(147, 235, 248, 1)',
						borderWidth: 2,
						color: '#182240',
						shadowBlur: 15,
						shadowColor: '#3a8dd6'
					},
					controlStyle: {
						showNextBtn: true,
						showPrevBtn: true,
						normal: {
							color: 'rgba(147, 235, 248, 1)',
							borderColor: 'rgba(147, 235, 248, 1)'
						},
						emphasis: {
							color: '#fff',
							borderColor: '#fff'
						}
					}
				},
				baseOption: {
					animation: true,
					animationDuration: 1000,
					animationEasing: 'cubicInOut',
					animationDurationUpdate: 1000,
					animationEasingUpdate: 'cubicInOut',
					grid: {
						right: '1%',
						top: '15%',
						bottom: '10%',
						width: '20%'
					},
					tooltip: {
						trigger: 'axis', // hover触发器
						axisPointer: { // 坐标轴指示器，坐标轴触发有效
							type: 'shadow', // 默认为直线，可选为：'line' | 'shadow'
							shadowStyle: {
								color: 'rgba(150,150,150,0.1)' //hover颜色
							}
						}
					},
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {        show: false },
                            dataView: {    show: false, readOnly: false },
                            magicType: {   show: false, type: ['bar', 'line'] },
                            restore: {     show: true },
                            saveAsImage: { show: true }
                        }
                    },
					geo: {
						show: true,
						map: nameMap,
						roam: true,
						zoom: 1,
						left:'30', top:'center',
						//center: [10, 20],
						label: {
							emphasis: {
								show: false
							}
						},
						itemStyle: {
							normal: {
								borderColor: 'rgba(147, 235, 248, 1)',
								borderWidth: 1,
								areaColor: {
									type: 'radial',
									x: 0.5,
									y: 0.5,
									r: 0.8,
									colorStops: [{
										offset: 0,
										color: 'rgba(147, 235, 248, 0)' // 0% 处的颜色
									}, {
										offset: 1,
										color: 'rgba(147, 235, 248, .2)' // 100% 处的颜色
									}],
									globalCoord: false // 缺省为 false
								},
								shadowColor: 'rgba(128, 217, 248, 1)',
								// shadowColor: 'rgba(255, 255, 255, 1)',
								shadowOffsetX: -2,
								shadowOffsetY: 2,
								shadowBlur: 10
							},
							emphasis: {
								areaColor: '#389BB7',
								borderWidth: 0
							}
						}
					}
				},
				options: []
			};
			
			for (var n:int = 0; n < year.length; n++) {

				optionXyMap01.options.push({
					backgroundColor: '#182240',
					title: [{
							text: 'COVID-19 Apache Royale - Echarts',
							left: '25%',
							top: '30',
							textStyle: {
								color: '#fff',
								fontSize: 25
							}
						},
						{
							id: 'statistic',
							text: " Top 20 Cases " + year[n],
							left: '75%',
							top: '30',
							textStyle: {
								color: '#fff',
								fontSize: 25
							}
						}
					],
					xAxis: {
						type: 'value',
						scale: true,
						position: 'top',
						min: 0,
						boundaryGap: false,
						splitLine: {
							show: false
						},
						axisLine: {
							show: false
						},
						axisTick: {
							show: false
						},
						axisLabel: {
							margin: 2,
							textStyle: {
								color: '#aaa'
							}
						}
					},
					yAxis: {
						type: 'category',
						//  name: 'TOP 20',
						nameGap: 16,
						axisLine: {
							show: true,
							lineStyle: {
								color: '#ddd'
							}
						},
						axisTick: {
							show: false,
							lineStyle: {
								color: '#ddd'
							}
						},
						axisLabel: {
							interval: 0,
							textStyle: {
								color: '#ddd'
							}
						},
						data: categoryData[n].slice(0, 20)
					},
					series: [
						{
							type: 'map',
							map: nameMap,
							geoIndex: 0,
							aspectScale: 0.75, 
							showLegendSymbol: false,
							label: {
								normal: {
									show: false
								},
								emphasis: {
									show: false,
									textStyle: {
										color: '#fff'
									}
								}
							},
							roam: true,
							itemStyle: {
								normal: {
									areaColor: '#5c253f',
									borderColor: '#32a852'
								},
								emphasis: {
									areaColor: '#2B91B7'
								}
							},
							animation: false,
							data: mapData
						},
						{
							//  name: 'Top 5',
							type: 'effectScatter',
							coordinateSystem: 'geo',
							data: convertData(mapData[n]),
							symbolSize: function(val:Array):Number {
								var n:int = 0;
								if (val[2] <= 1000) {
									n = 1;
								} else if (val[2] <= 10000) {
									n = 5;
								} else if (val[2] <= 50000) {
									n = 10;
								} else if (val[2] <= 150000) {
									n = 15;
								} else if (val[2] <= 500000) {
									n = 20;
								} else if (val[2] <= 1000000) {
									n = 25;
								} else if (val[2] <= 5000000) {
									n = 35;
								} else {
									n = 45;
								}
								return n;
							},
							showEffectOn: 'render',
							rippleEffect: {
								brushType: 'stroke'
							},
							hoverAnimation: true,
							label: {
								normal: {
									formatter: '{b}',
									position: 'right',
									show: false
								}
							},
							itemStyle: {
								normal: {
									color: 'rgba(147, 235, 248, 1)',
									shadowBlur: 10,
									shadowColor: '#3a8dd6'
								}
							},
							zlevel: 1
						},
						{
							zlevel: 1.5,
							type: 'bar',
							symbol: 'none',
							itemStyle: {
								normal: {
									areaColor: {
										type: 'radial',
										x: 0.5,
										y: 0.5,
										r: 0.8,
										colorStops: [{
											offset: 0,
											color: 'rgba(147, 235, 248, 0)' // 0% 处的颜色
										}, {
											offset: 1,
											color: 'rgba(147, 235, 0, .2)' // 100% 处的颜色
										}],
										globalCoord: false // 缺省为 false
									}
								}
							},
							data: barData[n].slice(0, 20)
						}
					]
				})
			}

            return optionXyMap01;
        }


		private function convertData(data:Array):Array {
            var res:Array = [];
            for (var i:int = 0; i < data.length; i++) {
                var geoCoord:Array = geoCoordMap[data[i].name];
                if (geoCoord) {
                    if (!data[i].value == '' && data[i].value > 0) {
                        res.push({
                            name: data[i].name,
                            value: geoCoord.concat(data[i].value)
                        });
                    }
                }
            }
            return res;
        }

    }
}