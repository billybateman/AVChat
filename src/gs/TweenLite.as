package gs
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.utils.*;

    public class TweenLite extends Object
    {
        private var _sound:SoundTransform;
        protected var _endTarget:Object;
        protected var _active:Boolean;
        protected var _color:ColorTransform;
        protected var _endColor:ColorTransform;
        public var duration:Number;
        public var vars:Object;
        public var delay:Number;
        public var startTime:uint;
        public var initTime:uint;
        public var tweens:Object;
        public var extraTweens:Object;
        public var target:Object;
        public static var version:Number = 5.83;
        public static var killDelayedCallsTo:Function = killTweensOf;
        private static var _sprite:Sprite = new Sprite();
        private static var _listening:Boolean;
        private static var _all:Dictionary = new Dictionary();
        private static var _timer:Timer = new Timer(2000);

        public function TweenLite(param1:Object, param2:Number, param3:Object)
        {
            if (param1 == null)
            {
                return;
            }
            if (param3.overwrite != false && param1 != null || _all[param1] == undefined)
            {
                delete _all[param1];
                _all[param1] = new Dictionary();
            }
            _all[param1][this] = this;
            this.vars = param3;
            this.duration = param2;
            this.delay = param3.delay || 0;
            if (param2 == 0)
            {
                this.duration = 0.001;
                if (this.delay == 0)
                {
                    this.vars.runBackwards = true;
                }
            }
            var _loc_4:* = param1;
            _endTarget = param1;
            this.target = _loc_4;
            if (!(this.vars.ease is Function))
            {
                this.vars.ease = easeOut;
            }
            if (this.vars.easeParams != null)
            {
                this.vars.proxiedEase = this.vars.ease;
                this.vars.ease = easeProxy;
            }
            if (this.vars.mcColor != null)
            {
                this.vars.tint = this.vars.mcColor;
            }
            if (!isNaN(Number(this.vars.autoAlpha)))
            {
                this.vars.alpha = Number(this.vars.autoAlpha);
            }
            this.tweens = {};
            this.extraTweens = {};
            this.initTime = getTimer();
            if (this.vars.runBackwards == true)
            {
                initTweenVals();
            }
            _active = false;
            if (param2 == 0 && this.delay == 0)
            {
                complete(true);
            }
            else if (!_listening)
            {
                _sprite.addEventListener(Event.ENTER_FRAME, executeAll);
                _timer.addEventListener("timer", killGarbage);
                _timer.start();
                _listening = true;
            }
            return;
        }// end function

        public function initTweenVals() : void
        {
            var _loc_2:String = null;
            var _loc_3:Number = NaN;
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_6:TweenLite = null;
            var _loc_7:TweenLite = null;
            var _loc_8:Object = null;
            var _loc_1:* = this.delay - (getTimer() - this.initTime) / 1000;
            if (this.target is Array)
            {
                _loc_4 = this.vars.endArray || [];
                _loc_5 = 0;
                while (_loc_5 < _loc_4.length)
                {
                    
                    if (this.target[_loc_5] != _loc_4[_loc_5] && this.target[_loc_5] != undefined)
                    {
                        this.tweens[_loc_5.toString()] = {o:this.target, s:this.target[_loc_5], c:_loc_4[_loc_5] - this.target[_loc_5]};
                    }
                    _loc_5++;
                }
            }
            else
            {
                for (_loc_2 in this.vars)
                {
                    
                    if (_loc_2 == "delay" || _loc_2 == "ease" || _loc_2 == "overwrite" || _loc_2 == "onComplete" || _loc_2 == "onCompleteParams" || _loc_2 == "runBackwards" || _loc_2 == "onUpdate" || _loc_2 == "onUpdateParams" || _loc_2 == "autoAlpha" || _loc_2 == "_autoAlpha" || _loc_2 == "onStart" || _loc_2 == "onStartParams" || _loc_2 == "easeParams" || _loc_2 == "mcColor")
                    {
                        continue;
                    }
                    if (_loc_2 == "tint" && this.target is DisplayObject)
                    {
                        _color = this.target.transform.colorTransform;
                        _endColor = new ColorTransform();
                        if (this.vars.alpha != undefined)
                        {
                            _endColor.alphaMultiplier = this.vars.alpha;
                            delete this.vars.alpha;
                            delete this.tweens.alpha;
                        }
                        else
                        {
                            _endColor.alphaMultiplier = this.target.alpha;
                        }
                        if (this.vars[_loc_2] != null && this.vars[_loc_2] != "")
                        {
                            _endColor.color = this.vars[_loc_2];
                        }
                        _loc_6 = new TweenLite(this, this.duration, {colorProxy:1, delay:_loc_1, overwrite:false, ease:this.vars.ease, runBackwards:this.vars.runBackwards});
                        _loc_6.endTarget = this.target;
                        continue;
                    }
                    if (_loc_2 == "volume" && this.target is MovieClip)
                    {
                        _sound = this.target.soundTransform;
                        _loc_7 = new TweenLite(this, this.duration, {volumeProxy:this.vars[_loc_2], ease:easeOut, delay:_loc_1, overwrite:false, runBackwards:this.vars.runBackwards});
                        _loc_7.endTarget = this.target;
                        continue;
                    }
                    if (this.target.hasOwnProperty(_loc_2))
                    {
                        if (typeof(this.vars[_loc_2]) == "number")
                        {
                            _loc_3 = this.vars[_loc_2] - this.target[_loc_2];
                        }
                        else
                        {
                            _loc_3 = Number(this.vars[_loc_2]);
                        }
                        this.tweens[_loc_2] = {o:this.target, s:this.target[_loc_2], c:_loc_3};
                        continue;
                    }
                    this.extraTweens[_loc_2] = {o:this.target, s:0, c:0, v:this.vars[_loc_2]};
                }
            }
            if (this.vars.runBackwards == true)
            {
                for (_loc_2 in this.tweens)
                {
                    
                    _loc_8 = this.tweens[_loc_2];
                    this.tweens[_loc_2].s = _loc_8.s + _loc_8.c;
                    _loc_8.c = _loc_8.c * -1;
                    if (_loc_8.c != 0)
                    {
                        _loc_8.o[_loc_2] = _loc_8.s;
                    }
                }
                if (this.vars.onUpdate != null)
                {
                    this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
                }
            }
            if (typeof(this.vars.autoAlpha) == "number")
            {
                this.target.visible = !(this.vars.runBackwards == true && this.target.alpha == 0);
            }
            return;
        }// end function

        public function render(param1:int) : void
        {
            var _loc_4:Object = null;
            var _loc_5:String = null;
            var _loc_2:* = (param1 - this.startTime) / 1000;
            if (_loc_2 > this.duration)
            {
                _loc_2 = this.duration;
            }
            var _loc_3:* = this.vars.ease(_loc_2, 0, 1, this.duration);
            for (_loc_5 in this.tweens)
            {
                
                _loc_4 = this.tweens[_loc_5];
                _loc_4.o[_loc_5] = _loc_4.s + _loc_3 * _loc_4.c;
            }
            if (this.vars.onUpdate != null)
            {
                this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
            }
            if (_loc_2 == this.duration)
            {
                complete(true);
            }
            return;
        }// end function

        public function complete(param1:Boolean = false) : void
        {
            if (!param1)
            {
                this.startTime = 0;
                render(this.duration * 1000);
                return;
            }
            if (typeof(this.vars.autoAlpha) == "number" && this.target.alpha == 0)
            {
                this.target.visible = false;
            }
            if (this.vars.onComplete != null)
            {
                this.vars.onComplete.apply(null, this.vars.onCompleteParams);
            }
            removeTween(this);
            return;
        }// end function

        protected function easeProxy(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            return this.vars.proxiedEase.apply(null, arguments.concat(this.vars.easeParams));
        }// end function

        public function get active() : Boolean
        {
            if (_active)
            {
                return true;
            }
            if ((getTimer() - this.initTime) / 1000 > this.delay)
            {
                _active = true;
                this.startTime = this.initTime + this.delay * 1000;
                if (this.vars.runBackwards != true)
                {
                    initTweenVals();
                }
                else if (typeof(this.vars.autoAlpha) == "number")
                {
                    this.target.visible = true;
                }
                if (this.vars.onStart != null)
                {
                    this.vars.onStart.apply(null, this.vars.onStartParams);
                }
                if (this.duration == 0.001)
                {
                    (this.startTime - 1);
                }
                return true;
            }
            else
            {
                return false;
            }
        }// end function

        public function set endTarget(param1:Object) : void
        {
            delete _all[_endTarget][this];
            _endTarget = param1;
            if (_all[param1] == undefined)
            {
                _all[param1] = new Dictionary();
            }
            _all[param1][this] = this;
            return;
        }// end function

        public function get endTarget() : Object
        {
            return _endTarget;
        }// end function

        public function set volumeProxy(param1:Number) : void
        {
            _sound.volume = param1;
            this.target.soundTransform = _sound;
            return;
        }// end function

        public function get volumeProxy() : Number
        {
            return _sound.volume;
        }// end function

        public function set colorProxy(param1:Number) : void
        {
            var _loc_2:* = 1 - param1;
            this.target.transform.colorTransform = new ColorTransform(_color.redMultiplier * _loc_2 + _endColor.redMultiplier * param1, _color.greenMultiplier * _loc_2 + _endColor.greenMultiplier * param1, _color.blueMultiplier * _loc_2 + _endColor.blueMultiplier * param1, _color.alphaMultiplier * _loc_2 + _endColor.alphaMultiplier * param1, _color.redOffset * _loc_2 + _endColor.redOffset * param1, _color.greenOffset * _loc_2 + _endColor.greenOffset * param1, _color.blueOffset * _loc_2 + _endColor.blueOffset * param1, _color.alphaOffset * _loc_2 + _endColor.alphaOffset * param1);
            return;
        }// end function

        public function get colorProxy() : Number
        {
            return 0;
        }// end function

        public static function to(param1:Object, param2:Number, param3:Object) : TweenLite
        {
            return new TweenLite(param1, param2, param3);
        }// end function

        public static function from(param1:Object, param2:Number, param3:Object) : TweenLite
        {
            param3.runBackwards = true;
            return new TweenLite(param1, param2, param3);
        }// end function

        public static function delayedCall(param1:Number, param2:Function, param3:Array = null) : TweenLite
        {
            return new TweenLite(param2, 0, {delay:param1, onComplete:param2, onCompleteParams:param3, overwrite:false});
        }// end function

        public static function removeTween(param1:TweenLite = null) : void
        {
            if (param1 != null && _all[param1.endTarget] != undefined)
            {
                delete _all[param1.endTarget][param1];
            }
            return;
        }// end function

        public static function killTweensOf(param1:Object = null, param2:Boolean = false) : void
        {
            var _loc_3:Object = null;
            var _loc_4:* = undefined;
            if (param1 != null && _all[param1] != undefined)
            {
                if (param2)
                {
                    _loc_3 = _all[param1];
                    for (_loc_4 in _loc_3)
                    {
                        
                        _loc_3[_loc_4].complete(false);
                    }
                }
                delete _all[param1];
            }
            return;
        }// end function

        public static function executeAll(event:Event) : void
        {
            var _loc_4:Object = null;
            var _loc_5:Object = null;
            var _loc_6:Object = null;
            var _loc_2:* = _all;
            var _loc_3:* = getTimer();
            for (_loc_4 in _loc_2)
            {
                
                for (_loc_5 in _loc_2[_loc_4])
                {
                    
                    _loc_6 = _loc_2[_loc_4][_loc_5];
                    if (_loc_6 != null && _loc_6.active)
                    {
                        _loc_6.render(_loc_3);
                    }
                }
            }
            return;
        }// end function

        public static function killGarbage(event:TimerEvent) : void
        {
            var _loc_4:Boolean = false;
            var _loc_5:Object = null;
            var _loc_6:Object = null;
            var _loc_7:Object = null;
            var _loc_2:* = _all;
            var _loc_3:int = 0;
            for (_loc_5 in _loc_2)
            {
                
                _loc_4 = false;
                for (_loc_6 in _loc_2[_loc_5])
                {
                    
                    _loc_4 = true;
                    break;
                }
                if (!_loc_4)
                {
                    delete _loc_2[_loc_5];
                    continue;
                }
                _loc_3++;
            }
            if (_loc_3 == 0)
            {
                _sprite.removeEventListener(Event.ENTER_FRAME, executeAll);
                _timer.removeEventListener("timer", killGarbage);
                _timer.stop();
                _listening = false;
            }
            return;
        }// end function

        static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 / param4;
            param1 = param1 / param4;
            return (-param3) * _loc_5 * (param1 - 2) + param2;
        }// end function

    }
}
