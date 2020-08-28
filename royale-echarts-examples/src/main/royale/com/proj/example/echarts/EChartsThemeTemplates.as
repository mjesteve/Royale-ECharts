/**
 * Pending separate on model / controller
 */
package com.proj.example.echarts
{
	import org.apache.royale.net.URLLoader;
	import org.apache.royale.events.Event;
	import org.apache.royale.net.URLRequest;
	import org.apache.royale.collections.ArrayList;
	import org.apache.royale.net.HTTPService;
	import org.apache.royale.collections.LazyCollection;
	import org.apache.royale.collections.parsers.JSONInputParser;
	import org.apache.royale.utils.ObjectMap;
	import org.apache.royale.utils.PointUtils;

    [Bindable]
    public class EChartsThemeTemplates
    {        
		static private var _themesLoad:ObjectMap;
		static public function get themesLoad():ObjectMap
		{
			if(_themesLoad == null){
				_themesLoad = new ObjectMap();
				_themesLoad['default'] = {themeName:'default', thumb:'themes/thumb/default.png', theme:null, isReg:false};
				_themesLoad['chalk'] = {themeName:'chalk', thumb:'themes/thumb/chalk.png', theme:null, isReg:false}
				_themesLoad['dark'] = {themeName:'dark', thumb:'themes/thumb/dark.png', theme:null, isReg:false}
				_themesLoad['essos'] = {themeName:'essos', thumb:'themes/thumb/essos.png', theme:null, isReg:false}
				_themesLoad['halloween'] = {themeName:'halloween', thumb:'themes/thumb/halloween.png', theme:null, isReg:false}				
				_themesLoad['infographic'] = {themeName:'infographic', thumb:'themes/thumb/infographic.png', theme:null, isReg:false}
				_themesLoad['macarons'] = {themeName:'macarons', thumb:'themes/thumb/macarons.png', theme:null, isReg:false}
				_themesLoad['purple-passion'] = {themeName:'purple-passion', thumb:'themes/thumb/purple-passion.png', theme:null, isReg:false}
				_themesLoad['roma'] = {themeName:'roma', thumb:'themes/thumb/roma.png', theme:null, isReg:false}
				_themesLoad['shine'] = {themeName:'shine', thumb:'themes/thumb/shine.png', theme:null, isReg:false}
				_themesLoad['vintage'] = {themeName:'vintage', thumb:'themes/thumb/vintage.png', theme:null, isReg:false}
				_themesLoad['walden'] = {themeName:'walden', thumb:'themes/thumb/walden.png', theme:null, isReg:false}
				_themesLoad['westeros'] = {themeName:'westeros', thumb:'themes/thumb/westeros.png', theme:null, isReg:false}
				_themesLoad['wonderland'] = {themeName:'wonderland', thumb:'themes/thumb/wonderland.png', theme:null, isReg:false};
			}
			return _themesLoad;
		}

        static public function updateReg(themeName:String,isReg:Boolean):void{
            if(_themesLoad[themeName]){
                _themesLoad[themeName].isReg = isReg;
            }
        }

        static public function updateTheme(themeName:String,theme:Object):void{
            if(_themesLoad[themeName]){
                _themesLoad[themeName].theme = theme;
            }
        }

    }
}