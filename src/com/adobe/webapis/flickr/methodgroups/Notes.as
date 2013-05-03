package com.adobe.webapis.flickr.methodgroups
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;

    public class Notes extends Object
    {
        private var _service:FlickrService;

        public function Notes(param1:FlickrService)
        {
            _service = param1;
            return;
        }// end function

        public function add(param1:String, param2:Rectangle, param3:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, add_result, "flickr.photos.notes.add", false, new NameValuePair("photo_id", param1), new NameValuePair("note_x", param2.x.toString()), new NameValuePair("note_y", param2.y.toString()), new NameValuePair("note_width", param2.width.toString()), new NameValuePair("note_height", param2.height.toString()), new NameValuePair("note_text", param3));
            return;
        }// end function

        private function add_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_ADD);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2, "note", MethodGroupHelper.parsePhotoNote);
            return;
        }// end function

        public function deleteNote(param1:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, delete_result, "flickr.photos.notes.delete", false, new NameValuePair("note_id", param1));
            return;
        }// end function

        private function delete_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_DELETE);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

        public function edit(param1:String, param2:Rectangle, param3:String) : void
        {
            MethodGroupHelper.invokeMethod(_service, edit_result, "flickr.photos.notes.edit", false, new NameValuePair("note_id", param1), new NameValuePair("note_x", param2.x.toString()), new NameValuePair("note_y", param2.y.toString()), new NameValuePair("note_width", param2.width.toString()), new NameValuePair("note_height", param2.height.toString()), new NameValuePair("note_text", param3));
            return;
        }// end function

        private function edit_result(event:Event) : void
        {
            var _loc_2:* = new FlickrResultEvent(FlickrResultEvent.PHOTOS_NOTES_EDIT);
            MethodGroupHelper.processAndDispatch(_service, URLLoader(event.target).data, _loc_2);
            return;
        }// end function

    }
}
