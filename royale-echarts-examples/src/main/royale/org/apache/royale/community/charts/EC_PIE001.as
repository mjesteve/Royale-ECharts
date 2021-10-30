package org.apache.royale.community.charts
{

    public class EC_PIE001 implements IEchartDefinition
    {

        public function EC_PIE001()
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
                    text:'Pie Chart'
                },
                series : [
                    {
                        name: 'Reference Page',
                        type: 'pie',
                        radius: '55%',
                        data:[
                            {value:400, name:'Searching Engine'},
                            {value:335, name:'Direct'},
                            {value:310, name:'Email'},
                            {value:274, name:'Alliance Advertisement'},
                            {value:235, name:'Video Advertisement'}
                        ]
                    }
                ]
            };

            return _options;
        }

    }
}