package alecmce.speedtests.list
{
    import alecmce.speedtests.method.MethodSpeedometer;

    public interface ListTheory
    {
        function append():void;

        function prefix():void;

        function pop():void;

        function shift():void;

        function iterateAll():void;

        function getMethodSpeedometer():MethodSpeedometer;

    }
}
