package com.adobe.webapis.flickr
{

    public class PhotoCount extends Object
    {
        private var _count:int;
        private var _fromDate:Date;
        private var _toDate:Date;

        public function PhotoCount()
        {
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

        public function get fromDate() : Date
        {
            return _fromDate;
        }// end function

        public function set fromDate(param1:Date) : void
        {
            _fromDate = param1;
            return;
        }// end function

        public function get toDate() : Date
        {
            return _toDate;
        }// end function

        public function set toDate(param1:Date) : void
        {
            _toDate = param1;
            return;
        }// end function

    }
}
