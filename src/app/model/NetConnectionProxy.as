package app.model
{
    import app.*;
    import flash.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class NetConnectionProxy extends Proxy implements IProxy
    {
        private var nc:NetConnection;
        private var connected:Boolean;
        private var ns:NetStream;
        public static const NAME:String = "NetConnectionProxy";

        public function NetConnectionProxy()
        {
            super(NAME);
            return;
        }// end function

        public function onRegister() : void
        {
            sendNotification(ApplicationFacade.LOG, "Net Connection Proxy: Registered");
            NetConnection.defaultObjectEncoding = ObjectEncoding.AMF0;
            return;
        }// end function

        public function getNetConnection() : NetConnection
        {
            return nc;
        }// end function

        public function connect(param1:String, param2:String, param3:Object) : void
        {
            var _loc_4:* = "Net Connection Proxy: Connect(" + param1 + "," + param3.user + "," + param3.audio + "," + param3.video + "," + param2 + ")";
            sendNotification(ApplicationFacade.LOG, _loc_4);
            nc = new NetConnection();
            nc.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
            nc.connect(param1, param2, param3);
            nc.client = this;
            return;
        }// end function

        public function disconnect() : void
        {
            var _loc_1:String = "Net Connection Proxy: Disconnecting";
            sendNotification(ApplicationFacade.LOG, _loc_1);
            nc.close();
            connected = false;
            return;
        }// end function

        public function updateUser(param1) : void
        {
            var _loc_2:String = "Net Connection Proxy: updateUser";
            sendNotification(ApplicationFacade.LOG, _loc_2);
            nc.call("updateUser", null, param1);
            return;
        }// end function

        public function recRoomInvite(param1:Object) : void
        {
            var _loc_2:String = "Net Connection Proxy: recRoomInvite";
            sendNotification(ApplicationFacade.LOG, _loc_2);
            sendNotification(ApplicationFacade.INVITE_OPEN_CMD, param1);
            return;
        }// end function

        public function receiveMessage(param1:Object) : void
        {
            var _loc_2:* = param1.sender;
            var _loc_3:* = param1.msg;
            var _loc_4:* = "Net Connection Proxy: receiveMessage - sender - " + _loc_2 + " - message - " + _loc_3;
            sendNotification(ApplicationFacade.LOG, _loc_4);
            return;
        }// end function

        public function receiveBan() : void
        {
            nc.close();
            return;
        }// end function

        public function onBWDone(... args) : void
        {
            return;
        }// end function

        public function onBWCheck(param1) : void
        {
            var _loc_2:String = "Net Connection Proxy: onBWCheck called";
            sendNotification(ApplicationFacade.LOG, _loc_2);
            return;
        }// end function

        public function close() : void
        {
            sendNotification(ApplicationFacade.LOG, "Net Connection Proxy: Server called close on us");
            return;
        }// end function

        private function netStatusHandler(event:NetStatusEvent) : void
        {
            var _loc_2:String = null;
            sendNotification(ApplicationFacade.LOG, "Net Connection Proxy: " + event.info.code);
            switch(event.info.code)
            {
                case "NetConnection.Connect.Success":
                {
                    _loc_2 = "Net Connection Proxy: connected successfully to " + NetConnection(event.target).uri;
                    sendNotification(ApplicationFacade.LOG, _loc_2);
                    connected = true;
                    nc = NetConnection(event.target);
                    sendNotification(ApplicationFacade.NETSTATUS, {nc:nc, status:"success"});
                    break;
                }
                case "NetConnection.Connect.Rejected":
                {
                    _loc_2 = "Net Connection Proxy: NetConnection rejected";
                    connected = false;
                    sendNotification(ApplicationFacade.LOG, _loc_2);
                    break;
                }
                case "NetConnection.Connect.Failed":
                {
                    _loc_2 = "Net Connection Proxy: NetConnection failed";
                    connected = false;
                    sendNotification(ApplicationFacade.LOG, _loc_2);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            var _loc_2:* = "Net Connection Proxy: Security error event " + event.toString();
            sendNotification(ApplicationFacade.LOG, _loc_2);
            return;
        }// end function

        protected function asyncErrorHandler(event:AsyncErrorEvent) : void
        {
            var _loc_2:* = "Net Connection Proxy: asyncErrorHandler " + event.error.message;
            sendNotification(ApplicationFacade.LOG, _loc_2);
            return;
        }// end function

        protected function IOErrorHandler(event:IOErrorEvent) : void
        {
            var _loc_2:* = "Net Connection Proxy: IOErrorHandler " + event.text;
            sendNotification(ApplicationFacade.LOG, _loc_2);
            return;
        }// end function

    }
}
