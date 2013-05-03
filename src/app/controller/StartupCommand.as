package app.controller
{
    import app.*;
    import app.model.*;
    import app.view.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class StartupCommand extends SimpleCommand
    {

        public function StartupCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            sendNotification(ApplicationFacade.LOG, "Startup Command: Execute");
            var _loc_2:* = param1.getBody() as Main;
            facade.registerProxy(new SettingsProxy(_loc_2.stage));
            //facade.registerProxy(new StageProxy(_loc_2.stage, true));
            facade.registerProxy(new StateProxy());
            facade.registerProxy(new JavascriptProxy());
            facade.registerProxy(new NetConnectionProxy());
            facade.registerProxy(new SharedObjectProxy());
            facade.registerProxy(new StandardNetConnectionProxy());
            facade.registerProxy(new RoomsSharedObjectProxy());
            facade.registerProxy(new NetStreamProxy());
            facade.registerMediator(new ApplicationMediator(_loc_2));
            sendNotification(ApplicationFacade.GET_SETTINGS_CMD, _loc_2);
            return;
        }// end function

    }
}
