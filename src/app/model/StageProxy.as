package app.model
{
    import app.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import org.puremvc.interfaces.*;
    import org.puremvc.patterns.observer.*;
    import org.puremvc.patterns.proxy.*;

    public class StageProxy extends Proxy 
    {
        private var constrainedWidth:Number;
        private var constrainedHeight:Number;
        private var updateTimer:Timer;
        public static const NAME:String = "StageProxy";
        private static const MAX_WIDTH:Number = 1600;
        private static const MIN_WIDTH:Number = 150;
        private static const MAX_HEIGHT:Number = 1600;
        private static const MIN_HEIGHT:Number = 200;

        public function StageProxy(param1:Stage, param2:Boolean = true)
        {
            super(NAME, param1);
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.stageFocusRect = false;
            if (param2)
            {
                stage.addEventListener(Event.RESIZE, update);
            }
            else
            {
                stage.addEventListener(Event.RESIZE, notifyStageSizeChanged);
            }
            updateTimer = new Timer(50, 1);
            updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE, notifyStageSizeChanged);
            update();
            return;
        }// end function

        public function update(event:Event = null) : void
        {
            updateTimer.reset();
            updateTimer.start();
            return;
        }// end function

        public function get stage() : Stage
        {
            return this.getData() as Stage;
        }// end function

        public function get stageWidth() : Number
        {
            return constrainedWidth;
        }// end function

        public function get stageHeight() : Number
        {
            return constrainedHeight;
        }// end function

        private function notifyStageSizeChanged(event:Event = null) : void
        {
            constrainedHeight = Math.min(Math.max(stage.stageHeight, MIN_HEIGHT), MAX_HEIGHT);
            constrainedWidth = Math.min(Math.max(stage.stageWidth, MIN_WIDTH), MAX_WIDTH);
            facade.notifyObservers(new Notification(ApplicationFacade.STAGE_RESIZE, this));
            return;
        }// end function

    }
}
