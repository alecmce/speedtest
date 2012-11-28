package speedtests.list
{
    import speedtests.method.MethodToken;

    public class MethodResult
    {
        public var prev:MethodResult;
        public var next:MethodResult;

        public var token:MethodToken;
        public var duration:int;

        public function MethodResult(token:MethodToken)
        {
            this.token = token;
            duration = token.duration;
        }
    }
}
