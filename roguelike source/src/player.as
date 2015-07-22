package 
{
	
	/**
	 * ...
	 * @author Ian Krueger
	 */
	
	import flash.display.Bitmap;
	import flash.display.BitmapData; 
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event; 
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	 
	public class player
	{
		//Player Blit Variables	
		private var playerCoordinates:Point; 
		private var playerBlitInit:Boolean = true; 
		private var playerRect:Rectangle; 
		
		//Player Movement Variables
		private var tilesChangeRect:Point = new Point(0, 0); 
		private var up:Boolean = false; 
		private var down:Boolean = false; 
		private var right:Boolean = false; 
		private var left:Boolean = false; 
		
		public function playerMovement():Point
		{
			return tilesChangeRect;
			tilesChangeRect.x = 0; 
			tilesChangeRect.y = 0; 
		}
		
		public function check(event:Event):void
		{
			if(up == true)
			{
				tilesChangeRect.y += 1; 
			}
			if(down == true)
			{
				tilesChangeRect.y -= 1; 
			}
			if(right == true)
			{
				tilesChangeRect.x -= 1;
			}
			if(left == true)
			{
				tilesChangeRect.x += 1; 
			}
			
			up = false; 
			down = false; 
			right = false; 
			left = false; 
		}
		
		public function movement(event:KeyboardEvent):void
		{
			if(event.keyCode == 87)
			{
				up = true; 
			}
			if(event.keyCode == 83)
			{
				down = true; 
			}
			if(event.keyCode == 65)
			{
				left = true; 
			}
			if(event.keyCode == 68)
			{
				right = true; 
			}
		}
	}
	
}