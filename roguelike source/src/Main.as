package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent; 
	import flash.display.BitmapData; 
	import flash.display.Loader; 
	import flash.display.LoaderInfo; 
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest; 
	
	/**
	 * ...
	 * @author Ian Krueger
	 */
	public class Main extends Sprite 
	{
		
		//Bools
		public var gameON:Boolean = true; 
		public var init1:Boolean = true; 
		
		//Ints
		private var level:int = 2; 
		private var number1:int = 1; 
		private var tileDimensions:Rectangle; 
		
		//Arrays
		private var tileType:Array; 
		
		//Image variables
		private var tiles2:BitmapData; 
		private var screen:BitmapData; 
		private var screen2:Bitmap; 
		private var tiles3:Bitmap;
		private var player1:BitmapData;
		private var player2:Bitmap; 
		private var circleMask:Sprite; 
		private var rectMask:Sprite; 
		
		//Geom variables
		private var playerBox:Rectangle; 
		private var playerPoint:Point; 
		private var tilesBox:Rectangle; 
		private var tilesPoint:Point; 
		private var tileChange:Point = new Point(0, 0); 
		
		//Embed Images
		[Embed(source = "../graphics/topDownTiles.png")]
		internal var tiles:Class; 
		
		[Embed(source = "../graphics/player.png")]
		internal var playerImage:Class; 
		
		//Custom Objects
		private var tileEngineObject:tileEngine; 
		private var playerObject:player; 
		
		public function Main():void
		{	
			if(init1 == true)
			{
				tileDimensions = new Rectangle(0, 0, 16, 16);
				playerBox = new Rectangle(0, 0, 16, 16); 
				playerPoint = new Point(384, 304); 
				tilesBox = new Rectangle(0, 0, 800, 600); 
				tilesPoint = new Point(0, 0); 
				screen = new BitmapData(800, 600, false, 0x000000);
				
				tileEngineObject = new tileEngine; 
				playerObject = new player; 
				tiles3 = new tiles; 
				player2 = new playerImage; 
				tiles2 = tiles3.bitmapData;
				player1 = player2.bitmapData; 
				tileType = tileEngineObject.tileRand(level); 
				
				//Set up mask
				circleMask = new Sprite(); 
				circleMask.graphics.lineStyle(1, 0x000000); 
				circleMask.graphics.beginFill(0x000000); 
				circleMask.graphics.drawCircle(393, 313, 56); 
				circleMask.graphics.endFill(); 
				addChild(circleMask); 
				rectMask = new Sprite(); 
				rectMask.graphics.lineStyle(1, 0x000000); 
				rectMask.graphics.beginFill(0x000000); 
				rectMask.graphics.drawRect(0, 0, 800, 600); 
				rectMask.graphics.endFill(); 
				addChild(rectMask); 
				
				init1 = false; 
			}
			
			//Calculate movement
			stage.addEventListener(KeyboardEvent.KEY_DOWN, playerObject.movement); 
			stage.addEventListener(Event.ENTER_FRAME, playerObject.check); 
			tileChange = playerObject.playerMovement(); 
			tilesPoint.x += tileChange.x; 
			tilesPoint.y += tileChange.y; 
			
			//Collision Detection
			hitDetection(); 
			
			//Create the screen
			screen.copyPixels(tileEngineObject.tileBlitter(tiles2), tilesBox, tilesPoint); 
			screen.copyPixels(player1, playerBox, playerPoint); 
			screen2 = new Bitmap(screen); 
			
			//Apply Mask
			screen2.mask = circleMask;  
			
			addChild(screen2);
		}
		
		private function hitDetection():void
		{
			//Tile Hit Detection
			for(number1 = 1; number1 < 4801; number1++)
			{
				//Make walls and deep water impassable
				if((tileType[number1] == 2) || (tileType[number1] == 4) || (tileType[number1] == 11))
				{
					if((playerPoint.x <= tileDimensions.x + 16) && (playerPoint.x + 16 >= tileDimensions.x) && (playerPoint.y <= tileDimensions.y + 16) && (playerPoint.y + 16 >= tileDimensions.y))
					{
						if(playerPoint.x <= tileDimensions.x + 16)
						{
							tilesPoint.x -= tileDimensions.x + 16 - playerPoint.x; 
						}
						if(playerPoint.x + 16 >= tileDimensions.x)
						{
							tilesPoint.x += playerPoint.x + 16 - tileDimensions.x;
						}
						if(playerPoint.y <= tileDimensions.y + 16)
						{
							tilesPoint.y -= tileDimensions.y + 16 - playerPoint.y; 
						}
						if(playerPoint.y + 16 >= tileDimensions.y)
						{
							tilesPoint.y += playerPoint.x + 16 - tileDimensions.y;
						}
					}
				}
				
				//Check to see if player is over the exit
				if(tileType[number1] == 12)
				{
					if((playerPoint.x <= tileDimensions.x + 16) && (playerPoint.x + 16 >= tileDimensions.x) && (playerPoint.y <= tileDimensions.y + 16) && (playerPoint.y + 16 >= tileDimensions.y))
					{
						
					}
				}
				//Check to see if player is over the entrance
				if(tileType[number1] == 13)
				{
					if((playerPoint.x <= tileDimensions.x + 16) && (playerPoint.x + 16 >= tileDimensions.x) && (playerPoint.y <= tileDimensions.y + 16) && (playerPoint.y + 16 >= tileDimensions.y))
					{
						
					}
				}
				
				tileDimensions.x += 16; 
				if(tileDimensions.x >= 1280)
				{
					tileDimensions.x = 0; 
					tileDimensions.y += 16; 
				}
			}
			
			//Object Hit Detection
			for(number1 = 1; number1 < 4801; number1++)
			{
				
			}
		}
	}
}