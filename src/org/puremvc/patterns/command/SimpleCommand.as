package org.puremvc.patterns.command
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;

    public class SimpleCommand extends Notifier implements ICommand, INotifier
    {

        public function SimpleCommand()
        {
            return;
        }// end function

        public function execute(param1:INotification) : void
        {
            return;
        }// end function

    }
}
