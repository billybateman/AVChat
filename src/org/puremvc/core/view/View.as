package org.puremvc.core.view
{
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;

    public class View extends Object implements IView
    {
        protected var mediatorMap:Array;
        protected var observerMap:Array;
        protected const SINGLETON_MSG:String = "View Singleton already constructed!";
        static var instance:IView;

        public function View()
        {
            if (instance != null)
            {
                throw Error(SINGLETON_MSG);
            }
            instance = this;
            mediatorMap = new Array();
            observerMap = new Array();
            initializeView();
            return;
        }// end function

        protected function initializeView() : void
        {
            return;
        }// end function

        public function registerObserver(param1:String, param2:IObserver) : void
        {
            if (observerMap[param1] != null)
            {
                observerMap[param1].push(param2);
            }
            else
            {
                observerMap[param1] = [param2];
            }
            return;
        }// end function

        public function notifyObservers(param1:INotification) : void
        {
            var _loc_2:Array = null;
            var _loc_3:Number = NaN;
            var _loc_4:IObserver = null;
            if (observerMap[param1.getName()] != null)
            {
                _loc_2 = observerMap[param1.getName()] as Array;
                _loc_3 = 0;
                while (_loc_3 < _loc_2.length)
                {
                    
                    _loc_4 = _loc_2[_loc_3] as IObserver;
                    _loc_4.notifyObserver(param1);
                    _loc_3 = _loc_3 + 1;
                }
            }
            return;
        }// end function

        public function registerMediator(param1:IMediator) : void
        {
            mediatorMap[param1.getMediatorName()] = param1;
            var _loc_2:* = param1.listNotificationInterests();
            if (_loc_2.length == 0)
            {
                return;
            }
            var _loc_3:* = new Observer(param1.handleNotification, param1);
            var _loc_4:Number = 0;
            while (_loc_4 < _loc_2.length)
            {
                
                registerObserver(_loc_2[_loc_4], _loc_3);
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        public function retrieveMediator(param1:String) : IMediator
        {
            return mediatorMap[param1];
        }// end function

        public function removeMediator(param1:String) : void
        {
            var _loc_2:String = null;
            var _loc_3:Array = null;
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            for (_loc_2 in observerMap)
            {
                
                _loc_3 = observerMap[_loc_2];
                _loc_4 = new Array();
                _loc_5 = 0;
                while (_loc_5 < _loc_3.length)
                {
                    
                    if (Observer(_loc_3[_loc_5]).compareNotifyContext(retrieveMediator(param1)) == true)
                    {
                        _loc_4.push(_loc_5);
                    }
                    _loc_5++;
                }
                while (_loc_4.length > 0)
                {
                    
                    _loc_6 = _loc_4.pop();
                    _loc_3.splice(_loc_6, 1);
                }
                if (_loc_3.length == 0)
                {
                    delete observerMap[_loc_2];
                }
            }
            delete mediatorMap[param1];
            return;
        }// end function

        public static function getInstance() : IView
        {
            if (instance == null)
            {
                instance = new View;
            }
            return instance;
        }// end function

    }
}
