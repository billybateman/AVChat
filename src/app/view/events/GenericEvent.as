package app.view.events
{
    import flash.events.*;

    public class GenericEvent extends Event
    {
        public var data:Object;

        public function GenericEvent(param1:String, param2)
        {
            super(param1, true);
            this.data = param2;
            return;
        }// end function

    }
}
