package com.proj.example.charts
{
    import com.proj.example.charts.EChartsComponent

    public class ECC_PIE001 extends EChartsComponent
    {
        
        public function ECC_PIE001()
        {
            super();
        }
		override public function addedToParent():void
		{
			super.addedToParent();
            setOption(optionsInit);
		}        
		override public function init(theme:Object=null, opts:Object=null):void
		{ 			
			super.init(theme,opts);
            resize({width: 'auto', height: 'auto'});
		}

        [Bindable]
        public static var autoLoad:Boolean = true;

        [Bindable]
        public static function get optionsInit():Object
        {
            return {
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

        }

    }
}