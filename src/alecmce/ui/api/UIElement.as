package alecmce.ui.api
{
    public interface UIElement
    {
        function setPosition(x:int, y:int):UIElement;

        function addToDisplay(composite:UIComposite):UIElement;

        function isInvalidated():Boolean;

        function redraw():void;
    }
}
