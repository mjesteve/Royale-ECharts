package com.proj.example.vos
{
    import com.proj.example.charts.IEchartDefinition;

    [Bindable]
    public class TabBarChartVO
    {
        public var hash:String;
        public var typeChart:String;
        public var label:String;
        public var description:String;
        public var thumbnail:String;
        public var component:IEchartDefinition;

        public function TabBarChartVO()
        {
        }

    }
}

