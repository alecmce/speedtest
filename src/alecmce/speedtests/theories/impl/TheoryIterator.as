package alecmce.speedtests.theories.impl
{
    import org.osflash.signals.Signal;

    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;
    import alecmce.speedtests.method.MethodSpeedometer;
    import alecmce.speedtests.util.Progress;

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

        public function TheoryIterator(list:LinkedList, theoryCount:int, methodCount:int)
        {
            this.list = list;
            this.theoryCount = theoryCount;
            this.methodCount = methodCount;

            reset();
        }

        public function updateProgressTotal():TheoryIterator
        {
            const count:int = theoryCount * methodCount * list.count;
            progress.setTotal(count);
            return this;
        }

        public function reset():void
        {
            progress
                .reset();

            setCurrentTheory(list.head);
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
            return current && index < theoryCount;
        }

        public function next():void
        {
            progress.tick();
            methods.next();
            if (!methods.hasNext())
                resetMethodsOrGetNextTheory();
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
