package alecmce.speedtests.list.theories
{
    import alecmce.speedtests.list.ListTheory;
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;

    import alecmce.speedtests.method.MethodSpeedometer;

    public class DirectLinkedListTheory implements ListTheory
    {
        private const list:LinkedList = new LinkedList();

        public function append():void
        {
            list.append(new Item());
        }

        public function prefix():void
        {
            list.prefix(new Item());
        }

        public function pop():void
        {
            list.pop();
        }

        public function shift():void
        {
            list.shift();
        }

        public function iterateAll():void
        {
            for (var node:Item = list.head; node; node = node.next)
                var data:* = node.data;
        }

        public function getMethodSpeedometer():MethodSpeedometer
        {
            return null;
        }
    }
}
