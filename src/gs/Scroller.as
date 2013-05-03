package gs
{
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;

    public class Scroller extends MovieClip
    {
        private const MIN_FACE_SIZE:int = 40;
        private const MOUSE_WHEEL_PRECENTAGE:Number = 0.15;
        private const gap:int = 3;
        public var ScrollerPane:MovieClip;
        public var PaneMask:MovieClip;
        public var ScrollerFace:MovieClip;
        public var scrollerAlign:String;
        public var scrollerWidth:int;
        public var scrollerHeight:int;

        public function Scroller(param1:MovieClip, param2:int, param3:int, param4:MovieClip, param5:String) : void
        {
            scrollerWidth = param2;
            scrollerHeight = param3;
            trace(param3);
            scrollerAlign = param5;
            ScrollerPane = param1;
            ScrollerFace = param4;
            PaneMask = createMask(ScrollerPane, param2, param3);
            PaneMask.x = ScrollerPane.x;
            PaneMask.y = ScrollerPane.y;
            param1.parent.addChild(PaneMask);
            param1.mask = PaneMask;
            ScrollerPane.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
            createScroller(ScrollerPane, param2, param3, param4, param5);
            return;
        }// end function

        private function createScroller(param1, param2, param3, param4:MovieClip, param5)
        {
            var _loc_6:Number = NaN;
            param1.parent.addChild(param4);
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    param4.x = param1.x + param2 + gap;
                    param4.y = param1.y;
                    _loc_6 = PaneMask.height / param1.height * PaneMask.height;
                    if (_loc_6 > MIN_FACE_SIZE)
                    {
                        param4.height = _loc_6;
                    }
                    param4.height = MIN_FACE_SIZE;
                    break;
                }
                case "horizontal":
                {
                    param4.x = param1.x;
                    param4.y = param1.y + param3 + gap;
                    _loc_6 = PaneMask.width / param1.width * PaneMask.width;
                    if (_loc_6 > MIN_FACE_SIZE)
                    {
                        param4.width = _loc_6;
                    }
                    param4.width = MIN_FACE_SIZE;
                    break;
                }
                default:
                {
                    break;
                }
            }
            param4.buttonMode = true;
            param4.addEventListener(MouseEvent.MOUSE_DOWN, ScrollFaceDown);
            param4.addEventListener(MouseEvent.MOUSE_UP, ScrollFaceUp);
            trace("scroller created");
            return;
        }// end function

        private function StageMouseUP(param1)
        {
            ScrollFaceUp(param1);
            return;
        }// end function

        private function ScrollFaceDown(param1)
        {
            var _loc_2:Rectangle = null;
            ScrollerPane.stage.addEventListener(MouseEvent.MOUSE_UP, StageMouseUP);
            ScrollerPane.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    _loc_2 = new Rectangle(PaneMask.x + PaneMask.width + gap, PaneMask.y, 0, PaneMask.height - ScrollerFace.height);
                    break;
                }
                case "horizontal":
                {
                    _loc_2 = new Rectangle(PaneMask.x, PaneMask.y + PaneMask.height + gap, PaneMask.width - ScrollerFace.width, 0);
                    break;
                }
                default:
                {
                    break;
                }
            }
            ScrollerFace.startDrag(false, _loc_2);
            return;
        }// end function

        private function ScrollFaceUp(param1)
        {
            ScrollerPane.stage.removeEventListener(MouseEvent.MOUSE_UP, ScrollFaceUp);
            ScrollerPane.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            ScrollerFace.stopDrag();
            return;
        }// end function

        private function updatePanePosition()
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    if (ScrollerPane.height > PaneMask.height)
                    {
                        _loc_1 = (ScrollerFace.y - PaneMask.y) / (PaneMask.height - ScrollerFace.height);
                        _loc_2 = ScrollerPane.height - PaneMask.height;
                        _loc_3 = _loc_2 * _loc_1;
                        TweenLite.to(ScrollerPane, 0.6, {y:PaneMask.y - _loc_3, ease:Regular.easeOut});
                    }
                    break;
                }
                case "horizontal":
                {
                    if (ScrollerPane.width > PaneMask.width)
                    {
                        _loc_1 = (ScrollerFace.x - PaneMask.x) / (PaneMask.width - ScrollerFace.width);
                        _loc_2 = ScrollerPane.width - PaneMask.width;
                        _loc_3 = _loc_2 * _loc_1;
                        TweenLite.to(ScrollerPane, 0.6, {x:PaneMask.x - _loc_3, ease:Regular.easeOut});
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function mouseMoveHandler(param1)
        {
            updatePanePosition();
            return;
        }// end function

        private function mouseWheelHandler(param1)
        {
            var _loc_2:* = undefined;
            var _loc_3:int = 0;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    _loc_2 = MOUSE_WHEEL_PRECENTAGE * (PaneMask.y + PaneMask.height - ScrollerFace.height);
                    if (param1.delta > 0)
                    {
                        _loc_3 = Math.max(ScrollerFace.y - _loc_2, PaneMask.y);
                    }
                    else
                    {
                        _loc_3 = Math.min(ScrollerFace.y + _loc_2, PaneMask.y + PaneMask.height - ScrollerFace.height);
                    }
                    TweenLite.to(ScrollerFace, 0.6, {y:_loc_3, ease:Regular.easeOut});
                    _loc_4 = (_loc_3 - PaneMask.y) / (PaneMask.height - ScrollerFace.height);
                    _loc_5 = PaneMask.height;
                    _loc_6 = _loc_5 * _loc_4;
                    TweenLite.to(ScrollerPane, 0.2, {y:PaneMask.y - _loc_6, ease:Regular.easeOut});
                    break;
                }
                case "horizontal":
                {
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function createMask(param1, param2, param3) : MovieClip
        {
            var _loc_4:* = new MovieClip();
            var _loc_5:* = "0xFFFFFF";
            _loc_4.graphics.beginFill(_loc_5, 0.5);
            _loc_4.graphics.drawRect(0, 0, param2, param3);
            _loc_4.graphics.endFill();
            return _loc_4;
        }// end function

        public function updatePosition(param1:Number) : void
        {
            param1 = param1 / 100;
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    ScrollerFace.y = param1 * (PaneMask.y + PaneMask.height - gap - MIN_FACE_SIZE) + gap;
                    break;
                }
                case "horizontal":
                {
                    ScrollerFace.x = param1 * (PaneMask.x + PaneMask.width - gap - MIN_FACE_SIZE) + gap;
                    break;
                }
                default:
                {
                    break;
                }
            }
            updatePanePosition();
            return;
        }// end function

        public function toggleScroller(param1) : void
        {
            if (param1)
            {
                ScrollerFace.visible = param1;
            }
            else if (ScrollerFace.visible == true)
            {
                ScrollerFace.visible = false;
            }
            else
            {
                ScrollerFace.visible = true;
            }
            return;
        }// end function

        public function updateSize(param1:Number, param2:Number) : void
        {
            scrollerWidth = param1;
            scrollerHeight = param2;
            PaneMask.width = param1;
            PaneMask.height = param2;
            trace("HEIGHT:" + param2);
            trace(PaneMask.height);
            switch(scrollerAlign)
            {
                case "vertical":
                {
                    ScrollerFace.x = ScrollerPane.x + param1 + gap;
                    break;
                }
                case "horizontal":
                {
                    ScrollerFace.y = ScrollerPane.y + param2 + gap;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
