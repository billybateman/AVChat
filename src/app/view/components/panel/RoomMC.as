package app.view.components.panel
{
    import app.*;
    import app.view.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class RoomMC extends MovieClip
    {
        public var roomObj:Object;
        public var room_txt:TextField;
        public var online_txt:TextField;
        public var private_mc:MovieClip;
        public var join_btn:MovieClip;
        public var hover_mc:MovieClip;
        public var hover:Boolean = false;

        public function RoomMC(param1:Object)
        {
            roomObj = new Object();
            trace("New Room");
            private_mc.visible = false;
            roomObj = param1;
            room_txt.text = roomObj.description;
            online_txt.text = roomObj.users + " users online";
            trace("PWD:" + roomObj.pwd + "!");
            if (roomObj.pwd == "")
            {
                private_mc.visible = false;
            }
            else
            {
                private_mc.visible = true;
            }
            join_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            join_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            join_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            room_txt.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            room_txt.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            room_txt.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            online_txt.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            online_txt.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            online_txt.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            hover_mc.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            hover_mc.alpha = 0;
            return;
        }// end function

        public function clickBtnHandler(event:MouseEvent) : void
        {
            trace("Click");
            dispatchEvent(new GenericEvent(ApplicationFacade.ROOMS_JOIN_CMD, roomObj));
            return;
        }// end function

        public function hoverBtnHandler(event:MouseEvent) : void
        {
            var _loc_2:* = new Number();
            if (hover == false)
            {
                hover = true;
            }
            else
            {
                hover = false;
            }
            if (hover == true)
            {
                hover_mc.alpha = 100;
            }
            else
            {
                hover_mc.alpha = 0;
            }
            return;
        }// end function

        public function getObject()
        {
            return roomObj;
        }// end function

        public function updateData(param1:Object)
        {
            roomObj = param1;
            room_txt.text = roomObj.description;
            online_txt.text = roomObj.users + " users online";
            if (roomObj.pwd == "")
            {
                private_mc.visible = false;
            }
            else
            {
                private_mc.visible = true;
            }
            return;
        }// end function

    }
}
