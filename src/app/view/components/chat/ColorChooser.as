package app.view.components.chat
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;

    public class ColorChooser extends MovieClip
    {
        public var color:uint = 0;
        public var color_txt:TextField;
        public var main_color_mc:ColorChooserColorBox;
        public var one_color_mc:ColorChooserColorBox;
        public var two_color_mc:ColorChooserColorBox;
        public var three_color_mc:ColorChooserColorBox;
        public var four_color_mc:ColorChooserColorBox;
        public var five_color_mc:ColorChooserColorBox;
        public var six_color_mc:ColorChooserColorBox;
        public var seven_color_mc:ColorChooserColorBox;
        public var eight_color_mc:ColorChooserColorBox;
        public var nine_color_mc:ColorChooserColorBox;
        public var ten_color_mc:ColorChooserColorBox;
        public var eleven_color_mc:ColorChooserColorBox;
        public var twelve_color_mc:ColorChooserColorBox;
        public var thirteen_color_mc:ColorChooserColorBox;
        public var fourteen_color_mc:ColorChooserColorBox;
        public var fifteen_color_mc:ColorChooserColorBox;
        public var sixteen_color_mc:ColorChooserColorBox;
        public var c:ColorTransform;

        public function ColorChooser()
        {
            c = new ColorTransform();
            trace("New Color Chooser");
            setColor(color);
            one_color_mc.setColor(0);
            c.color = 0;
            one_color_mc.transform.colorTransform = c;
            two_color_mc.setColor(16711680);
            c.color = 16711680;
            two_color_mc.transform.colorTransform = c;
            three_color_mc.setColor(16777215);
            c.color = 16777215;
            three_color_mc.transform.colorTransform = c;
            four_color_mc.setColor(15729535);
            c.color = 15729535;
            four_color_mc.transform.colorTransform = c;
            five_color_mc.setColor(4980810);
            c.color = 4980810;
            five_color_mc.transform.colorTransform = c;
            six_color_mc.setColor(629);
            c.color = 629;
            six_color_mc.transform.colorTransform = c;
            seven_color_mc.setColor(2507419);
            c.color = 2507419;
            seven_color_mc.transform.colorTransform = c;
            eight_color_mc.setColor(41158);
            c.color = 41158;
            eight_color_mc.transform.colorTransform = c;
            nine_color_mc.setColor(20736);
            c.color = 20736;
            nine_color_mc.transform.colorTransform = c;
            ten_color_mc.setColor(7192576);
            c.color = 7192576;
            ten_color_mc.transform.colorTransform = c;
            eleven_color_mc.setColor(16727808);
            c.color = 16727808;
            eleven_color_mc.transform.colorTransform = c;
            twelve_color_mc.setColor(16745984);
            c.color = 16745984;
            twelve_color_mc.transform.colorTransform = c;
            thirteen_color_mc.setColor(5516294);
            c.color = 5516294;
            thirteen_color_mc.transform.colorTransform = c;
            fourteen_color_mc.setColor(9460532);
            c.color = 9460532;
            fourteen_color_mc.transform.colorTransform = c;
            fifteen_color_mc.setColor(7895160);
            c.color = 7895160;
            fifteen_color_mc.transform.colorTransform = c;
            sixteen_color_mc.setColor(6710886);
            c.color = 6710886;
            sixteen_color_mc.transform.colorTransform = c;
            one_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            two_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            three_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            four_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            five_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            six_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            seven_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            eight_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            nine_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            ten_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            eleven_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            twelve_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            thirteen_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            fourteen_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            fifteen_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            sixteen_color_mc.addEventListener(MouseEvent.CLICK, onColorChoose);
            return;
        }// end function

        public function onColorChoose(event:MouseEvent) : void
        {
            var _loc_2:* = MovieClip(event.target);
            color = _loc_2.getColor();
            setColor(color);
            this.visible = false;
            return;
        }// end function

        public function setColor(param1:uint)
        {
            color = param1;
            color_txt.text = "#" + color.toString(16);
            main_color_mc.setColor(color);
            c.color = color;
            main_color_mc.transform.colorTransform = c;
            return;
        }// end function

        public function getColor() : String
        {
            var _loc_1:* = "#" + color.toString(16);
            return _loc_1;
        }// end function

    }
}
