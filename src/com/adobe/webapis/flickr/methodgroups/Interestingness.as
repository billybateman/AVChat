package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Interestingness extends Object
    {
        private var _service:FlickrService;

        public function Interestingness(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function getList(param1:Date = null, param2:String = "", param3:Number = 100, param4:Number = 1) : void
        {
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_5:String = "";
            if (param1 != null)
            {
                _loc_6 = ((param1.getMonth() + 1)).toString();
                if (param1.getMonth() <= 9)
                {
                    _loc_6 = "0" + _loc_6;
                }
                _loc_7 = param1.getDate().toString();
                if (param1.getDate() <= 9)
                {
                    _loc_7 = "0" + _loc_7;
                }
                _loc_5 = param1.getFullYear() + "-" + _loc_6 + "-" + _loc_7;
            }
            MethodGroupHelper.invokeMethod(_service, getList_result, "flickr.interestingness.getList", false, new NameValuePair("date", _loc_5), new NameValuePair("extras", param2), new NameValuePair("per_page", param3.toString()), new NameValuePair("page", param4.toString()));
            return;
        }// end function

        private function getList_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.INTERESTINGNESS_GET_LIST);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "photos", MethodGroupHelper.parsePagedPhotoList);
            return;
        }// end function

    }
}
