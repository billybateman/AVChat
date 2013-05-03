package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.net.*;

    public class Groups extends Object
    {
        private var _service:FlickrService;
        private var _pools:Pools;

        public function Groups(param1:FlickrService)
        {
            _service = param1;
            _pools = new Pools(param1);
            return;
        }// end function

        public function get pools() : Pools
        {
            return _pools;
        }// end function

        public function browse(param1:String = "0") : void
        {
            MethodGroupHelper.invokeMethod(_service, browse_result, "flickr.groups.browse", false, new NameValuePair("cat_id", param1));
            return;
        }// end function

        private function browse_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_BROWSE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "category", MethodGroupHelper.parseGroupCategory);
            return;
        }// end function

        public function getInfo(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, getInfo_result, "flickr.groups.getInfo", false, new NameValuePair("group_id", param1));
            return;
        }// end function

        private function getInfo_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_GET_INFO);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "group", MethodGroupHelper.parseGroup);
            return;
        }// end function

        public function search(param1:String, param2:Number = 100, param3:Number = 1) : void
        {
            MethodGroupHelper.invokeMethod(_service, search_result, "flickr.groups.search", false, new NameValuePair("text", param1), new NameValuePair("per_page", param2.toString()), new NameValuePair("page", param3.toString()));
            return;
        }// end function

        private function search_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.GROUPS_SEARCH);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "groups", MethodGroupHelper.parsePagedGroupList);
            return;
        }// end function

    }
}
