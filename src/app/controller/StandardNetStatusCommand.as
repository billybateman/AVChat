package app.controller
{
    import app.*;
    import app.model.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class StandardNetStatusCommand extends SimpleCommand implements ICommand
    {

        public function StandardNetStatusCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            var _loc_4:RoomsSharedObjectProxy = null;
            var _loc_2:* = Object(param1.getBody()).status;
            var _loc_3:* = Object(param1.getBody()).nc;
            sendNotification(ApplicationFacade.LOG, "Standard Net Status Command: " + _loc_2);
            if (_loc_2 == "success")
            {
                sendNotification(ApplicationFacade.STANDARD_NET_CONNECTION, _loc_3);
                _loc_4 = facade.retrieveProxy(RoomsSharedObjectProxy.NAME) as RoomsSharedObjectProxy;
                _loc_4.connect(_loc_3);
            }
            return;
        }// end function

    }
}
