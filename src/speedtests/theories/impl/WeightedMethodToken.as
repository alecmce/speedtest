package speedtests.theories.impl
{
    import speedtests.list.linkedlist.Item;
    import speedtests.list.linkedlist.LinkedList;
    import speedtests.method.MethodToken;

    public class WeightedMethodToken
    {
        private const results:LinkedList = new LinkedList();

        public var proportion:Number;
        public var token:MethodToken;

        private var isCalculated:Boolean;
        private var duration:int;
        private var proportionateDuration:Number;

        public function WeightedMethodToken(token:MethodToken)
        {
            this.token = token;
        }

        public function addResult(duration:int):WeightedMethodToken
        {
            results.append(new Item(duration));
            isCalculated = false;
            return this;
        }

        public function getProportionateDuration():Number
        {
            isCalculated || calculateProportiateDuration();
            return proportionateDuration;
        }

        private function calculateProportiateDuration():void
        {
            duration = 0;
            for (var item:Item = results.head; item; item = item.next)
                duration += item.data;

            proportionateDuration = duration * proportion;
            isCalculated = true;
        }

        public function reset():WeightedMethodToken
        {
            results.clear();
            return this;
        }

        public function toString():String
        {
            return "{name}: {pDuration} ({duration} @ {proportion})"
                .replace("{name}", token.name)
                .replace("{pDuration}", getProportionateDuration())
                .replace("{duration}", duration)
                .replace("{proportion}", proportion);
        }
    }
}
