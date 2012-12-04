package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.method.impl.MethodToken;
    import alecmce.speedtests.method.impl.Weight;
    import alecmce.speedtests.theories.api.Theory;

    public class TheoryFactory
    {
        private const methods:Vector.<WeightedMethodToken> = new <WeightedMethodToken>[];
        private var before:Function;
        private var weights:Weights;

        public function setBefore(before:Function):TheoryFactory
        {
            this.before = before;
            return this;
        }

        public function setWeights(weights:Weights):TheoryFactory
        {
            this.weights = weights;
            return this;
        }

        public function addMethod(name:String, method:Function):TheoryFactory
        {
            methods.push(makeWeightedMethodToken(name, method));
            return this;
        }

        private function makeWeightedMethodToken(name:String, method:Function):WeightedMethodToken
        {
            const token:MethodToken = new MethodToken()
                .setMethod(method)
                .setName(name) as MethodToken;

            const weight:Weight = weights.getWeight(name);

            return new WeightedMethodToken()
                .setMethod(token)
                .setWeight(weight);
        }

        public function make():Theory
        {
            const theory:Theory = new TheoryBuilderTheory(before, methods);
            methods.length = 0;
            return theory;
        }
    }
}

import alecmce.speedtests.theories.api.Theory;
import alecmce.speedtests.theories.impl.WeightedMethodToken;

class TheoryBuilderTheory implements Theory
{
    private var before:Function;
    private var methods:Vector.<WeightedMethodToken>;

    public function TheoryBuilderTheory(before:Function, methods:Vector.<WeightedMethodToken>)
    {
        this.before = before;
        this.methods = methods.concat();
    }

    public function getBefore():Function
    {
        return before;
    }

    public function getMethods():Vector.<WeightedMethodToken>
    {
        return methods;
    }
}
