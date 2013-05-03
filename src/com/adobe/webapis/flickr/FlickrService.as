package com.adobe.webapis.flickr
{
    import com.adobe.crypto.*;
    import com.adobe.webapis.*;
    import com.adobe.webapis.flickr.methodgroups.*;
    import flash.net.*;

    public class FlickrService extends URLLoaderBase
    {
        private var _api_key:String;
        private var _secret:String;
        private var _token:String;
        private var _permission:String;
        private var _auth:Auth;
        private var _blogs:Blogs;
        private var _contacts:Contacts;
        private var _favorites:Favorites;
        private var _groups:Groups;
        private var _interestingness:Interestingness;
        private var _people:People;
        private var _photos:Photos;
        private var _photosets:PhotoSets;
        private var _pools:Pools;
        private var _tags:Tags;
        private var _test:Test;
        private var _urls:Urls;
        public static const END_POINT:String = "http://api.flickr.com/services/rest/?";
        public static const AUTH_END_POINT:String = "http://api.flickr.com/services/auth/?";

        public function FlickrService(param1:String)
        {
            _api_key = param1;
            _permission = AuthPerm.NONE;
            _token = "";
            _auth = new Auth(this);
            _blogs = new Blogs(this);
            _contacts = new Contacts(this);
            _favorites = new Favorites(this);
            _groups = new Groups(this);
            _interestingness = new Interestingness(this);
            _people = new People(this);
            _photos = new Photos(this);
            _photosets = new PhotoSets(this);
            _pools = new Pools(this);
            _tags = new Tags(this);
            _test = new Test(this);
            _urls = new Urls(this);
            return;
        }// end function

        public function get api_key() : String
        {
            return _api_key;
        }// end function

        public function set api_key(param1:String) : void
        {
            _api_key = param1;
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

        public function get token() : String
        {
            return _token;
        }// end function

        public function set token(param1:String) : void
        {
            _token = param1;
            return;
        }// end function

        public function get permission() : String
        {
            return _permission;
        }// end function

        public function set permission(param1:String) : void
        {
            _permission = param1;
            return;
        }// end function

        public function get auth() : Auth
        {
            return _auth;
        }// end function

        public function get blogs() : Blogs
        {
            return _blogs;
        }// end function

        public function get contacts() : Contacts
        {
            return _contacts;
        }// end function

        public function get favorites() : Favorites
        {
            return _favorites;
        }// end function

        public function get groups() : Groups
        {
            return _groups;
        }// end function

        public function get interestingness() : Interestingness
        {
            return _interestingness;
        }// end function

        public function get people() : People
        {
            return _people;
        }// end function

        public function get photos() : Photos
        {
            return _photos;
        }// end function

        public function get photosets() : PhotoSets
        {
            return _photosets;
        }// end function

        public function get pools() : Pools
        {
            return _pools;
        }// end function

        public function get tags() : Tags
        {
            return _tags;
        }// end function

        public function get test() : Test
        {
            return _test;
        }// end function

        public function get urls() : Urls
        {
            return _urls;
        }// end function

        public function getLoginURL(param1:String, param2:String) : String
        {
            var _loc_3:* = secret;
            _loc_3 = _loc_3 + ("api_key" + api_key);
            _loc_3 = _loc_3 + ("frob" + param1);
            _loc_3 = _loc_3 + ("perms" + param2);
            var _loc_4:* = AUTH_END_POINT;
            _loc_4 = AUTH_END_POINT + ("api_key=" + api_key);
            _loc_4 = _loc_4 + ("&frob=" + param1);
            _loc_4 = _loc_4 + ("&perms=" + param2);
            _loc_4 = _loc_4 + ("&api_sig=" + MD5.hash(_loc_3));
            return _loc_4;
        }// end function

        function get urlLoader() : URLLoader
        {
            return getURLLoader();
        }// end function

    }
}
