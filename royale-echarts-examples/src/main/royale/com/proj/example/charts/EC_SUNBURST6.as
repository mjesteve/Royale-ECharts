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
                name: 'Imagi\nnary',
                itemStyle: {
                    normal: {
                        color: colors[1]
                    }
                },
                children: [{
                    name: 'Fiction',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Pain'
                        }, {
                            name: 'Mercy'
                        }, {
                            name: 'Tenant downstairs'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'The cross of nothingness'
                        }, {
                            name: 'Silent confession'
                        }, {
                            name: 'The end of childhood'
                        }]
                    }, {
                        name: '3☆',
                        children: [{
                            name: 'Diary of a Crazy Old Man'
                        }]
                    }]
                }, {
                    name: 'Other',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Nabokov´s short \nstories'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'Requiem'
                        }, {
                            name: 'Life Jigsaw Edition'
                        }]
                    }, {
                        name: '3☆',
                        children: [{
                            name: 'I need you more than\nI love you'
                        }]
                    }]
                }]
            }, {
                name: 'Non-\nfiction',
                itemStyle: {
                    color: colors[2]
                },
                children: [{
                    name: 'Design',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Interfaceless\ninteraction'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'Lighting and Rendering\nTechnology of Digital Drawing'
                        }, {
                            name: 'Japanese Architecture\nAnatomy Book'
                        }]
                    }, {
                        name: '3☆',
                        children: [{
                            name: 'Fantasy world art\n&RPG mapping lecture'
                        }]
                    }]
                }, {
                    name: 'Social Science',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Pain points'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'Effective managers'
                        }, {
                            name: 'Evolution'
                        }, {
                            name: 'The coming of the\npost-materialistic era'
                        }]
                    }, {
                        name: '3☆',
                        children: [{
                            name: 'Madness and civilization'
                        }]
                    }]
                }, {
                    name: 'Psycholo\ngical',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Neurotic personality of\nour time'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'Pygmalion effect'
                        }, {
                            name: 'Injured person'
                        }]
                    }, {
                        name: '3☆'
                    }, {
                        name: '2☆',
                        children: [{
                            name: 'Obsessed with'
                        }]
                    }]
                }, {
                    name: 'Home',
                    children: [{
                        name: '4☆',
                        children: [{
                            name: 'Make the house a home'
                        }, {
                            name: 'Live only the\nnecessary life'
                        }, {
                            name: 'Nordic minimalist style'
                        }]
                    }]
                }, {
                    name: 'Picture\nbook',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Design poem'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'If life fools you'
                        }, {
                            name: 'Naturalist´s Illustrated\nMysterious Animals'
                        }]
                    }, {
                        name: '3☆',
                        children: [{
                            name: 'Direction'
                        }]
                    }]
                }, {
                    name: 'Philosophy',
                    children: [{
                        name: '4☆',
                        children: [{
                            name: 'The wisdom of life'
                        }]
                    }]
                }, {
                    name: 'Techno\nlogy',
                    children: [{
                        name: '5☆',
                        children: [{
                            name: 'Clean code'
                        }]
                    }, {
                        name: '4☆',
                        children: [{
                            name: 'Three.js\nDevelopment Guide'
                        }]
                    }]
                }]
            });

            for (var j:int = 0; j < data.length; ++j) 
            {
                var level1:Object = data[j].children;
                
                for (var i:int = 0; i < level1.length; ++i) 
                {
                    var block:Object = level1[i].children;
                    var bookScore:Object = [];
                    var bookScoreId:Object;

                    for (var star:int = 0; star < block.length; ++star) 
                    {                        
                        var style:Object = (function (name:String):Object {
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
                            return itemStyle.start2;
                            
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

            _options = {
                toolbox: {
                    show: true, right: 5, top: 5,
                    showTitle: true, 
                    feature: {
                        saveAsImage: {show: true, title: 'Save As Image'},
                        restore: {show: true, title: 'Restore'}
                    }
                },
                backgroundColor: bgColor,
                color: colors,
                series: [{
                    type: 'sunburst',
                    center: ['50%', '48%'],
                    data: data,
                    sort: function (a:*, b:*):int {
                        if (a.depth === 1) {
                            return b.getValue() - a.getValue();
                        }
                        else {
                            return a.dataIndex - b.dataIndex;
                        }
                    },
                    nodeClick: 'rootToNode',
                    label: {
                        rotate: 'radial',
                        color: bgColor
                    },
                    itemStyle: {
                        borderColor: bgColor,
                        borderWidth: 2
                    },
                    levels: [{}, {
                        r0: 0,
                        r: 40,
                        label: {
                            rotate: 0
                        }
                    }, {
                        r0: 40,
                        r: 105
                    }, {
                        r0: 115,
                        r: 140,
                        itemStyle: {
                            shadowBlur: 2,
                            shadowColor: colors[2],
                            color: 'transparent'
                        },
                        label: {
                            rotate: 'tangential',
                            fontSize: 10,
                            color: colors[0]
                        }
                    }, {
                        r0: 140,
                        r: 145,
                        itemStyle: {
                            shadowBlur: 80,
                            shadowColor: colors[0]
                        },
                        label: {
                            position: 'outside',
                            textShadowBlur: 5,
                            textShadowColor: '#333'
                        },
                        downplay: {
                            label: {
                                opacity: 0.5
                            }
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