package org.puremvc.interfaces
{

    public interface IView
    {

        public function IView();

        function registerObserver(param1:String, param2:IObserver) : void;

        function notifyObservers(param1:INotification) : void;

        function registerMediator(param1:IMediator) : void;

        function retrieveMediator(param1:String) : IMediator;

        function removeMediator(param1:String) : void;

    }
}
