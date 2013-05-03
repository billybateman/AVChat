package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Contacts extends Object
    {
        private var _service:FlickrService;

        public function Contacts(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getList() : void
        {
            MethodGroupHelper.invokeMethod(_service, getList_result, "flickr.contacts.getList", false);
            return;
        }// end function

        private function getList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.CONTACTS_GET_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "contacts", MethodGroupHelper.parseContactList);
            return;
        }// end function

        public function getPublicList(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getPublicList_result, "flickr.contacts.getPublicList", false, new NameValuePair("user_id", param1));
            return;
        }// end function

        private function getPublicList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.CONTACTS_GET_PUBLIC_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "contacts", MethodGroupHelper.parseContactList);
            return;
        }// end function

    }
}
