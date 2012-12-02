package alecmce.ui.impl
{
    import alecmce.ui.api.UIComposite;
    import alecmce.ui.api.UIElement;

    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;

    internal class BaseUIElement extends Sprite implements UIElement
    {
        private var _isInvalidated:Boolean = false;

        final public function setPosition(x:int, y:int):UIElement
        {
            this.x = x;
            this.y = y;
            return this;
        }

        final public function addToDisplay(composite:UIComposite):UIElement
        {
            (composite as DisplayObjectContainer).addChild(this);
            return this;
        }

        final public function invalidate():void
        {
            _isInvalidated = true;
        }

        final public function isInvalidated():Boolean
        {
            return _isInvalidated;
        }

        final public function redraw():void
        {
            onRedraw();
            _isInvalidated = false;
        }

        protected function onRedraw():void
        {

        }
    }
}
