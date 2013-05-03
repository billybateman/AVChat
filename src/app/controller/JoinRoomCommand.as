package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class JoinRoomCommand extends SimpleCommand implements ICommand
    {

        public function JoinRoomCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Join Room Command: Execute");
            var _loc_2:* = param1.getBody() as Object;
            var _loc_3:* = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            var _loc_4:* = _loc_3.getConnectionString() as String;
            var _loc_5:* = _loc_3.getRoomsConnectionString() as String;
            _loc_3.setRoomObject(_loc_2);
            _loc_4 = _loc_4 + "/" + _loc_2.id;
            var _loc_6:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_7:* = (facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy).getLocale() as Object;
            var _loc_8:* = new Object();
            new Object().user = _loc_7.user;
            _loc_8.audio = _loc_7.audio;
            _loc_8.video = _loc_7.video;
            var _loc_9:* = facade.retrieveProxy(NetConnectionProxy.NAME) as NetConnectionProxy;
            (facade.retrieveProxy(NetConnectionProxy.NAME) as NetConnectionProxy).disconnect();
            _loc_9.onRegister();
            _loc_9.connect(_loc_4, _loc_5, _loc_8);
            return;
        }// end function

    }
}
