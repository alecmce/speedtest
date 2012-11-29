package speedtests.method.impl
{
    import speedtests.method.api.MethodResults;

    public class WeightedResults
    {
        private var results:MethodResults;
        private var proportion:Number;

        public function setResults(results:MethodResults):WeightedResults
        {
            this.results = results;
            return this;
        }

        public function setProportion(proportion:Number):WeightedResults
        {
            this.proportion = proportion;
            return this;
        }

        public function getWeightedTotal():Number
        {
            return results.getTotal() * proportion;
        }

        public function getMean():Number
        {
            return results.getMean() * proportion;
        }
    }
}
