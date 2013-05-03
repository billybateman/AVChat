package org.puremvc.interfaces
{

    public interface IModel
    {

        public function IModel();

        function registerProxy(param1:IProxy) : void;

        function retrieveProxy(param1:String) : IProxy;

        function removeProxy(param1:String) : void;

    }
}
