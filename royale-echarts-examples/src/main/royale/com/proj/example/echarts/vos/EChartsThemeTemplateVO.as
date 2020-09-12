package com.proj.example.echarts.vos
{

    [Bindable]
    public class EChartsThemeTemplateVO
    {
        public var themeName:String;
        public var thumb:String;
        public var jsonConfig:Object;
        public var isReg:Boolean;
        public var custom:Boolean;
        public var isNative:Boolean;
        public var jsFormat:Boolean;

        public function EChartsThemeTemplateVO(themeName:String, thumb:String = null, jsonConfig:Object = null, isReg:Boolean = false, 
        custom:Boolean = false, isNative:Boolean = false, jsFormat:Boolean = true)
        {
            this.themeName = themeName;
            this.thumb = thumb;
            this.jsonConfig = jsonConfig;
            this.isReg = isReg;
            this.custom = custom;
            this.isNative = isNative;
            this.jsFormat = jsFormat;
        }

    }
}

