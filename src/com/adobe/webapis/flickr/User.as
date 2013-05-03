package com.adobe.webapis.flickr
{

    public class User extends Object
    {
        private var _nsid:String;
        private var _username:String;
        private var _fullname:String;
        private var _isPro:Boolean;
        private var _bandwidthMax:Number;
        private var _bandwidthUsed:Number;
        private var _filesizeMax:Number;
        private var _url:String;
        private var _isIgnored:Boolean;
        private var _isFriend:Boolean;
        private var _isFamily:Boolean;
        private var _isAdmin:Boolean;
        private var _iconServer:int;
        private var _mboxSha1Sum:String;
        private var _location:String;
        private var _photoUrl:String;
        private var _profileUrl:String;
        private var _firstPhotoUploadDate:Date;
        private var _firstPhotoTakenDate:Date;
        private var _photoCount:int;
        private var _tags:Array;

        public function User()
        {
            _tags = new Array();
            return;
        }// end function

        public function get nsid() : String
        {
            return _nsid;
        }// end function

        public function set nsid(param1:String) : void
        {
            _nsid = param1;
            return;
        }// end function

        public function get username() : String
        {
            return _username;
        }// end function

        public function set username(param1:String) : void
        {
            _username = param1;
            return;
        }// end function

        public function get fullname() : String
        {
            return _fullname;
        }// end function

        public function set fullname(param1:String) : void
        {
            _fullname = param1;
            return;
        }// end function

        public function get isPro() : Boolean
        {
            return _isPro;
        }// end function

        public function set isPro(param1:Boolean) : void
        {
            _isPro = param1;
            return;
        }// end function

        public function get bandwidthMax() : Number
        {
            return _bandwidthMax;
        }// end function

        public function set bandwidthMax(param1:Number) : void
        {
            _bandwidthMax = param1;
            return;
        }// end function

        public function get bandwidthUsed() : Number
        {
            return _bandwidthUsed;
        }// end function

        public function set bandwidthUsed(param1:Number) : void
        {
            _bandwidthUsed = param1;
            return;
        }// end function

        public function get filesizeMax() : Number
        {
            return _filesizeMax;
        }// end function

        public function set filesizeMax(param1:Number) : void
        {
            _filesizeMax = param1;
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

        public function get isIgnored() : Boolean
        {
            return _isIgnored;
        }// end function

        public function set isIgnored(param1:Boolean) : void
        {
            _isIgnored = param1;
            return;
        }// end function

        public function get isFamily() : Boolean
        {
            return _isFamily;
        }// end function

        public function set isFamily(param1:Boolean) : void
        {
            _isFamily = param1;
            return;
        }// end function

        public function get isFriend() : Boolean
        {
            return _isFriend;
        }// end function

        public function set isFriend(param1:Boolean) : void
        {
            _isFriend = param1;
            return;
        }// end function

        public function get isAdmin() : Boolean
        {
            return _isAdmin;
        }// end function

        public function set isAdmin(param1:Boolean) : void
        {
            _isAdmin = param1;
            return;
        }// end function

        public function get iconServer() : int
        {
            return _iconServer;
        }// end function

        public function set iconServer(param1:int) : void
        {
            _iconServer = param1;
            return;
        }// end function

        public function get mboxSha1Sum() : String
        {
            return _mboxSha1Sum;
        }// end function

        public function set mboxSha1Sum(param1:String) : void
        {
            _mboxSha1Sum = param1;
            return;
        }// end function

        public function get location() : String
        {
            return _location;
        }// end function

        public function set location(param1:String) : void
        {
            _location = param1;
            return;
        }// end function

        public function get photoUrl() : String
        {
            return _photoUrl;
        }// end function

        public function set photoUrl(param1:String) : void
        {
            _photoUrl = param1;
            return;
        }// end function

        public function get profileUrl() : String
        {
            return _profileUrl;
        }// end function

        public function set profileUrl(param1:String) : void
        {
            _profileUrl = param1;
            return;
        }// end function

        public function get firstPhotoUploadDate() : Date
        {
            return _firstPhotoUploadDate;
        }// end function

        public function set firstPhotoUploadDate(param1:Date) : void
        {
            _firstPhotoUploadDate = param1;
            return;
        }// end function

        public function get firstPhotoTakenDate() : Date
        {
            return _firstPhotoTakenDate;
        }// end function

        public function set firstPhotoTakenDate(param1:Date) : void
        {
            _firstPhotoTakenDate = param1;
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

        public function get tags() : Array
        {
            return _tags;
        }// end function

        public function set tags(param1:Array) : void
        {
            _tags = param1;
            return;
        }// end function

    }
}
