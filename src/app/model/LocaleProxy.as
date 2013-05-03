package app.model
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class LocaleProxy extends Proxy implements IProxy
    {
        public static const NAME:String = "LocaleProxy";

        public function LocaleProxy(param1:String, param2:Object)
        {
            trace("Setup Locale Proxy");
            super(param1, param2);
            return;
        }// end function

        public function getLocale() : Object
        {
            return data as Object;
        }// end function

        public function setLocale(param1)
        {
            data = param1;
            return;
        }// end function

        public function get locale() : Object
        {
            return data as Object;
        }// end function

    }
}
