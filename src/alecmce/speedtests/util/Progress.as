package alecmce.speedtests.util
{
    public class Progress
    {
        private static const INDEX_NOT_SET:int = -1;

        private var total:int;
        private var position:int;

        public function setTotal(total:int):Progress
        {
            this.total = total;
            return this;
        }

        public function reset():Progress
        {
            position = 0;
            return this;
        }

        public function tick():Progress
        {
            ++position;
            return this;
        }

        public function getProportion():Number
        {
            return total ? position / total : 0;
        }

        public function getTotal():int
        {
            return total;
        }
    }
}
