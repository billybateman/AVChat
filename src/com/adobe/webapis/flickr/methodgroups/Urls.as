package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Urls extends Object
    {
        private var _service:FlickrService;

        public function Urls(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getGroup(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getGroup_result, "flickr.urls.getGroup", false, new NameValuePair("group_id", param1));
            return;
        }// end function

        private function getGroup_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.URLS_GET_GROUP);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "group", MethodGroupHelper.parseGroup);
            return;
        }// end function

        public function getUserPhotos(param1:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getUserPhotos_result, "flickr.urls.getUserPhotos", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getUserPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.URLS_GET_USER_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

        public function getUserProfile(param1:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getUserProfile_result, "flickr.urls.getUserProfile", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getUserProfile_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.URLS_GET_USER_PROFILE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

        public function lookupGroup(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, lookupGroup_result, "flickr.urls.lookupGroup", false, new NameValuePair("url", param1));
            return;
        }// end function

        private function lookupGroup_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.URLS_LOOKUP_GROUP);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "group", MethodGroupHelper.parseGroup);
            return;
        }// end function

        public function lookupUser(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, lookupUser_result, "flickr.urls.lookupUser", false, new NameValuePair("url", param1));
            return;
        }// end function

        private function lookupUser_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.URLS_LOOKUP_USER);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUser);
            return;
        }// end function

    }
}
