package org.puremvc.interfaces
{

    public interface IObserver
    {

        public function IObserver();

        function setNotifyMethod(param1:Function) : void;

        function setNotifyContext(param1:Object) : void;

        function notifyObserver(param1:INotification) : void;

        function compareNotifyContext(param1:Object) : Boolean;

    }
}
