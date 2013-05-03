package app.model
{
    import app.*;
    import flash.external.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;
    import org.puremvc.patterns.proxy.*;

    public class JavascriptProxy extends Proxy implements IProxy
    {
        public static const NAME:String = "JavascriptProxy";

        public function JavascriptProxy()
        {
            super(NAME);
            init();
            return;
        }// end function

        public function init() : void
        {
            ExternalInterface.addCallback("sendToActionscript", callFromJavaScript);
            return;
        }// end function

        public function callFromJavaScript(param1:uint)
        {
            facade.notifyObservers(new Notification(ApplicationFacade.JAVASCRIPT_CALL, param1));
            return;
        }// end function

    }
}
