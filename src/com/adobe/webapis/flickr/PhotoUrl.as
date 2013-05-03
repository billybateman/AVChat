package com.adobe.webapis.flickr
{

    public class PhotoUrl extends Object
    {
        private var _type:String;
        private var _url:String;

        public function PhotoUrl()
        {
            return;
        }// end function

        public function get type() : String
        {
            return _type;
        }// end function

        public function set type(param1:String) : void
        {
            _type = param1;
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
