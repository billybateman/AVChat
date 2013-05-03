package org.puremvc.interfaces
{

    public interface IFacade
    {

        public function IFacade();

        function notifyObservers(param1:INotification) : void;

        function registerProxy(param1:IProxy) : void;

        function retrieveProxy(param1:String) : IProxy;

        function removeProxy(param1:String) : void;

        function registerCommand(param1:String, param2:Class) : void;

        function removeCommand(param1:String) : void;

        function registerMediator(param1:IMediator) : void;

        function retrieveMediator(param1:String) : IMediator;

        function removeMediator(param1:String) : void;

    }
}
