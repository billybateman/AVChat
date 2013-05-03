package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class ChatSendCommand extends SimpleCommand implements ICommand
    {

        public function ChatSendCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Chat Send Command: Execute");
            var _loc_2:* = param1.getBody() as Object;
            var _loc_3:* = facade.retrieveProxy(SharedObjectProxy.NAME) as SharedObjectProxy;
            _loc_3.sendChat(_loc_2);
            return;
        }// end function

    }
}
