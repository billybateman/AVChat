package com.adobe.webapis
{
    import com.adobe.net.*;
    import flash.events.*;

    public class URLLoaderBase extends ServiceBase
    {

        public function URLLoaderBase()
        {
            return;
        }// end function

        protected function getURLLoader() : DynamicURLLoader
        {
            var _loc_1:* = new DynamicURLLoader();
            _loc_1.addEventListener("progress", onProgress);
            _loc_1.addEventListener("ioError", onIOError);
            _loc_1.addEventListener("securityError", onSecurityError);
            return _loc_1;
        }// end function

        private function onIOError(event:IOErrorEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function onSecurityError(event:SecurityErrorEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function onProgress(event:ProgressEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

    }
}
