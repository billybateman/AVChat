package app.view.components
{
    import app.*;
    import app.view.components.invite.*;
    import app.view.events.*;
    import com.bumpslide.events.*;
    import flash.display.*;
    import flash.events.*;

    public class Invite extends MovieClip
    {
        public var user:String;
        public var invites:Array;
        public var invitesCounter:Number = 0;
        public static var EVENT_CREATION_COMPLETE:String = "onCreationComplete";

        public function Invite()
        {
            user = new String();
            invites = new Array();
            trace("New Invite Loaded");
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            return;
        }// end function

        private function onAddedToStage(event:Event) : void
        {
            trace("Invite is initialized");
            addEventListener(ApplicationFacade.INVITE_CLOSE_CMD, onInviteCloseNotification);
            dispatchEvent(new UIEvent(EVENT_CREATION_COMPLETE, this));
            return;
        }// end function

        public function connectUI()
        {
            trace("Invite : Connect UI");
            return;
        }// end function

        private function onInviteCloseNotification(event:GenericEvent) : void
        {
            trace("Invite Mediator: Invite Close Command Notification");
            (invitesCounter - 1);
            removeChild(invites[event.data]);
            return;
        }// end function

        public function newInvite(param1)
        {
            (invitesCounter + 1);
            invites[param1.id] = new InviteMC(param1);
            invites[param1.id].x = 220 * invitesCounter;
            invites[param1.id].y = 220;
            addChild(invites[param1.id]);
            return;
        }// end function

        public function setSize(param1:Number, param2:Number) : void
        {
            trace("Invite : Set Size:" + param1 + "/" + param2);
            var _loc_3:* = param1;
            var _loc_4:* = param2;
            return;
        }// end function

        public function setRoomObject(param1) : void
        {
            trace("Invite : Set Room Object:" + param1);
            return;
        }// end function

    }
}
