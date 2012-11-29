package alecmce.speedtests.theories.impl
{
    import alecmce.speedtests.Token;
    import alecmce.speedtests.method.MethodToken;
    import alecmce.speedtests.theories.api.Theory;

    public class TheoryToken extends Token
    {
        public const results:TheoryResults = new TheoryResults();

        private var theory:Theory;

        public function setTheory(theory:Theory):TheoryToken
        {
            this.theory = theory;
            results.setMethods(theory.getMethods());
            return this;
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
                list[i] = data[i].method;

            return list;
        }

        public function getResults():TheoryResults
        {
            return results;
        }

        public function toString():String
        {
            const tokens:Vector.<WeightedMethodToken> = theory.getMethods();

            var lines:Array = [name + ": " + results.getWeightedTotal()];
            for each (var token:WeightedMethodToken in tokens)
                lines.push("\t" + token.toString());

            return lines.join("\n");
        }
    }
}
