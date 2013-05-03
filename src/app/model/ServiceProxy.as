package app.model
{
    import com.adobe.webapis.flickr.*;
    import com.adobe.webapis.flickr.events.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class ServiceProxy extends Proxy implements IProxy
    {
        private var _flickrService:FlickrService;
        public static const NAME:String = "FlickrProxy";
        private static const API_KEY:String = "1a01abdc020efe076816318e0243af0c";

        public function ServiceProxy()
        {
            super(NAME);
            _flickrService = new FlickrService(API_KEY);
            _flickrService.addEventListener(FlickrResultEvent.PHOTOS_SEARCH, onResult_photosSearch);
            return;
        }// end function

        public function photosSearch(param1:String) : void
        {
            _flickrService.photos.search("", "", "any", param1, null, null, null, null, -1, "", 150, 1, "interestingness-desc");
            return;
        }// end function

        private function onResult_photosSearch(event:FlickrResultEvent) : void
        {
            return;
        }// end function

    }
}
