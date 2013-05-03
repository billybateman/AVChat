package app.controller
{
    import app.*;
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class GetSettingsCommand extends SimpleCommand implements ICommand
    {

        public function GetSettingsCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Get Settings Command: Execute");
            var _loc_2:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_3:* = _loc_2.getLocale() as Object;
            var _loc_4:* = _loc_3.basePath;
            sendNotification(ApplicationFacade.LOG, "Settings Path: " + _loc_4);
            var _loc_5:* = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            var _loc_6:* = (facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy).getSettings(_loc_4);
            return;
        }// end function

    }
}
