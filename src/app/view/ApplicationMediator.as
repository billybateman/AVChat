package app.view
{
    import app.*;
    import app.view.components.*;
    import com.bumpslide.events.*;
    import org.puremvc.interfaces.*;

    public class ApplicationMediator extends BaseMediator implements IMediator
    {
        public static const NAME:String = "ApplicationMediator";

        public function ApplicationMediator(param1:Object)
        {
            trace("Application Mediator Loaded");
            super(NAME, param1);
            param1.addEventListener(Chat.EVENT_CREATION_COMPLETE, registerChildMediators);
            param1.addEventListener(Panel.EVENT_CREATION_COMPLETE, registerChildMediators);
            param1.addEventListener(VideoArea.EVENT_CREATION_COMPLETE, registerChildMediators);
            param1.addEventListener(Loading.EVENT_CREATION_COMPLETE, registerChildMediators);
            param1.addEventListener(Invite.EVENT_CREATION_COMPLETE, registerChildMediators);
            return;
        }// end function

        private function registerChildMediators(event:UIEvent) : void
        {
            var _loc_2:Chat = null;
            var _loc_3:Panel = null;
            var _loc_4:VideoArea = null;
            var _loc_5:Loading = null;
            var _loc_6:Invite = null;
            if (event.data.name == "chat_mc")
            {
                _loc_2 = event.data as Chat;
                facade.registerMediator(new ChatMediator(_loc_2));
                sendNotification(ApplicationFacade.CMD_STAGE_UPDATE);
            }
            if (event.data.name == "panel_mc")
            {
                _loc_3 = event.data as Panel;
                facade.registerMediator(new PanelMediator(_loc_3));
                sendNotification(ApplicationFacade.CMD_STAGE_UPDATE);
            }
            if (event.data.name == "video_area_mc")
            {
                _loc_4 = event.data as VideoArea;
                facade.registerMediator(new VideoAreaMediator(_loc_4));
                sendNotification(ApplicationFacade.CMD_STAGE_UPDATE);
            }
            if (event.data.name == "loading_mc")
            {
                _loc_5 = event.data as Loading;
                facade.registerMediator(new LoadingMediator(_loc_5));
                sendNotification(ApplicationFacade.CMD_STAGE_UPDATE);
            }
            if (event.data.name == "invite_mc")
            {
                _loc_6 = event.data as Invite;
                facade.registerMediator(new InviteMediator(_loc_6));
                sendNotification(ApplicationFacade.CMD_STAGE_UPDATE);
            }
            return;
        }// end function

    }
}
