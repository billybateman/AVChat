package app.view.components
{
    import app.*;
    import app.view.events.*;
    import com.bumpslide.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class Loading extends MovieClip
    {
        public var user:String;
        public var roomObj:Object;
        public var bg:MovieClip;
        public var protect_mc:MovieClip;
        public var protect_enter_btn:SimpleButton;
        public var pwd_txt:TextField;
        public var passwordSet:Boolean = false;
        public static var EVENT_CREATION_COMPLETE:String = "onCreationComplete";

        public function Loading()
        {
            user = new String();
            trace("New Loading Loaded");
            protect_mc.visible = false;
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            protect_mc.addEventListener(ApplicationFacade.PASSWORD_CORRECT, onPasswordCorrect);
            return;
        }// end function

        public function onPasswordCorrect(event:GenericEvent)
        {
            hideLoading();
            return;
        }// end function

        private function onAddedToStage(event:Event) : void
        {
            trace("Loading is initialized");
            dispatchEvent(new UIEvent(EVENT_CREATION_COMPLETE, this));
            return;
        }// end function

        public function connectUI() : void
        {
            trace("Loading : Connect UI");
            if (!passwordSet)
            {
                hideLoading();
            }
            return;
        }// end function

        public function setSize(param1:Number, param2:Number) : void
        {
            trace("Loading : Set Size:" + param1 + "/" + param2);
            var _loc_3:* = param1;
            var _loc_4:* = param2;
            bg.width = param1;
            bg.height = param2;
            var _loc_5:* = param1 / 2 - protect_mc.width / 2;
            protect_mc.x = _loc_5;
            var _loc_6:* = param2 / 2 - protect_mc.height / 2;
            protect_mc.y = _loc_6;
            return;
        }// end function

        public function hideLoading() : void
        {
            trace("Loading : Hide Loading");
            passwordSet = false;
            protect_mc.visible = false;
            bg.visible = false;
            return;
        }// end function

        public function showLoading(param1) : void
        {
            trace("Loading : Show Loading");
            passwordSet = false;
            roomObj = param1;
            if (roomObj.pwd != "")
            {
                protect_mc.setRoomObject(roomObj);
                passwordSet = true;
                protect_mc.visible = true;
            }
            else
            {
                protect_mc.visible = false;
            }
            bg.visible = true;
            return;
        }// end function

        public function setRoomObject(param1) : void
        {
            trace("Loading : Set Room Object:" + param1);
            return;
        }// end function

    }
}
