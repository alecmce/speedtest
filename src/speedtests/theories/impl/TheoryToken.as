package speedtests.theories.impl
{
    import speedtests.Token;
    import speedtests.method.MethodToken;
    import speedtests.theories.api.Theory;

    public class TheoryToken extends Token
    {
        private var theory:Theory;

        public function TheoryToken(name:String, theory:Theory)
        {
            super(name);
            this.theory = theory;
        }

        public function getBefore():Function
        {
            return theory.getBefore();
        }

        public function getMethods():Vector.<MethodToken>
        {
            const data:Vector.<WeightedMethodToken> = theory.getMethods();
            const count:uint = data.length;

            const list:Vector.<MethodToken> = new Vector.<MethodToken>(count, true);
            for (var i:int = 0; i < count; i++)
                list[i] = data[i].token;

            return list;
        }

        public function getDuration():int
        {
            const tokens:Vector.<WeightedMethodToken> = theory.getMethods();

            var duration:Number = 0;
            for each (var token:WeightedMethodToken in tokens)
                duration += token.getProportionateDuration();

            return int(duration);
        }

        public function toString():String
        {
            const tokens:Vector.<WeightedMethodToken> = theory.getMethods();

            var lines:Array = [name + ": " + getDuration()];
            for each (var token:WeightedMethodToken in tokens)
                lines.push("\t" + token.toString());

            return lines.join("\n");
        }

        public function reset():TheoryToken
        {
            const tokens:Vector.<WeightedMethodToken> = theory.getMethods();

            for each (var token:WeightedMethodToken in tokens)
                token.reset();

            return this;
        }
    }
}
