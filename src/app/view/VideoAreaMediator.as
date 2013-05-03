package app.view
{
    import app.*;
    import app.model.*;
    import app.view.components.*;
    import app.view.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;

    public class VideoAreaMediator extends BaseMediator implements IMediator
    {
        public var nc:NetConnection;
        public var user:String;
        public var userListObj:Object;
        public static const NAME:String = "VideoAreaMediator";

        public function VideoAreaMediator(param1:Object = null)
        {
            nc = new NetConnection();
            user = new String();
            userListObj = new Object();
            trace("VideoArea Mediator Loaded");
            super(NAME, param1);
            var _loc_2:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_3:* = _loc_2.getLocale() as Object;
            user = _loc_3.user;
            videoarea.setupUser(user);
            videoarea.addEventListener(ApplicationFacade.JAVASCRIPT_CALL, onJavascriptNotification);
            videoarea.addEventListener(ApplicationFacade.VIDEO_CLOSE_CALL, onVideoCloseNotification);
            return;
        }// end function

        private function onVideoCloseNotification(event:GenericEvent) : void
        {
            sendNotification(ApplicationFacade.VIDEO_CLOSE_CALL, event.data);
            return;
        }// end function

        private function onJavascriptNotification(event:GenericEvent) : void
        {
            sendNotification(ApplicationFacade.JAVASCRIPT_CALL, event.data);
            return;
        }// end function

        private function connectUI() : void
        {
            trace("Video Area: Connect UI");
            return;
        }// end function

        public function setupUserVideoMC(param1:Object) : void
        {
            var _loc_2:NetStream = null;
            var _loc_3:* = facade.retrieveProxy(NetStreamProxy.NAME) as NetStreamProxy;
            _loc_3.connect(nc);
            _loc_2 = _loc_3.getNetStream() as NetStream;
            _loc_2.play(param1.user);
            videoarea.addListUser(param1, _loc_2);
            return;
        }// end function

        public function get videoarea() : VideoArea
        {
            return viewComponent as VideoArea;
        }// end function

        override public function listNotificationInterests() : Array
        {
            return [ApplicationFacade.STAGE_RESIZE, ApplicationFacade.JAVASCRIPT_CALL, ApplicationFacade.USER_CHANGE_CALL, ApplicationFacade.USER_DELETE_CALL, ApplicationFacade.VIDEO_ADD_CALL, ApplicationFacade.VIDEO_CLOSE_CALL, ApplicationFacade.NET_CONNECTION];
        }// end function

        override public function handleNotification(param1:INotification) : void
        {
            var _loc_2:StageProxy = null;
            switch(param1.getName())
            {
                case ApplicationFacade.STAGE_RESIZE:
                {
                    _loc_2 = param1.getBody() as StageProxy;
                    videoarea.setSize(_loc_2.stageWidth, _loc_2.stageHeight);
                    videoarea.x = 2.5;
                    videoarea.y = _loc_2.stageHeight - 168;
                    break;
                }
                case ApplicationFacade.JAVASCRIPT_CALL:
                {
                    trace("VideoArea Mediator : Javascript Call");
                    videoarea.setObject(param1.getBody());
                    break;
                }
                case ApplicationFacade.NET_CONNECTION:
                {
                    trace("VideoArea Mediator : Net Connection");
                    nc = param1.getBody() as NetConnection;
                    connectUI();
                    break;
                }
                case ApplicationFacade.USER_CHANGE_CALL:
                {
                    trace("VideoArea Mediator : User Change");
                    userListObj = param1.getBody() as Object;
                    videoarea.changeListUser(userListObj);
                    break;
                }
                case ApplicationFacade.USER_DELETE_CALL:
                {
                    trace("VideoArea Mediator : Delete Change");
                    userListObj = param1.getBody() as Object;
                    videoarea.removeListUser(userListObj);
                    break;
                }
                case ApplicationFacade.VIDEO_ADD_CALL:
                {
                    trace("VideoArea Mediator : Video Add");
                    userListObj = param1.getBody() as Object;
                    setupUserVideoMC(userListObj);
                    break;
                }
                case ApplicationFacade.VIDEO_CLOSE_CALL:
                {
                    trace("VideoArea Mediator : Video Close");
                    userListObj = param1.getBody() as Object;
                    videoarea.removeListUser(userListObj);
                    break;
                }
                default:
                {
                    break;
                    break;
                }
            }
            return;
        }// end function

    }
}
