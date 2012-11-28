package speedtests.list.theories
{
    import speedtests.list.linkedlist.Item;

    final public class ArrayListTheory extends NullListTheory
    {
        private const list:Array = [];

        override public function append():void
        {
            list.push(new Item());
        }

        override public function prefix():void
        {
            list.unshift(new Item());
        }

        override public function pop():void
        {
            var data:* = list.pop();
        }

        override public function shift():void
        {
            var data:* = list.shift();
        }

        override public function iterateAll():void
        {
            var count:int = list.length;
            for (var i:int = 0; i < count; i++)
                var data:* = list[i].data;
        }
    }
}
