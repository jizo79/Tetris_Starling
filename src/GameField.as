package  
{
	import starling.display.Sprite;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jizo
	 */
	public class GameField extends Sprite
	{
		private var fieldArray:Array;
		private var tilesHeight:uint;
		private var tilesWidth:uint;
		private var TS:int;
		
		public function GameField(height:uint, width:uint, ts:int)
		{
			tilesHeight = height;
			tilesWidth = width;
			TS = ts;
			init();
		}
		
		private function init():void
		{
			fieldArray = new Array();
			for (var i:uint = 0; i < tilesHeight; ++i)
			{
				fieldArray[i] = new Array();
				for (var j:uint = 0; j < tilesWidth; ++j)
				{
					fieldArray[i][j] = 0;
				}
			}
		}
		
		public function canFit(Row:int, Col:int, tetromino:Tetromino):Boolean
		{
			var currentFigure:Array = tetromino.currentFigure;
			for (var i:int = 0; i < currentFigure.length; ++i)
			{
				for (var j:int = 0; j < currentFigure[i].length; ++j)
				{
					if (currentFigure[i][j] == 1)
					{
						if (Col + j < 0)
						{
							trace("left");
							return false;
						}
						else if (Col + j > tilesWidth - 1)
						{
							trace("right");
							return false;
						}
						else if (Row + i > tilesHeight - 1)
						{
							trace("top");
							return false;
						}
						else if (Row + i < 0)
						{
							trace("bottom");
							return false;
						}
						else if (fieldArray[Row + i][Col + j] == 1)
						{
							trace("collision");
							return false;
						}
					}
				}
			}
			return true;
		}
		
		public function landTetromino(Row:int, Col:int, tetromino:Tetromino):void
		{
			var currentTetrominoFigure:Array = tetromino.currentFigure;
			var type:uint = tetromino.currentType();
			var landed:Sprite;
			for (var i:int = 0; i < currentTetrominoFigure.length; ++i)
			{
				for (var j:int = 0; j < currentTetrominoFigure[i].length; ++j)
				{
					if (currentTetrominoFigure[i][j] == 1)
					{
						landed = new Sprite();
						addChild(landed);
						var tempImage:Image = new Image(Assets.getTextureByType(type));
						landed.addChild(tempImage);
						landed.x = 15 + 2 * (Col + j) + TS * (Col + j);
						landed.y = 10 + 2 * (Row + i) + TS * (Row + i);
						landed.name = "r" + (Row + i) + "c" + (Col + j);
						fieldArray[Row + i][Col + j] = 1;
					}
				}
			}
		}
		
		public function updateLines():uint
		{
			var cleanedLines:uint = 0;
			for (var i:int = 0; i < tilesHeight; ++i)
			{
				trace(fieldArray[i]);
				if (fieldArray[i].indexOf(0) == -1)
				{
					cleanedLines++;
					for (var j:int = 0; j < tilesWidth; ++j)
					{
						fieldArray[i][j] = 0;
						removeChild(getChildByName("r" + i + "c" + j));
					}
					for (j = i; j >= 0; --j)
					{
						for (var k:int = 0; k < tilesWidth; ++k)
						{
							if (fieldArray[j][k] == 1)
							{
								fieldArray[j][k] = 0;
								fieldArray[j + 1][k] = 1;
								getChildByName("r" + j + "c" + k).y += 2 + TS;
								getChildByName("r" + j + "c" + k).name = "r" + (j + 1) + "c" + k;
							}
						}
					}
				}
			}
			return cleanedLines;
		}
	}
}