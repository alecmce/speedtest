package speedtests.method.api
{
    public interface MethodResults
    {
        function add(duration:int):void;

        function getTotal():int;

        function getCount():int;

        function getMean():Number;

        function getVariance():Number;
    }
}
