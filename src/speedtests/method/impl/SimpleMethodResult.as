package speedtests.method.impl
{
    import speedtests.method.api.MethodResult;

    public class SimpleMethodResult implements MethodResult
    {
        private var duration:int;
        private var count:int;

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
            return duration / count;
        }
    }
}
