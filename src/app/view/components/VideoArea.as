package app.view.components
{
    import app.view.components.videoarea.*;
    import com.bumpslide.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import gs.*;

    public class VideoArea extends MovieClip
    {
        public var user:String;
        public var video_list_holder_mc:MovieClip;
        public var video_area_bg:MovieClip;
        public var video_count:Number = 0;
        public var myScroller:Scroller;
        public static var EVENT_CREATION_COMPLETE:String = "onCreationComplete";

        public function VideoArea()
        {
            user = new String();
            trace("New VideoArea Loaded");
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            return;
        }// end function

        private function onAddedToStage(event:Event) : void
        {
            trace("VideoArea is initialized");
            video_list_holder_mc.width = 600;
            myScroller = new Scroller(video_list_holder_mc, 600, 145, new scrollerFaceHorizontal(), "horizontal");
            dispatchEvent(new UIEvent(EVENT_CREATION_COMPLETE, this));
            return;
        }// end function

        public function addListUser(param1:Object, param2:NetStream) : void
        {
            var _loc_5:UserVideoMC = null;
            trace("VideoArea: Add List User");
            trace(param1.user);
            var _loc_3:* = param1.user;
            var _loc_4:* = MovieClip(video_list_holder_mc.getChildByName(_loc_3));
            if (video_list_holder_mc.getChildByName(_loc_3) == null)
            {
                trace("Video Area: Add User Video");
                _loc_5 = new UserVideoMC(param1);
                _loc_5.x = video_count * 155;
                _loc_5.y = 0;
                _loc_5.name = "video_" + param1.user;
                _loc_5.setupUserVideo(param1, param2);
                video_list_holder_mc.addChild(_loc_5);
                (video_count + 1);
            }
            return;
        }// end function

        public function removeListUser(param1:Object) : void
        {
            var _loc_6:DisplayObject = null;
            trace("Video Area: Remove List User :" + param1.user);
            var _loc_2:* = "video_" + param1.user;
            var _loc_3:* = MovieClip(video_list_holder_mc.getChildByName(_loc_2));
            var _loc_4:* = _loc_3.x;
            video_list_holder_mc.removeChild(_loc_3);
            (video_count - 1);
            var _loc_5:* = 0;
            while (_loc_5 < video_list_holder_mc.numChildren)
            {
                
                _loc_6 = video_list_holder_mc.getChildAt(_loc_5);
                if (_loc_5 > 0)
                {
                    trace(_loc_6.name);
                    trace(_loc_6);
                    if (_loc_6.x > _loc_4)
                    {
                        TweenLite.to(_loc_6, 1, {x:_loc_6.x - 155, y:_loc_6.y});
                    }
                }
                _loc_5 = _loc_5 + 1;
            }
            return;
        }// end function

        public function changeListUser(param1:Object) : void
        {
            trace("Video Area: Change List User");
            trace(param1.user);
            var _loc_2:* = param1.user;
            var _loc_3:* = MovieClip(video_list_holder_mc.getChildByName(_loc_2));
            if (video_list_holder_mc.getChildByName(_loc_2) != null)
            {
                _loc_3.updateData(param1);
            }
            return;
        }// end function

        public function setupUser(param1:String) : void
        {
            trace("VideoArea : Setup User : " + param1);
            user = param1;
            return;
        }// end function

        public function setSize(param1:Number, param2:Number) : void
        {
            trace("VideoArea : Set Size:" + param1 + "/" + param2);
            var _loc_3:* = param1;
            var _loc_4:* = param2;
            video_area_bg.width = param1 - 190;
            myScroller.updateSize(param1 - 195, 145);
            return;
        }// end function

        public function setObject(param1) : void
        {
            trace("VideoArea : Set Object:" + param1);
            return;
        }// end function

    }
}
