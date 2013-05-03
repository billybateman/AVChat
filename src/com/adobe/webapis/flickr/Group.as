package com.adobe.webapis.flickr
{

    public class Group extends Object
    {
        private var _nsid:String;
        private var _name:String;
        private var _description:String;
        private var _privacy:int;
        private var _members:int;
        private var _online:int;
        private var _chatNsid:String;
        private var _inChat:int;
        private var _isEighteenPlus:Boolean;
        private var _isAdmin:Boolean;
        private var _photos:int;
        private var _iconServer:int;
        private var _url:String;

        public function Group()
        {
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

        public function get name() : String
        {
            return _name;
        }// end function

        public function set name(param1:String) : void
        {
            _name = param1;
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

        public function get privacy() : int
        {
            return _privacy;
        }// end function

        public function set privacy(param1:int) : void
        {
            _privacy = param1;
            return;
        }// end function

        public function get members() : int
        {
            return _members;
        }// end function

        public function set members(param1:int) : void
        {
            _members = param1;
            return;
        }// end function

        public function get online() : int
        {
            return _online;
        }// end function

        public function set online(param1:int) : void
        {
            _online = param1;
            return;
        }// end function

        public function get chatNsid() : String
        {
            return _chatNsid;
        }// end function

        public function set chatNsid(param1:String) : void
        {
            _chatNsid = param1;
            return;
        }// end function

        public function get inChat() : int
        {
            return _inChat;
        }// end function

        public function set inChat(param1:int) : void
        {
            _inChat = param1;
            return;
        }// end function

        public function get isEighteenPlus() : Boolean
        {
            return _isEighteenPlus;
        }// end function

        public function set isEighteenPlus(param1:Boolean) : void
        {
            _isEighteenPlus = param1;
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

        public function get photos() : int
        {
            return _photos;
        }// end function

        public function set photos(param1:int) : void
        {
            _photos = param1;
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
