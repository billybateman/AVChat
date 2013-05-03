package com.adobe.webapis.flickr
{

    public class AuthResult extends Object
    {
        private var _token:String;
        private var _perms:String;
        private var _user:User;

        public function AuthResult()
        {
            perms = AuthPerm.NONE;
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

        public function get perms() : String
        {
            return _perms;
        }// end function

        public function set perms(param1:String) : void
        {
            _perms = param1;
            return;
        }// end function

        public function get user() : User
        {
            return _user;
        }// end function

        public function set user(param1:User) : void
        {
            _user = param1;
            return;
        }// end function

    }
}
