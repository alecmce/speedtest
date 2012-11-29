package alecmce.speedtests.list
{
    import alecmce.speedtests.list.theories.ArrayListTheory;

    public class ListsTest
    {
        private const speedo:ListSpeedometer = new ListSpeedometer();

        private var theory:ListTheory;
        private var quantities:Quantities;
        private var proportions:Proportions;

        public function setTheory(theory:ListTheory):ListsTest
        {
            this.theory = theory;
            return this;
        }

        public function setQuantities(quantities:Quantities):ListsTest
        {
            this.quantities = quantities;
            return this;
        }

        public function start():void
        {
            speedo.result.add(onResult);

            const arrayList:ListToken = new ListToken("arrayList", new ArrayListTheory());

            speedo
                .addToken(append)
                .addToken(iterateAll)
                .addToken(pop)
                .addToken(prefix)
                .addToken(shift)
                .start();
        }

        private function onResult(method:MethodResult, duration:int):void
        {

        }
    }
}

class Quantities
{
    public var append:int = 0;
    public var prefix:int = 0;
    public var pop:int = 0;
    public var shift:int = 0;
    public var iterateAll:int = 0;

    public function getCount():int
    {
        return append + prefix + pop + shift + iterateAll;
    }
}

class Proportions
{
    public var append:Number = 0.0;
    public var prefix:Number = 0.0;
    public var pop:Number = 0.0;
    public var shift:Number = 0.0;
    public var iterateAll:Number = 0.0;
    
    public function Proportions(quantities:Quantities)
    {
        var invCount:Number = 1/quantities.getCount();

        append = quantities.append * invCount;
        prefix = quantities.prefix * invCount;
        pop = quantities.pop * invCount;
        shift = quantities.shift * invCount;
        iterateAll = quantities.iterateAll * invCount;
    }
}