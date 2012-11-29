package alecmce.speedtests.list.theories
{
    public class ForEachIteratorArrayListTheory implements ListTheory
    {
        private const list:Array = [];
        
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
            for each(var item:Item in list)
                var data:* = item.data;
        }
    }
}
