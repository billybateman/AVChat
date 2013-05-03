package app.model
{
    import app.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.proxy.*;

    public class SettingsProxy extends Proxy implements IProxy
    {
        public var connectionString:String;
        public var roomsConnectionString:String;
        public var roomObj:Object;
        public static const NAME:String = "SettingsProxy";
        private static const settings_url:String = "assets/settings.xml";

        public function SettingsProxy(param1:Stage)
        {
            connectionString = new String();
            roomsConnectionString = new String();
            roomObj = new Object();
            trace("Settings Proxy");
            super(NAME, param1);
            return;
        }// end function

        public function getSettings(param1:String) : void
        {
            param1 = param1 + "assets/settings.xml";
            var _loc_2:* = new URLLoader();
            _loc_2.dataFormat = URLLoaderDataFormat.TEXT;
            _loc_2.addEventListener(Event.COMPLETE, onLoadXML);
            _loc_2.load(new URLRequest(param1));
            return;
        }// end function

        public function onLoadXML(event:Event) : void
        {
            var myXML:XML;
            var ev:* = event;
            try
            {
                myXML = new XML(ev.target.data);
                connectionString = myXML.title.chatRtmp.text();
                roomsConnectionString = myXML.title.roomsRtmp.text();
                roomObj.description = "Lobby";
                roomObj.users = 1;
                roomObj.id = "default";
                sendNotification(ApplicationFacade.APP_READY, data);
            }
            catch (e:TypeError)
            {
                trace("Could not parse the XML");
                trace(e.message);
            }
            return;
        }// end function

        public function getConnectionString() : String
        {
            return connectionString;
        }// end function

        public function getRoomsConnectionString() : String
        {
            return roomsConnectionString;
        }// end function

        public function getRoomObject() : Object
        {
            return roomObj;
        }// end function

        public function setRoomObject(param1:Object) : void
        {
            roomObj = param1;
            return;
        }// end function

    }
}
