package speedtests.method
{
    import flash.utils.getTimer;

    import org.osflash.signals.Signal;

    public class MethodSpeedometer
    {
        public const result:Signal = new Signal(MethodToken);

        private const list:MethodTokenList = new MethodTokenList();
        private var before:Function;
        private var count:int;
        private var current:MethodToken;

        public function setCount(count:int):MethodSpeedometer
        {
            this.count = count;
            return this;
        }

        public function setBefore(before:Function):MethodSpeedometer
        {
            this.before = before;
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
            list.head || (current = token);
            list.add(token);
            return this;
        }

        public function hasNext():Boolean
        {
            return current != null;
        }

        public function next():void
        {
            recordTimeForMethod();
            current = current.next as MethodToken;
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
    }
}
