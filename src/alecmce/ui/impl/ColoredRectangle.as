package alecmce.ui.impl
{
    final public class ColoredRectangle extends BaseUIElement
    {
        private static const DEFAULT_WIDTH:int = 100;
        private static const DEFAULT_HEIGHT:int = 6;
        private static const DEFAULT_COLOR:uint = 0x666666;

        private var _width:int = DEFAULT_WIDTH;
        private var _height:int = DEFAULT_HEIGHT;
        private var color:uint = DEFAULT_COLOR;

        public function setWidth(width:int):ColoredRectangle
        {
            this._width = width;
            invalidate();
            return this;
        }

        public function setHeight(height:int):ColoredRectangle
        {
            this._height = height;
            invalidate();
            return this;
        }

        public function setColor(color:uint):ColoredRectangle
        {
            this.color = color;
            invalidate();
            return this;
        }

        override protected function onRedraw():void
        {
            graphics.clear();
            graphics.beginFill(color);
            graphics.drawRect(0, 0, _width, _height);
            graphics.endFill();
        }
    }
}
