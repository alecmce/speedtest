package speedtests
{
    public class Token
    {
        public var prev:Token;
        public var next:Token;

        public var name:String;

        public function Token(name:String)
        {
            this.name = name;
        }
    }
}
