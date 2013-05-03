package app.model
{
    import app.*;
    import flash.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class NetStreamProxy extends Proxy implements IProxy
    {
        private var ns:NetStream;
        public static const NAME:String = "NetStreamProxy";

        public function NetStreamProxy()
        {
            super(NAME);
            return;
        }// end function

        public function connect(param1:NetConnection) : void
        {
            var _loc_2:String = "Net Stream Proxy: Connect";
            sendNotification(ApplicationFacade.LOG, _loc_2);
            ns = new NetStream(param1);
            ns.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
            ns.addEventListener(IOErrorEvent.IO_ERROR, IOErrorHandler);
            ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            return;
        }// end function

        public function setVideo(param1:Boolean)
        {
            return;
        }// end function

        public function setAudio(param1:Boolean)
        {
            return;
        }// end function

        public function getNetStream() : NetStream
        {
            return ns;
        }// end function

        public function disconnect() : void
        {
            var _loc_1:String = "Net Stream Proxy: Disconnecting";
            sendNotification(ApplicationFacade.LOG, _loc_1);
            ns.close();
            return;
        }// end function

        public function close() : void
        {
            sendNotification(ApplicationFacade.LOG, "Net Stream Proxy: Server called close on us");
            return;
        }// end function

        private function netStatusHandler(event:NetStatusEvent) : void
        {
            trace("ns status : ", event.info.code);
            switch(event.info.code)
            {
                case "NetStream.Play.Start":
                {
                    trace("ns started playing");
                    break;
                }
                case "NetStream.Play.UnpublishNotify":
                {
                    trace("ns unpublish notify");
                    break;
                }
                case "NetStream.Buffer.Full":
                {
                    trace("NS Buffer Full");
                    break;
                }
                case "NetStream.Buffer.Empty":
                {
                    break;
                }
                case "NetStream.Buffer.Flush":
                {
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
