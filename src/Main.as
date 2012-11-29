package
{
    import flash.display.Sprite;

    import speedtests.method.eg.MethodSpeedoExample;
    import speedtests.theories.eg.TheorySpeedoExample;

    public class Main extends Sprite
    {
        private const methods:MethodSpeedoExample = new MethodSpeedoExample();
        private const theories:TheorySpeedoExample= new TheorySpeedoExample();

        public function Main()
        {
//            runMethods();
            runTheories();
        }

        private function runMethods():void
        {
            addChild(methods);
            methods.start();
        }

        private function runTheories():void
        {
            addChild(theories);
            theories.start();
        }
    }
}
