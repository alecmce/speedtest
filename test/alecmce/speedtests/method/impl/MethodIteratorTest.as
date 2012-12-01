package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.list.linkedlist.Item;
    import alecmce.speedtests.list.linkedlist.LinkedList;

    import org.hamcrest.assertThat;
    import org.hamcrest.object.equalTo;

    public class MethodIteratorTest
    {
        private var iterator:MethodIterator;

        [Before]
        public function before():void
        {
            iterator = new MethodIterator();
        }

        [Test]
        public function expectAsManyIterationsAsItemsInList():void
        {
            iterator
                .setList(makeLinkedList(2))
                .reset();

            assertThat(countIterations(), equalTo(2));
        }

        [Test]
        public function initiallyProgressReports0():void
        {
            iterator
                .setList(makeLinkedList(2))
                .reset();

            assertThat(iterator.progress.getProportion(), equalTo(0));
        }

        [Test]
        public function progressUpdatesCorrectly():void
        {
            iterator
                .setList(makeLinkedList(2))
                .reset();

            iterator.next();
            assertThat(iterator.progress.getProportion(), equalTo(0.5));
        }

        private function makeLinkedList(methodTokenCount:int):LinkedList
        {
            const list:LinkedList = new LinkedList();
            for (var i:int = 0; i < methodTokenCount; i++)
            {
                const counter:MethodCounter = new MethodCounter();
                list.append(new Item(counter.makeToken()));
            }
            return list;
        }

        private function countIterations():int
        {
            var count:int = 0;
            while (iterator.hasNext())
            {
                ++count;
                iterator.next();
            }
            return count;
        }
    }
}

import alecmce.speedtests.method.impl.MethodToken;

class MethodCounter
{
    public var count:int = 0;

    public function method():void
    {
        ++count;
    }

    public function makeToken():MethodToken
    {
        return new MethodToken()
            .setMethod(method);
    }
}