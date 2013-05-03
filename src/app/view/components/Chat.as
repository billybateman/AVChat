package app.view.components {
    
    import app.ApplicationFacade;
    import app.model.*;
    import app.view.events.*;
    import app.view.components.*;
	import app.view.components.chat.*;
	
	import flash.events.Event;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.display.Sprite;	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.StyleSheet;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
		   
    import com.bumpslide.events.UIEvent;	
	import gs.*;

    /**
     * The main chat view
     * 
     * @author Billy Bateman - White Label
     */
    public class Chat extends MovieClip {
        
        static public var EVENT_CREATION_COMPLETE:String = "onCreationComplete";  		         
       	
		public var chat_top_mc:MovieClip;
		public var active_chat_btn:MovieClip;
		public var room_txt:TextField;
		
		public var other_chat_btn:SimpleButton;
		
		public var chat_area_bg:MovieClip;
		
		public var chat_options_mc:MovieClip;		
		public var font_options_btn:SimpleButton;
		public var emotions_btn:SimpleButton;
		public var precanned_btn:SimpleButton;
		public var color_chooser_btn:SimpleButton;
		public var send_btn:SimpleButton;
		
		public var chat_input_bg:MovieClip;
		public var input_txt:TextField;
		
		public var new_dyn_txt:TextField;
		public var dyn_txt:TextField = new TextField();
		public var holder_mc:MovieClip;
		
		public var color_chooser_mc:ColorChooser;
		public var font_options_mc:MovieClip;
		public var emotions_mc:MovieClip;
		
		public var user:String = new String();
		public var myColor:String = new String("#000000");
		
		public var myScroller:Scroller;
		
		public var create_room_btn:SimpleButton;
		public var create_room_mc:CreateRoom;
			
        public function Chat()
        {    
            trace("New Chat Area Loaded");			
									
			//Framework Listener
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );		
        }	
		
		private function onAddedToStage(event:Event):void
        {
        	trace('Chat Area is initialized');
			
			create_room_mc.visible = false;
			
			color_chooser_mc.visible = false;
			font_options_mc.visible = false;
			emotions_mc.visible = false;
			
			input_txt.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
			
			//the listener added to the text field
			input_txt.addEventListener(FocusEvent.FOCUS_IN, clearInput);
			
			// Setup Send Button Listeners
			send_btn.addEventListener(MouseEvent.CLICK, inputText);
			
			color_chooser_btn.addEventListener(MouseEvent.MOUSE_OVER, colorChange);
			font_options_btn.addEventListener(MouseEvent.MOUSE_OVER, fontChange);
			emotions_btn.addEventListener(MouseEvent.MOUSE_OVER, emotionsChange);
			holder_mc.addEventListener(MouseEvent.MOUSE_OVER, hidePanels);
			
			emotions_mc.addEventListener(MouseEvent.CLICK, emoticonClick);
			
			create_room_btn.addEventListener(MouseEvent.CLICK, toggleCreateRoom);
			
			var myFont:Font = new ArialLibrary();			
			var textFormat:TextFormat = new TextFormat();			
			textFormat.font = myFont.fontName;
			textFormat.size = 13;
			textFormat.leading = 7;
			
			
			dyn_txt.width = 590;
			dyn_txt.height = 260;
			dyn_txt.x = 0;
			dyn_txt.y = 0;
			dyn_txt.border = false;
			dyn_txt.multiline = true;
			dyn_txt.wordWrap = true;
			dyn_txt.autoSize =  "center";
			dyn_txt.background = false;
			
			dyn_txt.defaultTextFormat = textFormat;
			dyn_txt.embedFonts = true;		
			dyn_txt.antiAliasType = AntiAliasType.ADVANCED;
			
						
			dyn_txt.htmlText = "";
			
			holder_mc.addChild(dyn_txt);
			holder_mc.height = 260;
			
			myScroller = new Scroller(holder_mc, holder_mc.width, 260, new scrollerFace(),"vertical");
			
			//createEmoticons();

			dispatchEvent( new UIEvent(EVENT_CREATION_COMPLETE, this ) );
			
			create_room_mc.addEventListener( ApplicationFacade.CLOSE_CREATE_CMD, closeCreateRoom );						
			
        }
		
		public function hideCreateRoom( ){
			trace("Hide Create Room");			
			myScroller.toggleScroller(false);
			create_room_mc.visible = false;
		}
		
		public function setupUser(userIn:String):void{
			trace("Chat : Setup User : " + userIn);
			user = userIn;
		}
		
		public function addChatMessage(obj:Object):void {
			trace("Chat : Add chat Message");
			trace("id:" + obj.id + " text:" +  obj.text);			
			insertChatText(obj.text);
		}
		
		public function toggleCreateRoom(e:MouseEvent):void{
			myScroller.toggleScroller(null);
			
			if(create_room_mc.visible == true){				
				create_room_mc.visible = false;
			} else {				
				create_room_mc.visible = true;
				
			}
		}
		
		public function closeCreateRoom( e:GenericEvent ){
			myScroller.toggleScroller(false);
			create_room_mc.visible = false;			
		}
		
		// Setup Input Listeners
		public function emoticonClick(e:MouseEvent):void
		{
			
			if(input_txt.text == "enter your message here..."){			
				input_txt.text = "";
			}
			
			switch(e.target.name){
				case "smile_btn":					
					input_txt.appendText(":)");
				break;
				case "wink_btn":
					input_txt.appendText(";)");
				break;
				case "sad_btn":
					input_txt.appendText(":(");
				break;
				case "angry_btn":
					input_txt.appendText(">O");
				break;
				case "cool_btn":
					input_txt.appendText("8)");
				break;
				case "laugh_btn":
					input_txt.appendText(":D");
				break;
				case "surprised_btn":
					input_txt.appendText(":O");
				break;
				case "innocent_btn":
					input_txt.appendText("O)");
				break;
				default:
					
				break;
			}
		}
		
		// Setup Input Listeners
		public function hidePanels(e:MouseEvent):void
		{			
			font_options_mc.visible = false;
			emotions_mc.visible = false;
			color_chooser_mc.visible = false;			
		}
		
		// Setup Input Listeners
		public function colorChange(e:MouseEvent):void
		{			
			font_options_mc.visible = false;
			emotions_mc.visible = false;
				
			if(color_chooser_mc.visible){
				color_chooser_mc.visible = false;
		    } else {	
				color_chooser_mc.visible = true;
		    }
		}
		
		public function emotionsChange(e:MouseEvent):void
		{			
			color_chooser_mc.visible = false;
			font_options_mc.visible = false;
				
			if(emotions_mc.visible){
				emotions_mc.visible = false;
		    } else {	
				emotions_mc.visible = true;
		    }
		}
		
		// Setup Input Listeners
		public function fontChange(e:MouseEvent):void
		{
			color_chooser_mc.visible = false;
			emotions_mc.visible = false;
				
			if(font_options_mc.visible){
				font_options_mc.visible = false;
		    } else {	
				font_options_mc.visible = true;
		    }
		}
		
		// Setup Input Listeners
		public function clearInput(evt:FocusEvent):void
		{
			if(input_txt.text == "enter your message here..."){			
				input_txt.text = "";
			}
			
			hidePanels(null);
		}
		
		
		public function clearChat():void
		{
			
			input_txt.text = "enter your message here...";
			dyn_txt.text = "";
			new_dyn_txt.text = "";
			
			// Remove old emos
			
			for(var ii=0; ii<holder_mc.numChildren; ii++)
			{				
				
				var mc:DisplayObject = holder_mc.getChildAt(ii);				
				
				trace(mc.name);
				trace("Type:" + typeof(mc));
				switch(mc.name){
					case "instance85":						
					break;
					case "dyn_txt":
					break;
					default:						
						if(typeof(mc) == "object"){						
							trace("Remove Emotion:" + mc.name);
							var remove_emo:String = mc.name;
							var remove_mc:MovieClip = MovieClip(holder_mc.getChildByName(remove_emo));
							trace(remove_mc);
							holder_mc.removeChild(remove_mc);
						}
					break;
				}
				
			}
			
			hidePanels(null);
			
		}
		
		public function insertChatText(chatText:String):void {			
			/* Remove <br> at end if its there.
			var indexInt:Number = theText.lastIndexOf("<br>", theText.length - 4);			
			if(indexInt){				
				theText = theText.substr(0, indexInt);				
			}
			*/			
			
			dyn_txt.htmlText =   dyn_txt.htmlText + chatText  + "<br>";
			createEmoticons();
			myScroller.updatePosition(100);
		}
		
		// Setup Input Listeners
		public function inputText(e:MouseEvent):void
		{
			
			if(input_txt.text != ""){			
				if(input_txt.text != "enter your message here..."){
					
					myColor = color_chooser_mc.getColor();
					var theText:String = "<font color='" + myColor + "'><b>" + user + "</b> : " + input_txt.text + "</font>";		
					
					input_txt.text = "";
					
					var now:Date = new Date();					
					var timeStamp:String = now.valueOf().toString();
					
					var chatObject:Object = new Object();
					chatObject.id = user + timeStamp;					
					chatObject.text = theText;
					chatObject.user = user;
					
					// Dispatch CHAT_SEND_CMD
					dispatchEvent( new GenericEvent( ApplicationFacade.CHAT_SEND_CMD, chatObject ));
				}
			}
			
			hidePanels(null);
		}
		
		public function reportKeyDown(event:KeyboardEvent):void 
		{ 
			//trace("Key Pressed: " + String.fromCharCode(event.charCode) +         " (character code: " + event.charCode + ")"); 
			if(event.charCode == 13){
				inputText(null);
			}
			
			hidePanels(null);
		}
		
		public function createEmoticons():void {
			var str:String = dyn_txt.text;			
			
			// define emoticons
			var emoticons = [':)',';)',':O',':D','O)','8)',':(','>O'];
			var index, emos = [];
			
			for(var i in emoticons){
				index = 0;
				while(index != -1){
					index = str.indexOf(emoticons[i],index);
					if(index != -1){
						emos.push({i:i,index:index,token:emoticons[i]});
						index += emoticons[i].length;
					}
				}
			}
			
			// sort emoticons by first indexed emoticon to last indexed emoticon
			emos.sortOn('index');
			
			// Remove old emos
			for(i=0; i<holder_mc.numChildren; i++)
			{				
				
				var mc:DisplayObject = holder_mc.getChildAt(i);				
				
				switch(mc.name){
					case "instance85":						
					break;
					case "dyn_txt":
					break;
					default:
						if(typeof(mc) == "object"){						
						var remove_emo:String = mc.name;
						var remove_mc:MovieClip = MovieClip(holder_mc.getChildByName(remove_emo));
						holder_mc.removeChild(remove_mc);
						}
					break;
				}
				
			}
			
			// put emoticon graphics over the indexed token instances			
			var charBounds, emo;
			for(i in emos){
				charBounds = dyn_txt.getCharBoundaries(emos[i].index);
				//trace("Add Emo");				
				emo = new Emo();
				emo.gotoAndStop(emos[i].i+1);
				emo.x = dyn_txt.x + charBounds.x;
				emo.y = dyn_txt.y + charBounds.y - 2;
				emo.name = "emo_" + i;
				holder_mc.addChild(emo);
				/**/
				index += emos[i].token.length
				
			}
			
		}

        public function setSize(w:Number, h:Number):void
        {
                               
           // Set the size to 100% of flash movie!
		  	   
		   var widthint:uint = w;
		   var heightint:uint = h;
		   
		   chat_top_mc.width = w - 190;
		   chat_area_bg.width = w - 190;
		   chat_options_mc.width = w - 190;		
		   chat_input_bg.width = w - 190;		   
		   new_dyn_txt.width = w - 210;
		   dyn_txt.width = w - 210;
		   input_txt.width = w - 280;
		   
		   new_dyn_txt.height = h - 300;
		   dyn_txt.height = h - 300;
		   chat_area_bg.height = h - 295;		
		   
		   myScroller.updateSize( w - 210, h - 300);
		   myScroller.updatePosition(100);
		   
		   color_chooser_mc.y = h - 330;
		   font_options_mc.y = h - 327;
		   emotions_mc.y = h - 330;
		   chat_options_mc.y = h - 246;  
		   
		   
		   
		   font_options_btn.y = h - 237;
		   emotions_btn.y = h - 240;
		   precanned_btn.y = h - 237;
		   color_chooser_btn.y = h - 237;	   
		   
		   send_btn.y = h - 210;
		   send_btn.x = w - 270;
		   
		   input_txt.y = h - 210;
		   chat_input_bg.y = h - 220;
		   
		   create_room_btn.x = w - (create_room_btn.width + 195);
		   create_room_mc.setSize(w, h);
		   //createEmoticons();
        }	
		
		
		public function setObject(obj:*):void {
			  trace("Setting Object:" + obj);			 
        }		
	
		public function setupRoomObject(obj:*):void {
			  trace("Setting Room Object:" + obj);
			  active_chat_btn.room_txt.text = obj.description;
			  clearChat();
        }		
		
    }
}
