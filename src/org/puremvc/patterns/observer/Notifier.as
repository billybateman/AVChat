package org.puremvc.patterns.observer
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.facade.*;

    public class Notifier extends Object
    {
        protected var facade:IFacade;

        public function Notifier()
        {
            facade = Facade.getInstance();
            return;
        }// end function

        public function sendNotification(param1:String, param2:Object = null, param3:String = null) : void
        {
            facade.notifyObservers(new Notification(param1, param2, param3));
            return;
        }// end function

    }
}
