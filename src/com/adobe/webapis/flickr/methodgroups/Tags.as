package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Tags extends Object
    {
        private var _service:FlickrService;

        public function Tags(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getListPhoto(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getListPhoto_result, "flickr.tags.getListPhoto", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function getListPhoto_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_PHOTO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photo", MethodGroupHelper.parsePhoto);
            return;
        }// end function

        public function getListUser(param1:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getListUser_result, "flickr.tags.getListUser", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getListUser_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_USER);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUserTags);
            return;
        }// end function

        public function getListUserPopular(param1:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getListUserPopular_result, "flickr.tags.getListUserPopular", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getListUserPopular_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_LIST_USER_POPULAR);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "user", MethodGroupHelper.parseUserTags);
            return;
        }// end function

        public function getRelated(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getRelated_result, "flickr.tags.getRelated", false, new NameValuePair("tag", param1));
            return;
        }// end function

        private function getRelated_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TAGS_GET_RELATED);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "tags", MethodGroupHelper.parseTagList);
            return;
        }// end function

    }
}
