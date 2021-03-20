package com.proj.example.jewel
{
	import org.apache.royale.jewel.List
	import org.apache.royale.jewel.beads.views.ListView;
	import org.apache.royale.core.IBeadView;
	import org.apache.royale.html.beads.ContainerView;
	import org.apache.royale.core.UIBase;
	import com.proj.example.jewel.beads.views.ListViewJwExt;
	import org.apache.royale.jewel.supportClasses.scrollbar.ScrollingViewport;

	public class ListJwExt extends org.apache.royale.jewel.List
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function ListJwExt()
		{
			super();
            addEventListener("beadsAdded", beadsAddedHandler);
        }

        private function beadsAddedHandler(event:Event):void
        {
			removeEventListener("beadsAdded", beadsAddedHandler);

            //var layout:HorizontalLayout = (_strand as UIBase).getBeadByType(IBeadLayout) as HorizontalLayout;
			//var lview:ContainerView = getBeadByType(IBeadView) as ContainerView;
			
		}

		public function get scrollViewport():ScrollingViewport
		{
			return (view as ListViewJwExt).scrollViewport;
		}

	}
}
