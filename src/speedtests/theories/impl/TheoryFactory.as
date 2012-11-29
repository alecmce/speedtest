package speedtests.theories.impl
{
    import speedtests.method.MethodToken;
    import speedtests.theories.api.Theory;

    public class TheoryFactory
    {
        private var before:Function;
        private const methods:Vector.<WeightedMethodToken> = new <WeightedMethodToken>[];
        private const weights:Vector.<int> = new <int>[];

        public function setBefore(before:Function):TheoryFactory
        {
            this.before = before;
            return this;
        }

        public function addMethod(name:String, method:Function, weight:int):TheoryFactory
        {
            var token:MethodToken = new MethodToken(name, method);
            var weighted:WeightedMethodToken = new WeightedMethodToken(token);
            methods.push(weighted);
            weights.push(weight);
            return this;
        }

        public function make():Theory
        {
            setProportions();
            const theory:Theory = new TheoryBuilderTheory(before, methods);
            reset();
            return theory;
        }

        private function setProportions():void
        {
            const sum:int = sumWeights();
            const count:int = weights.length;
            for (var i:int = 0; i < count; i++)
                methods[i].proportion = weights[i] / sum;
        }

        private function sumWeights():int
        {
            var count:int = 0;
            for each (var weight:int in weights)
                count += weight;

            return count;
        }

        private function reset():void
        {
            methods.length = 0;
            weights.length = 0;
        }
    }
}

import speedtests.theories.api.Theory;
import speedtests.theories.impl.WeightedMethodToken;

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
