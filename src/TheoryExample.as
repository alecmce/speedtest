package {
    import alecmce.speedtests.theories.eg.*;
    import alecmce.speedtests.theories.impl.TheorySpeedometer;
    import alecmce.speedtests.theories.impl.TheoryToken;
    import alecmce.speedtests.util.Wait;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;

    [SWF(width="640", height="480", frameRate="60")]
    public class TheoryExample extends Sprite
    {
        private const THEORY_ITERATIONS:int = 100;
        private const METHOD_ITERATIONS:int = 1000;

        private const theories:IntHashTheories = makeTheories();
        private const speedo:TheorySpeedometer = makeSpeedometer();
        private const progress:SpeedoProgress = makeProgress();
        private const output:TextField = makeTextField();
        private const wait:Wait = new Wait().wait(2000, start);
        private const log:Array = [""];

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
            const dictionary:TheoryToken = new TheoryToken()
                    .setTheory(theories.getDictionaryTheory())
                    .setName("dictionary") as TheoryToken;

            const vector:TheoryToken = new TheoryToken()
                    .setTheory(theories.getFixedVectorIntHash())
                    .setName("vector") as TheoryToken;

            const object:TheoryToken = new TheoryToken()
                    .setTheory(theories.getObjectTheory())
                    .setName("object") as TheoryToken;

            const speedo:TheorySpeedometer = new TheorySpeedometer();
            speedo
                .setTheoryCount(THEORY_ITERATIONS)
                .setMethodCount(METHOD_ITERATIONS)
                .setTheories(new <TheoryToken>[dictionary, vector, object])
                .result.add(onResult);

            return speedo;
        }

        private function makeProgress():SpeedoProgress
        {
            const progress:SpeedoProgress = new SpeedoProgress()
                .setProgress(speedo.progress);

            addChild(progress);
            return progress;
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

import alecmce.speedtests.util.Progress;

import com.bit101.components.ProgressBar;

import flash.display.Sprite;
import flash.events.Event;

class SpeedoProgress extends Sprite
{
    private var progress:Progress;

    private const bar:ProgressBar = makeProgress();
    private function makeProgress():ProgressBar
    {
        const bar:ProgressBar = new ProgressBar();
        bar.maximum = 1;
        bar.x = 20;
        bar.y = 20;
        bar.width = 600;
        addChild(bar);
        return bar;
    }

    public function setProgress(progress:Progress):SpeedoProgress
    {
        progress && removeEventListener(Event.ENTER_FRAME, iterate);
        this.progress = progress;
        progress && addEventListener(Event.ENTER_FRAME, iterate);
        return this;
    }

    private function iterate(event:Event):void
    {
        bar.value = progress.getProportion();
    }
}