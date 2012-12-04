package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.method.api.MethodResults;

    public class WeightedResults
    {
        private var results:MethodResults;
        private var proportion:Number;

        public function setResults(results:MethodResults):WeightedResults
        {
            this.results = results;
            return this;
        }

        public function getTotal():int
        {
            return results.getTotal();
        }

        public function getProportion():Number
        {
            return proportion;
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
