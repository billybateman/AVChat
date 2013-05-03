package app.model
{
    import app.*;
    import flash.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class RoomsSharedObjectProxy extends Proxy implements IProxy
    {
        private var rooms_so:SharedObject;
        public var rooms_list:Array;
        public var nc:NetConnection;
        public static const NAME:String = "RoomsSharedObjectProxy";

        public function RoomsSharedObjectProxy()
        {
            super(NAME);
            rooms_list = new Array();
            return;
        }// end function

        public function connect(param1:NetConnection) : void
        {
            sendNotification(ApplicationFacade.LOG, "Rooms Shared Object Proxy Connect");
            nc = param1;
            rooms_so = SharedObject.getRemote("rooms", nc.uri, true);
            rooms_so.addEventListener(SyncEvent.SYNC, roomsSync);
            rooms_so.addEventListener(NetStatusEvent.NET_STATUS, onSOnetStatus);
            rooms_so.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSOSecurityError);
            rooms_so.client = this;
            rooms_so.connect(nc);
            return;
        }// end function

        private function roomsSync(event:SyncEvent) : void
        {
            var _loc_5:Object = null;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            sendNotification(ApplicationFacade.LOG, "onRoomsSyncEvent: " + event);
            var _loc_2:* = event.changeList;
            var _loc_3:* = event.target.data;
            trace(_loc_2.length);
            var _loc_4:Number = 0;
            while (_loc_4 < _loc_2.length)
            {
                
                _loc_5 = _loc_2[_loc_4];
                if (_loc_5.name != undefined && _loc_5.name != "roomId" && _loc_5.name != "undefined")
                {
                    trace("rooms onSync> changList #" + _loc_4 + ", " + _loc_5.code + " " + _loc_5.name);
                    _loc_6 = _loc_3[_loc_5.name].room;
                    _loc_7 = _loc_3[_loc_5.name].users;
                    _loc_8 = _loc_3[_loc_5.name].description;
                    _loc_9 = _loc_3[_loc_5.name].pwd;
                    trace("ROOM:" + _loc_6 + " users:" + _loc_7);
                }
                if (_loc_5.code == "clear")
                {
                    sendNotification(ApplicationFacade.ROOMS_CLEAR_CALL);
                }
                else if (_loc_5.code == "change")
                {
                    if (_loc_5.name != undefined && _loc_5.name != "roomId" && _loc_5.name != "undefined")
                    {
                        sendNotification(ApplicationFacade.ROOMS_CHANGE_CALL, _loc_3[_loc_5.name]);
                    }
                }
                else if (_loc_5.code == "delete")
                {
                    sendNotification(ApplicationFacade.ROOMS_DELETE_CALL, _loc_3[_loc_5.name]);
                }
                else if (_loc_5.code == "success")
                {
                    trace("ROOMS slot success");
                }
                else if (_loc_5.code == "reject")
                {
                    trace("ROOMS slot reject");
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
