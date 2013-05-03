package app
{
    import app.controller.*;
    import flash.display.*;
    import org.puremvc.patterns.facade.*;
    import org.puremvc.patterns.observer.*;

    public class ApplicationFacade extends Facade
    {
        public static const CMD_STARTUP:String = "onCmdStartup";
        public static const CMD_STAGE_UPDATE:String = "onCmdStageUpdate";
        public static const STAGE_RESIZE:String = "onStageResize";
        public static const EVENT_CREATION_COMPLETE:String = "onCreationComplete";
        public static const INIT_LOCALE:String = "onInitLocaleProxy";
        public static const LOG:String = "onLog";
        public static const APP_READY:String = "onAppReady";
        public static const GET_SETTINGS_CMD:String = "getSettingsCmd";
        public static const NET_CONNECTION:String = "onNetConnection";
        public static const NETSTATUS:String = "onNetStatus";
        public static const STANDARD_NET_CONNECTION:String = "onStandardNetConnection";
        public static const STANDARD_NETSTATUS:String = "onStandardNetStatus";
        public static const ROOMS_CONNECT_CMD:String = "onRoomsConnectCmd";
        public static const ROOMS_DISCONNECT_CMD:String = "onRoomsDisconnectCmd";
        public static const ROOMS_DATA_CALL:String = "onRoomsDataCall";
        public static const ROOMS_CHANGE_CALL:String = "onRoomsChangeCall";
        public static const ROOMS_DELETE_CALL:String = "onRoomsDeleteCall";
        public static const ROOMS_CLEAR_CALL:String = "onRoomsClearCall";
        public static const ROOMS_CREATE_CMD:String = "onRoomsCreateCmd";
        public static const ROOMS_JOIN_CMD:String = "onRoomsJoinCmd";
        public static const CLOSE_CREATE_CMD:String = "onCloseCreateCmd";
        public static const CHAT_SEND_CMD:String = "onChatSendCmd";
        public static const CHAT_CHANGE_CALL:String = "onChatChangeCall";
        public static const CHAT_DELETE_CALL:String = "onChatDeleteCall";
        public static const CHAT_CLEAR_CALL:String = "onChatClearCall";
        public static const USER_SEND_CMD:String = "userSendCmd";
        public static const USER_CHANGE_CALL:String = "userChangeCall";
        public static const USER_DELETE_CALL:String = "userDeleteCall";
        public static const USER_CLEAR_CALL:String = "userClearCall";
        public static const VIDEO_PUBLISH_CALL:String = "onVideoPublish";
        public static const AUDIO_PUBLISH_CALL:String = "onAudioPublish";
        public static const VIDEO_ADD_CALL:String = "onAddVideoCall";
        public static const VIDEO_CLOSE_CALL:String = "onCloseVideoCall";
        public static const JAVASCRIPT_CALL:String = "onJavaScriptCall";
        public static const PASSWORD_CORRECT:String = "onPasswordCorrectCall";
        public static const UPDATE_LOCAL_PROXY_CMD:String = "onUpdateLocalProxyCmd";
        public static const INVITE_CLOSE_CMD:String = "onInviteCloseCmd";
        public static const INVITE_OPEN_CMD:String = "onInviteOpenCmd";
        public static const INVITE_SEND_CMD:String = "onInviteSendCmd";

        public function ApplicationFacade()
        {
            return;
        }// end function

        public function startup(param1:DisplayObject, param2:Object) : void
        {
            trace("Application Facade: Startup");
            notifyObservers(new Notification(ApplicationFacade.INIT_LOCALE, param2));
            notifyObservers(new Notification(ApplicationFacade.CMD_STARTUP, param1));
            return;
        }// end function

        override protected function initializeController() : void
        {
            trace("Application Facade: Initialize");
            super.initializeController();
            registerCommand(LOG, LogCommand);
            registerCommand(APP_READY, AppReadyCommand);
            registerCommand(GET_SETTINGS_CMD, GetSettingsCommand);
            registerCommand(NETSTATUS, NetStatusCommand);
            registerCommand(STANDARD_NETSTATUS, StandardNetStatusCommand);
            registerCommand(CMD_STARTUP, StartupCommand);
            registerCommand(CMD_STAGE_UPDATE, StageUpdateCommand);
            registerCommand(INIT_LOCALE, InitLocaleProxyCommand);
            registerCommand(CHAT_SEND_CMD, ChatSendCommand);
            registerCommand(ROOMS_CONNECT_CMD, RoomsConnectCommand);
            registerCommand(ROOMS_DISCONNECT_CMD, RoomsDisconnectCommand);
            registerCommand(ROOMS_CREATE_CMD, CreateRoomCommand);
            registerCommand(ROOMS_JOIN_CMD, JoinRoomCommand);
            registerCommand(INVITE_SEND_CMD, SendInviteCommand);
            registerCommand(UPDATE_LOCAL_PROXY_CMD, UpdateLocalProxyCommand);
            return;
        }// end function

        public static function getInstance() : ApplicationFacade
        {
            trace("Application Facade: Get Instance");
            //if (instance == null)
            //{
                instance = new ApplicationFacade;
            //}
            return instance as ApplicationFacade;
        }// end function

    }
}
