package speedtests.theories.eg
{
    import speedtests.theories.api.Theory;
    import speedtests.theories.impl.TheoryFactory;

    public class IntHashTheories
    {
        public var weightOfGet:int = 100;
        public var weightOfSet:int = 100;
        public var weightOfClear:int = 100;
        public var weightOfIterateKeys:int = 100;
        public var weightOfIterateValues:int = 100;

        private const factory:TheoryFactory = new TheoryFactory();

        public function getDictionaryTheory():Theory
        {
            return makeTheory(new DictionaryIntHash());
        }

        public function getObjectTheory():Theory
        {
            return makeTheory(new ObjectIntHash());
        }

        public function getFixedVectorIntHash():Theory
        {
            return makeTheory(new FixedVectorIntHash());
        }

        private function makeTheory(hash:IntHashStructure):Theory
        {
            return factory
                .setBefore(hash.before)
                .addMethod("get", hash.get, weightOfGet)
                .addMethod("set", hash.set, weightOfSet)
                .addMethod("clear", hash.clear, weightOfClear)
                .addMethod("iterateKeys", hash.iterateKeys, weightOfIterateKeys)
                .addMethod("iterateValues", hash.iterateValues, weightOfIterateValues)
                .make();
        }
    }
}