package app.view.components.chat
{
    import app.*;
    import app.view.events.*;
    import fl.controls.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class CreateRoom extends MovieClip
    {
        public var name_txt:TextField;
        public var pwd_txt:TextField;
        public var pwd_lbl:TextField;
        public var pwd_bg:MovieClip;
        public var bg:MovieClip;
        public var protect_box:CheckBox;
        public var invite_txt:TextField;
        public var create_btn:SimpleButton;
        public var close_create_room_btn:SimpleButton;

        public function CreateRoom()
        {
            trace("New Create Room");
            pwd_txt.visible = false;
            pwd_lbl.visible = false;
            pwd_bg.visible = false;
            invite_txt.text = "";
            protect_box.addEventListener(MouseEvent.CLICK, togglePassword);
            close_create_room_btn.addEventListener(MouseEvent.CLICK, closeCreateRoom);
            create_btn.addEventListener(MouseEvent.CLICK, validateCreateRoom);
            __setProp_protect_box_create_room_mc_Layer1_0();
            return;
        }// end function

        public function validateCreateRoom(event:MouseEvent) : void
        {
            var _loc_2:String = null;
            var _loc_3:String = null;
            var _loc_4:Object = null;
            if (name_txt.text != "")
            {
                _loc_2 = new String();
                _loc_3 = generateRandomString(16);
                _loc_4 = new Object();
                _loc_4.room = _loc_3;
                _loc_4.description = name_txt.text;
                _loc_4.users = "0";
                _loc_4.pwd = pwd_txt.text;
                _loc_4.id = _loc_3;
                name_txt.text = "";
                pwd_txt.visible = false;
                pwd_txt.text = "";
                pwd_lbl.visible = false;
                pwd_bg.visible = false;
                protect_box.selected = false;
                trace("Create New Room:" + _loc_4.description);
                trace("with password:" + _loc_4.pwd);
                dispatchEvent(new GenericEvent(ApplicationFacade.ROOMS_CREATE_CMD, _loc_4));
            }
            return;
        }// end function

        public function closeCreateRoom(event:MouseEvent) : void
        {
            dispatchEvent(new GenericEvent(ApplicationFacade.CLOSE_CREATE_CMD, null));
            return;
        }// end function

        public function generateRandomString(param1:Number) : String
        {
            var _loc_2:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var _loc_3:* = _loc_2.split("");
            var _loc_4:String = "";
            var _loc_5:Number = 0;
            while (_loc_5 < param1)
            {
                
                _loc_4 = _loc_4 + _loc_3[Math.floor(Math.random() * _loc_3.length)];
                _loc_5 = _loc_5 + 1;
            }
            return _loc_4;
        }// end function

        public function togglePassword(event:MouseEvent) : void
        {
            if (pwd_txt.visible == true)
            {
                pwd_txt.visible = false;
                pwd_txt.text = "";
                pwd_lbl.visible = false;
                pwd_bg.visible = false;
            }
            else
            {
                pwd_txt.visible = true;
                pwd_lbl.visible = true;
                pwd_bg.visible = true;
            }
            return;
        }// end function

        public function setSize(param1:Number, param2:Number) : void
        {
            var _loc_3:* = param1;
            var _loc_4:* = param2;
            bg.width = param1 - 190;
            bg.height = param2 - 295;
            close_create_room_btn.x = param1 - (close_create_room_btn.width + 195);
            create_btn.x = param1 - (create_btn.width + 195);
            return;
        }// end function

        function __setProp_protect_box_create_room_mc_Layer1_0()
        {
            try
            {
                protect_box["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            protect_box.enabled = true;
            protect_box.label = "";
            protect_box.labelPlacement = "right";
            protect_box.selected = false;
            protect_box.visible = true;
            try
            {
                protect_box["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
