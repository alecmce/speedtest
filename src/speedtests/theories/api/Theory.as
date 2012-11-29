package speedtests.theories.api
{
    import speedtests.theories.impl.WeightedMethodToken;

    public interface Theory
    {
        function getBefore():Function;

        function getMethods():Vector.<WeightedMethodToken>;
    }

}
