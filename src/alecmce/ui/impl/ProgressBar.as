package alecmce.ui.impl
{
    import alecmce.speedtests.util.Progress;

    final public class ProgressBar extends BaseUIComposite
    {
        private static const DEFAULT_WIDTH:int = 100;
        private static const DEFAULT_HEIGHT:int = 6;
        private static const DEFAULT_PADDING:int = 1;
        private static const DEFAULT_BACKGROUND_COLOR:int = 0x666666;
        private static const DEFAULT_BAR_COLOR:int = 0xFFFFFF;

        private const background:ColoredRectangle = makeBackground();
        private const bar:ColoredRectangle = makeBar();

        private var padding:int = DEFAULT_PADDING;
        private var paddedWidth:int = DEFAULT_WIDTH - padding * 2;
        private var progress:Progress;
        private var proportion:Number = 0;

        public function setWidth(width:int):ProgressBar
        {
            background.setWidth(width);
            bar.invalidate();
            return this;
        }

        public function setHeight(height:int):ProgressBar
        {
            background.setHeight(height);
            bar.setHeight(height - 2 * padding);
            return this;
        }

        public function setBackgroundColor(color:int):ProgressBar
        {
            background.setColor(color);
            return this;
        }

        public function setBarColor(color:int):ProgressBar
        {
            bar.setColor(color);
            return this;
        }

        public function setPadding(padding:int):ProgressBar
        {
            this.padding = padding;
            bar.invalidate();
            return this;
        }

        public function setProgress(progress:Progress):ProgressBar
        {
            this.progress = progress;
            bar.invalidate();
            return this;
        }

        override public function isInvalidated():Boolean
        {
            return (progress && proportion != progress.getProportion()) || super.isInvalidated();
        }

        override protected function onRedraw():void
        {
            this.proportion = progress ? progress.getProportion() : 0;
            paddedWidth = width - 2 * padding;
            bar.setWidth(paddedWidth * proportion);
        }

        private function makeBackground():ColoredRectangle
        {
            return new ColoredRectangle()
                .setWidth(DEFAULT_WIDTH)
                .setHeight(DEFAULT_HEIGHT)
                .setColor(DEFAULT_BACKGROUND_COLOR)
                .addToDisplay(this) as ColoredRectangle;
        }

        private function makeBar():ColoredRectangle
        {
            return new ColoredRectangle()
                .setWidth(DEFAULT_WIDTH - DEFAULT_PADDING * 2)
                .setHeight(DEFAULT_HEIGHT - DEFAULT_PADDING * 2)
                .setColor(DEFAULT_BAR_COLOR)
                .setPosition(DEFAULT_PADDING, DEFAULT_PADDING)
                .addToDisplay(this) as ColoredRectangle;
        }
    }
}
