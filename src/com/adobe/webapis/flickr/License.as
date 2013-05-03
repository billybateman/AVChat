package com.adobe.webapis.flickr
{

    public class License extends Object
    {
        private var _id:int;
        private var _name:String;
        private var _url:String;
        public static const ALL_RIGHTS_RESERVED:int = 0;
        public static const ATTRIBUTION:int = 4;
        public static const ATTRIBUTION_NODERIVS:int = 6;
        public static const ATTRIBUTION_NONCOMMERCIAL_NODERIVS:int = 3;
        public static const ATTRIBUTION_NONCOMMERCIAL:int = 2;
        public static const ATTRIBUTION_NONCOMMERCIAL_SHAREALIKE:int = 1;
        public static const ATTRIBUTION_SHAREALIKE:int = 5;

        public function License()
        {
            return;
        }// end function

        public function get id() : int
        {
            return _id;
        }// end function

        public function set id(param1:int) : void
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
