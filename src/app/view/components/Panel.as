package app.view.components {
    
    import app.ApplicationFacade;
    import app.model.*;
    import app.view.events.*;
    import app.view.components.*;
	import app.view.components.panel.*;
	
	import flash.events.Event;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.display.Sprite;	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import flash.text.TextField;
	import flash.display.Scene;
	
	import fl.controls.Button;
	import fl.controls.TextArea;
	import fl.events.ComponentEvent;
	
	import flash.system.Security;
	import flash.system.SecurityPanel;
	import flash.net.ObjectEncoding;
	import flash.net.NetStream;
	import flash.media.*;
	   
    import com.bumpslide.events.UIEvent;	
	import gs.*;
	
    /**
     * The main Panel view
     * 
     * @author Billy Bateman - White Label
     */
    public class Panel extends MovieClip {
        
        static public var EVENT_CREATION_COMPLETE:String = "onCreationComplete";  		         
       	
		public var user:String = new String();
		
		public var panel_bg_mc:MovieClip;
		
		/* Userlist stuff */
		public var myScroller:Scroller;
		public var users_tab:MovieClip;				
		public var user_count:Number = 0;		
		public var user_list_holder_mc:MovieClip;	
		
		/* Rooms Stuff */
		public var myScrollerRoom:Scroller;
		public var room_count:Number = 0;		
		public var room_list_holder_mc:MovieClip;	
		public var rooms_tab:MovieClip;	
		
		
		/*Webcam Stuff*/
		public var my_webcam_tab:MovieClip;
		public var webcam_menu_top:MovieClip;		
		public var myName:TextField;
		public var myWebcam:Video;
		public var no_photo_mc:MovieClip;		
		public var audio_btn:MovieClip;
		public var audioObj:Object = new Object();		
		public var video_btn:MovieClip;
		public var videoObj:Object = new Object();		
		public var settings_btn:MovieClip;		
		public var webcam_menu_mc:MovieClip;
		
		public var hover:Boolean = false;
		public var currentElementFrame:Number = 1;
		
		public var openTab:String = "users";
		public var panelH:Number;
		
			
        public function Panel()
        {    
            trace("New Panel Loaded");				
						
			//Framework Listener
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );		
			
        }	
		       
        private function onAddedToStage(event:Event):void
        {
        	trace('Panel is initialized');			
			
			
			/* User List */			
				
				users_tab.user_list_txt.text = "Users (" + user_count + ")";
				user_list_holder_mc.height = 310;								
				myScroller = new Scroller(user_list_holder_mc, 160, 310, new scrollerFace(),"vertical");				
			
			/* End User List */
			
			/* Rooms List */
				
				room_list_holder_mc.visible = false;
				rooms_tab.rooms_txt.text = "Rooms (" + room_count + ")";
				room_list_holder_mc.height = 310;				
				
				myScrollerRoom = new Scroller(room_list_holder_mc, 160, 310, new scrollerFace(),"vertical");
				myScrollerRoom.ScrollerFace.visible = false;
				
				rooms_tab.addEventListener(MouseEvent.CLICK, clickTabHandler);
				
				
			/* End Rooms List */
			
			
			/* Webcam Panel */
			
				audioObj.status = false;
				videoObj.status = false;		
			
				/* button listeners */
				audio_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
				audio_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
				audio_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
				
				video_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
				video_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
				video_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
				
				settings_btn.addEventListener(MouseEvent.CLICK, clickBtnHandler);
				settings_btn.addEventListener(MouseEvent.MOUSE_OVER, hoverBtnHandler);
				settings_btn.addEventListener(MouseEvent.MOUSE_OUT, hoverBtnHandler);
			
			/* End Webcam Panel */
			
			/* Setup Tab Listeners */
				 
			
			
        	dispatchEvent( new UIEvent(EVENT_CREATION_COMPLETE, this ) ); 
        }
		
		
		
		
		public function clickTabHandler(e:MouseEvent):void
		{			
			
			
			switch(e.target.name){
				case "rooms_tab":				
				if(openTab == "rooms"){
					openTab = "users";
					toggleRoomsList();					
					TweenLite.to(rooms_tab, 1, {x:rooms_tab.x, y:my_webcam_tab.y - 22, onComplete: toggleUsersList});					
					
					// Dispath event to disconnect after
					dispatchEvent( new GenericEvent( ApplicationFacade.ROOMS_DISCONNECT_CMD, null ));					
				} else {
					// Dispath event to connect first
					dispatchEvent( new GenericEvent( ApplicationFacade.ROOMS_CONNECT_CMD, null ));					
					
					openTab = "rooms";
					toggleUsersList();
					TweenLite.to(rooms_tab, 1, {x:rooms_tab.x, y:users_tab.y + 22, onComplete: toggleRoomsList});
					
				}
				case "rooms_txt":
				if(openTab == "rooms"){
					openTab = "users";
					toggleRoomsList();					
					TweenLite.to(rooms_tab, 1, {x:rooms_tab.x, y:my_webcam_tab.y - 22, onComplete: toggleUsersList});					
					
					// Dispath event to disconnect after
					dispatchEvent( new GenericEvent( ApplicationFacade.ROOMS_DISCONNECT_CMD, null ));					
				} else {
					// Dispath event to connect first
					dispatchEvent( new GenericEvent( ApplicationFacade.ROOMS_CONNECT_CMD, null ));					
					
					openTab = "rooms";
					toggleUsersList();
					TweenLite.to(rooms_tab, 1, {x:rooms_tab.x, y:users_tab.y + 22, onComplete: toggleRoomsList});
					
				}
			}
		}
		
		public function toggleUsersList():void{
			trace("Toggle Users List");
			if(user_list_holder_mc.visible == false){
				user_list_holder_mc.visible = true;
				myScroller.ScrollerFace.visible = true;
			} else {
				user_list_holder_mc.visible = false;
				myScroller.ScrollerFace.visible = false;
			}
		}
		
		public function toggleRoomsList():void{
			trace("Toggle Rooms List");
			if(room_list_holder_mc.visible == false){
				room_list_holder_mc.visible = true;
				myScrollerRoom.ScrollerFace.visible = true;
			} else {
				room_list_holder_mc.visible = false;
				myScrollerRoom.ScrollerFace.visible = false;
			}
		}
		
		public function changeListRoom(roomObj:Object):void{
			trace("Panel: Change List Room");
			
			
			/* Check for user movie clip */
			trace(roomObj.room);
			var change_room:String = roomObj.room;
			var change_mc:MovieClip = MovieClip(room_list_holder_mc.getChildByName(change_room));
			
			if (room_list_holder_mc.getChildByName(change_room) == null) { 				
				trace("Change List Room: Add Room");
				/* User does not exist add to stage */
				var elem:RoomMC = new RoomMC(roomObj);			
				elem.x = 0;
				elem.y = room_count * 42;
				elem.name = roomObj.room;
				//elem.addEventListener(MouseEvent.CLICK, roomClick);
				//elem.addEventListener(MouseEvent.MOUSE_OVER, elemOver);
				//elem.addEventListener(MouseEvent.MOUSE_OVER, elemOut);
				elem.addEventListener( ApplicationFacade.ROOMS_JOIN_CMD, notifyJoinRoom );			
				
				room_list_holder_mc.addChild(elem);
				
				room_count = room_count + 1;
				rooms_tab.rooms_txt.text = "Rooms (" + room_count + ")";				
				
			} else {
				/* User exists updateData function */				
				trace("Change List Room: Change Room");
				change_mc.updateData(roomObj);
			}	
			
		}
		
		public function notifyJoinRoom(e:GenericEvent){
			trace("Panel: Join Room");
			//dispatchEvent( new GenericEvent( ApplicationFacade.ROOMS_JOIN_CMD, e.data ));
		}
		
		
		public function removeListUser(userObj:Object):void{
			/* Remove User from the list */
			trace(userObj.userName);
			
			var remove_user:String = userObj.user;
			var remove_mc:MovieClip = MovieClip(user_list_holder_mc.getChildByName(remove_user));
			var remove_mc_y:Number = remove_mc.y;
			user_list_holder_mc.removeChild(remove_mc);
			
			user_count = user_count - 1;
			users_tab.user_list_txt.text = "Users (" + user_count + ")";
			
			
			/* Send Command to all clips below to tween up */
			for(var i=0; i<user_list_holder_mc.numChildren; i++)
			{				
				var mc:DisplayObject = user_list_holder_mc.getChildAt(i);				
				if(i > 0){
				trace(mc.name);
				trace(mc);
					if(mc.y > remove_mc_y){
						//mc.y = mc.y + 20;
						TweenLite.to(mc, 1, {x:mc.x, y:mc.y - 20});
					}
				}
			}
			
			/* This works, pulls reference to a movie clip, use for anything on mouseevent.			
			trace(userObj.userName);
			var remove_user:String = userObj.userName;
			var remove_mc:MovieClip = MovieClip(user_list_holder_mc.getChildByName(remove_user));
			remove_mc.y = 200;
			*/			
			
			/* Update Scroller */
		}
		
		public function removeAllUsers():void{
			/* Remove All Users from the list */			
			
			
			user_count = 0;
			users_tab.user_list_txt.text = "Users (" + user_count + ")";
			
			
			
			for(var i=0; i<user_list_holder_mc.numChildren; i++)
			{				
				var mc:DisplayObject = user_list_holder_mc.getChildAt(i);				
				if(i > 0){
					trace(mc.name);
					trace(mc);					
					
					var remove_user:String = mc.name;
					var remove_mc:MovieClip = MovieClip(user_list_holder_mc.getChildByName(remove_user));
					var remove_mc_y:Number = remove_mc.y;
					user_list_holder_mc.removeChild(remove_mc);
				}
			}			
						
			/* Update Scroller */
		}
		
		public function changeListUser(userObj:Object):void{
			trace("Panel: Change List User");
			
			/* Check for user movie clip */
			trace("User:" + userObj.user);
			var change_user:String = userObj.user;
			var change_mc:MovieClip = MovieClip(user_list_holder_mc.getChildByName(change_user));
			
			if (user_list_holder_mc.getChildByName(change_user) == null) { 				
				trace("Change List User: Add User");
				/* User does not exist add to stage */
				var elem:UserMC = new UserMC(userObj);			
				elem.x = 0;
				elem.y = user_count * 24;
				elem.name = userObj.user;
				//elem.addEventListener(MouseEvent.CLICK, elemClick);
				//elem.addEventListener(MouseEvent.MOUSE_OVER, elemOver);
				//elem.addEventListener(MouseEvent.MOUSE_OVER, elemOut);
				
				user_list_holder_mc.addChild(elem);
				
				user_count = user_count + 1;
				users_tab.user_list_txt.text = "Users (" + user_count + ")";				
				
			} else {
				/* User exists updateData function */				
				trace("Change List User: Change User");
				change_mc.updateData(userObj);
			}	
			
		}
		
		public function roomClick(e:MouseEvent):void{
			trace(e.target.name);
			
			// Extract obj from elem
			var clickElem:MovieClip = MovieClip(e.target);
			
			var clickObj:Object =  clickElem.getObject();
			
			trace("Panel : Room Selected:" + clickObj.room);
			
			//dispatchEvent( new GenericEvent( ApplicationFacade.VIDEO_ADD_CALL, clickObj ));
				
			
		}
		
		public function elemClick(e:MouseEvent):void{
			trace(e.target.name);
			
			// Extract obj from elem
			var clickElem:MovieClip = MovieClip(e.target);
			
			var clickObj:Object =  clickElem.getObject();
			
			trace("Panel : Element Selected:" + clickObj.user);
			
			dispatchEvent( new GenericEvent( ApplicationFacade.VIDEO_ADD_CALL, clickObj ));
				
			
		}
		
		public function elemOver(e:MouseEvent):void{
			trace(e.target.name);
			
			e.target.showJoin();
			
		}
		
		public function elemOut(e:MouseEvent):void{
			//trace(e.target.name);
		}
		
		public function clickBtnHandler(e:MouseEvent):void
		{			
			
			switch(e.target.name){
				case "audio_btn":
					trace("Audio Button");
					if(audioObj.status == false){
						audioObj.status = true;
						audio_btn.gotoAndStop(3);
					} else {
						audioObj.status = false;
						audio_btn.gotoAndStop(1);
					}
					dispatchEvent( new GenericEvent( ApplicationFacade.AUDIO_PUBLISH_CALL, audioObj ));
				break;
				case "video_btn":
					trace("Video Button");
					if(videoObj.status == false){
						videoObj.status = true;
						video_btn.gotoAndStop(3);
					} else {
						videoObj.status = false;
						video_btn.gotoAndStop(1);
					}
					dispatchEvent( new GenericEvent( ApplicationFacade.VIDEO_PUBLISH_CALL, videoObj ));						
				break;
				case "settings_btn":
					trace("Open security panel");
					Security.showSettings(SecurityPanel.CAMERA);
				break;
				default:
				break;
			}
		}
		
		public function hoverBtnHandler(e:MouseEvent):void
		{			
			var scene:Number = new Number();		
			
			if(hover == false){
				hover = true;
			} else {
				hover = false;
			}
			
			switch(e.target.name){
				case "audio_btn":
					if(audioObj.status == false){
						if(hover == true){
							scene = audio_btn.currentFrame;
							currentElementFrame = scene;
							audio_btn.gotoAndStop(2);
						} else {
							currentElementFrame = 1;
							audio_btn.gotoAndStop(1);
						}
					}
				break;
				case "video_btn":
					if(videoObj.status == false){
						if(hover == true){
							scene = video_btn.currentFrame;
							currentElementFrame = scene;
							video_btn.gotoAndStop(2);
						} else {
							currentElementFrame = 1;
							video_btn.gotoAndStop(1);
						}
						}
				break;
				case "settings_btn":
					
					if(hover == true){						
						settings_btn.gotoAndStop(2);
					} else {						
						settings_btn.gotoAndStop(1);
					}
					
				break;
			}			
		}
		
		public function clearWebcam():void{
			trace("Clear Webcam");
			videoObj.status = false;
			video_btn.gotoAndStop(1);
			myWebcam.attachCamera(null);
			myWebcam.visible = false;
			
		}
		public function setupWebcam(cam:Camera):void{
			trace("Add Webcam");
			videoObj.status = true;
			video_btn.gotoAndStop(3);
			audioObj.status = true;
			audio_btn.gotoAndStop(3);
			myWebcam.attachCamera(cam);			
			myWebcam.visible = true;
			
		}
		
		public function setupUser(userIn:String):void{
			trace("Panel : Setup User : " + userIn);
			user = userIn;
			myName.text = user;
		}

        public function setSize(w:Number, h:Number):void
        {
                               
           trace("Panel : Set Size:" + w + "/" + h);
		   // Set the size to 100% of flash movie!
		  panelH = h;   
		   var widthint:uint = w;
		   var heightint:uint = h;	
		   
		   panel_bg_mc.height = h - 55;
		   
		   users_tab.y = 0;
		   
		   myScroller.updateSize( 160, h - 250);
		   
		   myScrollerRoom.updateSize( 160, h - 250);
		   
		   
		   if(openTab == "rooms"){
		   	  rooms_tab.y = users_tab.y + 22
			   
		   } else {
		   	  rooms_tab.y = h - 228;		   
		   }
		   
		   my_webcam_tab.y = h - 205;
		   
		   
		   webcam_menu_top.y = h - 184;
		   myName.y = h - 182;
		   
		   myWebcam.y = h - 163;
		   no_photo_mc.y = h - 145;
		   
		   webcam_menu_mc.y = h - 52;		   
		   audio_btn.y = h - 52;
		   video_btn.y = h - 52; 
		   settings_btn.y = h - 48;
			
			
        }	
		
		
		public function setObject(obj:*):void {
			  trace("Panel : Set Object:" + obj);			 
        }
		
    }
}
