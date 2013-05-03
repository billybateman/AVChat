package com.adobe.webapis.flickr
{

    public class NameValuePair extends Object
    {
        private var _name:String;
        private var _value:String;

        public function NameValuePair(param1:String = "", param2:String = "")
        {
            _name = param1;
            _value = param2;
            return;
        }// end function

        public function get name() : String
        {
            return _name;
        }// end function

        public function set name(param1:String) : void
        {
            _name = param1;
            return;
        }// end function

        public function get value() : String
        {
            return _value;
        }// end function

        public function set value(param1:String) : void
        {
            _value = param1;
            return;
        }// end function

    }
}
