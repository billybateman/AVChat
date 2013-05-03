package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Pools extends Object
    {
        private var _service:FlickrService;

        public function Pools(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function add(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, add_result, "flickr.groups.pools.add", false, new NameValuePair("photo_id", param1), new NameValuePair("group_id", param2));
            return;
        }// end function

        private function add_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_ADD);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function getContext(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getContext_result, "flickr.groups.pools.getContext", false, new NameValuePair("photo_id", param1), new NameValuePair("group_id", param2));
            return;
        }// end function

        private function getContext_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_CONTEXT);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "context", MethodGroupHelper.parseContext);
            return;
        }// end function

        public function getGroups() : void
        {
            MethodGroupHelper.invokeMethod(_service, getGroups_result, "flickr.groups.pools.getGroups", false);
            return;
        }// end function

        private function getGroups_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_GROUPS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "groups", MethodGroupHelper.parseGroupList);
            return;
        }// end function

        public function getPhotos(param1:String, param2:String = "", param3:String = "", param4:Number = 100, param5:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPhotos_result, "flickr.groups.pools.getPhotos", false, new NameValuePair("group_id", param1), new NameValuePair("tags", param2), new NameValuePair("extras", param3), new NameValuePair("per_page", param4.toString()), new NameValuePair("page", param5.toString()));
            return;
        }// end function

        private function getPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_GET_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function remove(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, remove_result, "flickr.groups.pools.remove", false, new NameValuePair("photo_id", param1), new NameValuePair("group_id", param2));
            return;
        }// end function

        private function remove_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_POOLS_REMOVE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
