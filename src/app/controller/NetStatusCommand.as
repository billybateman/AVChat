package app.controller
	{
		
		import flash.net.NetConnection;
		
		import flash.display.DisplayObject;
    
		import org.puremvc.interfaces.*;
		import org.puremvc.patterns.command.*;
		import org.puremvc.patterns.observer.*;
		
		import app.model.*;
		import app.view.ApplicationMediator;
		import app.ApplicationFacade;
		import app.Main;
	
		public class NetStatusCommand extends SimpleCommand implements ICommand
		{
			/* 
				This command runs everytime the NetConnection Proxy dispatches a status message.			
			*/
			 
			override public function execute( note:INotification ):void
			{
				// grab the content of the note, in this case an object with nc and status properties
				var status:String 			= Object(note.getBody()).status;
				var nc:NetConnection 		= Object(note.getBody()).nc;
								
				// send something to the trace window
				sendNotification( ApplicationFacade.LOG, "Net Status Command: " + status );
				
								
				if (status == "success")
				{
										
					// Setup Shared Object Proxy
					var soPxy:SharedObjectProxy = facade.retrieveProxy( SharedObjectProxy.NAME ) as SharedObjectProxy;
					soPxy.connect( nc );
					
					
					/*
					
					// Setup Shared Object Proxy
					var nsPxy:NetStreamProxy = facade.retrieveProxy( NetStreamProxy.NAME ) as NetStreamProxy;
					nsPxy.connect( nc );					
					nsPxy.publishCamera("bbateman", false);				
					
					// Setup another net stream	to play live stream 
					var nsPxy2:NetStreamProxy = facade.retrieveProxy( NetStreamProxy.NAME ) as NetStreamProxy;
					nsPxy2.connect( nc );
					//nsPxy.playStream("bbateman");					
					
					*/
					
					// Flash Media Server Ban User
					//nc.call("banUser", null, "banned-user");
					//nc.call("unBanUser", null, "banned-user");
					//nc.call("sendAction", null, "bbateman", "bbateman", "watching");
					//nc.call("sendMessage", null, "bbateman", "bbateman", "<b>bbateman :</b> welcome to my world, I am <i>ready to roll</i>");
					//nc.call("sendInvite", null, "bbateman", "bbateman", "test room", "this is a test room", "");
					//nc.call("updateChat", null, "1", "bbateman", "this is a test message");
					//nc.call("deleteChat", null, "1");
					//nc.call("userEdit", null, "bbateman", "false", "true");
					
					sendNotification( ApplicationFacade.NET_CONNECTION, nc );
				
					
				}
				// else or switch here to handle other statuses...

			}		
		}
	}
