package speedtests.method
{
    import speedtests.Token;
    import speedtests.method.api.MethodResult;
    import speedtests.method.impl.SimpleMethodResult;

    public class MethodToken extends Token
    {
        public var method:Function;
        private var results:MethodResult;

        public function MethodToken(name:String, method:Function, results:MethodResult = null)
        {
            super(name);
            this.method = method;
            this.results = results || new SimpleMethodResult();
        }

        public function addResult(duration:int):void
        {
            results.add(duration);
        }

        final public function toString():String
        {
            return name + ": " + results.getMean();
        }
    }
}
