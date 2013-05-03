package app.view.components.loading
{
    import app.*;
    import app.view.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class ProtectMC extends MovieClip
    {
        public var roomObj:Object;
        public var pwd_txt:TextField;
        public var enter_btn:SimpleButton;

        public function ProtectMC()
        {
            roomObj = new Object();
            trace("New Protect MC");
            enter_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            return;
        }// end function

        public function clickBtnHandler(event:MouseEvent) : void
        {
            trace("Click");
            if (pwd_txt.text != "")
            {
                if (pwd_txt.text == roomObj.pwd)
                {
                    pwd_txt.text = "";
                    dispatchEvent(new GenericEvent(ApplicationFacade.PASSWORD_CORRECT, null));
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
