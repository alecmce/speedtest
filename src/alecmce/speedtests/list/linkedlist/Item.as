package alecmce.speedtests.list.linkedlist
{
    public class Item
    {
        public var prev:Item;
        public var next:Item;

        public var data:*;

        public function Item(data:* = null)
        {
            this.data = data;
        }
    }
}
