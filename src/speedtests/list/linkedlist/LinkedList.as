package speedtests.list.linkedlist
{
    public class LinkedList
    {
        public var head:Item;
        public var tail:Item;

        public function append(item:Item):LinkedList
        {
            if (head)
            {
                tail.next = item;
                item.prev = tail;
                tail = item;
            }
            else
            {
                head = tail = item;
            }

            return this;
        }

        public function prefix(item:Item):void
        {
            if (head)
            {
                head.prev = item;
                item.next = item;
                head = item;
            }
            else
            {
                head = tail = item;
            }
        }

        public function remove(item:Item):Item
        {
            item.next && (item.next.prev = item.prev);
            item.prev && (item.prev.next = item.next);
            head == item && (head = head.next);
            tail == item && (tail = tail.prev);
            return item;
        }

        public function pop():Item
        {
            return remove(tail);
        }

        public function shift():Item
        {
            return remove(head);
        }

        public function getIterator():ItemIterator
        {
            return new ItemIterator(head);
        }

        public function clear():void
        {
            head = null;
            tail = null;
        }
    }
}
