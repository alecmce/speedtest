package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.method.api.MethodResults;

    public class WeightedResults
    {
        private var results:MethodResults;
        private var weight:Weight;

        public function setResults(results:MethodResults):WeightedResults
        {
            this.results = results;
            return this;
        }

        public function setWeight(weight:Weight):WeightedResults
        {
            this.weight = weight;
            return this;
        }

        public function getTotal():int
        {
            return results.getTotal();
        }

        public function getProportion():Number
        {
            return weight.getProportion();
        }

        public function getWeightedTotal():Number
        {
            return results.getTotal() * weight.getProportion();
        }

        public function getMean():Number
        {
            return results.getMean() * weight.getProportion();
        }
    }
}
