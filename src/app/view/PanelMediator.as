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
	import flash.events.ActivityEvent;
    import flash.media.Microphone;
	import flash.events.*;
	
    /**
     * Mediator for Panel
     * 
     * @author Billy Bateman
     */
    public class PanelMediator extends BaseMediator implements IMediator {
        
       public static const NAME:String = "PanelMediator";
       
	   public var nc:NetConnection = new NetConnection;	   
	   public var user:String = new String();
	   
	   
	   public var userObj:Object = new Object();
	   public var userListObj:Object = new Object();
	   public var roomListObj:Object = new Object();
	   
	   public var myStream :	NetStream;
	   public var mic	   :	Microphone;	   
	   public var cam      :    Camera;
	   public var camFPS   :    Number    	= 15;
	   public var camW     :    Number  	= 640;
	   public var camH     :    Number 		= 480;
	   
        public function PanelMediator(viewComponent:Object = null)
        {
            
			trace("Panel Mediator Loaded");
			
			super(NAME, viewComponent);
			
			// Get GUID from localproxy
			var localProxy:LocaleProxy = facade.retrieveProxy( LocaleProxy.NAME ) as LocaleProxy;
         	var flashVars:Object = localProxy.getLocale() as Object;
			
			user = flashVars.user;
			
			panel.setupUser(user);			
            
            // listen for UI events from our view
            panel.addEventListener( ApplicationFacade.VIDEO_PUBLISH_CALL, onVideoNotification );
			panel.addEventListener( ApplicationFacade.AUDIO_PUBLISH_CALL, onAudioNotification );
			panel.addEventListener( ApplicationFacade.JAVASCRIPT_CALL, onJavascriptNotification );
			panel.addEventListener( ApplicationFacade.VIDEO_ADD_CALL, onVideoAddNotification );
			
			panel.addEventListener( ApplicationFacade.ROOMS_CONNECT_CMD, onRoomsConnectNotification );
			panel.addEventListener( ApplicationFacade.ROOMS_DISCONNECT_CMD, onRoomsDisconnectNotification );
			panel.addEventListener( ApplicationFacade.ROOMS_JOIN_CMD, onRoomJoinNotification );
			
      
	  }
	  	
		private function onRoomJoinNotification( e:GenericEvent ):void
		{			
			trace("Panel Mediator: Join Room Command Notification");
			sendNotification( ApplicationFacade.ROOMS_JOIN_CMD, e.data );
		}
		
		private function onRoomsConnectNotification( e:GenericEvent ):void
		{			
			trace("Send Rooms Connect Command Notification");
			sendNotification( ApplicationFacade.ROOMS_CONNECT_CMD, e.data );
		}
		
		private function onRoomsDisconnectNotification( e:GenericEvent ):void
		{			
			trace("Send Rooms Disconnect Command Notification");
			sendNotification( ApplicationFacade.ROOMS_DISCONNECT_CMD, e.data );
		}
		
		private function onVideoAddNotification( e:GenericEvent ):void
		{			
			trace("Send Video Add Notification");
			sendNotification( ApplicationFacade.VIDEO_ADD_CALL, e.data );
		}
		
		/* Video Publish Notification */
		private function onVideoNotification( e:GenericEvent ):void
		{
			trace("Panel Mediator: Video Notify");
			
			var video_obj:Object = e.data;
			
			/* Get the user from the local proxy */				
			var localProxy:LocaleProxy = facade.retrieveProxy( LocaleProxy.NAME ) as LocaleProxy;
			var flashVars:Object = localProxy.getLocale() as Object;				
			
			userObj = flashVars;
							
			userObj.user = flashVars.user;
			userObj.audio = flashVars.video;
			userObj.video = video_obj.status;
				
				
			sendNotification( ApplicationFacade.UPDATE_LOCAL_PROXY_CMD, userObj );			
			
			if(video_obj.status == true){
				publishCamera();
			} else {
				unPublishCamera();
			}
			
			sendNotification( ApplicationFacade.VIDEO_PUBLISH_CALL, e.data );
		}
		
		/* Audio Publish Notification */
		private function onAudioNotification( e:GenericEvent ):void
		{
			
			trace("Panel Mediator: Audio Notify");
			
			var audio_obj:Object = e.data;
			
			
			/* Get the user from the local proxy */				
			var localProxy:LocaleProxy = facade.retrieveProxy( LocaleProxy.NAME ) as LocaleProxy;
			var flashVars:Object = localProxy.getLocale() as Object;				
			
			userObj = flashVars;
							
			userObj.user = flashVars.user;
			userObj.audio = audio_obj.status;
			userObj.video = flashVars.video;
				
				
			sendNotification( ApplicationFacade.UPDATE_LOCAL_PROXY_CMD, userObj );			
			
			if(audio_obj.status == true){
				publishMicrophone();
			} else {
				unPublishMicrophone();
			}
		}
				
		/* Javascript Notification */
		private function onJavascriptNotification( e:GenericEvent ):void
		{
			sendNotification( ApplicationFacade.JAVASCRIPT_CALL, e.data );
		}
		
		private function connectUI():void{
			trace("Connect UI");		
			panel.removeAllUsers();
			setupCameraStream();
			publishCamera();
			publishMicrophone();
			
		}
		
		public function setupCameraStream():void {
			 					
			// Setup Shared Object Proxy
			var nsPxy2:NetStreamProxy = facade.retrieveProxy( NetStreamProxy.NAME ) as NetStreamProxy;
			nsPxy2.connect( nc );			
			myStream = nsPxy2.getNetStream() as NetStream;
			
			myStream.publish(user, "publish");
			
		}
		
		public function publishCamera():void {
			trace("publish cam");								
			cam = Camera.getCamera();
	        //cam.setMode(camW, camH, camFPS);
	        //cam.setQuality(512000, 90);	        
			//cam.addEventListener(ActivityEvent.ACTIVITY, activityHandler);			
			myStream.attachCamera(cam);	
			panel.setupWebcam(cam);
				
		}
		
		
		
		public function unPublishCamera(){
			 					
			myStream.attachCamera(null);			
			panel.clearWebcam();			
				
		}
		
		public function publishMicrophone():void {
			
			trace("publish microphone");
			
			mic = Microphone.getMicrophone();
			//mic.setSilenceLevel(10, -1);	
			
	        //mic.setUseEchoSuppression(true);
			
			panel.addEventListener(Event.ENTER_FRAME, onChangeFrame);
			
			myStream.attachAudio(mic);
	    }
		
		public function unPublishMicrophone():void{
			 					
			myStream.attachAudio(null);
			
				
		}
		
		private function activityHandler(event:ActivityEvent):void {
            //trace("event: " + event);
            //trace("event.activating: " + event.activating);
			
			// Set userobj to true if its not already done
			// if the user hasn't disabled the video
        }
		
		private function onChangeFrame(event:Event):void {
            //trace("Microphone Level:" + mic.activityLevel);
			
			// Set userobj to true if its not already done
			// if the user hasn't disabled the audio
        }
        
        /**
         * viewComponent cast to appropriate type
         */
        public function get panel() : Panel {
            return viewComponent as Panel;
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
				ApplicationFacade.USER_CHANGE_CALL,
				ApplicationFacade.USER_DELETE_CALL,
				ApplicationFacade.NET_CONNECTION,				
				ApplicationFacade.ROOMS_DATA_CALL,
				ApplicationFacade.ROOMS_CHANGE_CALL,
				ApplicationFacade.ROOMS_DELETE_CALL
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
                    	panel.setSize( stage.stageWidth, stage.stageHeight );
						
						panel.x = stage.stageWidth - 185;
						panel.y = 29;
						
                    break;
				case ApplicationFacade.JAVASCRIPT_CALL:
                    trace("Panel Mediator : Javascript Call");
						panel.setObject(note.getBody());
                    break;
				case ApplicationFacade.NET_CONNECTION:
				 	trace("Panel Mediator : Net Connection");
						nc = note.getBody() as NetConnection;
						connectUI();
					break;
				case ApplicationFacade.USER_CHANGE_CALL:
				 	trace("Panel Mediator : User Change");
						userListObj = note.getBody() as Object;
						panel.changeListUser(userListObj);
					break;
				case ApplicationFacade.USER_DELETE_CALL:
				 	trace("Panel Mediator : User Delete");
						userListObj = note.getBody() as Object;
						panel.removeListUser(userListObj);
					break;
				case ApplicationFacade.ROOMS_DATA_CALL:
				 	trace("Panel Mediator : Rooms Data Call");
						//userListObj = note.getBody() as Object;
						//panel.removeListUser(userListObj);
					break;
				case ApplicationFacade.ROOMS_CHANGE_CALL:
				 	trace("Panel Mediator : Room Change");
						roomListObj = note.getBody() as Object;
						panel.changeListRoom(roomListObj);
					break;
				case ApplicationFacade.ROOMS_DELETE_CALL:
				 	trace("Panel Mediator : Room Delete");
						roomListObj = note.getBody() as Object;
						//panel.removeListRoom(roomListObj);
					break;
				
                default:
                    break;
            }
        }       
        
    }
}
