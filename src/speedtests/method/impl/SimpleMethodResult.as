package speedtests.method.impl
{
    import speedtests.method.api.MethodResults;

    public class SimpleMethodResult implements MethodResults
    {
        private var duration:int = 0;
        private var count:int = 0;

        public function add(duration:int):void
        {
            this.duration += duration;
            ++count;
        }

        public function getTotal():int
        {
            return duration;
        }

        public function getCount():int
        {
            return count;
        }

        public function getMean():Number
        {
            return count ? duration / count : 0;
        }

        public function getVariance():Number
        {
            return 0;
        }
    }
}
