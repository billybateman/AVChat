package app.view.components.panel
{
     import app.*;
    import app.view.events.*;
	import flash.display.*;
    import flash.text.*;
	import flash.events.*;

    public class UserMC extends MovieClip
    {
        public var userObj:Object;
        public var user_txt:TextField;
		public var view_btn:SimpleButton;

        public function UserMC(param1:Object)
        {
            userObj = new Object();
            trace("New User");
            userObj = param1;
            user_txt.text = userObj.user;
			
			view_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
            return;
        }// end function
		
		public function clickBtnHandler(event:MouseEvent) : void
        {
            trace("Click");
            dispatchEvent( new GenericEvent( ApplicationFacade.VIDEO_ADD_CALL, userObj ));
            return;
        }// end function
		
		

        public function getObject()
        {
            return userObj;
        }// end function

        public function updateData(param1:Object)
        {
            userObj = param1;
            return;
        }// end function

    }
}
