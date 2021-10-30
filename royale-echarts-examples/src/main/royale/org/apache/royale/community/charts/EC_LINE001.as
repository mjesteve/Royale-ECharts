package org.apache.royale.community.charts
{

    public class EC_LINE001 implements IEchartDefinition
    {

        public function EC_LINE001()
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
                    text:'Temperature changes in the next week',
                    subtext:'Purely fictitious'
                },
                tooltip: {
                    trigger:'axis'
                },
                legend: {
                    data: ['highest temperature','lowest temperature']
                },
                toolbox: {
                    show: true, left:'0px', top:'bottom',
                    feature: {
                        dataZoom: {
                            yAxisIndex:'none'
                        },
                        dataView: {readOnly: false},
                        magicType: {type: ['line','bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type:'category',
                    boundaryGap: false,
                    data: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
                },
                yAxis: {
                    type:'value',
                    axisLabel: {
                        formatter:'{value} °C'
                    }
                },
                series: [
                    {
                        name:'Maximum temperature',
                        type:'line',
                        data: [11, 11, 15, 13, 12, 13, 10],
                        markPoint: {
                            data: [
                                {type:'max', name:'maximum value'},
                                {type:'min', name:'minimum value'}
                            ]
                        },
                        markLine: {
                            data: [
                                {type:'average', name:'average'}
                            ]
                        }
                    },
                    {
                        name:'Minimum temperature',
                        type:'line',
                        data: [1, -2, 2, 5, 3, 2, 0],
                        markPoint: {
                            data: [
                                {name:'weekly lowest', value: -2, xAxis: 1, yAxis: -1.5}
                            ]
                        },
                        markLine: {
                            data: [
                                {type:'average', name:'average'},
                                [{
                                    symbol:'none',
                                    x: '90%',
                                    yAxis:'max'
                                }, {
                                    symbol:'circle',
                                    label: {
                                        position:'start',
                                        formatter:'Maximum value'
                                    },
                                    type:'max',
                                    name:'Highest point'
                                }]
                            ]
                        }
                    }
                ]
            };

            return _options;
        }

    }
}