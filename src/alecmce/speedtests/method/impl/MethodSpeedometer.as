package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.util.Progress;

    import org.osflash.signals.Signal;

    public class MethodSpeedometer
    {
        private var DEFAULT_COUNT:int = 10000;

        private const list:LinkedList = new LinkedList();
        private var count:int = DEFAULT_COUNT;

        private const iterator:MethodIterator = makeIterator();
        public const progress:Progress = iterator.progress;
        public const result:Signal = iterator.result;

        private function makeIterator():MethodIterator
        {
            return new MethodIterator()
                .setList(list)
                .setCount(count);
        }

        public function setCount(count:int):MethodSpeedometer
        {
            iterator.setCount(count);
            return this;
        }

        public function setBefore(before:Function):MethodSpeedometer
        {
            iterator.setBefore(before);
            return this;
        }

        public function setMethods(tokens:Vector.<MethodToken>):MethodSpeedometer
        {
            list.clear();
            addMethods(tokens);
            return this;
        }

        private function addMethods(tokens:Vector.<MethodToken>):void
        {
            for each (var token:MethodToken in tokens)
                addMethod(token);
        }

        public function addMethod(token:MethodToken):MethodSpeedometer
        {
            const item:Item = new Item(token);
            list.append(item);
            iterator.reset()
            return this;
        }

        public function hasNext():Boolean
        {
            return iterator.hasNext();
        }

        public function next():void
        {
            iterator.next();
        }

        public function reset():MethodSpeedometer
        {
            iterator.reset();
            return this;
        }

        public function clear():MethodSpeedometer
        {
            list.clear();
            iterator.reset();
            return this;
        }
    }
}
