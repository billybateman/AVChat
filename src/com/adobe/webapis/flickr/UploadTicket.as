package com.adobe.webapis.flickr
{

    public class UploadTicket extends Object
    {
        private var _id:String;
        private var _isInvalid:Boolean;
        private var _isComplete:Boolean;
        private var _uploadFailed:Boolean;
        private var _photoId:String;

        public function UploadTicket()
        {
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

        public function get photoId() : String
        {
            return _photoId;
        }// end function

        public function set photoId(param1:String) : void
        {
            _photoId = param1;
            return;
        }// end function

        public function get isInvalid() : Boolean
        {
            return _isInvalid;
        }// end function

        public function set isInvalid(param1:Boolean) : void
        {
            _isInvalid = param1;
            return;
        }// end function

        public function get isComplete() : Boolean
        {
            return _isComplete;
        }// end function

        public function set isComplete(param1:Boolean) : void
        {
            _isComplete = param1;
            return;
        }// end function

        public function get uploadFailed() : Boolean
        {
            return _uploadFailed;
        }// end function

        public function set uploadFailed(param1:Boolean) : void
        {
            _uploadFailed = param1;
            return;
        }// end function

    }
}
