package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class UpdateLocalProxyCommand extends SimpleCommand implements ICommand
    {
        public var userObj:Object;

        public function UpdateLocalProxyCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Update Local Proxy Command: Execute");
            var _loc_2:* = param1.getBody() as Object;
            var _loc_3:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            _loc_3.setLocale(_loc_2);
            var _loc_4:* = facade.retrieveProxy(NetConnectionProxy.NAME) as NetConnectionProxy;
            (facade.retrieveProxy(NetConnectionProxy.NAME) as NetConnectionProxy).updateUser(_loc_2);
            return;
        }// end function

    }
}
