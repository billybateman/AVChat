package com.adobe.webapis.flickr
{

    public class Blog extends Object
    {
        private var _id:String;
        private var _name:String;
        private var _needsPassword:Boolean;
        private var _url:String;

        public function Blog()
        {
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
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

        public function get needsPassword() : Boolean
        {
            return _needsPassword;
        }// end function

        public function set needsPassword(param1:Boolean) : void
        {
            _needsPassword = param1;
            return;
        }// end function

        public function get url() : String
        {
            return _url;
        }// end function

        public function set url(param1:String) : void
        {
            _url = param1;
            return;
        }// end function

    }
}
