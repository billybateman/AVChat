package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class RoomsConnectCommand extends SimpleCommand implements ICommand
    {

        public function RoomsConnectCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Rooms Connect Command: Execute");
            var _loc_2:* = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            var _loc_3:* = _loc_2.getRoomsConnectionString() as String;
            var _loc_4:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_5:* = (facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy).getLocale() as Object;
            var _loc_6:* = ((facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy).getLocale() as Object).user + "_client";
            var _loc_7:* = facade.retrieveProxy(StandardNetConnectionProxy.NAME) as StandardNetConnectionProxy;
            (facade.retrieveProxy(StandardNetConnectionProxy.NAME) as StandardNetConnectionProxy).onRegister();
            _loc_7.connect(_loc_3, _loc_6, null);
            return;
        }// end function

    }
}
