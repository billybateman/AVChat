package app.model
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;
    import org.puremvc.patterns.proxy.*;

    public class StateProxy extends Proxy implements IProxy
    {
        public static const NAME:String = "StateProxy";

        public function StateProxy()
        {
            super(NAME, null);
            return;
        }// end function

        private function notifyChanged(param1:String) : void
        {
            var _loc_2:* = new Notification("statechange_" + param1, this[param1]);
            facade.notifyObservers(_loc_2);
            return;
        }// end function

    }
}
