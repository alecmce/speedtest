package alecmce.speedtests.ui
{
    import alecmce.speedtests.method.impl.Weight;
    import alecmce.speedtests.theories.impl.Weights;

    import flash.display.Sprite;

    import org.osflash.signals.Signal;

    public class WeightSliders extends Sprite
    {
        public const changed:Signal = new Signal();

        private var weights:Weights;

        public function setWeights(weights:Weights):WeightSliders
        {
            this.weights && clearSliders();
            this.weights = weights;
            this.weights && makeSliders();
            return this;
        }

        private function clearSliders():void
        {
            var count:int = numChildren;
            while (count--)
            {
                const slider:WeightSlider = getChildAt(0) as WeightSlider;
                slider.changed.removeAll();
                removeChild(slider);
            }
        }

        private function makeSliders():void
        {
            const names:Vector.<String> = weights.getNames();
            const count:int = names.length;

            for (var i:int = 0; i < count; i++)
            {
                name = names[i];
                weights.hasName(name) && makeSlider(names[i], i);
            }
        }

        private function makeSlider(name:String, index:int):void
        {
            const weight:Weight = weights.getWeight(name);

            const slider:WeightSlider = new WeightSlider()
                .setLength(100)
                .setWeight(weight);

            slider.changed.add(onSliderChanged);
            slider.y = 20 * index;
            addChild(slider);
        }

        private function onSliderChanged():void
        {
            changed.dispatch();
        }
    }
}