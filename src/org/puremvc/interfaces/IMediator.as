package org.puremvc.interfaces
{

    public interface IMediator
    {

        public function IMediator();

        function getMediatorName() : String;

        function getViewComponent() : Object;

        function listNotificationInterests() : Array;

        function handleNotification(param1:INotification) : void;

    }
}
