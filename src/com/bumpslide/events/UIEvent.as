package com.bumpslide.events
{
    import flash.events.*;

    public class UIEvent extends Event
    {
        private var _data:Object;

        public function UIEvent(param1:String, param2:Object = null)
        {
            super(param1, true);
            _data = param2;
            return;
        }// end function

        public function get data() : Object
        {
            return _data;
        }// end function

    }
}
