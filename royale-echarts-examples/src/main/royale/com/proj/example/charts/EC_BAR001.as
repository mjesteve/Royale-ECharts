package com.proj.example.charts
{

    public class EC_BAR001 implements IEchartDefinition
    {
        
        public function EC_BAR001()
        {
            
        }

        private var _options:Object;
        [Binding]
        public function get options():Object{ return _options; }
        public function set options(value:Object):void{ _options = value; }
        
        
        public function optionChartInit():Object
        {
            _options = {
                title: {
                    text:'Bar Chart Person',
                    subtext:'Data comes from the Local'
                },
                legend: {
                    data: [
                        {name: 'Limit', icon: 'square'},
                        {name: 'Acummulated', icon: 'square'}
                    ],
                    orient:'vertical',
                    x:'right',  y:'top', itemGap: 10, itemWidth: 10, itemHeight: 10,
                    textStyle:{color: '#000000', fontStyle:'normal',fontSize:'10',fontFamily:'Open Sans'}
                },
                toolbox: {
                    show: true, right:'0px', top:'bottom',
                    orient: 'vertical',
                    feature: {
                        mark: {show: true},
                        dataZoom: {
                            yAxisIndex:'none'
                        },
                        dataView: {readOnly: false, title: 'Data View Title'},
                        magicType: { 
                            show: true, 
                            type: ["line", "bar"], 
                            title: { line: "Line", bar: "Bar"}
                        },
                        restore: {title: 'restore'},
                        saveAsImage: {title: 'save As Image'}
                    }
                },
                //https://echarts.apache.org/en/option.html#tooltip
                tooltip: {
                    trigger:'axis',
                    axisPointer:{type: 'shadow'}, snap: true, alwaysShowContent: false, appendToBody: true,
                    padding: [10,15,10,15],
                    //extraCssText: "width:200px; white-space:pre-wrap;",
                    //, formatter: "{a} <br/>{b} : {c}%" '{des|'+v[1]+'}'
                    formatter: function (params) {
                        //https://echarts.apache.org/en/option.html#tooltip.formatter
                        
                        var v = params[0].name.split(' - ');
                        var res='<strong>'+v[0]+'</strong> - '+v[1];
                        res += '<hr style="height:1px;border-width:0;background-color:white">';
                        for(var i = 0; i < params.length; i++) {
                            //legend color
                            if (i === 0) {                            
                                res += '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;background-color:#2196f3;"></span>';
                            }else{
                                res += '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;background-color:#bbdefa;"></span>';
                            }
                            res += '<strong>'+params[i].seriesName+'</strong>: ';
                            var item = params[i].data;
                            if (i === 0) {
                                //res += item.tpersonaltxt+'   ('+item.tpersonalpercentage+'%)<br/>';
                                res += '<strong>'+item.tpersonaltxt+' </strong>('+item.tpersonalpercentage+' %)<br>';
                            }else{
                                res += '<strong>'+item.acumtxt+' </strong>('+item.acumpercentage+' %)<br>';
                            }
                        }
                        return res;
                    },
                    textStyle: {
                        fontStyle:'normal',fontSize:10, fontWeight:'normal', fontFamily:'Open Sans'
                    }
                },
                grid: {
                    containLabel: false, 
                    top:'center', left: '20%', right:'20', width: 'auto', 
                    height: '300'
                },
                dataset: {
                    dimensions: ['descontador', 'tpersonalpercentage', 'acumpercentage', 'tpersonaltxt', 'acumtxt'],
                    source: [
                        {descontador: '105 - Break / Fumar / wc', tpersonalpercentage: 100, acumpercentage: 133, tpersonaltxt: '0:15', acumtxt: '0:20'},
                        {descontador: '106 - Structural Overtime', tpersonalpercentage: 100, acumpercentage: 70, tpersonaltxt: '10:00', acumtxt: '7:00'},
                        {descontador: '120 - Vacation Days (business)', tpersonalpercentage: 100, acumpercentage: 9, tpersonaltxt: '22', acumtxt: '2'},
                        {descontador: '150 - Self Business Days', tpersonalpercentage: 100, acumpercentage: 0, tpersonaltxt: '9', acumtxt: '0'}
                    ]
                },
                yAxis: {
                    type: 'category',
                    inverse: true, //FROM (0,0). true: order from source [105..150], false: reverse order of source [150..105]
                    position: 'left', offset: 10,
                    axisTick: {show: true, alignWithLabel: true, inside: false, length:5},
                    axisLabel: {
                        color: '#000000', fontStyle:'normal',fontSize:10, fontFamily:'Open Sans',
                        verticalAlign: 'middle',
                        lineHeight: 20,
                        formatter: function(value, index){ 
                            var v = value.split(' - ');
                            v[1] = (v[1].length >= 15 ? (v[1].slice(0,13)+"...") : v[1] );
                            //v[1] = v[1].split (" "). join ("\n");
                            //return '{cod|v[0]}' + '\n' + '{des|v[1]}'; //is does not work
                            return '{cod|'+v[0]+'}' + '\n' + '{des|'+v[1]+'}';
                        },
                        rich: {
                            cod: {
                                fontStyle:'bold',
                                width: 40
                            },
                            des: {
                                fontSize: 9,
                                align:'right'//,
                                //backgroundColor: '#ffffff',
                                //height:15, width:100
                            }
                        }
                    },
                    splitArea: {show: false}
                },
                xAxis: {
                        type: 'value',
                        position: 'right', offset: 0,
                        axisTick: {show: true, alignWithLabel: true, inside: false, length:5},
                        axisLabel: {
                            color: '#000000', fontStyle:'normal',fontSize:10, fontFamily:'Open Sans',
                            textStyle: {
                                color: function(value,index){  
                                    return value <=100 ? 'green':'red'; 
                                },
                            verticalAlign: 'top', 
                            padding: [10,10,10,10]}, 
                            formatter: '{value}%'
                        }, 
                        minInterval: 1, maxInterval:25, interval:20
                },
                series: [{
                            name: 'Limit', type: 'bar', 
                            barWidth: '22', barMaxWidth: '22', barMinWidth: '22',
                            label: {
                                show: true, position: 'inside',
                                color: '#ffffff',fontStyle:'bold', fontSize:10, fontWeight:'normal', fontFamily:'Open Sans',
                                formatter: '{@tpersonaltxt} ({@tpersonalpercentage} %)'
                            },
                            itemStyle: {color: '#2196f3'},
                            encode: { 
                                x: 'tpersonalpercentage', 
                                y: 'descontador'
                            }
                        },
                        {
                            name: 'Acummulated', type: 'bar', 
                            barWidth: '22', barMaxWidth: '22', barMinWidth: '22', barGap:'1%', barCategoryGap: 5,
                            label: {
                                show: true, 
                                formatter: '{@acumtxt} ({@acumpercentage} %)',
                                color: '#000000',fontStyle: 'bold',fontSize: 10, fontWeight: 'normal', fontFamily: 'Open Sans'
                            },
                            itemStyle: {color: '#bbdefa'} ,
                            encode: { 
                                x: 'acumpercentage', 
                                y: 'descontador'
                            }
                        }
                ]
            };

            return _options;
        }

    }
}