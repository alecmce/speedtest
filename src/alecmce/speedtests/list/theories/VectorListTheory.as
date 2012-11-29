package alecmce.speedtests.list.theories
{
    public class VectorListTheory implements ListTheory
    {
        private const list:Vector.<Item> = new Vector.<Item>();

        public function append():void
        {
            list.push(new Item());
        }

        public function prefix():void
        {
            list.unshift(new Item());
        }

        public function pop():void
        {
            var data:* = list.pop();
        }

        public function shift():void
        {
            var data:* = list.shift();
        }

        public function iterateAll():void
        {
            var count:int = list.length;
            for (var i:int = 0; i < count; i++)
                var data:* = list[i].data;
        }
    }
}
