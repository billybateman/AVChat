package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Licenses extends Object
    {
        private var _service:FlickrService;

        public function Licenses(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getInfo() : void
        {
            MethodGroupHelper.invokeMethod(_service, getInfo_result, "flickr.photos.licenses.getInfo", false);
            return;
        }// end function

        private function getInfo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_LICENSES_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "licenses", MethodGroupHelper.parseLicenseList);
            return;
        }// end function

        public function setLicense(param1:String, param2:int) : void
        {
            MethodGroupHelper.invokeMethod(_service, setLicense_result, "flickr.photos.licenses.setLicense", false, new NameValuePair("photo_id", param1), new NameValuePair("license_id", param2.toString()));
            return;
        }// end function

        private function setLicense_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_LICENSES_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
