package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.util.Progress;

    import flash.utils.getTimer;

    import org.osflash.signals.Signal;

    public class MethodIterator
    {
        public const progress:Progress = new Progress();
        public const result:Signal = new Signal(MethodToken);

        private var list:LinkedList;
        private var count:int;

        private var item:Item;
        private var current:MethodToken;
        private var before:Function;

        public function setList(list:LinkedList):MethodIterator
        {
            this.list = list;
            return this;
        }

        public function setCount(count:int):MethodIterator
        {
            this.count = count;
            return this;
        }

        public function setBefore(before:Function):MethodIterator
        {
            this.before = before;
            return this;
        }

        public function reset():MethodIterator
        {
            count = 0;
            setCurrentMethod(list.head);
            return this;
        }

        private function setCurrentMethod(item:Item):void
        {
            this.item = item;
            current = item ? item.data as MethodToken : null;
        }

        public function hasNext():Boolean
        {
            return current;
        }

        public function next():void
        {
            recordTimeForMethod();
            updateProgress();
            setCurrentMethod(item.next);
        }

        private function recordTimeForMethod():void
        {
            before && before();
            var start:int = getTimer();
            repeatMethod(current.method);
            var end:int = getTimer();
            recordTime(current, start, end);
        }

        private function recordTime(method:MethodToken, start:int, end:int):void
        {
            method.addResult(end - start);
            result.dispatch(method);
        }

        private function repeatMethod(method:Function):void
        {
            for (var i:int = 0; i < count; i++)
                method();
        }

        private function updateProgress():void
        {
            progress.setTotal(++count * list.count);
        }
    }
}
