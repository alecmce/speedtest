package speedtests.method.eg
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;

    import speedtests.method.MethodSpeedometer;
    import speedtests.method.MethodToken;

    public class MethodSpeedoExample extends Sprite
    {
        private const ITERATIONS:int = 100000;

        private const iterators:ListIterators = new ListIterators();
        private const speedo:MethodSpeedometer = makeSpeedometer();
        private const output:TextField = makeTextField();

        private function makeSpeedometer():MethodSpeedometer
        {
            const loopThroughVector:MethodToken = new MethodToken("loopThroughVector", iterators.loopThroughVector);
            const loopThroughArray:MethodToken = new MethodToken("loopThroughArray", iterators.loopThroughArray);
            const loopThroughList:MethodToken = new MethodToken("loopThroughLinkedList", iterators.loopThroughLinkedList);

            const speedo:MethodSpeedometer = new MethodSpeedometer();
            speedo.setCount(ITERATIONS)
                  .addToken(loopThroughVector)
                  .addToken(loopThroughArray)
                  .addToken(loopThroughList)
                  .result.add(onResult);

            return speedo;
        }

        private function makeTextField():TextField
        {
            var output:TextField = new TextField();
            output.width = 800;
            output.height = 600;
            output.multiline = true;
            addChild(output);
            return output;
        }

        private function onResult(token:MethodToken):void
        {
            output.appendText(token.toString() + "\n");
        }

        private function onReady():void
        {
            if (speedo.hasNext())
                addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

        private function onEnterFrame(event:Event):void
        {
            speedo.next();
            if (!speedo.hasNext())
                removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        }

    }
}






