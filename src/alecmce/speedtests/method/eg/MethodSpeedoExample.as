package alecmce.speedtests.method.eg
{
    import alecmce.speedtests.method.impl.MethodSpeedometer;
    import alecmce.speedtests.method.impl.MethodToken;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;

    public class MethodSpeedoExample extends Sprite
    {
        private const ITERATIONS:int = 100000;

        private const iterators:ListIterators = new ListIterators();
        private const speedo:MethodSpeedometer = makeSpeedometer();
        private const output:TextField = makeTextField();

        private function makeSpeedometer():MethodSpeedometer
        {
            const loopThroughVector:MethodToken = new MethodToken()
                    .setMethod(iterators.loopThroughVector)
                    .setName("loopThroughVector") as MethodToken;

            const loopThroughArray:MethodToken = new MethodToken()
                    .setMethod(iterators.loopThroughArray)
                    .setName("loopThroughArray") as MethodToken;

            const loopThroughList:MethodToken = new MethodToken()
                    .setMethod(iterators.loopThroughLinkedList)
                    .setName("loopThroughLinkedList") as MethodToken;

            const speedo:MethodSpeedometer = new MethodSpeedometer();
            speedo.setCount(ITERATIONS)
                  .addMethod(loopThroughVector)
                  .addMethod(loopThroughArray)
                  .addMethod(loopThroughList)
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

        public function start():void
        {
            speedo.reset();
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






