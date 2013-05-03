package org.puremvc.patterns.proxy
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;

    public class Proxy extends Notifier implements IProxy, INotifier
    {
        protected var proxyName:String;
        protected var data:Object;
        public static var NAME:String = "Proxy";

        public function Proxy(param1:String = null, param2:Object = null)
        {
            this.proxyName = param1 != null ? (param1) : (NAME);
            if (param2 != null)
            {
                setData(param2);
            }
            return;
        }// end function

        public function getProxyName() : String
        {
            return proxyName;
        }// end function

        public function setData(param1:Object) : void
        {
            this.data = param1;
            return;
        }// end function

        public function getData() : Object
        {
            return data;
        }// end function

    }
}
