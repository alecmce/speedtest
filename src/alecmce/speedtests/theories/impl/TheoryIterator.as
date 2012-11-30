package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.method.impl.MethodSpeedometer;
    import alecmce.speedtests.util.Progress;

    import org.osflash.signals.Signal;

    public class TheoryIterator
    {
        private const methods:MethodSpeedometer = new MethodSpeedometer();

        public const progress:Progress = new Progress();
        public const theoryComplete:Signal = new Signal(TheoryToken);

        private var list:LinkedList;

        public var methodCount:int;
        public var theoryCount:int;

        private var item:Item;
        private var current:TheoryToken;
        private var index:int;

        public function setList(list:LinkedList):TheoryIterator
        {
            this.list = list;
            return this;
        }

        public function setTheoryCount(theoryCount:int):TheoryIterator
        {
            this.theoryCount = theoryCount;
            return this;
        }

        public function setMethodCount(methodCount:int):TheoryIterator
        {
            this.methodCount = methodCount;
            return this;
        }

        public function updateProgressTotal():TheoryIterator
        {
            const count:int = theoryCount * methodCount * list.count;
            progress.setTotal(count);
            return this;
        }

        public function reset():TheoryIterator
        {
            progress.reset();
            setCurrentTheory(list.head);
            return this;
        }

        private function setCurrentTheory(item:Item):void
        {
            this.item = item;
            current = item ? item.data as TheoryToken : null;
            current && methods
                .clear()
                .setBefore(current.getBefore())
                .setMethods(current.getMethods())
                .setCount(methodCount)
                .reset();

            this.index = 0;
        }

        public function hasNext():Boolean
        {
            return current && index < theoryCount && methods.hasNext();
        }

        public function next():void
        {
            progress.tick();
            methods.next();
            methods.hasNext() || resetMethodsOrGetNextTheory();
        }

        private function resetMethodsOrGetNextTheory():void
        {
            methods.reset();
            ++index == theoryCount && completeTheory();
        }

        private function completeTheory():void
        {
            theoryComplete.dispatch(current);
            setCurrentTheory(item.next);
        }
    }
}
