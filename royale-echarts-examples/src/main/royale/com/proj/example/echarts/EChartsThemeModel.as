package com.proj.example.echarts
{
	import org.apache.royale.net.URLLoader;
	import org.apache.royale.events.Event;
	import org.apache.royale.net.URLRequest;
	import org.apache.royale.collections.ArrayList;

    public class EChartsThemeModel
    {
        public static var themesLoad:ArrayList = new ArrayList([
            {themeName:'chalk', thumb:'themes/thumb/chalk.png', theme:null},
            {themeName:'dark', thumb:'themes/thumb/dark.png', theme:null},
            {themeName:'essos', thumb:'themes/thumb/essos.png', theme:null},
            {themeName:'halloween', thumb:'themes/thumb/halloween.png', theme:null},
            {themeName:'infographic', thumb:'themes/thumb/infographic.png', theme:null},
            {themeName:'macarons', thumb:'themes/thumb/macarons.png', theme:null},
            {themeName:'purple-passion', thumb:'themes/thumb/purple-passion.png', theme:null},
            {themeName:'roma', thumb:'themes/thumb/roma.png', theme:null},
            {themeName:'shine', thumb:'themes/thumb/shine.png', theme:null},
            {themeName:'vintage', thumb:'themes/thumb/vintage.png', theme:null},
            {themeName:'walden', thumb:'themes/thumb/walden.png', theme:null},
            {themeName:'westeros', thumb:'themes/thumb/westeros.png', theme:null},
            {themeName:'wonderland', thumb:'themes/thumb/wonderland.png', theme:null}
            ]);

        public function EChartsThemeModel()
        {
        }

        private static function themeInfoLoad(themeName:String):Object
        {            
            for(var i:int = 0; i<themeName.length; i++)
            {
                if(themeName[i].themeName == themeName)
                {
                    return {index:i,item:themeName[i]};
                }
            }
            return {index:-1,item:null};
        }

		public static function getCfgTheme(themeName:String=null):int
		{
            var idxtheme:Object = themeInfoLoad(themeName);
			if(idxtheme.index != -1)
            {                
                var xmlLoader:URLLoader = new URLLoader();
                xmlLoader.addEventListener(Event.COMPLETE, 
                    function loadXML(e:Event):void{             
                        /*var xmlData:XML = new XML (e.target.data);
                        servicesConfig.WPWebService.source = xmlData.child("source").toString();
                        servicesConfig.loginChannel.channelId = xmlData.child("channelId").toString();
                        servicesConfig.loginChannel.serverName = xmlData.child("serverName").toString();
                        servicesConfig.loginChannel.serverPort = xmlData.child("serverPort").toString();
                        servicesConfig.loginChannel.contextRoot = xmlData.child("contextRoot").toString();
                        servicesConfig.loginChannel.endPointName = xmlData.child("endPointName").toString();*/ 
                        var objData:String = e.target.data as String;
                        var jsonData:Object = JSON.parse(objData);
                        themeName[idxtheme].theme = jsonData;
                    }
                );			
			    xmlLoader.load(new URLRequest("themes/json/"+themeName+".json"));
            }
            return idxtheme.index;
		}

    }
}