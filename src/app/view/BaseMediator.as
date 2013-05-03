package app.view
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.mediator.*;

    public class BaseMediator extends Mediator implements IMediator
    {
        private var _name:String = "";
        public static const NAME:String = "BaseMediator";

        public function BaseMediator(param1:String, param2:Object = null)
        {
            super(param2);
            _name = param1;
            return;
        }// end function

        override public function getMediatorName() : String
        {
            return _name;
        }// end function

    }
}
