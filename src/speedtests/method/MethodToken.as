package speedtests.method
{
    import speedtests.Token;

    public class MethodToken extends Token
    {
        public var method:Function;
        public var duration:int;

        public function MethodToken(name:String, method:Function)
        {
            super(name);
            this.method = method;
        }

        final public function toString():String
        {
            return name + ": " + duration;
        }
    }
}
