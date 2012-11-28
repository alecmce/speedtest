package speedtests.list.theories
{
    import speedtests.list.ListTheory;

    import speedtests.method.MethodSpeedometer;
    import speedtests.method.MethodToken;

    public class NullListTheory implements ListTheory
    {
        public function append():void {}
        public function prefix():void {}
        public function pop():void {}
        public function shift():void {}
        public function iterateAll():void {}

        final public function getMethodSpeedometer():MethodSpeedometer
        {
            const append:MethodToken = new MethodToken("append", append);
            const iterateAll:MethodToken = new MethodToken("iterateAll", iterateAll);
            const pop:MethodToken = new MethodToken("pop", pop);
            const prefix:MethodToken = new MethodToken("prefix", prefix);
            const shift:MethodToken = new MethodToken("shift", shift);

            return new MethodSpeedometer()
                    .addToken(append)
                    .addToken(iterateAll)
                    .addToken(pop)
                    .addToken(prefix)
                    .addToken(shift);
        }
    }
}
