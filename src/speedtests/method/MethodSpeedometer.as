package speedtests.method
{
    import flash.utils.getTimer;

    import org.osflash.signals.Signal;

    public class MethodSpeedometer
    {
        public const result:Signal = new Signal(MethodToken);
        private const list:MethodTokenList = new MethodTokenList();

        private var count:int;
        private var current:MethodToken;

        public function setCount(count:int):MethodSpeedometer
        {
            this.count = count;
            return this;
        }

        public function setToken(tokens:Vector.<MethodToken>):MethodSpeedometer
        {
            list.clear();
            for each (var token:MethodToken in tokens)
                list.add(token);

            return this;
        }

        public function addToken(token:MethodToken):MethodSpeedometer
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
            var start:int = getTimer();
            repeatMethod(current.method);
            var end:int = getTimer();
            recordTime(current, start, end);
        }

        private function recordTime(method:MethodToken, start:int, end:int):void
        {
            method.duration = end - start;
            result.dispatch(method);
        }

        private function repeatMethod(method:Function):void
        {
            for (var i:int = 0; i < count; i++)
                method();
        }
    }
}
