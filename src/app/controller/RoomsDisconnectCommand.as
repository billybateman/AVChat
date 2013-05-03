package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class RoomsDisconnectCommand extends SimpleCommand implements ICommand
    {

        public function RoomsDisconnectCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Rooms Disconnect Command: Execute");
            var _loc_2:* = facade.retrieveProxy(StandardNetConnectionProxy.NAME) as StandardNetConnectionProxy;
            _loc_2.disconnect();
            return;
        }// end function

    }
}
