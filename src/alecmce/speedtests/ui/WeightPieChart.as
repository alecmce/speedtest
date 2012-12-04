package alecmce.speedtests.ui
{
    import alecmce.speedtests.method.impl.Weight;
    import alecmce.speedtests.theories.impl.Weights;

    import com.bit101.charts.PieChart;

    import flash.display.Sprite;

    public class WeightPieChart extends Sprite
    {
        private const data:Array = [];
        private const pie:PieChart = makePieChart();
        private var weights:Weights;
        private var names:Vector.<String>;

        private function makePieChart():PieChart
        {
            const pie:PieChart = new PieChart(this, 0, 0);
            pie.data = data;
            pie.width = 250;
            pie.height = 150;
            addChild(pie);
            return pie;
        }

        public function setWeights(weights:Weights):WeightPieChart
        {
            this.weights = weights;
            populateDataAndRedraw();
            return this;
        }

        public function redraw():WeightPieChart
        {
            pie.draw();
            return this;
        }

        private function populateDataAndRedraw():void
        {
            names = weights.getNames();
            const count:int = names.length;

            data.length = count;
            for (var i:int = 0; i < count; i++)
            {
                const weight:Weight = weights.getWeight(names[i]);
                const vo:WeightPieChartVO = new WeightPieChartVO()
                    .setWeight(weight);

                data[i] = new WeightPieChartVO().setWeight(weight);
            }
        }
    }
}
