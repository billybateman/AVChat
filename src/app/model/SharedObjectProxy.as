package app.model
{
    import app.*;
    import flash.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class SharedObjectProxy extends Proxy implements IProxy
    {
        private var users_so:SharedObject;
        public var user_list:Array;
        private var chat_so:SharedObject;
        public var chat_list:Array;
        private var banned_so:SharedObject;
        public var banned_list:Array;
        public var nc:NetConnection;
        public static const NAME:String = "SharedObjectProxy";

        public function SharedObjectProxy()
        {
            super(NAME);
            user_list = new Array();
            chat_list = new Array();
            banned_list = new Array();
            return;
        }// end function

        public function connect(param1:NetConnection) : void
        {
            nc = param1;
            users_so = SharedObject.getRemote("users", nc.uri, false);
            users_so.addEventListener(SyncEvent.SYNC, userSync);
            users_so.addEventListener(NetStatusEvent.NET_STATUS, onSOnetStatus);
            users_so.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSOSecurityError);
            users_so.client = this;
            users_so.connect(nc);
            chat_so = SharedObject.getRemote("textChat", nc.uri, false);
            chat_so.addEventListener(SyncEvent.SYNC, chatSync);
            chat_so.addEventListener(NetStatusEvent.NET_STATUS, onSOnetStatus);
            chat_so.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSOSecurityError);
            chat_so.client = this;
            chat_so.connect(nc);
            banned_so = SharedObject.getRemote("bannedUsers", nc.uri, false);
            banned_so.addEventListener(SyncEvent.SYNC, bannedSync);
            banned_so.addEventListener(NetStatusEvent.NET_STATUS, onSOnetStatus);
            banned_so.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSOSecurityError);
            banned_so.client = this;
            banned_so.connect(nc);
            return;
        }// end function

        private function userSync(event:SyncEvent) : void
        {
            var _loc_6:Object = null;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            sendNotification(ApplicationFacade.LOG, "onUserSyncEvent: " + event);
            var _loc_2:* = event.changeList;
            var _loc_3:* = event.target.data;
            var _loc_4:* = _loc_3.userList;
            var _loc_5:Number = 0;
            while (_loc_5 < _loc_2.length)
            {
                
                _loc_6 = _loc_2[_loc_5];
                if (_loc_6.name != undefined && _loc_6.name != "userId" && _loc_6.name != "undefined" && _loc_6.name != "userList")
                {
                    trace("users onSync> changList #" + _loc_5 + ", " + _loc_6.code + " " + _loc_6.name);
                    _loc_7 = _loc_3[_loc_6.name].user;
                    _loc_8 = _loc_3[_loc_6.name].audio;
                    _loc_9 = _loc_3[_loc_6.name].video;
                }
                if (_loc_6.code == "clear")
                {
                    sendNotification(ApplicationFacade.USER_CLEAR_CALL);
                }
                else if (_loc_6.code == "change")
                {
                    if (_loc_6.name != undefined && _loc_6.name != "userId" && _loc_6.name != "undefined" && _loc_6.name != "userList")
                    {
                        sendNotification(ApplicationFacade.USER_CHANGE_CALL, _loc_3[_loc_6.name]);
                    }
                }
                else if (_loc_6.code == "delete")
                {
                    sendNotification(ApplicationFacade.USER_DELETE_CALL, _loc_3[_loc_6.name]);
                }
                else if (_loc_6.code == "success")
                {
                    trace("user slot success");
                }
                else if (_loc_6.code == "reject")
                {
                    trace("user slot reject");
                }
                _loc_5 = _loc_5 + 1;
            }
            return;
        }// end function

        public function sendChat(param1:Object) : void
        {
            sendNotification(ApplicationFacade.LOG, "Shared Object Proxy: chatSend - " + param1);
            nc.call("sendTextMsg", null, param1.id, param1.text, param1.user);
            return;
        }// end function

        private function chatSync(event:SyncEvent) : void
        {
            var _loc_5:Object = null;
            sendNotification(ApplicationFacade.LOG, "onChatSyncEvent: " + event);
            var _loc_2:* = event.changeList;
            var _loc_3:* = event.target.data;
            var _loc_4:Number = 0;
            while (_loc_4 < _loc_2.length)
            {
                
                _loc_5 = _loc_2[_loc_4];
                if (_loc_5.name != undefined && _loc_5.name != "undefined" && _loc_5.name != "textId")
                {
                    trace("chat onSync> changList #" + _loc_4 + ", " + _loc_5.code + " " + _loc_5.name);
                    if (_loc_5.code == "clear")
                    {
                        sendNotification(ApplicationFacade.CHAT_DELETE_CALL);
                    }
                    else if (_loc_5.code == "change")
                    {
                        trace("chat slot changed: " + _loc_5.name);
                        sendNotification(ApplicationFacade.CHAT_CHANGE_CALL, _loc_3[_loc_5.name]);
                    }
                    else if (_loc_5.code == "delete")
                    {
                        trace("chat slot deleted: " + _loc_5.name);
                        sendNotification(ApplicationFacade.CHAT_DELETE_CALL, _loc_5.name);
                    }
                    else if (_loc_5.code == "success")
                    {
                        trace("chat slot success");
                    }
                    else if (_loc_5.code == "reject")
                    {
                        trace("chat slot reject");
                    }
                }
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        private function bannedSync(event:SyncEvent) : void
        {
            var _loc_5:Object = null;
            sendNotification(ApplicationFacade.LOG, "onBannedSyncEvent: " + event);
            var _loc_2:* = event.changeList;
            var _loc_3:* = event.target.data;
            var _loc_4:Number = 0;
            while (_loc_4 < _loc_2.length)
            {
                
                _loc_5 = _loc_2[_loc_4];
                if (_loc_5.name != undefined && _loc_5.name != "undefined" && _loc_5.name != "banList")
                {
                    trace("banned onSync> changList #" + _loc_4 + ", " + _loc_5.code + " " + _loc_5.name);
                    if (_loc_5.code == "clear")
                    {
                    }
                    else if (_loc_5.code == "change")
                    {
                    }
                    else if (_loc_5.code == "delete")
                    {
                    }
                    else if (_loc_5.code == "success")
                    {
                    }
                    else if (_loc_5.code == "reject")
                    {
                    }
                }
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        private function onSOnetStatus(event:NetStatusEvent) : void
        {
            sendNotification(ApplicationFacade.LOG, "onSOnetStatus: " + event);
            return;
        }// end function

        private function onSOSecurityError(event:SecurityErrorEvent) : void
        {
            sendNotification(ApplicationFacade.LOG, "onSOnetStatus: " + event);
            return;
        }// end function

    }
}
