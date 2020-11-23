package com.iest.echarts.models
{
	import org.apache.royale.core.IBeadModel;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.events.EventDispatcher;
	import org.apache.royale.utils.ObjectMap;
	import com.iest.echarts.vos.EChartsThemeTemplateVO;
	import org.apache.royale.collections.ArrayList;

    [Bindable]
    public class EChartsThemesModel extends EventDispatcher implements IBeadModel
	{
		
        private static var _instance:EChartsThemesModel;
		public static function get instance():EChartsThemesModel{
			return _instance || (_instance = new EChartsThemesModel());
		}    
		/**
		 * Constructor.
		 */
		public function EChartsThemesModel()
		{
			if (!_instance) {
                super();
                _instance = this;
			}else{                            
				trace('EChartsThemesModel error');                
				throw new Error("singleton");
            }
		}

        private var _strand:IStrand;

		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function set strand(value:IStrand):void
		{
			_strand = value;
		}    

		public var initComplete:Boolean = false;

		public function init():void
		{
			_themesLoad = new ObjectMap();
			_themesLoad['default'] = new EChartsThemeTemplateVO('default', 'themes/thumb/default.png');
			_themesLoad['chalk'] = new EChartsThemeTemplateVO('chalk', 'themes/thumb/chalk.png');
			_themesLoad['dark'] = new EChartsThemeTemplateVO('dark', 'themes/thumb/dark.png');
			_themesLoad['essos'] = new EChartsThemeTemplateVO('essos', 'themes/thumb/essos.png');
			_themesLoad['halloween'] = new EChartsThemeTemplateVO('halloween', 'themes/thumb/halloween.png');				
			_themesLoad['infographic'] = new EChartsThemeTemplateVO('infographic', 'themes/thumb/infographic.png');
			_themesLoad['macarons'] = new EChartsThemeTemplateVO('macarons', 'themes/thumb/macarons.png');
			_themesLoad['purple-passion'] = new EChartsThemeTemplateVO('purple-passion', 'themes/thumb/purple-passion.png');
			_themesLoad['roma'] = new EChartsThemeTemplateVO('roma', 'themes/thumb/roma.png');
			_themesLoad['shine'] = new EChartsThemeTemplateVO('shine', 'themes/thumb/shine.png');
			_themesLoad['vintage'] = new EChartsThemeTemplateVO('vintage', 'themes/thumb/vintage.png');
			_themesLoad['walden'] = new EChartsThemeTemplateVO('walden', 'themes/thumb/walden.png');
			_themesLoad['westeros'] = new EChartsThemeTemplateVO('westeros', 'themes/thumb/westeros.png');
			_themesLoad['wonderland'] = new EChartsThemeTemplateVO('wonderland', 'themes/thumb/wonderland.png');
		}

		private var _themesLoad:ObjectMap;
		public function get themesLoad():ObjectMap
		{
			if(_themesLoad == null){
				init();
			}
			return _themesLoad;
		}

		public function themesLoadArrayList():ArrayList
		{
			var ar:ArrayList = new ArrayList();
			var dic:ObjectMap = themesLoad;
			for(var key:String in dic)
			{
				if(_themesLoad[key] is EChartsThemeTemplateVO)
					ar.addItem(_themesLoad[key] as EChartsThemeTemplateVO);
			}
			return ar;
		}

		public function itemThemeFromName(themeName:String):EChartsThemeTemplateVO
		{
			if(_themesLoad[themeName])
                return _themesLoad[themeName] as EChartsThemeTemplateVO;
			else
				return null;
		}

		public var loadInProgress:Boolean = false;
		public var itemLoadingTheme:EChartsThemeTemplateVO;
		public var countCustomTheme:int=0;
		

    }
}

