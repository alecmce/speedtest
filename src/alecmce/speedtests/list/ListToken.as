package alecmce.speedtests.list
{
    import alecmce.speedtests.Token;
    import alecmce.speedtests.method.MethodToken;

    public class ListToken extends Token
    {
        private var theory:ListTheory;
        public var methods:Vector.<MethodToken>;
        public var proportions:ListProportions;
        public const durations:Vector.<int>;

        public function ListToken(name:String, theory:ListTheory, proportions:ListProportions)
        {
            super(name);
            this.theory = theory;
            this.proportions = proportions;
        }

        public function addDuration(method:MethodToken, duration:int):void
        {
            const index:int = methods.indexOf(method);
            if (durations.length <= index)
                durations.length = index + 1;

            durations[index] = duration;
        }
    }
}
