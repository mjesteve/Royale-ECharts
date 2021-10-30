package org.apache.royale.community.charts
{

    public class EC_BAR003 implements IEchartDefinition
    {

        public function EC_BAR003()
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
                    text:'Bar Chart - Overlapping Series'
                },
                tooltip: {
                    trigger:'axis',
                    axisPointer: {// axis indicator, axis trigger is valid
                        type:'shadow' // The default is a straight line, optional:'line' |'shadow'
                    }
                },
                legend: {
                    data: ['Direct Access','Email Marketing','Affiliate Advertising','Video Advertising','Search Engine']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type:'value'
                },
                yAxis: {
                    type:'category',
                    data: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
                },
                series: [
                    {
                        name:'Direct access',
                        type:'bar',
                        stack:'Total',
                        label: {
                            show: true,
                            position:'insideRight'
                        },
                        data: [320, 302, 301, 334, 390, 330, 320]
                    },
                    {
                        name:'Mail Marketing',
                        type:'bar',
                        stack:'Total',
                        label: {
                            show: true,
                            position:'insideRight'
                        },
                        data: [120, 132, 101, 134, 90, 230, 210]
                    },
                    {
                        name:'Affiliate Advertising',
                        type:'bar',
                        stack:'Total',
                        label: {
                            show: true,
                            position:'insideRight'
                        },
                        data: [220, 182, 191, 234, 290, 330, 310]
                    },
                    {
                        name:'Video ads',
                        type:'bar',
                        stack:'Total',
                        label: {
                            show: true,
                            position:'insideRight'
                        },
                        data: [150, 212, 201, 154, 190, 330, 410]
                    },
                    {
                        name:'Search Engine',
                        type:'bar',
                        stack:'Total',
                        label: {
                            show: true,
                            position:'insideRight'
                        },
                        data: [820, 832, 901, 934, 1290, 1330, 1320]
                    }
                ]
            };

            return _options;
        }

    }
}