package org.puremvc.interfaces
{

    public interface IController
    {

        public function IController();

        function registerCommand(param1:String, param2:Class) : void;

        function executeCommand(param1:INotification) : void;

        function removeCommand(param1:String) : void;

    }
}
