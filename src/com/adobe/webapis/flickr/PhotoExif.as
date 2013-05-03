package com.adobe.webapis.flickr
{

    public class PhotoExif extends Object
    {
        private var _tagspace:String;
        private var _tagspaceId:int;
        private var _tag:int;
        private var _label:String;
        private var _raw:String;
        private var _clean:String;

        public function PhotoExif()
        {
            return;
        }// end function

        public function get tagspace() : String
        {
            return _tagspace;
        }// end function

        public function set tagspace(param1:String) : void
        {
            _tagspace = param1;
            return;
        }// end function

        public function get tagspaceId() : int
        {
            return _tagspaceId;
        }// end function

        public function set tagspaceId(param1:int) : void
        {
            _tagspaceId = param1;
            return;
        }// end function

        public function get tag() : int
        {
            return _tag;
        }// end function

        public function set tag(param1:int) : void
        {
            _tag = param1;
            return;
        }// end function

        public function get label() : String
        {
            return _label;
        }// end function

        public function set label(param1:String) : void
        {
            _label = param1;
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

        public function get clean() : String
        {
            return _clean;
        }// end function

        public function set clean(param1:String) : void
        {
            _clean = param1;
            return;
        }// end function

    }
}
