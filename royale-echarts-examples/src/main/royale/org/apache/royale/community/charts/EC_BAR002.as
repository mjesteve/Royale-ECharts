package org.apache.royale.community.charts
{

    public class EC_BAR002 implements IEchartDefinition
    {

        public function EC_BAR002()
        {

        }

        private var _options:Object;
        [Binding]
        public function get options():Object{ return _options; }
        public function set options(value:Object):void{ _options = value; }


        public function optionChartInit():Object
        {
            _options = {
                title: {   text:'The total population of the world (thousand)', subtext:'Data comes from the network'   },
                tooltip: { trigger:'axis', axisPointer: {type:'shadow'}   },
                legend: {  orient:'vertical', x:'right',  y:'top', itemGap: 10, itemWidth: 10, itemHeight: 10,
                           data: ['2018', '2019']
                },
                grid: {   left: '5%',  right: '5%', bottom: '5%', containLabel: true    },
                xAxis: {  type:'value', boundaryGap: [0, 0.01]    },
                yAxis: {  type:'category', data: ['Brazil','Indonesia','United States','India','China','World population']},
                series: [
                    {   name: '2018', type:'bar',
                        data: [210, 268, 327, 1353, 1428, 7631]
                    },
                    {   name: '2019', type:'bar',
                        data: [211, 271, 330, 1366, 1434, 7713]
                    }
                ]
            };

            return _options;
        }

    }
}