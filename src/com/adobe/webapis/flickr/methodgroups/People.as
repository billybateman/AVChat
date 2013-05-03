package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class People extends Object
    {
        private var _service:FlickrService;

        public function People(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function findByEmail(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, findByEmail_result, "flickr.people.findByEmail", false, new NameValuePair("find_email", param1));
            return;
        }// end function

        private function findByEmail_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_FIND_BY_EMAIL);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

        public function findByUsername(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, findByUsername_result, "flickr.people.findByUsername", false, new NameValuePair("username", param1));
            return;
        }// end function

        private function findByUsername_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_FIND_BY_USERNAME);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

        public function getInfo(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getInfo_result, "flickr.people.getInfo", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getInfo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parsePerson);
            return;
        }// end function

        public function getPublicGroups(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPublicGroups_result, "flickr.people.getPublicGroups", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getPublicGroups_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_PUBLIC_GROUPS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "groups", MethodGroupHelper.parseGroupList);
            return;
        }// end function

        public function getPublicPhotos(param1:String, param2:String = "", param3:Number = 100, param4:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPublicPhotos_result, "flickr.people.getPublicPhotos", false, new NameValuePair("user_id", param1), new NameValuePair("extras", param2), new NameValuePair("per_page", param3.toString()), new NameValuePair("page", param4.toString()));
            return;
        }// end function

        private function getPublicPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_PUBLIC_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function getUploadStatus() : void
        {
            MethodGroupHelper.invokeMethod(_service, getUploadStatus_result, "flickr.people.getUploadStatus", false);
            return;
        }// end function

        private function getUploadStatus_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PEOPLE_GET_UPLOAD_STATUS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

    }
}
