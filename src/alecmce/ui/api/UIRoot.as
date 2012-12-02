package alecmce.ui.api
{
    import flash.display.DisplayObjectContainer;

    public interface UIRoot extends UIComposite
    {
        function addToContainer(container:DisplayObjectContainer):UIRoot;

    }
}
