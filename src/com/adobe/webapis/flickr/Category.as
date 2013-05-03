package com.adobe.webapis.flickr
{

    public class Category extends Object
    {
        private var _id:String;
        private var _name:String;
        private var _path:String;
        private var _pathIds:String;
        private var _count:int;
        private var _subCategories:Array;
        private var _groups:Array;

        public function Category()
        {
            _subCategories = new Array();
            _groups = new Array();
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

        public function get path() : String
        {
            return _path;
        }// end function

        public function set path(param1:String) : void
        {
            _path = param1;
            return;
        }// end function

        public function get pathIds() : String
        {
            return _pathIds;
        }// end function

        public function set pathIds(param1:String) : void
        {
            _pathIds = param1;
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

        public function get subCategories() : Array
        {
            return _subCategories;
        }// end function

        public function set subCategories(param1:Array) : void
        {
            _subCategories = param1;
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
