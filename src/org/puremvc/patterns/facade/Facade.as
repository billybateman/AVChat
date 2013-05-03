package org.puremvc.patterns.facade
{
    import org.puremvc.core.controller.*;
    import org.puremvc.core.model.*;
    import org.puremvc.core.view.*;
    import org.puremvc.interfaces.*;

    public class Facade extends Object implements IFacade
    {
        protected var controller:IController;
        protected var model:IModel;
        protected var view:IView;
        protected const SINGLETON_MSG:String = "Facade Singleton already constructed!";
        static var instance:IFacade;

        public function Facade()
        {
            if (instance != null)
            {
                throw Error(SINGLETON_MSG);
            }
            instance = this;
            initializeFacade();
            return;
        }// end function

        protected function initializeFacade() : void
        {
            initializeModel();
            initializeController();
            initializeView();
            return;
        }// end function

        protected function initializeController() : void
        {
            if (controller != null)
            {
                return;
            }
            controller = Controller.getInstance();
            return;
        }// end function

        protected function initializeModel() : void
        {
            if (model != null)
            {
                return;
            }
            model = Model.getInstance();
            return;
        }// end function

        protected function initializeView() : void
        {
            if (view != null)
            {
                return;
            }
            view = View.getInstance();
            return;
        }// end function

        public function notifyObservers(param1:INotification) : void
        {
            if (view != null)
            {
                view.notifyObservers(param1);
            }
            return;
        }// end function

        public function registerCommand(param1:String, param2:Class) : void
        {
            controller.registerCommand(param1, param2);
            return;
        }// end function

        public function removeCommand(param1:String) : void
        {
            controller.removeCommand(param1);
            return;
        }// end function

        public function registerProxy(param1:IProxy) : void
        {
            model.registerProxy(param1);
            return;
        }// end function

        public function retrieveProxy(param1:String) : IProxy
        {
            return model.retrieveProxy(param1);
        }// end function

        public function removeProxy(param1:String) : void
        {
            if (model != null)
            {
                model.removeProxy(param1);
            }
            return;
        }// end function

        public function registerMediator(param1:IMediator) : void
        {
            if (view != null)
            {
                view.registerMediator(param1);
            }
            return;
        }// end function

        public function retrieveMediator(param1:String) : IMediator
        {
            return view.retrieveMediator(param1) as IMediator;
        }// end function

        public function removeMediator(param1:String) : void
        {
            if (view != null)
            {
                view.removeMediator(param1);
            }
            return;
        }// end function

        public static function getInstance() : IFacade
        {
            if (instance == null)
            {
                instance = new Facade;
            }
            return instance;
        }// end function

    }
}
