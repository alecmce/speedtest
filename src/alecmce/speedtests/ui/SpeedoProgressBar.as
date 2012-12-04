package alecmce.speedtests.ui
{
    import alecmce.speedtests.util.Progress;

    import com.bit101.components.ProgressBar;

    import flash.display.Sprite;
    import flash.events.Event;

    public class SpeedoProgressBar extends Sprite
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

        public function setProgress(progress:Progress):SpeedoProgressBar
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
}
