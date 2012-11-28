package speedtests.method
{
    public class MethodTokenList
    {
        public var head:MethodToken;
        public var tail:MethodToken;

        public function add(token:MethodToken):MethodTokenList
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
