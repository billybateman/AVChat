package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class PhotoSets extends Object
    {
        private var _service:FlickrService;

        public function PhotoSets(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function addPhoto(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, addPhoto_result, "flickr.photosets.addPhoto", false, new NameValuePair("photoset_id", param1), new NameValuePair("photo_id", param2));
            return;
        }// end function

        private function addPhoto_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_ADD_PHOTO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function create(param1:String, param2:String, param3:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, create_result, "flickr.photosets.create", false, new NameValuePair("title", param1), new NameValuePair("description", param2), new NameValuePair("primary_photo_id", param3));
            return;
        }// end function

        private function create_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_CREATE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoSet", MethodGroupHelper.parsePhotoSet);
            return;
        }// end function

        public function deleteSet(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, delete_result, "flickr.photosets.delete", false, new NameValuePair("photoset_id", param1));
            return;
        }// end function

        private function delete_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_DELETE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function editMeta(param1:String, param2:String, param3:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, editMeta_result, "flickr.photosets.editMeta", false, new NameValuePair("photoset_id", param1), new NameValuePair("title", param2), new NameValuePair("description", param3));
            return;
        }// end function

        private function editMeta_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_EDIT_META);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function editPhotos(param1:String, param2:String, param3:Array) : void
        {
            MethodGroupHelper.invokeMethod(_service, editPhotos_result, "flickr.photosets.editPhotos", false, new NameValuePair("photoset_id", param1), new NameValuePair("primary_photo_id", param2), new NameValuePair("photo_ids", param3.join(",")));
            return;
        }// end function

        private function editPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_EDIT_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function getContext(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getContext_result, "flickr.photosets.getContext", false, new NameValuePair("photo_id", param1), new NameValuePair("photoset_id", param2));
            return;
        }// end function

        private function getContext_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_CONTEXT);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "context", MethodGroupHelper.parseContext);
            return;
        }// end function

        public function getInfo(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getInfo_result, "flickr.photosets.getInfo", false, new NameValuePair("photoset_id", param1));
            return;
        }// end function

        private function getInfo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoSet", MethodGroupHelper.parsePhotoSet);
            return;
        }// end function

        public function getList(param1:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getList_result, "flickr.photosets.getList", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoSets", MethodGroupHelper.parsePhotoSetList);
            return;
        }// end function

        public function getPhotos(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPhotos_result, "flickr.photosets.getPhotos", false, new NameValuePair("photoset_id", param1));
            return;
        }// end function

        private function getPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_GET_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoSet", MethodGroupHelper.parsePhotoSet);
            return;
        }// end function

        public function orderSets(param1:Array) : void
        {
            MethodGroupHelper.invokeMethod(_service, orderSets_result, "flickr.photosets.orderSets", false, new NameValuePair("photoset_ids", param1.join(",")));
            return;
        }// end function

        private function orderSets_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_ORDER_SETS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function removePhoto(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, removePhoto_result, "flickr.photosets.removePhoto", false, new NameValuePair("photoset_id", param1), new NameValuePair("photo_id", param2));
            return;
        }// end function

        private function removePhoto_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOSETS_REMOVE_PHOTO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
