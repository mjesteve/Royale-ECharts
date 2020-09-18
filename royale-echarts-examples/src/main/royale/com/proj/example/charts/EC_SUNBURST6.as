package com.proj.example.charts
{

    public class EC_SUNBURST6 implements IEchartDefinition
    {
        /**
         * https://www.runoob.com/try/try.php?filename=tryecharts_sunburst6
         */
        public function EC_SUNBURST6(){}

        private var _options:Object;
        [Binding]
        public function get options():Object{ return _options; }
        public function set options(value:Object):void{ _options = value; }
        
        
        public function optionChartInit():Object
        {
            var colors:Array = ['#FFAE57', '#FF7853', '#EA5151', '#CC3F57', '#9A2555'];
            var bgColor:String = '#2E2733';

            var itemStyle:Object = {
                star5: { color: colors[0]}, star4: {color: colors[1]},star3: {color: colors[2]},star2: {color: colors[3]}
            };

            var data:Array = new Array();
            data.push({
                name: 'imaginary', id: 'level1',
                itemStyle: {
                    normal: {
                        color: colors[1]
                    }
                },
                children: [{
                    name: 'Fiction', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'pain'
                        }, {
                            name: 'mercy'
                        }, {
                            name: 'Tenant downstairs'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'The cross of nothingness'
                        }, {
                            name: 'Silent confession'
                        }, {
                            name: 'The end of childhood'
                        }]
                    }, {
                        name: '3☆', id: 'level3',
                        children: [{
                            name: 'Diary of a Crazy Old Man'
                        }]
                    }]
                }, {
                    name: 'other', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Nabokov´s short stories'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Requiem'
                        }, {
                            name: 'Life Jigsaw Edition'
                        }]
                    }, {
                        name: '3☆', id: 'level3',
                        children: [{
                            name: 'I need you more than I love you'
                        }]
                    }]
                }]
            });

            data.push({
                name: 'Non-fiction', id: 'level1',
                itemStyle: {
                    color: colors[2]
                },
                children: [{
                    name: 'design', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Interfaceless interaction'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Lighting and Rendering Technology of Digital Drawing'
                        }, {
                            name: 'Japanese Architecture Anatomy Book'
                        }]
                    }, {
                        name: '3☆', id: 'level3',
                        children: [{
                            name: 'Fantasy world art\n&RPG mapping lecture'
                        }]
                    }]
                }, {
                    name: 'Social Science', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Pain points'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Effective managers'
                        }, {
                            name: 'evolution'
                        }, {
                            name: 'The coming of the post-materialistic era'
                        }]
                    }, {
                        name: '3☆', id: 'level3',
                        children: [{
                            name: 'Madness and civilization'
                        }]
                    }]
                }, {
                    name: 'Psychological', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Neurotic personality of our time'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Pygmalion effect'
                        }, {
                            name: 'Injured person'
                        }]
                    }, {
                        name: '3☆', id: 'level3'
                    }, {
                        name: '2☆', id: 'level3',
                        children: [{ name: 'Obsessed with' }] }]
                }, {
                    name: 'Home', id: 'level2',
                    children: [{
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Make the house a home'
                        }, {
                            name: 'Live only the necessary life'
                        }, {
                            name: 'Nordic minimalist style'
                        }]
                    }]
                }, {
                    name: 'Picture book', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Design poem'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'If life fools you'
                        }, {
                            name: 'Naturalist´s Illustrated Mysterious Animals'
                        }]
                    }, {
                        name: '3☆', id: 'level3',
                        children: [{
                            name: 'direction'
                        }]
                    }]
                }, {
                    name: 'philosophy', id: 'level2',
                    children: [{
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'The wisdom of life'
                        }]
                    }]
                }, {
                    name: 'technology', id: 'level2',
                    children: [{
                        name: '5☆', id: 'level3',
                        children: [{
                            name: 'Clean code'
                        }]
                    }, {
                        name: '4☆', id: 'level3',
                        children: [{
                            name: 'Three.js Development Guide'
                        }]
                    }]
                }]
            });

            for (var j = 0; j < data.length; ++j) {
                var level1 = data[j].children;
                for (var i = 0; i < level1.length; ++i) {
                    var block = level1[i].children;
                    var bookScore = [];
                    var bookScoreId;
                    for (var star = 0; star < block.length; ++star) {
                        var style = (function (name) {
                            switch (name) {
                                case '5☆':
                                    bookScoreId = 0;
                                    return itemStyle.star5;
                                case '4☆':
                                    bookScoreId = 1;
                                    return itemStyle.star4;
                                case '3☆':
                                    bookScoreId = 2;
                                    return itemStyle.star3;
                                case '2☆':
                                    bookScoreId = 3;
                                    return itemStyle.star2;
                            }
                        })(block[star].name);

                        block[star].label = {
                            color: style.color,
                            downplay: {
                                opacity: 0.5
                            }
                        };

                        if (block[star].children) {
                            style = {
                                opacity: 1,
                                color: style.color
                            };
                            block[star].children.forEach(function (book) {
                                book.value = 1;
                                book.itemStyle = style;

                                book.label = {
                                    color: style.color
                                };

                                var value = 1;
                                if (bookScoreId === 0 || bookScoreId === 3) {
                                    value = 5;
                                }

                                if (bookScore[bookScoreId]) {
                                    bookScore[bookScoreId].value += value;
                                }
                                else {
                                    bookScore[bookScoreId] = {
                                        color: colors[bookScoreId],
                                        value: value
                                    };
                                }
                            });
                        }
                    }

                    level1[i].itemStyle = {
                        color: data[j].itemStyle.color
                    };
                }
            }
            
            /*
            for (var j:int = 0; j < data.length; ++j) 
            {
                var level1:Array = data[j].children;
                for (var i:int = 0; i < level1.length; ++i) 
                {
                    var block:Array = level1[i].children;
                    var bookScore:Array = [];
                    var bookScoreId:int;
                    for (var star:int = 0; star < block.length; ++star) 
                    {
                        var style:Object = (function (name:String):String {
                            switch (name) {
                                case '5☆':
                                    bookScoreId = 0;
                                    return itemStyle.star5;
                                case '4☆':
                                    bookScoreId = 1;
                                    return itemStyle.star4;
                                case '3☆':
                                    bookScoreId = 2;
                                    return itemStyle.star3;
                                case '2☆':
                                    bookScoreId = 3;
                                    return itemStyle.star2;
                            }
                        })(block[star].name);

                        block[star].label = {
                            color: style.color,
                            downplay: {
                                opacity: 0.5
                            }
                        };

                        if (block[star].children) {
                            style = {
                                opacity: 1,
                                color: style.color
                            };
                            block[star].children.forEach(function (book:Object):void {
                                book.value = 1;
                                book.itemStyle = style;

                                book.label = {
                                    color: style.color
                                };

                                var value:int = 1;
                                if (bookScoreId === 0 || bookScoreId === 3) {
                                    value = 5;
                                }

                                if (bookScore[bookScoreId]) {
                                    bookScore[bookScoreId].value += value;
                                }
                                else {
                                    bookScore[bookScoreId] = {
                                        color: colors[bookScoreId],
                                        value: value
                                    };
                                }
                            });
                        }
                    }

                    level1[i].itemStyle = {
                        color: data[j].itemStyle.color
                    };
                }
            }
            */

            _options = {
                toolbox: {
                        show: true, right: 5, top: 5,
                        showTitle: true, 
                        feature: {
                            saveAsImage: {show: true, title: 'Save As Image'},
                            restore: {show: true, title: 'Restore'},
                            dataView: {show: true, readOnly: false, title: 'Data View'}
                        }
                    },                
                legend: {
                    orient:'vertical',
                    right: 5, top: 5
                },
                backgroundColor: bgColor,
                color: colors,
                series: [{
                    type: 'sunburst',
                    center: ['50%', '48%'],
                    data: data,
                    sort: function (a, b) {
                        if (a.depth === 1) {
                            return b.getValue() - a.getValue();
                        }
                        else {
                            return a.dataIndex - b.dataIndex;
                        }
                    },
                    label: { rotate: 'radial',  color: bgColor },
                    itemStyle: { borderColor: bgColor, borderWidth: 2 },
                    levels: [
                        {}, 
                        { r0: 0,  r: 40,  label: { rotate: 0 } }, 
                        { r0: 40, r: 105 }, 
                        { r0: 115,  r: 140,
                            itemStyle: { shadowBlur: 2, shadowColor: colors[2], color: 'transparent' },
                            label: { rotate: 'tangential', fontSize: 10, color: colors[0] }
                        }, 
                        { r0: 140,  r: 145,  
                            itemStyle: { shadowBlur: 80, shadowColor: colors[0] },
                            label: { position: 'outside', textShadowBlur: 5, textShadowColor: '#333'
                        },
                        downplay: {
                            label: { opacity: 0.5 }
                        }
                    }]
                }]
            };

            return _options;
        }

    }
}

    class itemVO
    {
        public var name:String;

        public var chindren:Array;

        public function itemVO(name:String, children:Array)
        {
            this.name=name;
            this.chindren=children;
        }
    }