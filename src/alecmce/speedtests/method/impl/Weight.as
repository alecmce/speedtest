package alecmce.speedtests.method.impl
{
    import alecmce.speedtests.theories.impl.Weights;

    public class Weight
    {
        private var weights:Weights;
        private var total:int;
        private var name:String;

        public function setName(name:String):Weight
        {
            this.name = name;
            return this;
        }

        public function setWeights(weights:Weights):Weight
        {
            this.weights = weights;
            return this;
        }

        public function setTotal(total:int):Weight
        {
            this.total = total;
            return this;
        }

        public function getTotal():int
        {
            return total;
        }

        public function getProportion():Number
        {
            return total / weights.getTotal();
        }

        public function getName():String
        {
            return name;
        }
    }
}
