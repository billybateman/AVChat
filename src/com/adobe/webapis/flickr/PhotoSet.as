package com.adobe.webapis.flickr
{

    public class PhotoSet extends Object
    {
        private var _id:String;
        private var _title:String;
        private var _url:String;
        private var _description:String;
        private var _photoCount:int;
        private var _primaryPhotoId:String;
        private var _ownerId:String;
        private var _secret:String;
        private var _server:int;
        private var _photos:Array;

        public function PhotoSet()
        {
            _photos = new Array();
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

        public function get url() : String
        {
            return _url;
        }// end function

        public function set url(param1:String) : void
        {
            _url = param1;
            return;
        }// end function

        public function get description() : String
        {
            return _description;
        }// end function

        public function set description(param1:String) : void
        {
            _description = param1;
            return;
        }// end function

        public function get photoCount() : int
        {
            return _photoCount;
        }// end function

        public function set photoCount(param1:int) : void
        {
            _photoCount = param1;
            return;
        }// end function

        public function get primaryPhotoId() : String
        {
            return _primaryPhotoId;
        }// end function

        public function set primaryPhotoId(param1:String) : void
        {
            _primaryPhotoId = param1;
            return;
        }// end function

        public function get ownerId() : String
        {
            return _ownerId;
        }// end function

        public function set ownerId(param1:String) : void
        {
            _ownerId = param1;
            return;
        }// end function

        public function get secret() : String
        {
            return _secret;
        }// end function

        public function set secret(param1:String) : void
        {
            _secret = param1;
            return;
        }// end function

        public function get server() : int
        {
            return _server;
        }// end function

        public function set server(param1:int) : void
        {
            _server = param1;
            return;
        }// end function

        public function get photos() : Array
        {
            return _photos;
        }// end function

        public function set photos(param1:Array) : void
        {
            _photos = param1;
            return;
        }// end function

    }
}
