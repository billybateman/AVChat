package app.view.components.videoarea
{
    import app.*;
    import app.view.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import flash.text.*;

    public class UserVideoMC extends MovieClip
    {
        public var userObj:Object;
        public var user_txt:TextField;
        public var video_mc:Video;
        public var close_btn:MovieClip;
        public var audio_btn:MovieClip;
        public var audioObj:Object;
        public var video_btn:MovieClip;
        public var videoObj:Object;
        public var hover:Boolean = false;
        public var currentElementFrame:Number = 1;

        public function UserVideoMC(param1:Object)
        {
            userObj = new Object();
            audioObj = new Object();
            videoObj = new Object();
            trace("New User Video");
            audioObj.status = false;
            videoObj.status = false;
            userObj = param1;
            audio_btn.gotoAndStop(2);
            video_btn.gotoAndStop(2);
            close_btn.gotoAndStop(1);
            audio_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            audio_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            audio_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            video_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            video_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            video_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            close_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            close_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
            close_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
            return;
        }// end function

        public function setupUserVideo(param1:Object, param2:NetStream) : void
        {
            trace("User Video: Setup User Video");
            user_txt.text = param1.user;
            video_mc.attachNetStream(param2);
            return;
        }// end function

        public function getObject()
        {
            return userObj;
        }// end function

        public function clickBtnHandler(event:MouseEvent) : void
        {
            switch(event.target.name)
            {
                case "audio_btn":
                {
                    trace("Audio Button");
                    if (audioObj.status == false)
                    {
                        audioObj.status = true;
                        audio_btn.gotoAndStop(3);
                    }
                    else
                    {
                        audioObj.status = false;
                        audio_btn.gotoAndStop(1);
                    }
                    break;
                }
                case "video_btn":
                {
                    trace("Video Button");
                    if (videoObj.status == false)
                    {
                        videoObj.status = true;
                        video_btn.gotoAndStop(3);
                    }
                    else
                    {
                        videoObj.status = false;
                        video_btn.gotoAndStop(1);
                    }
                    break;
                }
                case "close_btn":
                {
                    trace("Close User Video");
                    dispatchEvent(new GenericEvent(ApplicationFacade.VIDEO_CLOSE_CALL, userObj));
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
            switch(event.target.name)
            {
                case "audio_btn":
                {
                    if (audioObj.status == false)
                    {
                        if (hover == true)
                        {
                            _loc_2 = audio_btn.currentFrame;
                            currentElementFrame = _loc_2;
                            audio_btn.gotoAndStop(2);
                        }
                        else
                        {
                            currentElementFrame = 1;
                            audio_btn.gotoAndStop(1);
                        }
                    }
                    break;
                }
                case "video_btn":
                {
                    if (videoObj.status == false)
                    {
                        if (hover == true)
                        {
                            _loc_2 = video_btn.currentFrame;
                            currentElementFrame = _loc_2;
                            video_btn.gotoAndStop(2);
                        }
                        else
                        {
                            currentElementFrame = 1;
                            video_btn.gotoAndStop(1);
                        }
                    }
                    break;
                }
                case "close_btn":
                {
                    if (hover == true)
                    {
                        close_btn.gotoAndStop(2);
                    }
                    else
                    {
                        close_btn.gotoAndStop(1);
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
