package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Upload extends Object
    {
        private var _service:FlickrService;
        private static const UPLOAD_DEST:String = "http://www.flickr.com/services/upload/?";

        public function Upload(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function checkTickets(param1:Array) : void
        {
            MethodGroupHelper.invokeMethod(_service, checkTickets_result, "flickr.photos.upload.checkTickets", false, new NameValuePair("tickets", param1.join(",")));
            return;
        }// end function

        private function checkTickets_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_UPLOAD_CHECK_TICKETS);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "uploadTickets", MethodGroupHelper.parseUploadTicketList);
            return;
        }// end function

    }
}
