package com.proj.example.charts
{

    import mx.core.InteractionMode;

    public class ECC_PIE003  implements IEchartDefinition
    {
        
        public function ECC_PIE003() {}

        private var _options:Object;
        [Binding]
        public function get options():Object{ return _options; }
        public function set options(value:Object):void{ _options = value; }

        public function optionChartInit():Object
        {
            var dashedPic:String = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAM8AAAAOBAMAAAB6G1V9AAAAD1BMVEX////Kysrk5OTj4+TJycoJ0iFPAAAAG0lEQVQ4y2MYBaNgGAMTQQVFOiABhlEwCugOAMqzCykGOeENAAAAAElFTkSuQmCC';
            
            var sum:Number = 0, sumBis:Number = 0;
            var limit:Number = 0;
            var accum:Number = 0;
            var pieSeries:Array = [], lineYAxis:Array = [], lineYAxisBis:Array = [];

            var arColors:Array = ['#2196f3','#bbdefa','#FF8700'];
            var coloNeg:String = '#ff002b';
            var chartData:Array = [
                {name: "Limit hrs", value: 1800, valuetxt: '30:00', unit:2},
                {name: "Accumulated hrs", value: 2400, valuetxt: '40:00',unit:2},
                {name: "Balance hrs", value: -600, valuetxt: '-10:00', unit:2}
            ];
            var chartDataBis:Array = [
                {name: "Limit days", value: 29, valuetxt: '29 d.',unit:1},
                {name: "Accumulated days",value: 22,valuetxt: '22 d.',unit:1},
                {name: "Balance days",value: 7,valuetxt: '7 d.',unit:1}
            ];

            var v:Object;
            var colorserie:String;
            var dataserie:Array = [];
            var valuepos:Number = 0;
            var valuecomp:Number = 0;

            var x:int = 0;
            var i:int = 0;
            var len:int = chartData.length;
            //These chart are calculated from the total
            for(x = 0; x < len; x++)
            {
                if(x<len-1)
                    sum += chartData[x].value;
            }
            for(i = 0; i < len; i++)
            {
                v = chartData[i];                
                colorserie = arColors[i];
                dataserie = [];
                
                if(i == 0) limit = v.value;
                if(i == 1) accum = v.value;

                if(i != 2){
                    dataserie = [
                        {value: v.value, name: v.name, itemStyle: {color: colorserie}},
                        {value: sum-v.value, name:'', itemStyle: {color: "rgba(0,0,0,0)"}}
                    ];
                }else{
                    valuepos = v.value;
                    valuecomp = 0;
                    if(v.value < 0){
                        colorserie = coloNeg;
                        valuepos = -1 * valuepos;
                        valuecomp = limit;
                    }else{
                        valuecomp = accum;
                    }
                    //var limite:Number = chartData[i-1].value + v.value;
                    dataserie = [
                        {value: valuecomp, name:'', itemStyle: {color: "rgba(0,0,0,0)"}},
                        {value: valuepos, name: v.name, itemStyle: {color: colorserie}},
                        {value: valuecomp, name:'', itemStyle: {color: "rgba(0,0,0,0)"}},
                    ];
                }
                
                //Serie value
                pieSeries.push({
                    name:'Hours',
                    type:'pie',
                    z: 2,
                    clockWise: false,
                    hoverAnimation: false,
                    radius: [65-i * 15 +'%', 57-i * 15 +'%'],
                    center: ["25%", "50%"],
                    label: { show: false },
                    data: dataserie
                });
                
                //Serie background
                pieSeries.push({
                    name:'Hours background',
                    type:'pie',
                    silent: true,
                    z: 1,
                    clockWise: false, //load in time
                    hoverAnimation: false, //Move in becomes bigger
                    radius: [65-i * 15 +'%', 57-i * 15 +'%'],
                    center: ["25%", "50%"],
                    label: { show: false },
                    data: [
                        {value: 7.5, itemStyle: {color: "#eff6ff"}},
                        {value: 2.5, name:'', itemStyle: {color: "rgba(0,0,0,0)"}}
                    ]
                });
                
                //v.percent = (v.value / sum * 100).toFixed(1) + "%";
                lineYAxis.push({
                    value: i,
                    textStyle: { rich: { circle: {color: colorserie, padding: [0, 5]} } }
                });

            }

            len = chartDataBis.length;
            for(x = 0; x < len; x++)
            {
                if(x<len-1)
                    sumBis += chartDataBis[x].value;
            }

            for(i = 0; i < len; i++)
            {
                v = chartDataBis[i];                
                colorserie = arColors[i];
                dataserie = [];
                
                if(i == 0) limit = v.value;
                if(i == 1) accum = v.value;

                if(i != 2){
                    dataserie = [
                        {value: v.value, name: v.name, itemStyle: {color: colorserie}},
                        {value: sumBis-v.value, name:'', itemStyle: {color: "rgba(0,0,0,0)"}}
                    ];                    
                }else{
                    valuepos = v.value;
                    valuecomp = 0;
                    if(v.value < 0){
                        colorserie = coloNeg;
                        valuepos = -1 * v.value;
                        valuecomp = limit;
                    }else{
                        valuepos = v.value;
                        valuecomp = accum;
                    }
                    //var limite:Number = chartData[i-1].value + v.value;
                    dataserie = [
                        {value: valuecomp, name:'', itemStyle: {color: "rgba(0,0,0,0)"}},
                        {value: valuepos, name: v.name, itemStyle: {color: colorserie}},
                        {value: valuecomp, name:'', itemStyle: {color: "rgba(0,0,0,0)"}},
                    ];
                }
                
                //Serie value
                pieSeries.push({
                    name:'days',
                    type:'pie',
                    z: 2,
                    clockWise: false,
                    hoverAnimation: false,
                    radius: [65-i * 15 +'%', 57-i * 15 +'%'],
                    center: ["75%", "50%"],
                    label: { show: false },
                    data: dataserie
                });
                
                //Serie background
                pieSeries.push({
                    name:'days background',
                    type:'pie',
                    silent: true,
                    z: 1,
                    clockWise: false, //load in time
                    hoverAnimation: false, //Move in becomes bigger
                    radius: [65-i * 15 +'%', 57-i * 15 +'%'],
                    center: ["75%", "50%"],
                    label: { show: false },
                    data: [
                        {value: 7.5, itemStyle: {color: "#eff6ff"}},
                        {value: 2.5, name:'', itemStyle: {color: "rgba(0,0,0,0)"}}
                    ]
                });
                
                //v.percent = (v.value / sum * 100).toFixed(1) + "%";
                lineYAxisBis.push({
                    value: i,
                    textStyle: { rich: { circle: {color: colorserie, padding: [0, 5]} } }
                });

            }

            _options = {
                toolbox: getToolBoxStd(true),
                backgroundColor:'#fff',
                color: arColors,
                grid: [{
                    top: '17%',
                    left: "25%",
                    height: '20%',
                    containLabel: false
                },{
                    top: '17%',
                    left: "75%",
                    height: '20%',
                    containLabel: false
                }],
                yAxis: [{
                    type:'category',gridIndex:0,
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        formatter: function(params:Object):String {
                            return labelformatter(params,chartData);
                        },
                        interval: 0,
                        inside: true,
                        textStyle: {
                            color: "#333", //does not work
                            fontSize: 14, //does not work
                            rich: {
                                line: {
                                    width: 75,
                                    height: 10,
                                    backgroundColor: {
                                        image: dashedPic
                                    }
                                },
                                name: {
                                    color:'#666'
                                },
                                bd: {
                                    color:'#ccc',
                                    padding: [0, 5]
                                },
                                value: {
                                    color: '#333',
                                    fontWeight: 700
                                },
                                valueneg: {
                                    color: '#ff002b',
                                    fontWeight: 700
                                }
                            }
                        },
                        show: true
                    },
                    data: lineYAxis
                },
                {
                    type:'category',gridIndex:1,
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        formatter: function(params:Object):String {
                            return labelformatter(params,chartDataBis);
                        },
                        interval: 0,
                        inside: true,
                        textStyle: {
                            color: "#333", //does not work
                            fontSize: 14, //does not work
                            rich: {
                                line: {
                                    width: 75,
                                    height: 10,
                                    backgroundColor: {
                                        image: dashedPic
                                    }
                                },
                                name: {
                                    color:'#666'
                                },
                                bd: {
                                    color:'#ccc',
                                    padding: [0, 5]
                                },
                                value: {
                                    color: '#333',
                                    fontWeight: 700
                                },
                                valueneg: {
                                    color: '#ff002b',
                                    fontWeight: 700
                                }
                            }
                        },
                        show: true
                    },
                    data: lineYAxisBis
                }],
                xAxis:[ {gridIndex:0, show: false}, {gridIndex:1, show: false}],
                series: pieSeries
            };

            return _options;

        }

        private function labelformatter(params:Object, arData:Array):String {
            var item:Object = arData[params];
            var valuestr:String = '{value|' + item.valuetxt +'}';
            if(item.value<0)
                valuestr = '{valueneg|' + item.valuetxt +'}';
            return'{line|}{circle|●}{name|' + item.name +'}{bd||}'+valuestr;
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

    }
}