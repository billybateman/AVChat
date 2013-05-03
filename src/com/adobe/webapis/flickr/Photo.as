package com.adobe.webapis.flickr
{

    public class Photo extends Object
    {
        private var _id:String;
        private var _ownerId:String;
        private var _ownerName:String;
        private var _secret:String;
        private var _server:int;
        private var _iconServer:int;
        private var _title:String;
        private var _description:String;
        private var _commentCount:int;
        private var _isPublic:Boolean;
        private var _isFriend:Boolean;
        private var _isFamily:Boolean;
        private var _license:int;
        private var _dateUploaded:Date;
        private var _dateTaken:Date;
        private var _dateAdded:Date;
        private var _originalFormat:String;
        private var _url:String;
        private var _exifs:Array;
        private var _rotation:int;
        private var _ownerRealName:String;
        private var _ownerLocation:String;
        private var _isFavorite:Boolean;
        private var _commentPermission:int;
        private var _addMetaPermission:int;
        private var _canComment:int;
        private var _canAddMeta:int;
        private var _notes:Array;
        private var _tags:Array;
        private var _urls:Array;
        private var _farm:int;

        public function Photo()
        {
            _exifs = new Array();
            _notes = new Array();
            _tags = new Array();
            _urls = new Array();
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

        public function get ownerId() : String
        {
            return _ownerId;
        }// end function

        public function set ownerId(param1:String) : void
        {
            _ownerId = param1;
            return;
        }// end function

        public function get ownerName() : String
        {
            return _ownerName;
        }// end function

        public function set ownerName(param1:String) : void
        {
            _ownerName = param1;
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

        public function get iconServer() : int
        {
            return _iconServer;
        }// end function

        public function set iconServer(param1:int) : void
        {
            _iconServer = param1;
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

        public function get description() : String
        {
            return _description;
        }// end function

        public function set description(param1:String) : void
        {
            _description = param1;
            return;
        }// end function

        public function get commentCount() : int
        {
            return _commentCount;
        }// end function

        public function set commentCount(param1:int) : void
        {
            _commentCount = param1;
            return;
        }// end function

        public function get isPublic() : Boolean
        {
            return _isPublic;
        }// end function

        public function set isPublic(param1:Boolean) : void
        {
            _isPublic = param1;
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

        public function get isFamily() : Boolean
        {
            return _isFamily;
        }// end function

        public function set isFamily(param1:Boolean) : void
        {
            _isFamily = param1;
            return;
        }// end function

        public function get license() : int
        {
            return _license;
        }// end function

        public function set license(param1:int) : void
        {
            _license = param1;
            return;
        }// end function

        public function get dateUploaded() : Date
        {
            return _dateUploaded;
        }// end function

        public function set dateUploaded(param1:Date) : void
        {
            _dateUploaded = param1;
            return;
        }// end function

        public function get dateTaken() : Date
        {
            return _dateTaken;
        }// end function

        public function set dateTaken(param1:Date) : void
        {
            _dateTaken = param1;
            return;
        }// end function

        public function get dateAdded() : Date
        {
            return _dateAdded;
        }// end function

        public function set dateAdded(param1:Date) : void
        {
            _dateAdded = param1;
            return;
        }// end function

        public function get originalFormat() : String
        {
            return _originalFormat;
        }// end function

        public function set originalFormat(param1:String) : void
        {
            _originalFormat = param1;
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

        public function get exifs() : Array
        {
            return _exifs;
        }// end function

        public function set exifs(param1:Array) : void
        {
            _exifs = param1;
            return;
        }// end function

        public function get rotation() : int
        {
            return _rotation;
        }// end function

        public function set rotation(param1:int) : void
        {
            _rotation = param1;
            return;
        }// end function

        public function get ownerRealName() : String
        {
            return _ownerRealName;
        }// end function

        public function set ownerRealName(param1:String) : void
        {
            _ownerRealName = param1;
            return;
        }// end function

        public function get ownerLocation() : String
        {
            return _ownerLocation;
        }// end function

        public function set ownerLocation(param1:String) : void
        {
            _ownerLocation = param1;
            return;
        }// end function

        public function get isFavorite() : Boolean
        {
            return _isFavorite;
        }// end function

        public function set isFavorite(param1:Boolean) : void
        {
            _isFavorite = param1;
            return;
        }// end function

        public function get commentPermission() : int
        {
            return _commentPermission;
        }// end function

        public function set commentPermission(param1:int) : void
        {
            _commentPermission = param1;
            return;
        }// end function

        public function get addMetaPermission() : int
        {
            return _addMetaPermission;
        }// end function

        public function set addMetaPermission(param1:int) : void
        {
            _addMetaPermission = param1;
            return;
        }// end function

        public function get canComment() : int
        {
            return _canComment;
        }// end function

        public function set canComment(param1:int) : void
        {
            _canComment = param1;
            return;
        }// end function

        public function get canAddMeta() : int
        {
            return _canAddMeta;
        }// end function

        public function set canAddMeta(param1:int) : void
        {
            _canAddMeta = param1;
            return;
        }// end function

        public function get notes() : Array
        {
            return _notes;
        }// end function

        public function set notes(param1:Array) : void
        {
            _notes = param1;
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

        public function get urls() : Array
        {
            return _urls;
        }// end function

        public function set urls(param1:Array) : void
        {
            _urls = param1;
            return;
        }// end function

        public function get farm() : int
        {
            return _farm;
        }// end function

        public function set farm(param1:int) : void
        {
            _farm = param1;
            return;
        }// end function

    }
}
