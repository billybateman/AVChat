package app.view
{
    import app.*;
    import app.model.*;
    import app.view.components.*;
    import app.view.events.*;
    import org.puremvc.interfaces.*;

    public class InviteMediator extends BaseMediator implements IMediator
    {
        public var user:String;
        public var userListObj:Object;
        public var roomListObj:Object;
        public static const NAME:String = "InviteMediator";

        public function InviteMediator(param1:Object = null)
        {
            user = new String();
            userListObj = new Object();
            roomListObj = new Object();
            trace("Invite Mediator Loaded");
            super(NAME, param1);
            var _loc_2:* = facade.retrieveProxy(LocaleProxy.NAME) as LocaleProxy;
            var _loc_3:* = _loc_2.getLocale() as Object;
            user = _loc_3.user;
            invite.addEventListener(ApplicationFacade.ROOMS_JOIN_CMD, onRoomJoinNotification);
            return;
        }// end function

        private function onRoomJoinNotification(event:GenericEvent) : void
        {
            trace("Invite Mediator: Join Room Command Notification");
            sendNotification(ApplicationFacade.ROOMS_JOIN_CMD, event.data);
            return;
        }// end function

        private function connectUI() : void
        {
            trace("Connect UI");
            invite.connectUI();
            return;
        }// end function

        public function get invite() : Invite
        {
            return viewComponent as Invite;
        }// end function

        override public function listNotificationInterests() : Array
        {
            return [ApplicationFacade.STAGE_RESIZE, ApplicationFacade.NET_CONNECTION, ApplicationFacade.INVITE_OPEN_CMD];
        }// end function

        override public function handleNotification(param1:INotification) : void
        {
            var _loc_2:StageProxy = null;
            switch(param1.getName())
            {
                case ApplicationFacade.STAGE_RESIZE:
                {
                    _loc_2 = param1.getBody() as StageProxy;
                    invite.setSize(_loc_2.stageWidth, _loc_2.stageHeight);
                    invite.x = 0;
                    invite.y = 0;
                    break;
                }
                case ApplicationFacade.NET_CONNECTION:
                {
                    trace("Invite Mediator : Net Connection");
                    connectUI();
                    break;
                }
                case ApplicationFacade.INVITE_OPEN_CMD:
                {
                    trace("Invite Mediator : OPEN");
                    roomListObj = param1.getBody() as Object;
                    invite.newInvite(roomListObj);
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
