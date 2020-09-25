//var uploadedDataURL = "https://winpluscloud.com/WPNetSuitePlus/assets/data-1585799654003-46R-3f-c3.json";
var uploadedDataURL = "assets/charts/data-1585799654003-46R-3f-c3.json";
//Line gathering point
var geoGpsMap = {
    '1': [116.415, 39.915],
    '2': [116.448, 39.935],
    '3': [116.455, 39.915],
    '4': [116.435, 39.925],
    'Base Station 1': [116.415, 39.915],
    'Base Station 2': [116.448, 39.935],
    'Base Station 3': [116.455, 39.915],
    'Control Center': [116.435, 39.925]
};
var l1 = {
     "Master Bedroom": [116.409, 39.928]
};
var l2 = {
     "Study Room Control": [116.428, 39.939]
};
var l3 = {
     "Toilet Control": [116.448, 39.939]
};
var l4 = {
     "Living Room Control": [116.426, 39.918]
};
var l5 = {
     "Second Bedroom Control": [116.448, 39.920]
};
var l6 = {
     "Stair Control": [116.443, 39.911]
};
var l7 = {
     "Kitchen Control": [116.448, 39.905]
};
var zhuwo = {
     "Master Bedroom Control": [116.409, 39.928]
};


//geoCoordMap adds all possible sensors to the array
var geoCoordMap = {
    "Living Room 1": [116.41, 39.9036],
    "Living Room 2": [116.43, 39.918],
    'Master Bedroom 1': [116.409, 39.921],
    "Master Bedroom 2": [116.409, 39.935],
    'Study Room': [116.432, 39.939],
    "Toilet": [116.4516, 39.939],
    "Living Room 3": [116.4516, 39.9306],
    'Second Bedroom': [116.4516, 39.920],
    "Stairs": [116.447, 39.911],
    "Kitchen": [116.4516, 39.905]
};
var geoCoordMap001 = {
    "Living Room 1": [116.41, 39.9036],
    "Living Room 2": [116.43, 39.918],
    'Master Bedroom 1': [116.409, 39.921],
    "Master Bedroom 2": [116.409, 39.935]
};
var geoCoordMap002 = {
    'Study Room': [116.432, 39.939],
    "Toilet": [116.4516, 39.939],
    "Living Room 3": [116.4516, 39.9306]
};
var geoCoordMap003 = {
    'Second Bedroom': [116.4516, 39.920],
    "Stairs": [116.447, 39.911],
    "Kitchen": [116.4516, 39.905]
};
var geoCoordMap004 = {
    'Base Station 1': [116.415, 39.915],
    'Base Station 2': [116.448, 39.935],
    'Base Station 3': [116.455, 39.915]
};
//temperature
var d1 = {
    "Living Room 1": 20,
    "Living Room 2": 25,
    'Master Bedroom 1': 17,
    "Master Bedroom 2": 19,
    "Study Room": 13,
    "Toilet": 22,
    "Living Room 3": 11,
    "Second Bedroom": 9,
    "Stairs": 29,
    "Kitchen": 38,
    "Base Station 1": 40,
    "Base Station 2": 45,
    "Base Station 3": 37
};

//humidity
var d2 = {
    "Living Room 1": 40,
    "Living Room 2": 45,
    'Master Bedroom 1': 37,
    "Master Bedroom 2": 39,
    'Study Room': 23,
    "Toilet": 80,
    "Living Room 3": 56,
    'Second Bedroom': 39,
    "Stairs": 29,
    "Kitchen": 68
};
//vibration
var d3 = {
     //"Living Room 1": 4,
     "Living Room 2": 5,
     //'Master Bedroom 1': 3,
     "Master Bedroom 2": 3,
     'Study Room': 2,
     "Toilet": 0,
     "Living Room 3": 0,
     'Second Bedroom': 3,
     "Stairs": 2,
     "Kitchen": 0
};
//smoke
var d4 = {
     "Living Room 1": 40,
     "Living Room 2": 45,
     'Master Bedroom 1': 37,
     "Master Bedroom 2": 39,
     'Study Room': 53,
     "Toilet": 60,
     "Living Room 3": 56,
     'Second Bedroom': 39,
     "Stairs": 29,
     "Kitchen": 68
};
//Light
var d5 = {
     "Living Room 1": 40,
     "Living Room 2": 45,
     'Master Bedroom 1': 37,
     "Master Bedroom 2": 39,
     'Study Room': 23,
     "Toilet": 80,
     "Living Room 3": 56,
     'Second Bedroom': 39,
     "Stairs": 29,
     "Kitchen": 68
};
var database = [{
         name: "Base Station 1",
         value: 0
     },
     {
         name: "Base Station 2",
         value: 0
     },
     {
         name: "Base Station 3",
         value: 0
     },
     {
         name: "Control Center",
         value: 0
     }
];
var da1 = [{
     name: "Master Bedroom",
     value: 0
}];
var da2 = [{
     name: "Study Room Control",
     value: 0
}];
var da3 = [{
     name: "Toilet Control",
     value: 0
}];
var da4 = [{
     name: "Living Room Control",
     value: 0
}];
var da5 = [{
     name: "Second Bedroom Control",
     value: 0
}];
var da6 = [{
     name: "Stair Control",
     value: 0
}];
var da7 = [{
     name: "Kitchen Control",
     value: 0
}];

