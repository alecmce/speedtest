package speedtests.theories.impl
{
    import org.osflash.signals.Signal;

    import speedtests.list.linkedlist.Item;
    import speedtests.list.linkedlist.LinkedList;
    import speedtests.method.MethodSpeedometer;

    public class TheorySpeedometer
    {
        private const methods:MethodSpeedometer = new MethodSpeedometer();
        private const list:LinkedList = new LinkedList();

        public const result:Signal = new Signal(TheoryToken);

        private var current:Item;
        private var theory:TheoryToken;
        private var methodCount:int;
        private var theoryCount:int;

        public function setTheoryCount(theoryCount:int):TheorySpeedometer
        {
            this.theoryCount = theoryCount;
            return this;
        }

        public function setMethodCount(methodCount:int):TheorySpeedometer
        {
            this.methodCount = methodCount;
            return this;
        }

        public function setTheories(tokens:Vector.<TheoryToken>):TheorySpeedometer
        {
            list.clear();
            for each (var token:TheoryToken in tokens)
                addTheory(token);

            return this;
        }

        public function addTheory(token:TheoryToken):TheorySpeedometer
        {
            var item:Item = new Item(token);
            list.head || (current = item);
            list.append(item);
            return this;
        }

        public function hasNext():Boolean
        {
            return current != null;
        }

        public function next():void
        {
            theory = current.data as TheoryToken;
            prepareMethodSpeedometer();
            repeatSpeedo();
            result.dispatch(theory);
            current = current.next;
        }

        public function reset():TheorySpeedometer
        {
            current = list.head;
            return this;
        }

        public function clear():TheorySpeedometer
        {
            current = null;
            list.clear();
            return this;
        }

        private function prepareMethodSpeedometer():void
        {
            methods.clear()
                   .setBefore(theory.getBefore())
                   .setMethods(theory.getMethods())
                   .setCount(methodCount);
        }

        private function repeatSpeedo():void
        {
            for (var i:int = 0; i < theoryCount; i++)
                iterateSpeedo();
        }

        private function iterateSpeedo():void
        {
            methods.reset();
            while (methods.hasNext())
                methods.next();
        }
    }
}
