package app.controller
{
    import app.model.*;
    import org.puremvc.interfaces.*;

    public class StageUpdateCommand extends BaseCommand implements ICommand
    {

        public function StageUpdateCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            //var _loc_2:* = facade.retrieveProxy(StageProxy.NAME) as StageProxy;
            //_loc_2.update();
            return;
        }// end function

    }
}
