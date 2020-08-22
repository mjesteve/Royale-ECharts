////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package com.proj.example.models
{
	import org.apache.royale.collections.ArrayList;
	import com.proj.example.vos.TabBarChartVO;
	import com.proj.example.vos.ChartDefExampleVO;

	[Bindable]
	public class ChartsModel
	{
	
		private var _tabBarAppData:ArrayList;		
		public function get tabBarAppData():ArrayList
		{
			if(!_tabBarAppData){
				var arData:Array = new Array();
				var it:TabBarChartVO = new TabBarChartVO();
				it.label="Char1";
				it.hash="ecp1";
				it.thumbnail="assets/charts/xCFIVk5Ebk.png";
				it.description="Pie Chart. 1";
				it.descChart = _ECC_PIE001;
				arData.push(it);

				it = new TabBarChartVO();
				it.label="Char2";
				it.hash="ecp2";
				it.thumbnail="assets/charts/xlZeV3FwQM.png";
				it.description="Pie Chart. 2";
				it.descChart = new ChartDefExampleVO();
				arData.push(it);

				_tabBarAppData = new ArrayList(arData);
			}
			return _tabBarAppData;
		}

		private var _ECC_PIE001:ChartDefExampleVO;
		public function get ECC_PIE001():ChartDefExampleVO
		{
			if(!_ECC_PIE001){
				_ECC_PIE001 = new ChartDefExampleVO();

			}
			return _ECC_PIE001;
		}
		
	}
}
