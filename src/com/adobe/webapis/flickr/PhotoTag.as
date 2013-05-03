package com.adobe.webapis.flickr
{

    public class PhotoTag extends Object
    {
        private var _id:String;
        private var _authorId:String;
        private var _raw:String;
        private var _tag:String;
        private var _count:int;

        public function PhotoTag()
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

        public function get authorId() : String
        {
            return _authorId;
        }// end function

        public function set authorId(param1:String) : void
        {
            _authorId = param1;
            return;
        }// end function

        public function get raw() : String
        {
            return _raw;
        }// end function

        public function set raw(param1:String) : void
        {
            _raw = param1;
            return;
        }// end function

        public function get tag() : String
        {
            return _tag;
        }// end function

        public function set tag(param1:String) : void
        {
            _tag = param1;
            return;
        }// end function

        public function get count() : int
        {
            return _count;
        }// end function

        public function set count(param1:int) : void
        {
            _count = param1;
            return;
        }// end function

    }
}
