package com.adobe.webapis.flickr
{

    public class PagedGroupList extends Object
    {
        private var _page:int;
        private var _pages:int;
        private var _perPage:int;
        private var _total:int;
        private var _groups:Array;

        public function PagedGroupList()
        {
            _groups = new Array();
            return;
        }// end function

        public function get page() : int
        {
            return _page;
        }// end function

        public function set page(param1:int) : void
        {
            _page = param1;
            return;
        }// end function

        public function get pages() : int
        {
            return _pages;
        }// end function

        public function set pages(param1:int) : void
        {
            _pages = param1;
            return;
        }// end function

        public function get perPage() : int
        {
            return _perPage;
        }// end function

        public function set perPage(param1:int) : void
        {
            _perPage = param1;
            return;
        }// end function

        public function get total() : int
        {
            return _total;
        }// end function

        public function set total(param1:int) : void
        {
            _total = param1;
            return;
        }// end function

        public function get groups() : Array
        {
            return _groups;
        }// end function

        public function set groups(param1:Array) : void
        {
            _groups = param1;
            return;
        }// end function

    }
}
