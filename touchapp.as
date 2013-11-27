package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class touchapp extends Sprite
	{
		private var startPosX:Number;
		private var startPosY:Number;
		private var endPosX:Number;
		private var endPosY:Number;
		
		public function touchapp()
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, startswipe);
		}
		
		public function startswipe(event:MouseEvent) {
			trace("Start swipe X : "+event.target.mouseX);
			trace("Start swipe Y : "+event.target.mouseY);
			startPosX = event.target.mouseX;
			startPosY = event.target.mouseY;
			
			stage.addEventListener(MouseEvent.MOUSE_UP, endswipe);			
		}
		
		public function endswipe(event:MouseEvent) {
			trace("end swipe X : "+event.target.mouseX);
			trace("end swipe Y : "+event.target.mouseY);
			trace("-------------------------------------------------");
			
			
			endPosX = event.target.mouseX;
			endPosY = event.target.mouseY;
			
			var diffX:Number = startPosX-endPosX;
			var diffY:Number = startPosY-endPosY;
			
			trace("Diff swipe X,Y : "+diffX+", "+diffY);
			
			var diffX2:Number = Math.pow(diffX,2);
			var diffY2:Number = Math.pow(diffY,2);
			
			var Complete:Number = diffX2+diffY2;
			
			var vectorlenght:Number = Math.sqrt(Complete);
			
			trace("length Vector : "+vectorlenght);
			
			var hoekSin:Number = diffY/vectorlenght;
			var radians:Number = Math.asin(hoekSin);
			
			trace("Sinus value : "+hoekSin+" Radials : "+radians);
			
			var degree:Number = radians*180/Math.PI;
			
			trace("degree's : "+degree);
			
			trace("-------------------------------------------------");			
			stage.removeEventListener(MouseEvent.MOUSE_UP, endswipe);
		}
	}
}