var colors = [
    ["#1DE9B6", "#F46E36", "#04B9FF", "#5DBD32", "#FFC809", "#FB95D5", "#BDA29A", "#6E7074", "#546570", "#C4CCD3"],
    ["#37A2DA", "#67E0E3", "#32C5E9", "#9FE6B8", "#FFDB5C", "#FF9F7F", "#FB7293", "#E062AE", "#E690D1", "#E7BCF3", "#9D96F5", "#8378EA", "#8378EA"],
    ["#DD6B66", "#759AA0", "#E69D87", "#8DC1A9", "#EA7E53", "#EEDD78", "#73A373", "#73B9BC", "#7289AB", "#91CA8C", "#F49F42"],
];
var colorIndex = 0;
$(function() {
    var year = ["Temperature (℃)", "Humidity (%)", "Vibration (g)", "Smoke (100 ppm)", "Light (100 lx)"];
    var year1 = ["Air conditioning thermostat", "Humidifier/window coordination", "Door lock lock", "Emergency fire fighting", "Lighting system"];

    var mapData = [
        [],
        [],
        [],
        [],
        []
    ];

     /*Column Y name*/
    var categoryData = [];
    var fei = [];
    var rong = [];
    var barData = [];
    var lineData1=[
        [10,12,13,12,14,14,16,17,18,20,22,26,27,26,23,20,18,18,16,16,14,13,12,10],
        [68,67,66,63,61,55,53,48,46,44,42,42,36,34,36,37,38,42,46,44,58,62,66,68],
        [1,1,1,1,1,1,1,2,3,2,1,1,1,1,1,1,3,3,1,3,3,1,1,1],
        [56,59,60,62,56,50,40,42,38,38,39,38,40,42,38,37,34,35,38,44,46,50,54,56],
        [1,1,2,1,5,10,20,24,30,32,32,34,38,40,40,38,32,25,32,32,5,1,1,1]
    ];
    var lineData2=[
        [11,12,14,12,15,13,16,16,16,21,22,24,22,24,23,21,19,18,15,14,15,13,12,11],
        [62,64,66,65,62,58,54,49,45,44,41,40,32,36,36,39,38,40,46,48,52,60,63,61],
        [1,1,1,2,1,1,1,2,1,2,1,1,3,1,1,1,3,2,1,1,3,1,2,1],
        [58,59,62,62,54,50,44,42,34,33,35,38,40,44,38,35,32,35,33,40,46,53,56,54],
        [1,1,1,1,6,12,20,22,30,33,32,35,38,42,40,37,34,28,32,33,10,1,1,1]
    ];
   
    var tian = [
        [],
        [],
        [],
        [],
        []
    ];

    var line1 = [];
    var line2 = [];
    var line3 = [];
    var line4 = [];
    var key;
    for (key in geoCoordMap001) {
        line1.push({
            "year":'Temperature',
            "name": key,
            "value": d1[key]
        });

    }
    for (key in geoCoordMap002) {
        line2.push({
            "year":'Temperature',
            "name": key,
            "value": d1[key]
        });

    }
    for (key in geoCoordMap003) {
        line3.push({
            "year":'Temperature',
            "name": key,
            "value": d1[key]
        });

    }
    for (key in geoCoordMap004) {
        line4.push({
            "year":'Temperature',
            "name": key,
            "value": d1[key]
        });

    }

    for (key in geoCoordMap) {
        mapData[0].push({
            "year":'Temperature',
            "name": key,
            "value": d1[key],
        });
        mapData[1].push({
            "year":'Humidity',
            "name": key,
            "value": d2[key],
        });
        mapData[2].push({
            "year":'Vibration',
            "name": key,
            "value": d3[key],
        });
        mapData[3].push({
            "year":'Smoke',
            "name": key,
            "value": d4[key],
        });
        mapData[4].push({
            "year":'Light',
            "name": key,
            "value": d5[key],
        });
     
    }
    var jian = [];
    var count = [];
    var datamax = [];
    var datamin = [];
    //VisualMap's max normal value setting
    var zhu = [45, 80, 10, 80, 50,];
    //VisualMap's min normal value setting
    var li = [-5, 15, 0, 20, 0,];
    //var count2=[];
    var count3 = [];
    for (var i = 0; i < mapData.length; i++) {
        mapData[i].sort(function sortNumber(a, b) {
            return a.value - b.value;
        });
        barData.push([]);
        categoryData.push([]);
        fei.push([]);
        rong.push([]);
        tian.push([]);
        jian[i] = 0;
        count[i] = 0;
        count3[i] = 0;
        datamax[i] = 0;
        datamin[i] = 1000;
        for (var j = 0; j < mapData[i].length; j++) {

            if (mapData[i][j].name =='Master Bedroom 1') {
                tian[i][0] = mapData[i][j].value;

            } else if (mapData[i][j].name =='Master Bedroom 2') {
                tian[i][1] = mapData[i][j].value;

            } else if (mapData[i][j].name =='Study Room') {
                tian[i][2] = mapData[i][j].value;

            } else if (mapData[i][j].name =='toilet') {
                tian[i][3] = mapData[i][j].value;

            } else if (mapData[i][j].name =='living Room 1') {
                tian[i][4] = mapData[i][j].value;

            } else if (mapData[i][j].name =='living Room 2') {
                tian[i][5] = mapData[i][j].value;

            } else if (mapData[i][j].name =='living Room 3') {
                tian[i][6] = mapData[i][j].value;

            } else if (mapData[i][j].name =='second Bedroom') {
                tian[i][7] = mapData[i][j].value;

            } else if (mapData[i][j].name =='stairs') {
                tian[i][8] = mapData[i][j].value;

            } else if (mapData[i][j].name =='kitchen') {
                tian[i][9] = mapData[i][j].value;

            }

            if (mapData[i][j].value >= -100) {
                jian[i] += mapData[i][j].value;
                count[i]++; //Average count
            } else {
                fei[i].push(mapData[i][j].name)
            }

            if (mapData[i][j].value >= datamax[i]) {
                datamax[i] = mapData[i][j].value;

            }
            if (mapData[i][j].value <= datamin[i]) {
                datamin[i] = mapData[i][j].value;

            }
            //count2[i]=mapData[i].length-count[i];
            if (mapData[i][j].value < li[i] || mapData[i][j].value > zhu[i]) {
                count3[i]++;
                rong[i].push(mapData[i][j].name);

            }
            barData[i].push(mapData[i][j].value);
            categoryData[i].push(mapData[i][j].name);

        }
    }

    $.getJSON(uploadedDataURL, function(geoJson) {

        echarts.registerMap('home', geoJson);
        
        var convertData = function(data) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var geoCoord = geoCoordMap[data[i].name];
                if (geoCoord) {
                    res.push({
                        name: data[i].name,
                        value: geoCoord.concat(data[i].value)
                    });
                }
            }
            return res;
        };
        var convertData1 = function(database) {
            var res = [];
            for (var i = 0; i < database.length; i++) {
                var geoCoord1 = geoGpsMap[database[i].name];
                if (geoCoord1) {
                    res.push({
                        name: database[i].name,
                        value: geoCoord1.concat(database[i].value)
                    });
                }
            }
            return res;
        };

        var convertedData1 = [
            convertData1(database),
            convertData1(database.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Master Bedroom Control switch legend
        var c1 = function(da1) {
            var res = [];
            for (var i = 0; i < da1.length; i++) {
                var g1 = l1[da1[i].name];
                if (g1) {
                    res.push({
                        name: da1[i].name,
                        value: g1.concat(da1[i].value)
                    });
                }
            }
            return res;
        };

        var cc1 = [
            c1(da1),
            c1(da1.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Study Room Control switch legend
        var c2 = function(da2) {
            var res = [];
            for (var i = 0; i < da2.length; i++) {
                var g2 = l2[da2[i].name];
                if (g2) {
                    res.push({
                        name: da2[i].name,
                        value: g2.concat(da2[i].value)
                    });
                }
            }
            return res;
        };

        var cc2 = [
            c2(da2),
            c2(da2.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];

        //Toilet Control switch legend
        var c3 = function(da3) {
            var res = [];
            for (var i = 0; i < da3.length; i++) {
                var g3 = l3[da3[i].name];
                if (g3) {
                    res.push({
                        name: da3[i].name,
                        value: g3.concat(da3[i].value)
                    });
                }
            }
            return res;
        };

        var cc3 = [
            c3(da3),
            c3(da3.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Living Room Control switch legend
        var c4 = function(da4) {
            var res = [];
            for (var i = 0; i < da4.length; i++) {
                var g4 = l4[da4[i].name];
                if (g4) {
                    res.push({
                        name: da4[i].name,
                        value: g4.concat(da4[i].value)
                    });
                }
            }
            return res;
        };

        var cc4 = [
            c4(da4),
            c4(da4.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Secondary Control switch legend
        var c5 = function(da5) {
            var res = [];
            for (var i = 0; i < da5.length; i++) {
                var g5 = l5[da5[i].name];
                if (g5) {
                    res.push({
                        name: da5[i].name,
                        value: g5.concat(da5[i].value)
                    });
                }
            }
            return res;
        };

        var cc5 = [
            c5(da5),
            c5(da5.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Stair Control switch legend
        var c6 = function(da6) {
            var res = [];
            for (var i = 0; i < da6.length; i++) {
                var g6 = l6[da6[i].name];
                if (g6) {
                    res.push({
                        name: da6[i].name,
                        value: g6.concat(da6[i].value)
                    });
                }
            }
            return res;
        };

        var cc6 = [
            c6(da6),
            c6(da6.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];
        //Kitchen Control switch legend
        var c7 = function(da7) {
            var res = [];
            for (var i = 0; i < da7.length; i++) {
                var g7 = l7[da7[i].name];
                if (g7) {
                    res.push({
                        name: da7[i].name,
                        value: g7.concat(da7[i].value)
                    });
                }
            }
            return res;
        };

        var cc7 = [
            c7(da7),
            c7(da7.sort(function(a, b) {
                return b.value - a.value;
            }).slice(0, 6))
        ];

        //         //Random program
        var convertToLineData = function(data, gps) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var dataItem = data[i];
                var fromCoord = geoCoordMap[dataItem.name];
                debugger;
                var toCoord = gps; //Zhengzhou
                // var toCoord = geoGps[Math.random()*3]; 
                if (fromCoord && toCoord) {
                    res.push([{
                        coord: fromCoord,
                        value: dataItem.value
                    }, {
                        coord: toCoord,
                    }]);
                }
            }
            return res;
        };

        var convertToLineData001 = function(data, gps) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var dataItem = data[i];
                var fromCoord = geoCoordMap004[dataItem.name];
                debugger;
                var toCoord = gps; //Zhengzhou
                // var toCoord = geoGps[Math.random()*3]; 
                if (fromCoord && toCoord) {
                    res.push([{
                        coord: fromCoord,
                        value: dataItem.value
                    }, {
                        coord: toCoord,
                    }]);
                }
            }
            return res;
        };

        optionXyMap01 = {
            //Bottom scroll bar
            timeline: {
                data: year,
                axisType: 'category',
                autoPlay: true,
                playInterval: 3000,
                left: '10%',
                right: '10%',
                bottom: '2%',
                width: '80%',
                label: {
                    normal: {
                        textStyle: {
                            color: '#ddd'
                        }
                    },
                    emphasis: {
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                symbolSize: 10,
                lineStyle: {
                    color: '#555'
                },
                checkpointStyle: {
                    borderColor: '#87CEEB',
                    borderWidth: 2
                },
                controlStyle: {
                    showNextBtn: true,
                    showPrevBtn: true,
                    normal: {
                        color: '#666',
                        borderColor: '#666'
                    },
                    emphasis: {
                        color: '#aaa',
                        borderColor: '#aaa'
                    }
                }
            },
            baseOption: {
                animation: true,
                animationDuration: 1000,
                animationEasing: 'cubicInOut',
                animationDurationUpdate: 1000,
                animationEasingUpdate: 'cubicInOut',
                //Histogram style
                 grid: [{
                     left: '67%',
                     top: '34.5%',
                     bottom: '44.5%',
                     width: '20%'
                 }, {
                     gridindex: 1,
                     left: '65%',
                     right: '3.5%',
                     top: '65%',
                     bottom: '10%',
                     containLabel: true
                 }],
                 tooltip: {
                     trigger:'axis', // hover trigger
                     axisPointer: {// coordinate axis indicator, coordinate axis trigger is valid
                         type:'shadow', // The default is a straight line, optional:'line' |'shadow'
                         shadowStyle: {
                             color:'#aaa' //hover color
                         }
                     }
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {
                            show: true
                        },
                        dataView: {
                            show: true,
                            readOnly: false
                        },
                        magicType: {
                            show: true,
                            type: ['bar', 'line']
                        },
                        restore: {
                            show: true
                        },
                        saveAsImage: {
                            show: true
                        }
                    }
                },
                legend: [{
                    data: ['Historical Average Data 1','Historical Average Data 2'],
                        orient:'horizontal', width: '400px',
                        right: '2.5%',
                        y: '60%',
                        textStyle: {
                            color:'#fffccc'
                        }
                    },
                    {
                        data: ['Base Station','Sensor','Transmission Route'],
                        top: '10%',
                        left: '35%',
                        textStyle: {
                            color:'#fff'
                        }
                    },
					{
                        icon:'roundRect',
                        orient:'horizontal',
                        bottom: '13%',
                        left: '5%',
                        data: [{
                                name:'Master Bedroom',
                            },
                            {
                                name:'Study Room Control',
                            },
                            {
                                name:'Toilet Control',
                            },
                            {
                                name:'Living Room Control',
                            }                            
                        ],
                        selected: {
                            'Master Bedroom': false,
                            'Study Room Control': false,                            
                            'Toilet Control': false,
                            'Living Room Control': false
                        },
                        textStyle: {
                            color:'#fff'
                        }
                    },
                    {
                        icon:'roundRect',
                        orient:'horizontal',
                        bottom: '10%',
                        left: '5%',
                        data: [{
                                name:'Second Bedroom Control',
                            },
                            {
                                name:'Stair Control',
                            },
                            {
                                name:'Kitchen Control',
                            }
                        ],
                        selected: {
                            'Second Bedroom Control': false,
                            'Stair Control': false,
                            'Kitchen Control': false
                        },
                        textStyle: {
                            color:'#fff'
                        }
                    },

                ],

                //Map style
                geo: {
                    show: true,
                    map: 'home',
                    roam: true,
                    zoom: 0.8,
                    center: [116.453, 39.920],
                    label: {
                        emphasis: {
                            show: true //false
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderColor: 'rgba(147, 235, 248, 1)',
                            borderWidth: 1,
                            areaColor: {
                                type: 'radial',
                                x: 0.5,
                                y: 0.5,
                                r: 0.8,
                                colorStops: [{
                                    offset: 0,
                                    color:'rgba(147, 235, 248, 0)' // color at 0%
                                 }, {
                                     offset: 1,
                                     color:'rgba(147, 235, 248, .2)' // color at 100%
                                }],
                                globalCoord: false // 缺省为 false
                            },
                            shadowColor: 'rgba(128, 217, 248, 1)',
                            // shadowColor: 'rgba(255, 255, 255, 1)',
                            shadowOffsetX: -2,
                            shadowOffsetY: 2,
                            shadowBlur: 10
                        },
                        emphasis: {
                            areaColor: '#389BB7',
                            borderWidth: 0
                        }
                    }
                },
            },

            options: []

        };


        for (var n = 0; n < year.length; n++) {

            optionXyMap01.options.push({//Background color
                backgroundColor:'#013954',

                //title
                title: [{
                        text:'Sensor layout plan',
                        left: '16%',
                        top: '5%',
                        textStyle: {
                            color:'#fff',
                            fontSize: 24
                        }
                    },
                    {
                        id:'statistic',
                        text: year[n] + " Data Statistics",
                        left: '60%',
                        top: '5%',
                        textStyle: {
                            color:'#fff',
                            fontSize: 24
                        }
                    },
                    {
                        text: "Average : " + (jian[n] / count[n]).toFixed(4),
                        left: '60%',
                        top: '14.5%',
                        textStyle: {
                            color:'#90ee90',
                            fontSize: 14
                        }
                    },
                    {

                        text: "Maximum : " + datamax[n],
                        left: '74%',
                        top: '14.5%',
                        textStyle: {
                            color:'#FF4500',
                            fontSize: 14
                        }
                    },
                    {

                        text: "Minimum value : " + datamin[n],
                        left: '85%',
                        top: '14.5%',
                        textStyle: {
                            color:'#87CEFF',
                            fontSize: 14
                        }
                    },
                    {

                        text: "Unused sensor : " + (mapData[n].length-count[n]), //+'\n'+fei[n],
                        left: '60%',
                        top: '17.5%',
                        textStyle: {
                            color:'#FF7F00',
                            fontSize: 14
                        },

                        extraCssText:'width:120px; white-space:pre-wrap' //Extra style makes\n effective
                    },
                    {

                        text: "Data Abnormal Sensor : " + (count3[n]),
                        left: '74%',
                        top: '17.5%',
                        textStyle: {
                            color:'#9370DB',
                            fontSize: 14
                        },

                        extraCssText:'width:120px; white-space:pre-wrap' //Extra style makes\n effective
                    },
                    {

                        text: "(Normal range of data : " + li[n] + "~" + zhu[n] + ")",
                        left: '60%',
                        top: '20.5%',
                        textStyle: {
                            color:'#FFA54F',
                            fontSize: 14
                        },

                        extraCssText:'width:120px; white-space:pre-wrap' //Extra style makes\n effective
                    },
                    {

                        text: "Unused sensor : "+"\n     " + (fei[n]),
                        left: '60%',
                        top: '23.5%',
                        textStyle: {
                            color:'#FF7F00',
                            fontSize: 14, lineHeight: 20
                        },

                        extraCssText:'width:120px; white-space:pre-wrap' //Extra style makes\n effective
                    }, {
                        text: "Data Abnormal Sensor : " + (rong[n]),
                        left: '60%',
                        top: '29%',
                        textStyle: {
                            color:'#9370DB',
                            fontSize: 14
                        },

                        extraCssText:'width:120px; white-space:pre-wrap' //Extra style makes\n effective
                    }


                ],
                visualMap: {
                    min: li[n],
                    max: zhu[n],
                    calculable: true,
                    text: ['High', 'Low'],
                    inRange: {
                        color: ['#50a3ba', '#eac736', '#d94e5d']

                    },
                    padding: 5,
                    right: "2%",
                    bottom: "40%",
                    textStyle: {
                        color: '#fff'
                    }
                },
                //             brush: {
                //     outOfBrush: {
                //         color: '#abc'
                //     },
                //     brushStyle: {
                //         borderWidth: 2,
                //         color: 'rgba(0,0,0,0.2)',
                //         borderColor: 'rgba(0,0,0,0.5)',
                //     },
                //     seriesIndex: [0, 1],
                //     throttleType: 'debounce',
                //     throttleDelay: 300,
                //     geoIndex: 0
                // },
                xAxis: [{
                        type: 'value',
                        scale: true,
                        position: 'top',
                        min: 0,
                        boundaryGap: false,
                        splitLine: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            margin: 2,
                            textStyle: {
                                color: '#fff'
                            }
                        },
                    },
                    {
                        gridIndex: 1,
                        type: 'category',
                        boundaryGap: false,
                        axisLabel: {
                            margin: 2,
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        data: ['0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9 Hour', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19 Hours', '20:00', '21:00', '22:00', '23:00']

                    }
                ],
                yAxis: [{
                    type: 'category',
                    //  name: 'TOP 20',
                    nameGap: 16,
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: '#ddd'
                        }
                    },
                    axisTick: {
                        show: false,
                        lineStyle: {
                            color: '#ddd'
                        }
                    },
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: '#ddd'
                        }
                    },
                    data: categoryData[n]
                }, {
                    gridIndex: 1,
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} ',
                        textStyle: {
                            color: '#ddd'
                        }
                    }
                }],

                series: [
                    //map
                     {
                         type:'map',
                         map:'home',
                         geoIndex: 0,
                         aspectScale: 0.75, //Aspect ratio
                         showLegendSymbol: true, // display when legend exists
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    color: '#fff'
                                }
                            }
                        },
                        roam: true,
                        itemStyle: {
                            normal: {
                                areaColor: '#031525',
                                borderColor: '#FFFFFF',
                            },
                            emphasis: {
                                areaColor: '#2B91B7'
                            }
                        },
                        animation: false,
                        data: mapData
                    },
                    //Flashing point on the map
                     {
                         name:'Sensor',
                         type:'effectScatter',
                         coordinateSystem:'geo',
                         data: convertData(mapData[n].sort(function(a, b) {
                             return b.value-a.value;
                         }).slice(0, 20)), //Size difference display
                        symbolSize: function(val) {
                            return (val[2] * 40 + 1200) / 180;
                        },
                        showEffectOn: 'render',
                        rippleEffect: {
                            brushType: 'stroke'
                        },
                        hoverAnimation: true,
                        label: {
                            normal: {
                                formatter: '{b}',
                                position: 'right',
                                show: true
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                shadowBlur: 10,
                                shadowColor: colors[colorIndex][n]
                            },
                        },
                        zlevel: 1
                    },
                    {
                        //Base station point display
                        name:'Base Station',
                        type: 'effectScatter',
                        coordinateSystem: 'geo',
                        data: convertData1(database.sort(function(a, b) {
                            return b.value - a.value;
                        }).slice(0, 20)),
                        symbol: 'arrow',
                        symbolSize: 10,
                        showEffectOn: 'render',
                        rippleEffect: {
                            brushType: 'stroke'
                        },
                        hoverAnimation: true,
                        label: {
                            normal: {
                                formatter: '{b}',
                                position: 'right',
                                show: true
                            }
                        },

                        itemStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                shadowBlur: 10,
                                shadowColor: '#2f4554'
                            },
                            emphasis: {
                                color: '#fff',
                                shadowBlur: 10,
                                shadowColor: '#cfff'
                            }
                        },
                        zlevel: 1
                    },
                    {
                        name:'Master Bedroom',
                         type:'effectScatter',
                         coordinateSystem:'geo',
                         data: c1(da1.sort(function(a, b) {
                             return b.value-a.value;
                         }).slice(0, 20)),
                         symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn: 'render',
                        // rippleEffect: {
                        //     brushType: 'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter: '{b}' + year1[n] + ':open',
                                position: 'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter: '{b}' + year[n] + '：' + tian[n][0],
                                position: 'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color: '#2f4554',
                                shadowBlur: 10,
                                shadowColor: '#2f4554'
                            },
                            emphasis: {
                                color: '#c23531',
                                shadowBlur: 10,
                                shadowColor: '#c23531'
                            },

                        },
                        zlevel: 1
                    },{
                        name:'Study Room Control',
                        type:'effectScatter',
                        coordinateSystem:'geo',
                        data: c2(da2.sort(function(a, b) {
                            return b.value-a.value;
                        }).slice(0, 20)),
                        symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn:'render',
                        // rippleEffect: {
                        // brushType:'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter:'{b}' + year1[n] +':open',
                                position:'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter:'{b}' + year[n] +':' + tian[n][2],
                                position:'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color:'#2f4554',
                                shadowBlur: 10,
                                shadowColor:'#2f4554'
                            },
                            emphasis: {
                                color:'#c23531',
                                shadowBlur: 10,
                                shadowColor:'#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    {

                        name:'Toilet Control',
                        type:'effectScatter',
                        coordinateSystem:'geo',
                        data: c3(da3.sort(function(a, b) {
                            return b.value-a.value;
                        }).slice(0, 20)),
                        symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn:'render',
                        // rippleEffect: {
                        // brushType:'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter:'{b}' + year1[n] +': On',
                                position:'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter: '{b}' + year[n] + '：' + tian[n][0],
                                position: 'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color: '#2f4554',
                                shadowBlur: 10,
                                shadowColor: '#2f4554'
                            },
                            emphasis: {
                                color: '#c23531',
                                shadowBlur: 10,
                                shadowColor: '#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    {
                        name:'Living Room Control',
                        type:'effectScatter',
                        coordinateSystem:'geo',
                        data: c4(da4.sort(function(a, b) {
                            return b.value-a.value;
                        }).slice(0, 20)),
                        symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn:'render',
                        // rippleEffect: {
                        // brushType:'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter:'{b}' + year1[n] +': On',
                                position:'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter:'{b}' + year[n] +':' + tian[n][0],
                                position:'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color:'#2f4554',
                                shadowBlur: 10,
                                shadowColor:'#2f4554'
                            },
                            emphasis: {
                                color:'#c23531',
                                shadowBlur: 10,
                                shadowColor:'#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    {

                        name:'Second Bedroom Control',
                        type:'effectScatter',
                        coordinateSystem:'geo',
                        data: c5(da5.sort(function(a, b) {
                            return b.value-a.value;
                        }).slice(0, 20)),
                        symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn:'render',
                        // rippleEffect: {
                        // brushType:'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter:'{b}' + year1[n] +': On',
                                position: 'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter: '{b}' + year[n] + '：' + tian[n][0],
                                position: 'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color: '#2f4554',
                                shadowBlur: 10,
                                shadowColor: '#2f4554'
                            },
                            emphasis: {
                                color: '#c23531',
                                shadowBlur: 10,
                                shadowColor: '#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    {
                        name:'Stair Control',
                        type:'effectScatter',
                        coordinateSystem:'geo',
                        data: c6(da6.sort(function(a, b) {
                            return b.value-a.value;
                        }).slice(0, 20)),
                        symbol:'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn:'render',
                        // rippleEffect: {
                        // brushType:'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter:'{b}' + year1[n] +': On',
                                position:'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter:'{b}' + year[n] +':' + tian[n][0],
                                position:'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color:'#2f4554',
                                shadowBlur: 10,
                                shadowColor:'#2f4554'
                            },
                            emphasis: {
                                color:'#c23531',
                                shadowBlur: 10,
                                shadowColor:'#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    {

                        name:'Kitchen Control',
                        type: 'effectScatter',
                        coordinateSystem: 'geo',
                        data: c7(da7.sort(function(a, b) {
                            return b.value - a.value;
                        }).slice(0, 20)),
                        symbol: 'roundRect', //bubble
                        symbolSize: 10,
                        // showEffectOn: 'render',
                        // rippleEffect: {
                        //     brushType: 'stroke'
                        // },
                        // hoverAnimation: true,
                        label: {
                            normal: {
                                formatter: '{b}' + year1[n] + '：On',
                                position: 'bottom',
                                show: true
                            },
                            emphasis: {
                                formatter: '{b}' + year[n] + '：' + tian[n][0],
                                position: 'bottom',
                                show: true
                            },
                        },

                        itemStyle: {
                            normal: {
                                color: '#2f4554',
                                shadowBlur: 10,
                                shadowColor: '#2f4554'
                            },
                            emphasis: {
                                color: '#c23531',
                                shadowBlur: 10,
                                shadowColor: '#c23531'
                            },

                        },
                        zlevel: 1
                    },
                    //Line gathering point
                    {name:'Transmission Route',
                        type:'lines',
                        zlevel: 2,
                        effect: {
                            show: true,
                            period: 4, //The arrow points to the speed, the smaller the value, the faster the speed
                            trailLength: 0.02, //The greater the value of the special effect trail length [0,1], the longer and heavier the trail
                            symbol:'arrow', //arrow icon
                            symbolSize: 3, //Icon size
                        },
                        lineStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                width: 0.1, //Wake line width
                                opacity: 0.5, //Transparency of trail lines
                                curveness: .3 //The straightness of the trail line
                            }
                        },
                        //Call the gathering point randomly
                        data: convertToLineData(line1, geoGpsMap[Math.ceil(1)])
                    },
                    {name:'Transmission Route',
                        type:'lines',
                        zlevel: 2,
                        effect: {
                            show: true,
                            period: 4, //The arrow points to the speed, the smaller the value, the faster the speed
                            trailLength: 0.02, //The greater the value of the special effect trail length [0,1], the longer and heavier the trail
                            symbol:'arrow', //arrow icon
                            symbolSize: 3, //Icon size
                        },
                        lineStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                width: 0.1, //Wake line width
                                opacity: 0.5, //Transparency of trail lines
                                curveness: .3 //The straightness of the trail line
                            }
                        },
                        //Call the gathering point randomly
                        data: convertToLineData(line2, geoGpsMap[Math.ceil(2)])
                    },
                    {name:'Transmission Route',
                        type:'lines',
                        zlevel: 2,
                        effect: {
                            show: true,
                            period: 4, //The arrow points to the speed, the smaller the value, the faster the speed
                            trailLength: 0.02, //The greater the value of the special effect trail length [0,1], the longer and heavier the trail
                            symbol:'arrow', //arrow icon
                            symbolSize: 3, //Icon size
                        },
                        lineStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                width: 0.1, //Wake line width
                                opacity: 0.5, //Transparency of trail lines
                                curveness: .3 //The straightness of the trail line
                            }
                        },
                        //Call the gathering point randomly
                        data: convertToLineData(line3, geoGpsMap[Math.ceil(3)])
                    },
                    {name:'Transmission Route',
                        type:'lines',
                        zlevel: 2,
                        effect: {
                            show: true,
                            period: 4, //The arrow points to the speed, the smaller the value, the faster the speed
                            trailLength: 0.02, //The greater the value of the special effect trail length [0,1], the longer and heavier the trail
                            symbol:'arrow', //arrow icon
                            symbolSize: 3, //Icon size
                        },
                        lineStyle: {
                            normal: {
                                color: colors[colorIndex][n],
                                width: 0.1, //Wake line width
                                opacity: 0.5, //Transparency of trail lines
                                curveness: .3 //The straightness of the trail line
                            }
                        },
                        //Call the gathering point randomly
                        data: convertToLineData001(line4, geoGpsMap[Math.ceil(4)])
                    },
                    //Histogram
                    {
                        zlevel: 1.5,
                        type:'bar',
                        symbol:'none',
                        itemStyle: {
                            normal: {
                                color: colors[colorIndex][n]
                            }
                        },
                        data: barData[n]
                    },
                    {

                        xAxisIndex: 1,
                        yAxisIndex: 1,
                        name:'Historical Average Data 1',

                        type:'line',
                        lineStyle: {
                            normal: {
                                color:'#4ea397'
                            }
                        },
                        data: lineData1[n],
                        markPoint: {
                            data: [{
                                    type:'max',
                                    name:'Maximum value',
                                    symbolSize: 40
                                },
                                {
                                    type:'min',
                                    name:'Minimum value',
                                    symbolSize: 20
                                }
                            ],
                            itemStyle: {
                                normal: {
                                    color:'#d0648a'
                                }
                            }
                        },
                        markLine: {
                            data: [{
                                type:'average',
                                name:'Average value'
                            }]
                        }
                    },
                    {
                        xAxisIndex: 1,
                        yAxisIndex: 1,
                        name:'Historical Average Data 2',

                        type:'line',
                        lineStyle: {
                            normal: {
                                color:'#4ea397'
                            }
                        },
                        data: lineData2[n],
                        markPoint: {
                            data: [{
                                    type:'max',
                                    name:'Maximum value',
                                    symbolSize: 40
                                },
                                {
                                    type:'min',
                                    name:'Minimum value',
                                    symbolSize: 20
                                }
                            ],
                            itemStyle: {
                                normal: {
                                    color:'#d0648a'
                                }
                            }
                        },
                        markLine: {
                            data: [{
                                type:'average',
                                name:'Average value'
                            }]
                        }
                    },


                ]
            })
        }
        myChart.setOption(optionXyMap01);
    });
});