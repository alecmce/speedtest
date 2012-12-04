package alecmce.speedtests.util
{
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    public class Wait
    {
        private const timer:Timer = new Timer(2000, 1);
        private var method:Function;

        private function onTimerComplete(event:TimerEvent):void
        {
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
            method && method();
        }

        public function wait(time:int, method:Function):Wait
        {
            this.method = method;

            timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
            timer.delay = time;
            timer.reset();
            timer.start();
            return this;
        }

    }
}
