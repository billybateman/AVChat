package com.adobe.webapis.flickr
{

    public class PhotoContext extends Object
    {
        private var _sets:Array;
        private var _pools:Array;

        public function PhotoContext()
        {
            _sets = new Array();
            _pools = new Array();
            return;
        }// end function

        public function get sets() : Array
        {
            return _sets;
        }// end function

        public function set sets(param1:Array) : void
        {
            _sets = param1;
            return;
        }// end function

        public function get pools() : Array
        {
            return _pools;
        }// end function

        public function set pools(param1:Array) : void
        {
            _pools = param1;
            return;
        }// end function

    }
}
