package alecmce.speedtests.theories.impl
{
    import org.hamcrest.assertThat;
    import org.hamcrest.object.equalTo;

    import alecmce.speedtests.method.MethodToken;

    public class WeightedMethodTokenTest
    {
        private var weighted:WeightedMethodToken;

        [Before]
        public function before():void
        {
            weighted = new WeightedMethodToken();
        }

        [Test]
        public function resultPicksUpDataFromInnerMethod():void
        {
            const duration:int = 10;
            const proportion:Number = 0.5;

            var method:MethodToken = new MethodToken();
            method.addResult(duration);

            weighted
                .setMethod(method)
                .setProportion(proportion);

            assertThat(weighted.getResults().getWeightedTotal(), equalTo(duration * proportion));
        }
    }
}
