package alecmce.speedtests.method
{
    import flash.utils.getTimer;

    import org.osflash.signals.Signal;

    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.util.Progress;

    public class MethodSpeedometer
    {
        public const progress:Progress = new Progress();
        public const result:Signal = new Signal(MethodToken);

        private const list:LinkedList = new LinkedList();
        private var current:Item;
        private var before:Function;
        private var count:int;

        private function updateProgress():void
        {
            progress.setTotal(count * list.count);
        }

        public function setCount(count:int):MethodSpeedometer
        {
            this.count = count;
            updateProgress();
            return this;
        }

        public function setBefore(before:Function):MethodSpeedometer
        {
            this.before = before;
            updateProgress();
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
            list.head || (current = item);
            list.append(item);
            updateProgress();
            return this;
        }

        public function hasNext():Boolean
        {
            return current != null;
        }

        public function next():void
        {
            recordTimeForMethod();
            updateProgress();
            current = current.next;
        }

        public function reset():MethodSpeedometer
        {
            current = list.head;
            return this;
        }

        public function clear():MethodSpeedometer
        {
            list.clear();
            current = null;
            return this;
        }

        private function recordTimeForMethod():void
        {
            const token:MethodToken = current.data as MethodToken;
            var start:int = getTimer();
            repeatMethod(token.method);
            var end:int = getTimer();
            recordTime(token, start, end);
        }

        private function recordTime(method:MethodToken, start:int, end:int):void
        {
            method.addResult(end - start);
            result.dispatch(method);
        }

        private function repeatMethod(method:Function):void
        {
            for (var i:int = 0; i < count; i++)
            {
                method();
            }
        }
    }
}
