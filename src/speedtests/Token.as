package speedtests
{
    public class Token
    {
        public var prev:Token;
        public var next:Token;

        public var name:String;

        public function setName(name:String):Token
        {
            this.name = name;
            return this;
        }
    }
}
