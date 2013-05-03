package com.adobe.webapis.flickr
{
    import flash.geom.*;

    public class PhotoNote extends Object
    {
        private var _id:String;
        private var _authorId:String;
        private var _authorName:String;
        private var _rectangle:Rectangle;
        private var _note:String;

        public function PhotoNote()
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

        public function get authorName() : String
        {
            return _authorName;
        }// end function

        public function set authorName(param1:String) : void
        {
            _authorName = param1;
            return;
        }// end function

        public function get rectangle() : Rectangle
        {
            return _rectangle;
        }// end function

        public function set rectangle(param1:Rectangle) : void
        {
            _rectangle = param1;
            return;
        }// end function

        public function get note() : String
        {
            return _note;
        }// end function

        public function set note(param1:String) : void
        {
            _note = param1;
            return;
        }// end function

    }
}
