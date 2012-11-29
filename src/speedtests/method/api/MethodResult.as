package speedtests.method.api
{
    public interface MethodResult
    {
        function add(duration:int):void;

        function getTotal():int;

        function getCount():int;

        function getMean():Number;
    }
}
