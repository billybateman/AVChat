package org.puremvc.interfaces
{

    public interface INotification
    {

        public function INotification();

        function getName() : String;

        function setBody(param1:Object) : void;

        function getBody() : Object;

        function setType(param1:String) : void;

        function getType() : String;

        function toString() : String;

    }
}
