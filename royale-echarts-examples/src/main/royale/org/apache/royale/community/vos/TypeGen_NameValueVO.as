package org.apache.royale.community.vos
{

    [Bindable]
    public class TypeGen_NameValueVO
    {
        public var name:String;
        public var value:Number;

        public function TypeGen_NameValueVO(item:Object = null)
        {
            if(item)
            {
                this.name = item.name;
                this.value = item.value;
            }
        }

    }
}

