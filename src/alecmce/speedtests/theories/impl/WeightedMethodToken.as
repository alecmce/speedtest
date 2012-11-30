package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.method.impl.MethodToken;
    import alecmce.speedtests.method.impl.WeightedResults;

    public class WeightedMethodToken
    {
        private const results:WeightedResults = new WeightedResults();

        public var proportion:Number;
        public var method:MethodToken;

        private var duration:int;

        public function setMethod(method:MethodToken):WeightedMethodToken
        {
            this.method = method;
            results.setResults(method.getResults());
            return this;
        }

        public function setProportion(proportion:Number):WeightedMethodToken
        {
            this.proportion = proportion;
            results.setProportion(proportion);
            return this;
        }

        public function getResults():WeightedResults
        {
            return results;
        }

        public function toString():String
        {
            return "{name}: {pDuration} ({duration} @ {proportion})"
                .replace("{name}", method.name)
                .replace("{pDuration}", results.getWeightedTotal())
                .replace("{duration}", duration)
                .replace("{proportion}", proportion);
        }
    }
}
