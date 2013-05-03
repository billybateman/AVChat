package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Favorites extends Object
    {
        private var _service:FlickrService;

        public function Favorites(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function add(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, add_result, "flickr.favorites.add", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function add_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.FAVORITES_ADD);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function getList(param1:String = "", param2:String = "", param3:Number = 100, param4:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getList_result, "flickr.favorites.getList", false, new NameValuePair("user_id", param1), new NameValuePair("extras", param2), new NameValuePair("per_page", param3.toString()), new NameValuePair("page", param4.toString()));
            return;
        }// end function

        private function getList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.FAVORITES_GET_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function getPublicList(param1:String, param2:String = "", param3:Number = 100, param4:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPublicList_result, "flickr.favorites.getPublicList", false, new NameValuePair("user_id", param1), new NameValuePair("extras", param2), new NameValuePair("per_page", param3.toString()), new NameValuePair("page", param4.toString()));
            return;
        }// end function

        private function getPublicList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.FAVORITES_GET_PUBLIC_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function remove(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, remove_result, "flickr.favorites.remove", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function remove_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.FAVORITES_REMOVE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
