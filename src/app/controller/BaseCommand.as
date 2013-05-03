package app.controller
{
    import app.model.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class BaseCommand extends SimpleCommand implements ICommand
    {
        protected var state:StateProxy;
        protected var service:ServiceProxy;

        public function BaseCommand()
        {
            service = facade.retrieveProxy(ServiceProxy.NAME) as ServiceProxy;
            state = facade.retrieveProxy(StateProxy.NAME) as StateProxy;
            return;
        }// end function

    }
}
