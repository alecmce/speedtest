package speedtests.theories.impl
{
    import org.hamcrest.assertThat;
    import org.hamcrest.object.equalTo;

    import speedtests.list.linkedlist.Item;
    import speedtests.list.linkedlist.LinkedList;

    public class TheoryIteratorTest
    {
        private var iterator:TheoryIterator;

        private static const TOKEN_COUNT:int = 2;
        private static const METHOD_ITERATIONS:int = 3;
        private static const THEORY_ITERATIONS:int = 5;

        [Test]
        public function theCorrectNumberOfIterationsArePerformed():void
        {
            const list:LinkedList = makeTheoryList(TOKEN_COUNT);
            iterator = new TheoryIterator(list, THEORY_ITERATIONS, METHOD_ITERATIONS);
            assertThat(iterationsCount(iterator), equalTo(TOKEN_COUNT * METHOD_ITERATIONS * THEORY_ITERATIONS));
        }

        private function makeTheoryList(count:int):LinkedList
        {
            const list:LinkedList = new LinkedList();
            for (var i:int = 0; i < count; i++)
                list.append(new Item(makeTheoryToken()));

            return list;
        }

        private function makeTheoryToken():TheoryToken
        {
            return new TheoryToken()
                .setTheory(new ExampleTheory())
                .setName("t") as TheoryToken;
        }

        private function iterationsCount(iterator:TheoryIterator):int
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

import speedtests.method.MethodToken;
import speedtests.theories.api.Theory;
import speedtests.theories.impl.WeightedMethodToken;

class ExampleTheory implements Theory
{
    public var beforeCount:int;
    public var methodCount:int;

    private const methods:Vector.<WeightedMethodToken> = new Vector.<WeightedMethodToken>();

    public function ExampleTheory()
    {
        const a:WeightedMethodToken = makeWeightedMethodToken("a");
        const b:WeightedMethodToken = makeWeightedMethodToken("b");
        const c:WeightedMethodToken = makeWeightedMethodToken("c");
        methods.push(a, b, c);
    }

    private function makeWeightedMethodToken(name:String):WeightedMethodToken
    {
        return new WeightedMethodToken()
            .setMethod(makeMethodToken(name));
    }

    private function makeMethodToken(name:String):MethodToken
    {
        return new MethodToken()
            .setMethod(method)
            .setName(name) as MethodToken;
    }

    public function getBefore():Function
    {
        return before;
    }

    public function getMethods():Vector.<WeightedMethodToken>
    {
        return methods;
    }

    private function before():void
    {
        ++beforeCount;
    }

    private function method():void
    {
        ++methodCount;
    }
}