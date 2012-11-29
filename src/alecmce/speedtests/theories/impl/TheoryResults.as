package alecmce.speedtests.theories.impl
{
    public class TheoryResults
    {
        private var methods:Vector.<WeightedMethodToken>;

        public function setMethods(methods:Vector.<WeightedMethodToken>):TheoryResults
        {
            this.methods = methods;
            return this;
        }

        public function getWeightedTotal():Number
        {
            var total:Number = 0;
            for each (var method:WeightedMethodToken in methods)
                total += method.getResults().getWeightedTotal();

            return total;
        }
    }
}
