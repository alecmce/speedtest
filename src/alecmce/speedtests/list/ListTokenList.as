package alecmce.speedtests.list
{
    public class ListTokenList
    {
        public var head:ListToken;
        public var tail:ListToken;

        public function add(token:ListToken):ListTokenList
        {
            if (head)
            {
                tail.next = token;
                token.prev = tail;
                tail = token;
            }
            else
            {
                head = tail = token;
            }

            return this;
        }

        public function clear():void
        {
            head = tail = null;
        }
    }
}
