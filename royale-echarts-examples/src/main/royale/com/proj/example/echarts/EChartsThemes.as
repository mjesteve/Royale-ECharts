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

    public class EChartsThemes
    {
        public static var themesLoad:ArrayList = new ArrayList([
            {themeName:'default', thumb:'themes/thumb/default.png', theme:null, isReg:false},
            {themeName:'light', thumb:'themes/thumb/light.png', theme:null, isReg:true},
            {themeName:'chalk', thumb:'themes/thumb/chalk.png', theme:null, isReg:false},
            {themeName:'dark', thumb:'themes/thumb/dark.png', theme:null, isReg:false},
            {themeName:'essos', thumb:'themes/thumb/essos.png', theme:null, isReg:false},
            {themeName:'halloween', thumb:'themes/thumb/halloween.png', theme:null, isReg:false},
            {themeName:'infographic', thumb:'themes/thumb/infographic.png', theme:null, isReg:false},
            {themeName:'macarons', thumb:'themes/thumb/macarons.png', theme:null, isReg:false},
            {themeName:'purple-passion', thumb:'themes/thumb/purple-passion.png', theme:null, isReg:false},
            {themeName:'roma', thumb:'themes/thumb/roma.png', theme:null, isReg:false},
            {themeName:'shine', thumb:'themes/thumb/shine.png', theme:null, isReg:false},
            {themeName:'vintage', thumb:'themes/thumb/vintage.png', theme:null, isReg:false},
            {themeName:'walden', thumb:'themes/thumb/walden.png', theme:null, isReg:false},
            {themeName:'westeros', thumb:'themes/thumb/westeros.png', theme:null, isReg:false},
            {themeName:'wonderland', thumb:'themes/thumb/wonderland.png', theme:null, isReg:false}
            ]);

        public function EChartsThemes()
        {
        }

        private static function themeInfoLoad(themeName:String):Object
        {            
            for(var i:int = 0; i<themesLoad.length; i++)
            {
                if(themesLoad[i].themeName == themeName)
                {
                    return {index:i,item:themesLoad[i] as Object};
                }
            }
            return {index:-1,item:null};
        }

        private static var inProgress:Boolean=false;
        
        /*private static var service:HTTPService;
        private static var collection:LazyCollection;*/

		public static function loadTheme(parentchart:EChartsComponent,themeName:String=null, outIdxTheme:int = -1):Boolean
        {
            do 
            {
              if(!inProgress)
              {
                inProgress = true;

                var objtheme:Object = themeInfoLoad(themeName);
                outIdxTheme = objtheme.index
                if(outIdxTheme != -1)
                {
                    if(!objtheme.item.theme && !objtheme.item.isReg)
                    {
                        var service:HTTPService = EChartsComponent.serviceJSON;
                        service.url = "themes/json/"+themeName+".json";
                        //service.addEventListener("complete", completeHandler);
                        service.addEventListener("complete", 
                            function(e:Event):void{                          
                                try
                                {
                                    var collection:LazyCollection = EChartsComponent.collectionJSON;
			                        var objData:Object = collection.getItemAt(0) as Object;

                                    //var objData:String = e.target.data as String;
                                    var txt:String = objData as String;
                                    var jsonData:Object = JSON.parse(txt);
                                    themesLoad[outIdxTheme].theme = jsonData;
                                    objtheme.item.theme = jsonData;

                                    echarts.registerTheme(themeName,objtheme.item.theme);
                                    objtheme.item.isReg = true;
                                    themesLoad[outIdxTheme].isReg = true;

                                }
                                catch (error:Error)
                                {
                                    trace(error.message);
                                }
                            }
                        );
                        service.send();
                    }
                    else if(!objtheme.item.isReg && objtheme.item.theme)
                    {
                        echarts.registerTheme(themeName,objtheme.item.theme);
                        objtheme.item.isReg = true;
                        themesLoad[outIdxTheme].isReg = true;
                    }
                }

                inProgress = false;
                return objtheme.item.isReg;
              }  
            
            } while(!inProgress);

            return false;
        }

        static private function completeHandler(event:Event):void
        {
            var collection:LazyCollection = EChartsComponent.collectionJSON;
			var a:Object = collection.getItemAt(0);
        }

/*		public static function loadTheme(themeName:String=null,outIdxTheme:int = -1):Boolean
		{
            while(!inProgress)
            {
                inProgress = true;

                var objtheme:Object = themeInfoLoad(themeName);
                outIdxTheme = objtheme.index
                if(outIdxTheme != -1)
                {
                    if(!objtheme.item.theme && !objtheme.item.isReg)
                    {
                        var jsonLoader:URLLoader = new URLLoader();
                        jsonLoader.addEventListener(Event.COMPLETE, 
                            function(e:Event):void{             
                                //var xmlData:XML = new XML (e.target.data);
                                //servicesConfig.WPWebService.source = xmlData.child("source").toString();
                                try
                                {                                 
                                    var objData:String = e.target.data as String;
                                    var jsonData:Object = JSON.parse(objData);
                                    themesLoad[outIdxTheme].theme = jsonData;
                                    objtheme.item.theme = jsonData;
                                }
                                catch (error:Error)
                                {
                                    trace(error.message);
                                }
                            }
                        );			
                        jsonLoader.load(new URLRequest("themes/json/"+themeName+".json"));
                    }

                    if(!objtheme.item.isReg && objtheme.item.theme){
                        echarts.registerTheme(themeName,objtheme.item.theme);
                        objtheme.item.isReg = true;
                        themesLoad[outIdxTheme].isReg = true;
                    }
                }

                inProgress = false;
                return objtheme.item.isReg;
            }
            return false;
		}*/
		/*public static function loadTheme(themeName:String=null,outIdxTheme:int = -1):Boolean
		{
            while(!inProgress)        
            {
                inProgress = true;

                var objtheme:Object = themeInfoLoad(themeName);
                outIdxTheme = objtheme.index
                if(outIdxTheme != -1)
                {
                    if(!objtheme.item.theme && !objtheme.item.isReg)
                    {
                        var xmlLoader:URLLoader = new URLLoader();
                        xmlLoader.addEventListener(Event.COMPLETE, loadJSON);			
                        xmlLoader.load(new URLRequest("themes/json/"+themeName+".json"));
                    }
                }

                inProgress = false;
                return objtheme.item.isReg;
            }
            return false;
		}

        private static function loadJSON(e:Event):void
        {                            
            //var xmlData:XML = new XML (e.target.data);
            //servicesConfig.WPWebService.source = xmlData.child("source").toString();
            try
            {                                 
                var objData:String = e.target.data as String;
                var jsonData:Object = JSON.parse(objData);
                themesLoad[outIdxTheme].theme = jsonData;
                objtheme.item.theme = jsonData;

                    if(!objtheme.item.isReg && objtheme.item.theme){
                        echarts.registerTheme(themeName,objtheme.item.theme);
                        objtheme.item.isReg = true;
                        themesLoad[outIdxTheme].isReg = true;
                    }
            }
            catch (error:Error)
            {
                trace(error.message);
            }        
            
        } */

    }
}