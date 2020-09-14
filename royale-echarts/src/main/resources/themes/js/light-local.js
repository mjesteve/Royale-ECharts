(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['exports', 'echarts'], factory);
    } else if (typeof exports === 'object' && typeof exports.nodeName !== 'string') {
        // CommonJS
        factory(exports, require('echarts'));
    } else {
        // Browser globals
        factory({}, root.echarts);
    }
}(this, function (exports, echarts) {
    var log = function (msg) {
        if (typeof console !== 'undefined') {
            console && console.error && console.error(msg);
        }
    };
    if (!echarts) {
        log('ECharts is not Loaded');
        return;
    }
    echarts.registerTheme('light-local', {
        "color": [
            '#37A2DA', '#32C5E9', '#67E0E3', '#9FE6B8', '#FFDB5C', '#ff9f7f',
            '#fb7293', '#E062AE', '#E690D1', '#e7bcf3', '#9d96f5', '#8378EA', '#96BFFF'
        ],
        "colorLayer": [
            ['#37A2DA', '#ffd85c', '#fd7b5f'],
            ['#37A2DA', '#67E0E3', '#FFDB5C', '#ff9f7f', '#E062AE', '#9d96f5'],
            ['#37A2DA', '#32C5E9', '#9FE6B8', '#FFDB5C', '#ff9f7f', '#fb7293', '#e7bcf3', '#8378EA', '#96BFFF'],
            ['#37A2DA', '#32C5E9', '#67E0E3', '#9FE6B8', '#FFDB5C', '#ff9f7f', '#fb7293', '#E062AE', '#E690D1', '#e7bcf3', '#9d96f5', '#8378EA', '#96BFFF']
        ]
    });
}));
