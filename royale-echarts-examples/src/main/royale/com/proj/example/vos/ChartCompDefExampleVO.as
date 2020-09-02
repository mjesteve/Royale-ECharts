package com.proj.example.vos
{
    import com.echarts.charts.IEchartDefinition;
    import com.echarts.components.EChartsComponent;

    public class ChartCompDefExampleVO
    {
        public var idChart:int;
        public var desChart:String;
        public var typeChart:String;
        public var component:IEchartDefinition;
        public var chartInstance:EChartsComponent;

        public function ChartCompDefExampleVO(idChart:int, desChart:String, typeChart:String, component:IEchartDefinition)
        {
            this.idChart = idChart;
            this.desChart = desChart;
            this.typeChart = typeChart;
            this.component = component;
        }

    }
}

