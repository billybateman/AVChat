package org.puremvc.patterns.mediator
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;

    public class Mediator extends Notifier implements IMediator, INotifier
    {
        protected var viewComponent:Object;
        public static const NAME:String = "Mediator";

        public function Mediator(param1:Object = null)
        {
            this.viewComponent = param1;
            return;
        }// end function

        public function getMediatorName() : String
        {
            return Mediator.NAME;
        }// end function

        public function getViewComponent() : Object
        {
            return viewComponent;
        }// end function

        public function listNotificationInterests() : Array
        {
            return [];
        }// end function

        public function handleNotification(param1:INotification) : void
        {
            return;
        }// end function

    }
}
