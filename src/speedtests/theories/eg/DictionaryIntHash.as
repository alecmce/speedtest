package speedtests.theories.eg
{
    import flash.utils.Dictionary;

    public class DictionaryIntHash implements IntHashStructure
    {
        private const COUNT:int = 100;

        private var hash:Dictionary = new Dictionary();
        private var object:Object = {};

        public function before():void
        {
            for (var i:int = 0; i < COUNT; i++)
                hash[i] = object;
        }

        public function get():void
        {
            for (var i:int = 0; i < COUNT; i++)
                var object:Object = hash[i];
        }

        public function set():void
        {
            for (var i:int = 0; i < COUNT; i++)
                hash[i] = object;
        }

        public function clear():void
        {
            for (var i:int = 0; i < COUNT; i++)
                delete hash[i];
        }

        public function iterateValues():void
        {
            for each (var object:Object in hash)
                var value:Object = object;
        }

        public function iterateKeys():void
        {
            for (var string:String in hash)
                var key:int = int(string);
        }
    }
}
