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
		
		
	
		public class AppReadyCommand extends SimpleCommand implements ICommand
		{
			/* 
				When this runs we have initialised the framework and its players.
				Let's grab a proxy and connect to FMS.			
			 */
			override public function execute( note:INotification ):void
			{			
				// send something to the trace window
				sendNotification( ApplicationFacade.LOG, "App Ready Command: Execute");
				
				/* Get the user from the local proxy */
				var settingsProxy:SettingsProxy = facade.retrieveProxy( SettingsProxy.NAME ) as SettingsProxy;
				var chatRtmp:String = settingsProxy.getConnectionString() as String;
				var roomsRtmp:String = settingsProxy.getRoomsConnectionString() as String;
				var roomObj:Object = settingsProxy.getRoomObject() as Object;
				
				/* Add Room Id to chatRtmp to get full connection to that specific room */
				chatRtmp = chatRtmp + "/" + roomObj.id;
				
				/* Get the user from the local proxy */
				var localProxy:LocaleProxy = facade.retrieveProxy( LocaleProxy.NAME ) as LocaleProxy;
				var flashVars:Object = localProxy.getLocale() as Object;				
				
				var userObj:Object = new Object();
								
				userObj.user = flashVars.user;
				userObj.audio = flashVars.audio;
				userObj.video = flashVars.video;
				
								
				// Setup NC Proxy
				var ncPxy:NetConnectionProxy = facade.retrieveProxy( NetConnectionProxy.NAME ) as NetConnectionProxy;
				
				ncPxy.onRegister();
				ncPxy.connect( chatRtmp, roomsRtmp, userObj );
				
				
			}
		
		}
		
	}