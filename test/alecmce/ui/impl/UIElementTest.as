package alecmce.ui.impl
{
    import org.hamcrest.assertThat;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.isFalse;
    import org.hamcrest.object.isTrue;

    public class UIElementTest
    {
        private var ui:BaseUIElement;

        [Before]
        public function before():void
        {
            ui = new BaseUIElement();
        }

        [Test]
        public function afterInvalidateIsInvalidated():void
        {
            ui.invalidate();
            assertThat(ui.isInvalidated(), isTrue());
        }

        [Test]
        public function afterRedrawNotIsInvalidated():void
        {
            ui.invalidate();
            ui.redraw();
            assertThat(ui.isInvalidated(), isFalse());
        }

        [Test]
        public function setPositionUpdatesXYValues():void
        {
            ui.setPosition(3,5);
            assertThat(ui.x, equalTo(3));
            assertThat(ui.y,  equalTo(5));
        }

        [Test]
        public function setPositionDoesNotInvalidate():void
        {
            ui.setPosition(3, 5);
            assertThat(ui.isInvalidated(), isFalse());
        }
    }
}
