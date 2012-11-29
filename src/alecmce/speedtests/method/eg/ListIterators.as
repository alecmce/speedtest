package alecmce.speedtests.method.eg
{
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.ItemIterator;
    import alecmce.speedtests.list.linkedlist.LinkedList;

    public class ListIterators
    {
        private static const ITEM_COUNT:int = 100;

        private const array:Array = makeArray();
        private const vector:Vector.<Item> = makeVector();
        private const list:LinkedList = makeList();

        private function makeArray():Array
        {
            var array:Array = [];
            for (var i:int = 0; i < ITEM_COUNT; i++)
                array.push(new Item());

            return array;
        }

        private function makeVector():Vector.<Item>
        {
            var vector:Vector.<Item> = new Vector.<Item>(ITEM_COUNT, true);
            for (var i:int = 0; i < ITEM_COUNT; i++)
                vector[i] = new Item();

            return vector;
        }

        private function makeList():LinkedList
        {
            var list:LinkedList = new LinkedList();
            for (var i:int = 0; i < ITEM_COUNT; i++)
                list.append(new Item());

            return list;
        }

        public function loopThroughVector():void
        {
            for (var i:int = 0; i < ITEM_COUNT; i++)
                 var data:* = vector[i].data;
        }

        public function loopThroughArray():void
        {
            for (var i:int = 0; i < ITEM_COUNT; i++)
                 var data:* = array[i].data;
        }

        public function loopThroughLinkedList():void
        {
            for (var item:Item = list.head; item; item = item.next)
                 var data:* = item.data;
        }

        public function loopThroughIterator():void
        {
            var iterator:ItemIterator = list.getIterator();
            while (iterator.hasNext())
                var data:* = iterator.next();
        }
    }
}
