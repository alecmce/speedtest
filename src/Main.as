package
{
    import alecmce.speedtests.method.eg.MethodSpeedoExample;
    import alecmce.speedtests.theories.eg.TheorySpeedoExample;
    import alecmce.ui.api.UIRoot;
    import alecmce.ui.impl.AutoRefreshRoot;
    import alecmce.ui.impl.ProgressBar;

    import flash.display.Sprite;

    public class Main extends Sprite
    {
        private const methods:MethodSpeedoExample = new MethodSpeedoExample();
        private const theories:TheorySpeedoExample= new TheorySpeedoExample();

        private const ui:UIRoot = makeRoot();
        private const progress:ProgressBar = makeProgressBar();

        private function makeRoot():UIRoot
        {
            return new AutoRefreshRoot()
                .addToContainer(this);
        }

        private function makeProgressBar():ProgressBar
        {
            return new ProgressBar()
                .setPosition(100, 100)
                .addToDisplay(ui) as ProgressBar;
        }

        public function Main()
        {
//            runMethods();
            runTheories();
        }

        private function runMethods():void
        {
            addChild(methods);
            progress.setProgress(methods.progress);
            methods.start();
        }

        private function runTheories():void
        {
            addChild(theories);
            progress.setProgress(theories.progress);
            theories.start();
        }
    }
}
