package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Photos extends Object
    {
        private var _service:FlickrService;
        private var _licenses:Licenses;
        private var _notes:Notes;
        private var _transform:Transform;
        private var _upload:Upload;

        public function Photos(param1:FlickrService)
        {
            _service = param1;
            _licenses = new Licenses(param1);
            _notes = new Notes(param1);
            _transform = new Transform(param1);
            _upload = new Upload(param1);
            return;
        }// end function

        public function get licenses() : Licenses
        {
            return _licenses;
        }// end function

        public function get notes() : Notes
        {
            return _notes;
        }// end function

        public function get transform() : Transform
        {
            return _transform;
        }// end function

        public function get upload() : Upload
        {
            return _upload;
        }// end function

        public function addTags(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, addTags_result, "flickr.photos.addTags", false, new NameValuePair("photo_id", param1), new NameValuePair("tags", param2));
            return;
        }// end function

        private function addTags_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_ADD_TAGS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function getAllContexts(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getAllContexts_result, "flickr.photos.getAllContexts", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function getAllContexts_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_ALL_CONTEXTS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoContext", MethodGroupHelper.parsePhotoContext);
            return;
        }// end function

        public function getContactsPhotos(param1:Number = 10, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
        {
            MethodGroupHelper.invokeMethod(_service, getContactsPhotos_result, "flickr.photos.getContactsPhotos", false, new NameValuePair("count", param1.toString()), new NameValuePair("just_friends", param2 ? ("1") : ("0")), new NameValuePair("single_photo", param3 ? ("1") : ("0")), new NameValuePair("include_self", param4 ? ("1") : ("0")));
            return;
        }// end function

        private function getContactsPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTACTS_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePhotoList);
            return;
        }// end function

        public function getContactsPublicPhotos(param1:String, param2:Number = 10, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
        {
            MethodGroupHelper.invokeMethod(_service, getContactsPublicPhotos_result, "flickr.photos.getContactsPublicPhotos", false, new NameValuePair("user_id", param1), new NameValuePair("count", param2.toString()), new NameValuePair("just_friends", param3 ? ("1") : ("0")), new NameValuePair("single_photo", param4 ? ("1") : ("0")), new NameValuePair("include_self", param5 ? ("1") : ("0")));
            return;
        }// end function

        private function getContactsPublicPhotos_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTACTS_PUBLIC_PHOTOS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePhotoList);
            return;
        }// end function

        public function getContext(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getContext_result, "flickr.photos.getContext", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function getContext_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_CONTEXT);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "context", MethodGroupHelper.parseContext);
            return;
        }// end function

        public function getCounts(param1:Array = null, param2:Array = null) : void
        {
            var _loc_3:String = "";
            var _loc_4:String = "";
            var _loc_5:* = param1 == null ? (0) : (param1.length);
            var _loc_6:int = 0;
            while (_loc_6 < _loc_5)
            {
                
                if (_loc_6 > 0)
                {
                    _loc_3 = _loc_3 + ",";
                }
                _loc_3 = _loc_3 + param1[_loc_6].getTime() / 1000;
                _loc_6++;
            }
            var _loc_7:* = param2 == null ? (0) : (param2.length);
            _loc_6 = 0;
            while (_loc_6 < _loc_7)
            {
                
                if (_loc_6 > 0)
                {
                    _loc_4 = _loc_4 + ",";
                }
                _loc_4 = _loc_4 + (param2[_loc_6] as Date).valueOf().toString();
                _loc_6++;
            }
            MethodGroupHelper.invokeMethod(_service, getCounts_result, "flickr.photos.getCounts", false, new NameValuePair("dates", _loc_3), new NameValuePair("taken_dates", _loc_4));
            return;
        }// end function

        private function getCounts_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_COUNTS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoCounts", MethodGroupHelper.parsePhotoCountList);
            return;
        }// end function

        public function getExif(param1:String, param2:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getExif_result, "flickr.photos.getExif", false, new NameValuePair("photo_id", param1), new NameValuePair("secret", param2));
            return;
        }// end function

        private function getExif_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_EXIF);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photo", MethodGroupHelper.parsePhotoExifs);
            return;
        }// end function

        public function getInfo(param1:String, param2:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, getInfo_result, "flickr.photos.getInfo", false, new NameValuePair("photo_id", param1), new NameValuePair("secret", param2));
            return;
        }// end function

        private function getInfo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photo", MethodGroupHelper.parsePhoto);
            return;
        }// end function

        public function getNotInSet(param1:String = "", param2:Number = 100, param3:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getNotInSet_result, "flickr.photos.getNotInSet", false, new NameValuePair("extras", param1), new NameValuePair("per_page", param2.toString()), new NameValuePair("page", param3.toString()));
            return;
        }// end function

        private function getNotInSet_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_NOT_IN_SET);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function getPerms(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPerms_result, "flickr.photos.getPerms", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function getPerms_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_PERMS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photo", MethodGroupHelper.parsePhotoPerms);
            return;
        }// end function

        public function getRecent(param1:String = "", param2:Number = 100, param3:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getRecent_result, "flickr.photos.getRecent", false, new NameValuePair("extras", param1), new NameValuePair("per_page", param2.toString()), new NameValuePair("page", param3.toString()));
            return;
        }// end function

        private function getRecent_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_RECENT);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function getSizes(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getSizes_result, "flickr.photos.getSizes", false, new NameValuePair("photo_id", param1));
            return;
        }// end function

        private function getSizes_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_SIZES);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photoSizes", MethodGroupHelper.parsePhotoSizeList);
            return;
        }// end function

        public function getUntagged(param1:String = "", param2:Number = 100, param3:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, getUntagged_result, "flickr.photos.getUntagged", false, new NameValuePair("extras", param1), new NameValuePair("per_page", param2.toString()), new NameValuePair("page", param3.toString()));
            return;
        }// end function

        private function getUntagged_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_GET_UNTAGGED);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function removeTag(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, removeTag_result, "flickr.photos.removeTag", false, new NameValuePair("tag_id", param1));
            return;
        }// end function

        private function removeTag_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_REMOVE_TAG);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function search(param1:String = "", param2:String = "", param3:String = "any", param4:String = "", param5:Date = null, param6:Date = null, param7:Date = null, param8:Date = null, param9:Number = -1, param10:String = "", param11:Number = 100, param12:Number = 1, param13:String = "date-posted-desc") : void
        {
            MethodGroupHelper.invokeMethod(_service, search_result, "flickr.photos.search", false, new NameValuePair("user_id", param1), new NameValuePair("tags", param2), new NameValuePair("tag_mode", param3), new NameValuePair("text", param4), new NameValuePair("min_upload_date", param5 == null ? ("") : (param5.valueOf().toString())), new NameValuePair("max_upload_date", param6 == null ? ("") : (param6.valueOf().toString())), new NameValuePair("min_taken_date", param7 == null ? ("") : (param7.valueOf().toString())), new NameValuePair("max_taken_date", param8 == null ? ("") : (param8.valueOf().toString())), new NameValuePair("license", param9 == -1 ? ("") : (param9.toString())), new NameValuePair("extras", param10), new NameValuePair("per_page", param11.toString()), new NameValuePair("page", param12.toString()), new NameValuePair("sort", param13));
            return;
        }// end function

        private function search_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SEARCH);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

        public function setDates(param1:String, param2:Date = null, param3:Date = null, param4:Number = 0) : void
        {
            MethodGroupHelper.invokeMethod(_service, setDates_result, "flickr.photos.setDates", false, new NameValuePair("photo_id", param1), new NameValuePair("date_posted", MethodGroupHelper.dateToString(param2)), new NameValuePair("date_taken", MethodGroupHelper.dateToString(param3)), new NameValuePair("date_taken_granularity", param4.toString()));
            return;
        }// end function

        private function setDates_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_DATES);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function setMeta(param1:String, param2:String, param3:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, setMeta_result, "flickr.photos.setMeta", false, new NameValuePair("photo_id", param1), new NameValuePair("title", param2), new NameValuePair("description", param3));
            return;
        }// end function

        private function setMeta_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_META);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function setPerms(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:int, param6:int) : void
        {
            MethodGroupHelper.invokeMethod(_service, setPerms_result, "flickr.photos.setPerms", false, new NameValuePair("photo_id", param1), new NameValuePair("is_public", param2 ? ("1") : ("0")), new NameValuePair("is_friend", param3 ? ("1") : ("0")), new NameValuePair("is_family", param4 ? ("1") : ("0")), new NameValuePair("perm_comment", param5.toString()), new NameValuePair("perm_addmeta", param6.toString()));
            return;
        }// end function

        private function setPerms_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_PERMS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function setTags(param1:String, param2:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, setTags_result, "flickr.photos.setTags", false, new NameValuePair("photo_id", param1), new NameValuePair("tags", param2));
            return;
        }// end function

        private function setTags_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_SET_TAGS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
