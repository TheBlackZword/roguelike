package 
{
	
	/**
	 * ...
	 * @author Ian Krueger
	 */
	import flash.display.Bitmap;
	import flash.display.BitmapData; 
	import flash.display.Sprite;
	import flash.geom.Rectangle; 
	import flash.geom.Point; 
	
	public class tileEngine 
	{
		//tileRand function variables
		private var tileType:Array = new Array(1, 2, 3); 
		private var tileX:Array; 
		private var tileY:Array; 
		private var tileRandInit:Boolean; 
		private var spawnFountain:Boolean = true; 
		private var spawnTower:Boolean = true; 
		private var spawnEntrance:Boolean = true; 
		private var spawnExit:Boolean = true; 
		private var number4:int = 1; 
		private var number3:int = 1; 
		private var number1:int = 1;  
		private var tileXINT:int = 0; 
		private var tileYINT:int = 0; 
		private var entrance:int = 0; 
		private var exit:int = 0; 
		private var spawnChecker:Boolean = true; 
		
		//tileBlitter function variables
		private var tileDimensions:Rectangle;
		private var tileXY:Point; 
		private var tileBlitInit:Boolean = true; 
		private var tileBD:BitmapData; 
		private var tileChange:Point = new Point(0, 0); 
		
		public function tileRand(mapType:int):Array
		{
			if(tileRandInit == true)
			{
				tileType[2401] = 0;
				tileX[2401] = 0; 
				tileY[2401] = 0; 
			}
			
			if(mapType == 0)
			{
				
			}
			
			//Map 1
			if(mapType == 1)
			{
				for(number1 = 1; number1 < 4801; number1++)
				{
					tileType[number1] = Math.floor(Math.random() * 3); 
					if(tileType[number1] == 1 || 2)
					{
						tileType[number1] = 5; 
					}
					if(tileType[number1 - 1] == 5)
					{
						if(Math.floor(Math.random() * 2) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
					if(tileType[number1 - 80] == 5)
					{
						if(Math.floor(Math.random() * 6) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
					if((tileType[number1 - 80] == 5) && (tileType[number1 - 160] == 5))
					{
						if(Math.floor(Math.random() * 2) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
				}
				
				//If there is a tile bordering a floor tile, and it is not a wall or floor tile, replace it with a wall tile
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] != 5)
					{
						if((tileType[number3 - 1] == 5) || (tileType[number3 + 1] == 5) || (tileType[number3 - 80] == 5) || (tileType[number3 + 80] == 5))
						{
							tileType[number3] = 2; 
						}
					}
				}
				
				//Spawn Fountain room
				if(spawnFountain == true)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						if((tileType[number3] == 5) && (spawnFountain == true))
						{
							if(Math.floor(Math.random() * 40) == 0)
							{
								//Spawn Water
								tileType[number3 + 162] = 7; 
								tileType[number3 + 242] = 7;
								tileType[number3 + 322] = 7;
								tileType[number3 + 163] = 7; 
								tileType[number3 + 243] = 7;
								tileType[number3 + 323] = 7;
								tileType[number3 + 164] = 7; 
								tileType[number3 + 244] = 7;
								tileType[number3 + 324] = 7;
								
								//Spawn tiles
								tileType[number3 + 81] = 5; 
								tileType[number3 + 161] = 5; 
								tileType[number3 + 241] = 5;
								tileType[number3 + 161] = 5;
								tileType[number3 + 401] = 5;
								tileType[number3 + 82] = 5; 
								tileType[number3 + 83] = 5; 
								tileType[number3 + 84] = 5;
								tileType[number3 + 85] = 5;
								tileType[number3 + 165] = 5; 
								tileType[number3 + 245] = 5; 
								tileType[number3 + 325] = 5;
								tileType[number3 + 405] = 5;
								tileType[number3 + 402] = 5;
								tileType[number3 + 403] = 5;
								tileType[number3 + 404] = 5;
								
								//Spawn top wall
								tileType[number3] = 2; 
								tileType[number3 + 1] = 2; 
								tileType[number3 + 2] = 2;
								tileType[number3 + 3] = 5;
								tileType[number3 + 4] = 2;
								tileType[number3 + 5] = 2;
								tileType[number3 + 6] = 2;
								
								//Spawn left wall
								tileType[number3 + 80] = 2; 
								tileType[number3 + 160] = 2; 
								tileType[number3 + 240] = 5;
								tileType[number3 + 320] = 2;
								tileType[number3 + 400] = 2;
								
								//Spawn right wall
								tileType[number3 + 86] = 2; 
								tileType[number3 + 166] = 2; 
								tileType[number3 + 246] = 5;
								tileType[number3 + 326] = 2;
								tileType[number3 + 406] = 2;
								
								//Spawn Bottom wall
								tileType[number3 + 480] = 2; 
								tileType[number3 + 481] = 2; 
								tileType[number3 + 482] = 2;
								tileType[number3 + 483] = 5;
								tileType[number3 + 484] = 2;
								tileType[number3 + 485] = 2;
								tileType[number3 + 486] = 2;
								
								spawnFountain = false;
							} 
						}
					}
				}
				
				//Spawn Tower
				if(spawnTower == true)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						if((tileType[number3] == 5) && (spawnTower == true))
						{
							if (Math.floor(Math.random() * 60) == 0)
							{
								tileType[number3 - 1] = 2; 
								tileType[number3 + 1] = 2; 
								tileType[number3 + 78] = 2; 
								tileType[number3 + 79] = 5; 
								tileType[number3 + 80] = 5; 
								tileType[number3 + 81] = 5; 
								tileType[number3 + 82] = 2; 
								tileType[number3 + 157] = 2; 
								tileType[number3 + 158] = 5; 
								tileType[number3 + 159] = 5; 
								tileType[number3 + 160] = 5; 
								tileType[number3 + 161] = 5; 
								tileType[number3 + 162] = 5; 
								tileType[number3 + 163] = 2; 
								tileType[number3 + 237] = 5; 
								tileType[number3 + 238] = 5;
								tileType[number3 + 239] = 5;
								tileType[number3 + 240] = 14;
								tileType[number3 + 241] = 14;
								tileType[number3 + 242] = 5;
								tileType[number3 + 243] = 5; 
								tileType[number3 + 337] = 2; 
								tileType[number3 + 338] = 5; 
								tileType[number3 + 339] = 5;
								tileType[number3 + 340] = 5; 
								tileType[number3 + 341] = 5;
								tileType[number3 + 342] = 5; 
								tileType[number3 + 343] = 2; 
								tileType[number3 + 418] = 2; 
								tileType[number3 + 419] = 5; 
								tileType[number3 + 420] = 5; 
								tileType[number3 + 421] = 5; 
								tileType[number3 + 422] = 2; 
								tileType[number3 + 499] = 2; 
								tileType[number3 + 501] = 2; 
								tileType[number3 + 500] = 5; 
								
								spawnTower = false;
							}
						}
					}
				}
				
				//If a wall tile is surrounded on all sides by floor tiles, delete it
				for(number3 = 1; number3 < 4801; number3++) 
				{
					if(tileType[number3] == 2)
					{
						if((tileType[number3 - 1] == 5) && (tileType[number3 + 1] == 5) && (tileType[number3 + 80] == 5) && (tileType[number3 - 80] == 5))
						{
							tileType[number3] = 5; 
						}
					}
				}
				
				//If a floor tile is surrounded on all sides by wall tiles, delete it
				for(number3 = 1; number3 < 4801; number3++) 
				{
					if(tileType[number3] == 5)
					{
						if((tileType[number3 - 1] == 2) && (tileType[number3 + 1] == 2) && (tileType[number3 + 80] == 2) && (tileType[number3 - 80] == 2))
						{
							tileType[number3] = 2; 
						}
					}
				}
				
				
				//The border tiles are turned into walls
				for(number3 = 1; number3 < 81; number3++)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 1; number3 < 4801; number3 += 80)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 80; number3 < 4801; number3 += 80)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 4720; number3 < 4801; number3++)
				{
					tileType[number3] = 2; 
				}
				
				//Spawn Entrance
				tileType[1323] = 5;
				tileType[1324] = 5;
				tileType[1325] = 5;
				tileType[1326] = 5;
				tileType[1327] = 5;
				tileType[1463] = 5;
				tileType[1464] = 5; 
				tileType[1465] = 5;
				tileType[1466] = 5;
				tileType[1467] = 5;
				tileType[1543] = 5;
				tileType[1544] = 5;
				tileType[1545] = 13;
				tileType[1546] = 5;
				tileType[1547] = 5;
				tileType[1623] = 5;
				tileType[1624] = 5;
				tileType[1625] = 5;
				tileType[1626] = 5;
				tileType[1627] = 5;
				
				//Spawn Exit and route from Entrance to Exit
				for(number3 = 1; number3 < 4801; number3++)
				{
					if((tileType[number3] == 5) && (spawnExit == true))
					{
						if (Math.floor(Math.random() * 200) == 0)
						{
							tileType[number3 - 1] = 5;
							tileType[number3 + 1] = 5; 
							tileType[number3 - 80] = 5; 
							tileType[number3 + 80] = 5; 
							tileType[number3] = 12; 
							spawnExit = false; 
						}
					}
				}
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 13)
					{
						entrance = number3; 
					}
					if(tileType[number3] == 12)
					{
						exit = number3; 
					}
				}
				if(exit % 80 >= entrance % 80)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit - number3] = 5;
						tileType[entrance + number3] = 5; 
						if((exit - number3) % 80 <= (entrance + number3) % 80)
						{
							number3 = 4801; 
						}
					}
				}
				else
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit + number3] = 5;
						tileType[entrance - number3] = 5; 
						if((exit + number3) % 80 >= (entrance + number3) % 80)
						{
							number3 = 4801; 
						}
					}
				}
				if(exit / 80 >= entrance / 80)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit - (number3 * 80)] = 5; 
						tileType[entrance + (number3 * 80)] = 5; 
						if(exit - (number3 * 80) <= entrance + (number3 * 80))
						{
							number3 = 4801; 
						}
					}
				}
				else
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit + (number3 * 80)] = 5; 
						tileType[entrance - (number3 * 80)] = 5; 
						if(exit + (number3 * 80) >= entrance - (number3 * 80))
						{
							number3 = 4801; 
						}
					}
				}
				
				//There is a random chance that a normal wall tile will be turned into a moss wall tile
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 2)
					{
						if(Math.floor(Math.random() * 3) == 2)
						{
							tileType[number3] = 4; 
						}
					}
				}
			}
			
			//Map 2
			if(mapType == 2)
			{
				for(number1 = 1; number1 < 4801; number1++)
				{
					tileType[number1] = Math.floor(Math.random() * 3); 
					if(tileType[number1] == 1 || 2)
					{
						tileType[number1] = 5; 
					}
					if(tileType[number1 - 1] == 5)
					{
						if(Math.floor(Math.random() * 2) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
					if(tileType[number1 - 80] == 5)
					{
						if(Math.floor(Math.random() * 6) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
					if((tileType[number1 - 80] == 5) && (tileType[number1 - 160] == 5))
					{
						if(Math.floor(Math.random() * 2) == 0)
						{
							tileType[number1] = 5; 
						}
						else
						{
							tileType[number1] = 0; 
						}
					}
				}
				
				//If there is a tile bordering a floor tile, and it is not a wall or floor tile, replace it with a wall tile
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] != 5)
					{
						if((tileType[number3 - 1] == 5) || (tileType[number3 + 1] == 5) || (tileType[number3 - 80] == 5) || (tileType[number3 + 80] == 5))
						{
							tileType[number3] = 2; 
						}
					}
				}
				
				//Spawn Shrine
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 5)
					{
						if(Math.floor(Math.random() * 80) == 0)
						{
							tileType[number3] = 10; 
							tileType[number3 + 1] = 10;  
							tileType[number3 + 2] = 10; 
							tileType[number3 + 3] = 10; 
							tileType[number3 + 4] = 10; 
							tileType[number3 + 5] = 10; 
							tileType[number3 + 6] = 10; 
							tileType[number3 + 7] = 10; 
							tileType[number3 + 8] = 10; 
							tileType[number3 + 9] = 10; 
							
							tileType[number3 + 80] = 10; 
							tileType[number3 + 81] = 5;  
							tileType[number3 + 82] = 5; 
							tileType[number3 + 83] = 5; 
							tileType[number3 + 84] = 5; 
							tileType[number3 + 85] = 5; 
							tileType[number3 + 86] = 5; 
							tileType[number3 + 87] = 5; 
							tileType[number3 + 88] = 5; 
							tileType[number3 + 89] = 5; 
							
							tileType[number3 + 160] = 10; 
							tileType[number3 + 161] = 5;  
							tileType[number3 + 162] = 5; 
							tileType[number3 + 163] = 5; 
							tileType[number3 + 164] = 5; 
							tileType[number3 + 165] = 5; 
							tileType[number3 + 166] = 5; 
							tileType[number3 + 167] = 5; 
							tileType[number3 + 168] = 5; 
							tileType[number3 + 169] = 5;
							
							tileType[number3 + 240] = 10; 
							tileType[number3 + 241] = 5;  
							tileType[number3 + 242] = 5; 
							tileType[number3 + 243] = 5; 
							tileType[number3 + 244] = 5; 
							tileType[number3 + 245] = 5; 
							tileType[number3 + 246] = 5; 
							tileType[number3 + 247] = 5; 
							tileType[number3 + 248] = 5; 
							tileType[number3 + 249] = 5; 
							
							tileType[number3 + 320] = 10; 
							tileType[number3 + 321] = 5;  
							tileType[number3 + 322] = 5; 
							tileType[number3 + 323] = 5; 
							tileType[number3 + 324] = 5; 
							tileType[number3 + 325] = 5; 
							tileType[number3 + 326] = 5; 
							tileType[number3 + 327] = 5; 
							tileType[number3 + 328] = 5; 
							tileType[number3 + 329] = 5; 
							
							tileType[number3 + 400] = 10; 
							tileType[number3 + 401] = 10;  
							tileType[number3 + 402] = 10; 
							tileType[number3 + 403] = 10; 
							tileType[number3 + 404] = 10; 
							tileType[number3 + 405] = 10; 
							tileType[number3 + 406] = 10; 
							tileType[number3 + 407] = 10; 
							tileType[number3 + 408] = 10; 
							tileType[number3 + 409] = 10; 
							
							number3 = 4801; 
						}
					}
				}
				
				//Spawn Secret Room
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 5)
					{
						if(Math.floor(Math.random() * 100) == 0)
						{
							tileType[number3] = 14; 
							tileType[number3 + 1] = 14; 
							tileType[number3 + 2] = 14; 
							tileType[number3 + 3] = 14; 
							tileType[number3 + 4] = 14; 
							
							tileType[number3 + 80] = 14; 
							tileType[number3 + 81] = 15; 
							tileType[number3 + 82] = 15; 
							tileType[number3 + 83] = 15; 
							tileType[number3 + 84] = 14; 
							
							tileType[number3 + 160] = 14; 
							tileType[number3 + 161] = 15; 
							tileType[number3 + 162] = 15; 
							tileType[number3 + 163] = 15; 
							tileType[number3 + 164] = 15; 
							tileType[number3 + 165] = 5; 
							tileType[number3 + 166] = 5; 
							
							tileType[number3 + 240] = 14; 
							tileType[number3 + 241] = 15; 
							tileType[number3 + 242] = 15; 
							tileType[number3 + 243] = 15; 
							tileType[number3 + 244] = 14; 
							
							tileType[number3 + 320] = 14; 
							tileType[number3 + 321] = 14; 
							tileType[number3 + 322] = 14; 
							tileType[number3 + 323] = 14; 
							tileType[number3 + 324] = 14; 
							
							number3 = 4801; 
						}
					}
				}
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 14)
					{
						if(Math.floor(Math.random() * 2) == 0)
						{
							tileType[number3] = 16; 
						}
					}
				}
				
				//If a wall tile is surrounded on all sides by floor tiles, delete it
				for(number3 = 1; number3 < 4801; number3++) 
				{
					if(tileType[number3] == 2)
					{
						if((tileType[number3 - 1] == 5) && (tileType[number3 + 1] == 5) && (tileType[number3 + 80] == 5) && (tileType[number3 - 80] == 5))
						{
							tileType[number3] = 5; 
						}
					}
				}
				
				//If a floor tile is surrounded on all sides by wall tiles, delete it
				for(number3 = 1; number3 < 4801; number3++) 
				{
					if(tileType[number3] == 5)
					{
						if((tileType[number3 - 1] == 2) && (tileType[number3 + 1] == 2) && (tileType[number3 + 80] == 2) && (tileType[number3 - 80] == 2))
						{
							tileType[number3] = 2; 
						}
					}
				}
				
				//The border tiles are turned into walls
				for(number3 = 1; number3 < 81; number3++)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 1; number3 < 4801; number3 += 80)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 80; number3 < 4801; number3 += 80)
				{
					tileType[number3] = 2; 
				}
				for(number3 = 4720; number3 < 4801; number3++)
				{
					tileType[number3] = 2; 
				}
				
				//Spawn Entrance
				tileType[1323] = 5;
				tileType[1324] = 5;
				tileType[1325] = 5;
				tileType[1326] = 5;
				tileType[1327] = 5;
				tileType[1463] = 5;
				tileType[1464] = 5; 
				tileType[1465] = 5;
				tileType[1466] = 5;
				tileType[1467] = 5;
				tileType[1543] = 5;
				tileType[1544] = 5;
				tileType[1545] = 13;
				tileType[1546] = 5;
				tileType[1547] = 5;
				tileType[1623] = 5;
				tileType[1624] = 5;
				tileType[1625] = 5;
				tileType[1626] = 5;
				tileType[1627] = 5;
				
				//Spawn Exit and route from Entrance to Exit
				for(number3 = 1; number3 < 4801; number3++)
				{
					if((tileType[number3] == 5) && (spawnExit == true))
					{
						if(Math.floor(Math.random() * 200) == 0)
						{
							tileType[number3 - 1] = 5;
							tileType[number3 + 1] = 5; 
							tileType[number3 - 80] = 5; 
							tileType[number3 + 80] = 5; 
							tileType[number3] = 12; 
							spawnExit = false; 
						}
					}
				}
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 13)
					{
						entrance = number3; 
					}
					if(tileType[number3] == 12)
					{
						exit = number3; 
					}
				}
				if(exit % 80 >= entrance % 80)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit - number3] = 5;
						tileType[entrance + number3] = 5; 
						if((exit - number3) % 80 <= (entrance + number3) % 80)
						{
							number3 = 4801; 
						}
					}
				}
				else
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit + number3] = 5;
						tileType[entrance - number3] = 5; 
						if((exit + number3) % 80 >= (entrance + number3) % 80)
						{
							number3 = 4801; 
						}
					}
				}
				if(exit / 80 >= entrance / 80)
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit - (number3 * 80)] = 5; 
						tileType[entrance + (number3 * 80)] = 5; 
						if(exit - (number3 * 80) <= entrance + (number3 * 80))
						{
							number3 = 4801; 
						}
					}
				}
				else
				{
					for(number3 = 1; number3 < 4801; number3++)
					{
						tileType[exit + (number3 * 80)] = 5; 
						tileType[entrance - (number3 * 80)] = 5; 
						if(exit + (number3 * 80) >= entrance - (number3 * 80))
						{
							number3 = 4801; 
						}
					}
				}
				
				//There is a random chance that a normal wall tile will be turned into a moss wall tile
				for(number3 = 1; number3 < 4801; number3++)
				{
					if(tileType[number3] == 2)
					{
						if(Math.floor(Math.random() * 2) == 1)
						{
							tileType[number3] = 4; 
						}
					}
				}
			}
			return tileType; 
		}
		
		public function tileBlitter(Tiles:BitmapData):BitmapData 
		{
			if(tileBlitInit == true)
			{
				tileDimensions = new Rectangle(0, 0, 16, 16); 
				tileXY = new Point(0, 0); 
				tileBD = new BitmapData(800,600,false,0x000000);
				tileBlitInit = false; 
			}
			
			var number2:int = 1; 
			for(number2 = 1; number2 < 4801; number2++)
			{
				if(tileType[number2] == 0)
				{
					tileDimensions.x = 0; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 1)
				{
					tileDimensions.x = 16; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 2)
				{
					tileDimensions.x = 32; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 3)
				{
					tileDimensions.x = 48; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 4)
				{
					tileDimensions.x = 64; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 5)
				{
					tileDimensions.x = 80; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 6)
				{
					tileDimensions.x = 96; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 7)
				{
					tileDimensions.x = 112; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 8)
				{
					tileDimensions.x = 128; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 12)
				{
					tileDimensions.x = 144; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 13)
				{
					tileDimensions.x = 160; 
					tileDimensions.y = 0; 
				}
				if(tileType[number2] == 9)
				{
					tileDimensions.x = 0; 
					tileDimensions.y = 16; 
				}
				if(tileType[number2] == 10)
				{
					tileDimensions.x = 16; 
					tileDimensions.y = 16; 
				}
				if(tileType[number2] == 11)
				{
					tileDimensions.x = 32; 
					tileDimensions.y = 16; 
				}
				if(tileType[number2] == 15)
				{
					tileDimensions.x = 48; 
					tileDimensions.y = 16; 
				}
				if(tileType[number2] == 14)
				{
					tileDimensions.x = 64; 
					tileDimensions.y = 16; 
				}
				if(tileType[number2] == 16)
				{
					tileDimensions.x = 80; 
					tileDimensions.y = 16; 
				}
	
				
				tileBD.copyPixels(Tiles, tileDimensions, tileXY); 
				tileXY.x += 16; 
				if(tileXY.x >= 1280)
				{
					tileXY.x = 0; 
					tileXY.y += 16; 
				}
			}
			return tileBD; 
		}
	}
}