package app.controller
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.command.*;

    public class LogCommand extends SimpleCommand implements ICommand
    {

        public function LogCommand()
        {
            return;
        }// end function

        override public function execute(param1:INotification) : void
        {
            var _loc_2:* = param1.getBody() as String;
            trace(_loc_2);
            return;
        }// end function

    }
}
