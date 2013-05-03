package app.controller
{
    import app.*;
    import app.model.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class CreateRoomCommand extends SimpleCommand implements ICommand
    {
        private var nc:NetConnection;

        public function CreateRoomCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Room Create Command: Execute");
            var _loc_2:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_3:* = _loc_2.getLocale() as Object;
            var _loc_4:* = _loc_3.user;
            var _loc_5:* = param1.getBody() as Object;
            var _loc_6:* = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            var _loc_7:* = (facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy).getRoomsConnectionString() as String;
            var _loc_8:* = facade.retrieveProxy(StandardNetConnectionProxy.NAME) as StandardNetConnectionProxy;
            (facade.retrieveProxy(StandardNetConnectionProxy.NAME) as StandardNetConnectionProxy).onRegister();
            _loc_8.connect(_loc_7, _loc_4, _loc_5);
            return;
        }// end function

    }
}
