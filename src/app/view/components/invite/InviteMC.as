package app.view.components.invite
{
    import app.*;
    import app.view.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class InviteMC extends MovieClip
    {
        public var inviteID:String;
        public var user:String;
        public var roomObj:Object;
        public var user_txt:TextField;
        public var room_txt:TextField;
        public var message_txt:TextField;
        public var accept_invite_btn:SimpleButton;
        public var close_invite_btn:SimpleButton;

        public function InviteMC(param1)
        {
            inviteID = new String();
            user = new String();
            roomObj = new Object();
            trace("New Invite MC");
            roomObj = param1;
            inviteID = roomObj.id;
            user = roomObj.from;
            user_txt.text = roomObj.from;
            room_txt.text = roomObj.description;
            if (roomObj.pwd != "")
            {
                message_txt.htmlText = user + " has invited you to join the private chat room " + roomObj.description + ". <br>Password is \'" + roomObj.pwd + "\'";
            }
            else
            {
                message_txt.htmlText = user + " has invited you to join the chat room " + roomObj.description + ".";
            }
            accept_invite_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            close_invite_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            return;
        }// end function

        public function clickBtnHandler(event:MouseEvent) : void
        {
            trace("Click");
            switch(event.target.name)
            {
                case "accept_invite_btn":
                {
                    dispatchEvent(new GenericEvent(ApplicationFacade.ROOMS_JOIN_CMD, roomObj));
                    dispatchEvent(new GenericEvent(ApplicationFacade.INVITE_CLOSE_CMD, inviteID));
                    break;
                }
                case "close_invite_btn":
                {
                    dispatchEvent(new GenericEvent(ApplicationFacade.INVITE_CLOSE_CMD, inviteID));
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function getRoomObject()
        {
            return roomObj;
        }// end function

        public function setRoomObject(param1:Object)
        {
            roomObj = param1;
            return;
        }// end function

    }
}
