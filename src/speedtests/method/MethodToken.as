package speedtests.method
{
    import speedtests.Token;
    import speedtests.method.api.MethodResults;
    import speedtests.method.impl.SimpleMethodResult;

    public class MethodToken extends Token
    {
        public var method:Function;
        private var results:MethodResults = new SimpleMethodResult();

        public function setMethod(method:Function):MethodToken
        {
            this.method = method;
            return this;
        }

        public function setResults(results:MethodResults):MethodToken
        {
            this.results = results;
            return this;
        }

        public function addResult(duration:int):void
        {
            results.add(duration);
        }

        public function getResults():MethodResults
        {
            return results;
        }

        final public function toString():String
        {
            return name + ": " + results.getMean();
        }
    }
}
