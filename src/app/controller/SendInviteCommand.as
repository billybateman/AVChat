package app.controller
{
    import app.*;
    import app.model.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class SendInviteCommand extends SimpleCommand implements ICommand
    {
        public var nc:NetConnection;

        public function SendInviteCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Send Invite Command: Execute");
            var _loc_2:* = param1.getBody() as Object;
            var _loc_3:* = facade.retrieveProxy(NetConnectionProxy.NAME) as NetConnectionProxy;
            nc = _loc_3.getNetConnection();
            nc.call("sendInvite", null, _loc_2);
            return;
        }// end function

    }
}
