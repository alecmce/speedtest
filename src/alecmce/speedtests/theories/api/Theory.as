package alecmce.speedtests.theories.api
{
    import alecmce.speedtests.theories.impl.WeightedMethodToken;

    public interface Theory
    {
        function getBefore():Function;

        function getMethods():Vector.<WeightedMethodToken>;
    }

}
