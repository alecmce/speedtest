package alecmce.speedtests.ui
{
    import alecmce.speedtests.method.impl.Weight;

    import com.bit101.components.HSlider;
    import com.bit101.components.Label;
    import com.bit101.components.Slider;

    import flash.display.Sprite;
    import flash.events.Event;

    import org.osflash.signals.Signal;

    public class WeightSlider extends Sprite
    {
        public const changed:Signal = new Signal();

        private var weight:Weight;
        private const slider:Slider = makeSlider();
        private const label:Label = makeLabel();
        private var length:int;

        public function setWeight(weight:Weight):WeightSlider
        {
            this.weight = weight;
            slider.value = weight.getTotal();
            redraw();
            return this;
        }

        public function setLength(length:int):WeightSlider
        {
            this.length = length;
            redraw();
            return this;
        }

        private function makeSlider():Slider
        {
            const slider:HSlider = new HSlider(this, 0, 0);
            slider.addEventListener(Event.CHANGE, onChange);
            slider.minimum = 0;
            slider.maximum = 250;
            slider.value = weight ? weight.getTotal() : 0;
            return slider;
        }

        private function onChange(event:Event):void
        {
            weight && weight.setTotal(slider.value);
            changed.dispatch();
        }

        private function makeLabel():Label
        {
            const label:Label = new Label(this, 0, 0);
            addChild(label);
            return label;
        }

        private function redraw():void
        {
            slider.width = length;

            label.text = weight ? weight.getName() : "[label]";
            label.draw();
            label.x = -label.width;
            label.y -= 3;
        }
    }
}
