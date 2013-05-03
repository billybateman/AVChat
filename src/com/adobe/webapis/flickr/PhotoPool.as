package com.adobe.webapis.flickr
{

    public class PhotoPool extends Object
    {
        private var _id:String;
        private var _title:String;

        public function PhotoPool()
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

        public function get title() : String
        {
            return _title;
        }// end function

        public function set title(param1:String) : void
        {
            _title = param1;
            return;
        }// end function

    }
}
