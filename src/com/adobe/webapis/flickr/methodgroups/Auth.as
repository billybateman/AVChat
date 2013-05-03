package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Auth extends Object
    {
        private var _service:FlickrService;

        public function Auth(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function checkToken(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, checkToken_result, "flickr.auth.checkToken", false, new NameValuePair("auth_token", param1));
            return;
        }// end function

        private function checkToken_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.AUTH_CHECK_TOKEN);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "auth", MethodGroupHelper.parseAuthResult);
            return;
        }// end function

        public function getFrob() : void
        {
            MethodGroupHelper.invokeMethod(_service, getFrob_result, "flickr.auth.getFrob", true);
            return;
        }// end function

        private function getFrob_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.AUTH_GET_FROB);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "frob", MethodGroupHelper.parseFrob);
            return;
        }// end function

        public function getToken(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getToken_result, "flickr.auth.getToken", true, new NameValuePair("frob", param1));
            return;
        }// end function

        private function getToken_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.AUTH_GET_TOKEN);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "auth", MethodGroupHelper.parseAuthResult);
            return;
        }// end function

    }
}
