package com.proj.example.charts
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
        
        
        public function optionsInit():Object
        {
            _options = {
                title: {
                    text:'The total population of the world',
                    subtext:'Data comes from the network'
                },
                tooltip: {
                    trigger:'axis',
                    axisPointer: {
                        type:'shadow'
                    }
                },
                legend: {
                    orient:'vertical',
                    x:'right',  y:'top', itemGap: 10, itemWidth: 10, itemHeight: 10,
                    data: ['2011', '2012']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type:'value',
                    boundaryGap: [0, 0.01]
                },
                yAxis: {
                    type:'category',
                    data: ['Brazil','Indonesia','United States','India','China','World population (ten thousand)']
                },
                series: [
                    {
                        name: '2011',
                        type:'bar',
                        data: [18203, 23489, 29034, 104970, 131744, 630230]
                    },
                    {
                        name: '2012',
                        type:'bar',
                        data: [19325, 23438, 31000, 121594, 134141, 681807]
                    }
                ]
                };

            return _options;
        }

    }
}