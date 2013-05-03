package org.puremvc.core.model
{
    import org.puremvc.interfaces.*;

    public class Model extends Object implements IModel
    {
        protected var proxyMap:Array;
        protected const SINGLETON_MSG:String = "Model Singleton already constructed!";
        static var instance:IModel;

        public function Model()
        {
            if (instance != null)
            {
                throw Error(SINGLETON_MSG);
            }
            instance = this;
            proxyMap = new Array();
            initializeModel();
            return;
        }// end function

        protected function initializeModel() : void
        {
            return;
        }// end function

        public function registerProxy(param1:IProxy) : void
        {
            proxyMap[param1.getProxyName()] = param1;
            return;
        }// end function

        public function retrieveProxy(param1:String) : IProxy
        {
            return proxyMap[param1];
        }// end function

        public function removeProxy(param1:String) : void
        {
            proxyMap[param1] = null;
            return;
        }// end function

        public static function getInstance() : IModel
        {
            if (instance == null)
            {
                instance = new Model;
            }
            return instance;
        }// end function

    }
}
