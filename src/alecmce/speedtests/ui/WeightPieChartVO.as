package alecmce.speedtests.ui
{
    import alecmce.speedtests.method.impl.Weight;

    public class WeightPieChartVO
    {
        private var weight:Weight;

        private var _label:String = "label";
        private var _value:Number = 1;
        public var color:uint = 0xFFEE00;

        public function setWeight(weight:Weight):WeightPieChartVO
        {
            this.weight = weight;
            return this;
        }

        public function get label():String
        {
            return weight.getName();
        }

        public function get value():Number
        {
            return weight.getProportion();
        }
    }
}
