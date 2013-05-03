package app.view {

    import org.puremvc.interfaces.IMediator;
    import org.puremvc.interfaces.INotification;
    
       
    import app.ApplicationFacade;    
	import app.model.*;
    import app.view.events.*;
    import app.view.components.*;
    
    import com.bumpslide.events.UIEvent;
	
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.NetStream;
	import flash.media.*;
	
    /**
     * Mediator for Chat
     * 
     * @author Billy Bateman
     */
    public class ChatMediator extends BaseMediator implements IMediator {
        
       public static const NAME:String = "ChatMediator";
       
	   public var nc:NetConnection = new NetConnection;
	   
	   
	   	   
        public function ChatMediator(viewComponent:Object = null)
        {
            
			trace("Chat Mediator Loaded");
			
			super(NAME, viewComponent);
            
			// Get GUID from localproxy
			var localProxy:LocaleProxy = facade.retrieveProxy( LocaleProxy.NAME ) as LocaleProxy;
         	var flashVars:Object = localProxy.getLocale() as Object;
			
			var user:String = flashVars.user;
			
			chat.setupUser(user);
			
            // listen for UI events from our view
            chat.addEventListener( ApplicationFacade.CHAT_SEND_CMD, onChatSendNotification );			
			chat.addEventListener( ApplicationFacade.ROOMS_CREATE_CMD, onCreateRoomNotification );			
			chat.addEventListener( ApplicationFacade.INVITE_SEND_CMD, onInviteSendNotification );
			
        }
		
		private function onInviteSendNotification( e:GenericEvent ):void
		{			
			trace("Invite Mediator: Send Invite Command Notification");
			sendNotification( ApplicationFacade.INVITE_SEND_CMD, e.data );
		}
		
		/* Javascript Notification */
		private function onChatSendNotification( e:GenericEvent ):void
		{
			sendNotification( ApplicationFacade.CHAT_SEND_CMD, e.data );
		}
		
		private function onCreateRoomNotification( e:GenericEvent ):void
		{
			trace("ChatMediator: ROOMS_CREATE_CMD");
			chat.hideCreateRoom();
			sendNotification( ApplicationFacade.ROOMS_CREATE_CMD, e.data );
		}
		
		private function connectUI(){
			trace("Connect UI");
			
			chat.clearChat();
			
			// send in name of room
			/* Get the user from the local proxy */
			var settingsProxy:SettingsProxy = facade.retrieveProxy( SettingsProxy.NAME ) as SettingsProxy;
			var roomObj:Object = settingsProxy.getRoomObject() as Object;
			
			chat.setupRoomObject(roomObj);
			
		}	
		
        
        /**
         * viewComponent cast to appropriate type
         */
        public function get chat() : Chat {
            return viewComponent as Chat;
        }
        
        /**
         * List all notifications this Mediator is interested in.
         * 
         * @return Array the list of Nofitication names
         */
        override public function listNotificationInterests():Array 
        {
            return [
               
                ApplicationFacade.STAGE_RESIZE,
				ApplicationFacade.JAVASCRIPT_CALL,
				ApplicationFacade.NET_CONNECTION,
				ApplicationFacade.CHAT_CHANGE_CALL
            ];            
        }

        /**
         * Handle all notifications this Mediator is interested in.
         * 
         * @param INotification a notification 
         */
        override public function handleNotification( note:INotification ):void 
        {
            switch ( note.getName() ) 
            {
               
                case ApplicationFacade.STAGE_RESIZE:
                    	var stage:StageProxy = note.getBody() as StageProxy;
                    	chat.setSize( stage.stageWidth, stage.stageHeight );					
                    break;
				case ApplicationFacade.JAVASCRIPT_CALL:
                    trace("Application Facade Javascript Call");
						//canvas.setObject(note.getBody());
                    break;
				 case ApplicationFacade.NET_CONNECTION:
						nc = note.getBody() as NetConnection;
						
						connectUI();
					break;
				 case ApplicationFacade.CHAT_CHANGE_CALL:
						var chatChangeObj = note.getBody() as Object;
						trace("Chat Mediator : CHAT_CHANGE_CALL : " + chatChangeObj);
						chat.addChatMessage(chatChangeObj);
					break;
                
                default:
                    break;
            }
        }       
        
    }
}