package alecmce.ui.impl
{
    import alecmce.ui.api.UIComposite;
    import alecmce.ui.api.UIElement;

    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;

    internal class BaseUIComposite extends Sprite implements UIComposite
    {
        private var elements:Vector.<UIElement>;

        override public function addChild(object:DisplayObject):DisplayObject
        {
            if (object is UIElement)
                (elements ||= new Vector.<UIElement>()).push(object as UIElement);

            return super.addChild(object);
        }

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

        public function isInvalidated():Boolean
        {
            return elements && isElementInvalidated();
        }

        private function isElementInvalidated():Boolean
        {
            for each (var element:UIElement in elements)
            {
                if (element.isInvalidated())
                    return true;
            }

            return false;
        }

        final public function redraw():void
        {
            onRedraw();
            for each (var element:UIElement in elements)
                element.isInvalidated() && element.redraw();
        }

        protected function onRedraw():void
        {

        }
    }
}
