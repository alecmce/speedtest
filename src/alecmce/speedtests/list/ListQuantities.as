package alecmce.speedtests.list
{
    final internal class ListQuantities
    {
        public var append:int = 0;
        public var prefix:int = 0;
        public var pop:int = 0;
        public var shift:int = 0;
        public var iterateAll:int = 0;

        public function getProportions():ListProportions
        {
            var invCount:Number = 1/getCount();

            var p:ListProportions = new ListProportions();
            p.append = append * invCount;
            p.prefix = prefix * invCount;
            p.pop = pop * invCount;
            p.shift = shift * invCount;
            p.iterateAll = iterateAll * invCount;
            return p;
        }

        private function getCount():int
        {
            return append + prefix + pop + shift + iterateAll;
        }
    }
}
