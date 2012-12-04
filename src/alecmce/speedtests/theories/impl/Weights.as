package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.method.impl.Weight;

    public class Weights
    {
        private const weights:Object = new Object();
        private var isInvalidated:Boolean;
        private var total:int;

        public function setWeight(name:String, value:int):Weights
        {
            const weight:Weight = new Weight()
                .setName(name)
                .setWeights(this)
                .setTotal(value);

            weights[name] = weight;
            isInvalidated = true;
            return this;
        }

        public function getWeight(name:String):Weight
        {
            return weights[name];
        }

        public function getTotal():int
        {
            isInvalidated && calculateTotal();
            return total;
        }

        private function calculateTotal():void
        {
            total = 0;
            for each (var weight:Weight in weights)
                total += weight.getTotal();

            isInvalidated = false;
        }

        public function hasName(name:String):Boolean
        {
            return weights[name] != null;
        }

        public function getNames():Vector.<String>
        {
            const names:Vector.<String> = new <String>[];
            for (var name:String in weights)
                names.push(name);

            return names;
        }
    }
}
