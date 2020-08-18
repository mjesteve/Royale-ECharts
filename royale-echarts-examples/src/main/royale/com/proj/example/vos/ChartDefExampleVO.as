package com.proj.example.vos
{
    import com.proj.example.charts.IEchartDefinition;

    public class ChartDefExampleVO
    {
        public var idChart:int;
        public var desChart:String;
        public var typeChart:String;
        public var component:IEchartDefinition;

        public function ChartDefExampleVO(idChart:int, desChart:String, typeChart:String, component:IEchartDefinition)
        {
            this.idChart = idChart;
            this.desChart = desChart;
            this.typeChart = typeChart;
            this.component = component;
        }

    }
}

