package {
    import alecmce.speedtests.theories.eg.*;
    import alecmce.speedtests.theories.impl.TheorySpeedometer;
    import alecmce.speedtests.theories.impl.TheoryToken;
    import alecmce.speedtests.theories.impl.Weights;
    import alecmce.speedtests.ui.SpeedoProgressBar;
    import alecmce.speedtests.ui.WeightPieChart;
    import alecmce.speedtests.ui.WeightSliders;
    import alecmce.speedtests.util.Wait;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;

    [SWF(width="640", height="480", frameRate="60")]
    public class TheoryExample extends Sprite
    {
        private const THEORY_ITERATIONS:int = 100;
        private const METHOD_ITERATIONS:int = 1000;

        private const weights:Weights = makeWeights();
        private const theories:IntHashTheories = makeTheories();
        private const speedo:TheorySpeedometer = makeSpeedometer();
        private const progress:SpeedoProgressBar = makeProgress();
        private const output:TextField = makeTextField();
        private const sliders:WeightSliders = makeWeightSliders();
        private const pie:WeightPieChart = makePieChart();
        private const wait:Wait = new Wait().wait(2000, start);
        private const log:Array = [""];

        private function makeWeights():Weights
        {
            return new Weights()
                    .setWeight("get", 100)
                    .setWeight("set", 100)
                    .setWeight("clear", 100)
                    .setWeight("iterateKeys", 100)
                    .setWeight("iterateValues", 100);
        }

        private function makeTheories():IntHashTheories
        {
            return new IntHashTheories()
                .setWeights(weights);
        }

        private function makeSpeedometer():TheorySpeedometer
        {
            const dictionary:TheoryToken = makeDictionaryTheory();
            const vector:TheoryToken = makeVectorTheory();
            const object:TheoryToken = makeObjectTheory();

            const speedo:TheorySpeedometer = new TheorySpeedometer();
            speedo
                .setTheoryCount(THEORY_ITERATIONS)
                .setMethodCount(METHOD_ITERATIONS)
                .setTheories(new <TheoryToken>[dictionary, vector, object])
                .result.add(onResult);

            return speedo;
        }

        private function makeDictionaryTheory():TheoryToken
        {
            return new TheoryToken()
                    .setTheory(theories.getDictionaryTheory())
                    .setName("dictionary") as TheoryToken;
        }

        private function makeVectorTheory():TheoryToken
        {
            return new TheoryToken()
                    .setTheory(theories.getFixedVectorIntHash())
                    .setName("vector") as TheoryToken;
        }

        private function makeObjectTheory():TheoryToken
        {
            return new TheoryToken()
                    .setTheory(theories.getObjectTheory())
                    .setName("object") as TheoryToken;
        }

        private function makeProgress():SpeedoProgressBar
        {
            const progress:SpeedoProgressBar = new SpeedoProgressBar()
                .setProgress(speedo.progress);

            addChild(progress);
            return progress;
        }

        private function makeTextField():TextField
        {
            var output:TextField = new TextField();
            output.x = 20;
            output.y = 60;
            output.width = 600;
            output.height = 420;
            output.multiline = true;
            addChild(output);
            return output;
        }

        private function makeWeightSliders():WeightSliders
        {
            const sliders:WeightSliders = new WeightSliders()
                    .setWeights(weights);

            sliders.x = 500;
            sliders.y = 50;
            sliders.changed.add(onChanged);
            addChild(sliders);
            return sliders;
        }

        private function onChanged():void
        {
            pie.redraw();
        }

        private function makePieChart():WeightPieChart
        {
            const pie:WeightPieChart = new WeightPieChart()
                    .setWeights(weights)
                    .redraw();

            pie.alpha = 0.5;
            pie.x = 620 - pie.width;
            pie.y = 460 - pie.height;
            addChild(pie);
            return pie;
        }

        private function onResult(token:TheoryToken):void
        {
            log.push(token.toString(), "");
            output.text = log.join("\n");
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

            log[log.length - 1] = int(speedo.progress.getProportion() * 100) + "%";
            output.text = log.join("\n");
        }
    }
}








