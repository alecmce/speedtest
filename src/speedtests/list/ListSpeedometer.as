package speedtests.list
{
    import flash.utils.Dictionary;

    import org.osflash.signals.Signal;

    import speedtests.method.MethodSpeedometer;
    import speedtests.method.MethodToken;

    public class ListSpeedometer
    {
        private const methods:MethodSpeedometer = makeMethodSpeedometer();
        private const list:ListTokenList = new ListTokenList();
        public const result:Signal = new Signal(MethodToken);

        public var head:ListToken;
        public var tail:ListToken;
        private var current:ListToken;

        private const results:Dictionary = new Dictionary();

        private var count:int;

        private function makeMethodSpeedometer():MethodSpeedometer
        {
            var m:MethodSpeedometer = new MethodSpeedometer();
            m.result.add(onResult);
            return m;
        }

        public function setCount(count:int):ListSpeedometer
        {
            this.count = count;
            return this;
        }

        public function addToken(token:ListToken):ListSpeedometer
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
            prepareMethodSpeedometer();
            repeatSpeedo();
            aggregateResults();
            current = current.next as ListToken;
        }

        public function reset():ListSpeedometer
        {
            current = list.head;
            return this;
        }

        public function clear():ListSpeedometer
        {
            head = tail = current = null;
            for (var name:String in results)
                delete results[name];

            return this;
        }

        private function prepareMethodSpeedometer():void
        {
            methods.reset()
                    .setCount(count);

            for each (var method:MethodToken in current.methods)
                methods.addMethod(method);
        }

        private function onResult(token:MethodToken):void
        {
            var result:MethodResult = new MethodResult(token);

            var name:String = token.name;
            var tail:MethodResult = results[name];
            if (tail)
            {
                tail.next = result;
                result.prev = tail;
            }

            results[name] = tail;
        }

        private function repeatSpeedo():void
        {
            for (var i:int = 0; i < count; i++)
                iterateSpeedo();
        }

        private function iterateSpeedo():void
        {
            while (methods.hasNext())
                methods.next();
        }

        private function aggregateResults():void
        {
            for (var name:String in results)
            {
                var method:MethodResult = results[name];
                var token:MethodToken = method.token;

                var duration:int = 0;
                for (null; method; method = method.next)
                    duration += method.duration;

                current.addDuration(token, duration);
            }

            result.dispatch(token);
        }
    }
}