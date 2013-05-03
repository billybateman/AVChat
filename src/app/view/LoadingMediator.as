package app.view
{
    import app.*;
    import app.model.*;
    import app.view.components.*;
    import app.view.events.*;
    import org.puremvc.interfaces.*;

    public class LoadingMediator extends BaseMediator implements IMediator
    {
        public var user:String;
        public var userListObj:Object;
        public var roomListObj:Object;
        public static const NAME:String = "LoadingMediator";

        public function LoadingMediator(param1:Object = null)
        {
            user = new String();
            userListObj = new Object();
            roomListObj = new Object();
            trace("Loading Mediator Loaded");
            super(NAME, param1);
            var _loc_2:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_3:* = _loc_2.getLocale() as Object;
            user = _loc_3.user;
            return;
        }// end function

        private function onRoomJoinNotification(event:GenericEvent) : void
        {
            trace("Loading Mediator: Join Room Command Notification");
            sendNotification(ApplicationFacade.ROOMS_JOIN_CMD, event.data);
            return;
        }// end function

        private function connectUI() : void
        {
            trace("Connect UI");
            loading.connectUI();
            return;
        }// end function

        public function get loading() : Loading
        {
            return viewComponent as Loading;
        }// end function

        override public function listNotificationInterests() : Array
        {
            return [ApplicationFacade.STAGE_RESIZE, ApplicationFacade.NET_CONNECTION, ApplicationFacade.ROOMS_JOIN_CMD];
        }// end function

        override public function handleNotification(param1:INotification) : void
        {
            var _loc_2:StageProxy = null;
            switch(param1.getName())
            {
                case ApplicationFacade.STAGE_RESIZE:
                {
                    _loc_2 = param1.getBody() as StageProxy;
                    loading.setSize(_loc_2.stageWidth, _loc_2.stageHeight);
                    loading.x = 0;
                    loading.y = 0;
                    break;
                }
                case ApplicationFacade.NET_CONNECTION:
                {
                    trace("Loading Mediator : Net Connection");
                    connectUI();
                    break;
                }
                case ApplicationFacade.ROOMS_JOIN_CMD:
                {
                    trace("Loading Mediator : Room Change");
                    roomListObj = param1.getBody() as Object;
                    loading.showLoading(roomListObj);
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
