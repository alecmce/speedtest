package speedtests.list.linkedlist
{
    public class ItemIterator
    {
        private var head:Item;
        private var current:Item;

        public function ItemIterator(head:Item)
        {
            this.head = head;
            this.current = head;
        }

        public function hasNext():Boolean
        {
            return current != null;
        }

        public function next():Item
        {
            var data:* = current.data;
            current = current.next;
            return data;
        }
    }
}
