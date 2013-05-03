package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Blogs extends Object
    {
        private var _service:FlickrService;

        public function Blogs(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getList() : void
        {
            MethodGroupHelper.invokeMethod(_service, getList_result, "flickr.blogs.getList", false);
            return;
        }// end function

        private function getList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.BLOGS_GET_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "blogs", MethodGroupHelper.parseBlogList);
            return;
        }// end function

        public function postPhoto(param1:String, param2:String, param3:String, param4:String, param5:String = "") : void
        {
            MethodGroupHelper.invokeMethod(_service, postPhoto_result, "flickr.blogs.postPhoto", false, new NameValuePair("blog_id", param1), new NameValuePair("photo_id", param2), new NameValuePair("title", param3), new NameValuePair("description", param4), new NameValuePair("blog_password", param5));
            return;
        }// end function

        private function postPhoto_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.BLOGS_POST_PHOTO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
