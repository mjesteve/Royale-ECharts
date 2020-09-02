package com.echarts
{

    public class EC_PIE002 implements IEchartDefinition
    {
        
        public function EC_PIE002()
        {
            
        }

        private var _options:Object;
        [Binding]
        public function get options():Object{ return _options; }
        public function set options(value:Object):void{ _options = value; }
        
        
        public function optionChartInit():Object
        {
            var dataprovider:Array = [
                        { name: 'Acummulated', value: 70, caption: '70:00'},
                        { name: 'Balance', value: 30, caption: '30:00'}
                    ];
            var dataproviderMarkPoint:Array = [{tope:'120:00',acumulado:'90:00',saldo:'30:00',name:'Limit',value:100 }];
            var lbldet:Object = {
                show: true,
                /* with markPoint:              
                formatter: function(params){
                    return [
                    '{title|Balance}', '{saldo|'+ params.value.saldo +'}',
                    '{hr|}',
                    '  {caption|Limit}{value|'+ params.value.tope +'}',
                    '  {caption|Acummulated}{value|'+ params.value.acumulado +'}'].join('\n');
                },
                */position: 'center',        
                formatter: function(params){
                    if(params.dataIndex === 0){
                        return [
                        '{title|Balance}', '{saldo|'+ dataproviderMarkPoint[0].saldo +'}',
                        '{hr|}',
                        '  {caption|Limit}{value|'+ dataproviderMarkPoint[0].tope +'}',
                        '  {caption|Acummulated}{value|'+ dataproviderMarkPoint[0].acumulado +'}'].join('\n');
                    }else{
                        return '';
                    }
                },
                rich: {
                    title: {
                        color: '#000', align: 'center', fontSize: 20, fontStyle: 'bold', fontFamily: 'Open Sans', height: 45
                    },
                    saldo: {
                        color: '#196DB3', fontSize: 20, fontStyle: 'bold', fontFamily: 'Open Sans', align: 'center', height: 45
                    },
                    hr: {
                        align: 'left', width: '100%', height: 0, borderWidth: 0.5, borderColor: '#777'
                    },
                    caption: {
                        color: '#000', align: 'left', fontSize: '1em', fontStyle: 'bold', fontFamily: 'Open Sans', padding: [0, 20, 20, 0]
                    },
                    value: {
                        color: '#000', align: 'right', fontSize: '1em', fontFamily: 'Open Sans', padding: [0, 0, 20, 10]
                    }
                }
            }

            _options = {
                title: {
                    text:'Pie-Doughnut Chart Person'
                },
                legend: {
                    data: [
                        { name: 'Limit', icon: 'circle' },
                        { name: 'Acummulated', icon: 'circle' },
                        { name: 'Balance', icon: 'circle' }
                    ],
                    //left: 'center', top: 'bottom',
                    orient:'vertical',
                    x:'right',  y:'top', itemGap: 10, itemWidth: 10, itemHeight: 10,
                    textStyle: { color: '#000000', fontStyle: 'normal', fontSize: '.8em', fontFamily: 'Open Sans' },
                    selectedMode: false
                },
                tooltip: {
                    trigger: 'item',
                    padding: [10,15,10,15],
                    //position: ['50%', '50%'],
                    //https://echarts.apache.org/en/option.html#tooltip.position
                        //param: The same as formatter.
                        //pos: Mouse position, [0] x - [1] y
                        //dom: The DOM object of tooltip.
                        //rect: It is valid only when mouse is on graphic elements, which stands for a bounding box with x, y, width, and height.
                        //size: The size of dom echarts container. For example: {contentSize: [width, height], viewSize: [width, height]}.
                        
                        //var point: Mouse position. Ex: return [point[0],'10%'];
                        
                        //Return:
                        //Return value is an array standing for tooltip position, which can be absolute pixels, or relative percentage.
                        //Or can be an object, like {left: 10, top: 30}, or {right: '20%', bottom: 40}.

                    position: function (pos, params, dom, rect, size) {
                        // tooltip will be fixed on the right if mouse hovering on the left,
                        // and on the left if hovering on the right.
                        //ex1:
                        //var obj = {top: 60};
                        //obj[['left', 'right'][+(pos[0] < size.contentSize[0] / 2)]] = 5;
                        //console.log(obj);
                        
                        //We always position ourselves "within" the limits of the chart
                        var obj = {};
                        if(pos[1]<size.contentSize[1])
                            obj.top = pos[1]+25;
                        else
                            obj.top = pos[1]-size.contentSize[1]-5;
                            
                        if(pos[0] < (size.contentSize[0] / 2)){
                            //are left chart
                            obj.left = pos[0];
                        }else{
                            obj.left = pos[0]-size.contentSize[0]-5;
                        }
                        return obj;
                    },
                    //extraCssText: "width:200px; white-space:pre-wrap;",
                    formatter: function (params) {
                        //https://echarts.apache.org/en/option.html#tooltip.formatter
                        //In this case...
                        //params: $vars --> Array [seriesName, name, value, percent]
                        //params.data (item hovered)
                        //console.log(params.data);
                        //params.value is equal params.data

                        //legend color
                        var res = '';
                        if (params.dataIndex === 0) {                            
                            res = '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;background-color:#bbdefa;"></span>';
                        }else{
                            res = '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;background-color:#2196f3;"></span>';
                        }
                        res += '<strong>'+params.data.name+'</strong><br/>';
                        res += '<strong>'+params.data.caption+'</strong>   ('+Number.parseFloat(params.data.value).toFixed(2)+'%)';
                        return res;
                    },
                    textStyle: {
                        fontStyle:'normal',fontSize:'1em', fontWeight:'normal', fontFamily:'Open Sans'
                    }
                },
                series: [
                    {
                        type: 'pie',
                        name: 'anillo',
                        radius: ['40%', '70%'],
                        avoidLabelOverlap: true,
                        center: ['50%', '50%'],
                        hoverAnimation: false, 
                        selectedMode: false,
                        dimensions: ['name', 'value', 'caption'],
                        data: dataprovider,
                        label: {
                            show: true, position: 'inside',
                            color: '#ffffff', fontSize: '1em', fontWeight: 'normal', fontFamily: 'Open Sans',
                            //formatter: '{@caption} {percen|({d}%)}',
                            formatter: function(params){
                                if(params.dataIndex === 0)
                                    return '{acum|'+Number.parseFloat(params.data.value).toFixed(2)+'%}';
                                else
                                    return params.data.value+'%';                                
                            },
                            rich:{
                                acum:{ color: '#000' }
                            }                        
                        },
                        labelLine: { show: false },
                        itemStyle: {
                            normal:{
                                //backgroundColor
                                color: function(params){
                                    if(params.dataIndex === 0)
                                        return '#bbdefa';
                                    else
                                        return '#2196f3';
                                }
                            },
                            emphasis:{
                                shadowColor: 'rgba(0, 0, 0, 0.5)',
                                shadowBlur: 5
                            }
                        }
                    },
                    {
                        type: 'pie',
                        name: 'serieLimit',
                        radius: ['73%', '85%'],
                        avoidLabelOverlap: true,
                        center: ['50%', '50%'],
                        hoverAnimation: false, 
                        selectedMode: false,
                        dimensions: ['tope', 'acumulado', 'saldo'],
                        data: dataproviderMarkPoint,
                        label: lbldet,
                        labelLine: {
                            show: false
                        },
                        itemStyle: {
                            normal:{
                                //backgroundColor
                                color: function(params){ return '#F7941D';}
                            },
                            emphasis:{
                                shadowColor: 'rgba(0, 0, 0, 0.5)',
                                shadowBlur: 5
                            }
                        }, 
                        tooltip:{ 
                            show:true,
                            trigger: 'item', position:{top:'50%',left:5},
                            padding: [10,15,10,15],
                            formatter: function (params) {
                                var res = '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;background-color:#F7941D;"></span>';
                                res += '<strong>'+params.data.name+'</strong><br/><strong>'+params.data.tope+'</strong>';
                                return res;
                            }                            
                        }
                    }
                ]
            };

            return _options;
        }

    }
}