package com.proj.example.charts
{
    
	public interface IEchartDefinitionTemplate
	{
		
		function get optionsInit():Object;
        function set optionsInit(value:Object):void;
		
		function get autoLoad():Boolean;
        function set autoLoad(value:Boolean):void;
        
        function get chartComponent():EChartsContainer;
		
	}
}