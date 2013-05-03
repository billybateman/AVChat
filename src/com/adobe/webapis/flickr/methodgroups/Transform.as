package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Transform extends Object
    {
        private var _service:FlickrService;

        public function Transform(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function rotate(param1:String, param2:Number) : void
        {
            MethodGroupHelper.invokeMethod(_service, rotate_result, "flickr.photos.transform.rotate", false, new NameValuePair("photo_id", param1), new NameValuePair("degrees", param2.toString()));
            return;
        }// end function

        private function rotate_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_TRANSFORM_ROTATE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
