package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.method.impl.MethodToken;
    import alecmce.speedtests.method.impl.WeightedResults;

    public class WeightedMethodToken
    {
        private const results:WeightedResults = new WeightedResults();

        public var method:MethodToken;

        public function setMethod(method:MethodToken):WeightedMethodToken
        {
            this.method = method;
            results.setResults(method.getResults());
            return this;
        }

        public function setProportion(proportion:Number):WeightedMethodToken
        {
            results.setProportion(proportion);
            return this;
        }

        public function getResults():WeightedResults
        {
            return results;
        }

        public function toString():String
        {
            const pDuration:String = results.getWeightedTotal().toFixed(2);
            const proportion:String = results.getProportion().toFixed(2);
            const duration:String = results.getTotal().toString();

            return "{name}: {pDuration} ({duration} @ {proportion})"
                .replace("{name}", method.name)
                .replace("{pDuration}", pDuration)
                .replace("{duration}", duration)
                .replace("{proportion}", proportion);
        }
    }
}
