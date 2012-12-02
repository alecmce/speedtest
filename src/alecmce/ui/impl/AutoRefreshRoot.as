package alecmce.ui.impl
{
    import alecmce.ui.api.UIRoot;

    import flash.display.DisplayObjectContainer;
    import flash.events.Event;

    final public class AutoRefreshRoot extends BaseUIComposite implements UIRoot
    {
        private var container:DisplayObjectContainer;

        public function addToContainer(container:DisplayObjectContainer):UIRoot
        {
            this.container && tearDown(container);
            this.container = container;
            this.container && setup(container);
            container.addChild(this);

            return this;
        }

        private function setup(container:DisplayObjectContainer):void
        {
            container.addEventListener(Event.ENTER_FRAME, iterate);
            container.addChild(this);
        }

        private function tearDown(container:DisplayObjectContainer):void
        {
            container.removeChild(this);
            container.removeEventListener(Event.ENTER_FRAME, iterate);
        }

        private function iterate(event:Event):void
        {
            isInvalidated() && redraw();
        }

    }
}
