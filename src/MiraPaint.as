
/**
	* Mira Paint
	*
	* Mira Fractal painting demo using the Gumowski-Mira equation.
	* The Gumowski-Mira equation was developed at CERN in 1980 by I. Gumowski and C. Mira to calculate the trajectories of sub-atomic particles.
	*
	* @author      Martin Latter <copysense.co.uk>
	* @copyright   Martin Latter 09/06/2008
	* @version     3.0
	* @license     The MIT License (MIT)
	* @link        https://github.com/Tinram/Mira-Paint.git
	* @package     MiraPaint
*/


package {


	import flash.display.*;
	import flash.events.*;


	[ SWF (width="1024", height="768", backgroundColor="0xFFFFFF") ]


	public class MiraPaint extends Sprite {

		private static const density:uint = 30000;
		private var canvas:BitmapData;
		private var bmp:Bitmap;
		private var color:uint;
		private var xp:int = 0;
		private var yp:int = 0;


		public function MiraPaint():void {

			init();
		}


		private function init():void {

			stage.scaleMode = "noScale";
			stage.align = StageAlign.TOP_LEFT;

			canvas = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xFFFFFFFF);
			bmp = new Bitmap(canvas);
			addChild(bmp);

			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
		}


		private function onKeyboardEvent(event:KeyboardEvent):void {

			if (event.keyCode == 32) {
				canvas.fillRect(canvas.rect, 0xFFFFFFFF);
			}
		}


		private function onMouseDown(event:MouseEvent):void {

			color = Math.random() * 0xFFFFFF + 0xFF000000; // 24-bit
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}


		private function onMouseUp(event:MouseEvent):void {

			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}


		private function onEnterFrame(event:Event):void {

			var r:uint = Math.random() * 100;

			/* Gumowski-Mira equation */
			var a:Number = Math.random();
			var b:Number = (r > 70) ? 0.9998 : 1.00001;
			var c:Number = 2 - 2 * a;
			var i:uint = 0;
			var j:Number = 0;
			var y:Number = Math.random() * 40 - 20;
			var x:Number = Math.random() * 40 - 20;
			var z:Number = 0;

			a = (r > 95) ? -a : a;
			r = Math.random() * 100;

			canvas.lock();

			for (; i < density; i++) {

				z = x;
				x = b * y + j;
				j = a * x + c * (x * x) / (1 + x * x);
				y = j - z;
				xp = x * 4;
				yp = y * 4;
				canvas.setPixel(mouseX + xp, mouseY + yp, color);
			}

			canvas.unlock();
		}

	}

}
