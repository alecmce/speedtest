package alecmce.speedtests.theories.impl
{
    import org.osflash.signals.Signal;

    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.method.MethodSpeedometer;
    import alecmce.speedtests.util.Progress;

    public class TheorySpeedometer
    {
        public static const THEORY_COUNT:int = 100;
        public static const METHOD_COUNT:int = 1000;

        private const methods:MethodSpeedometer = new MethodSpeedometer();
        private const list:LinkedList = new LinkedList();
        private const iterator:TheoryIterator = new TheoryIterator(list, THEORY_COUNT, METHOD_COUNT);
        public const result:Signal = iterator.theoryComplete;
        public const progress:Progress = iterator.progress;

        private var current:Item;
        private var theory:TheoryToken;

        public function setTheoryCount(theoryCount:int):TheorySpeedometer
        {
            iterator.theoryCount = theoryCount;
            return this;
        }

        public function setMethodCount(methodCount:int):TheorySpeedometer
        {
            iterator.methodCount = methodCount;
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
            iterator.updateProgressTotal();
            return this;
        }

        public function hasNext():Boolean
        {
            return iterator.hasNext();
            return current != null;
        }

        public function next():void
        {
            iterator.next();
        }

        public function reset():TheorySpeedometer
        {
            iterator.reset();
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
            methods
                .clear()
                .setBefore(theory.getBefore())
                .setMethods(theory.getMethods())
                .setCount(iterator.methodCount)
                .reset();
        }

        private function repeatSpeedo():void
        {
            for (var i:int = 0; i < iterator.theoryCount; i++)
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
