package app
{
    import flash.display.MovieClip;
	import flash.text.*;
    import flash.events.Event;
    import flash.display.LoaderInfo;  
    import app.view.components.*;
	
    public class Main extends MovieClip
    {
        public var chat_mc:Chat;
        public var panel_mc:Panel;
        public var video_area_mc:VideoArea;
        public var invite_mc:Invite;
        public var loading_mc:Loading;

        public function Main()
        {
            trace("Main: Loading Application");
            stop();
            addEventListener(Event.ADDED_TO_STAGE, start);
           
        }// end function

        public function start(event:Event = null) : void
        {
            trace("Main: Start");
            gotoAndStop("start");
            //var _loc_2:* = LoaderInfo(this.loaderInfo).parameters;
            //var _loc_3:* = ApplicationFacade.getInstance();
            //_loc_3.startup(this, _loc_2);
			var flashVars:Object = LoaderInfo( this.loaderInfo ).parameters;
            
            // init PureMVC Facade
            var facade:ApplicationFacade = ApplicationFacade.getInstance();
			trace("Trying Startup");
            facade.startup( this, flashVars );
            
        }// end function

    }
}
