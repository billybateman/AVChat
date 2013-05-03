package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Test extends Object
    {
        private var _service:FlickrService;

        public function Test(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function echo(... args) : void
        {
            MethodGroupHelper.invokeMethod(_service, echo_result, "flickr.test.echo", false, args);
            return;
        }// end function

        private function echo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TEST_ECHO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function login() : void
        {
            MethodGroupHelper.invokeMethod(_service, login_result, "flickr.test.login", false);
            return;
        }// end function

        private function login_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.TEST_LOGIN);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
