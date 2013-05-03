package org.puremvc.core.controller
{
    import org.puremvc.core.view.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;

    public class Controller extends Object implements IController
    {
        protected var view:IView;
        protected var commandMap:Array;
        protected const SINGLETON_MSG:String = "Controller Singleton already constructed!";
        static var instance:IController;

        public function Controller()
        {
            if (instance != null)
            {
                throw Error(SINGLETON_MSG);
            }
            instance = this;
            commandMap = new Array();
            initializeController();
            return;
        }// end function

        protected function initializeController() : void
        {
            view = View.getInstance();
            return;
        }// end function

        public function executeCommand(param1:INotification) : void
        {
            var _loc_2:* = commandMap[param1.getName()];
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = new _loc_2;
            _loc_3.execute(param1);
            return;
        }// end function

        public function registerCommand(param1:String, param2:Class) : void
        {
            if (commandMap[param1] == null)
            {
                view.registerObserver(param1, new Observer(executeCommand, this));
            }
            commandMap[param1] = param2;
            return;
        }// end function

        public function removeCommand(param1:String) : void
        {
            commandMap[param1] = null;
            return;
        }// end function

        public static function getInstance() : IController
        {
            if (instance == null)
            {
                instance = new Controller;
            }
            return instance;
        }// end function

    }
}
