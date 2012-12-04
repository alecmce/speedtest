package alecmce.speedtests.theories.eg
{
    import alecmce.speedtests.theories.api.Theory;
    import alecmce.speedtests.theories.impl.TheoryFactory;
    import alecmce.speedtests.theories.impl.Weights;

    public class IntHashTheories
    {
        private const factory:TheoryFactory = new TheoryFactory();
        private var weights:Weights;

        public function setWeights(weights:Weights):IntHashTheories
        {
            this.weights = weights;
            return this;
        }

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
                .setWeights(weights)
                .addMethod("get", hash.get)
                .addMethod("set", hash.set)
                .addMethod("clear", hash.clear)
                .addMethod("iterateKeys", hash.iterateKeys)
                .addMethod("iterateValues", hash.iterateValues)
                .make();
        }
    }
}