package speedtests.theories
{
    import speedtests.method.MethodToken;

    public class WeightedMethodToken
    {
        public var proportion:Number;
        public var token:MethodToken;

        public function WeightedMethodToken(token:MethodToken)
        {
            this.token = token;
        }
    }
}
