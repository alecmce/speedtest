package speedtests.theories.eg
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;

    import speedtests.theories.impl.TheorySpeedometer;
    import speedtests.theories.impl.TheoryToken;

    public class TheorySpeedoExample extends Sprite
    {
        private const THEORY_ITERATIONS:int = 100;
        private const METHOD_ITERATIONS:int = 1000;

        private const theories:IntHashTheories = makeTheories();
        private const speedo:TheorySpeedometer = makeSpeedometer();
        private const output:TextField = makeTextField();

        private function makeTheories():IntHashTheories
        {
            const theories:IntHashTheories = new IntHashTheories();
            theories.weightOfGet = 10;
            theories.weightOfSet = 10;
            theories.weightOfClear = 1;
            theories.weightOfIterateKeys = 1;
            theories.weightOfIterateValues = 3;
            return theories;
        }

        private function makeSpeedometer():TheorySpeedometer
        {
            const dictionary:TheoryToken = new TheoryToken("dictionary", theories.getDictionaryTheory());
            const vector:TheoryToken = new TheoryToken("vector", theories.getFixedVectorIntHash());
            const object:TheoryToken = new TheoryToken("object", theories.getObjectTheory());

            const speedo:TheorySpeedometer = new TheorySpeedometer();
            speedo
                .setTheoryCount(THEORY_ITERATIONS)
                .setMethodCount(METHOD_ITERATIONS)
                .addTheory(dictionary)
                .addTheory(vector)
                .addTheory(object)
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

        private function onResult(token:TheoryToken):void
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