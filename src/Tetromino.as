package  
{
	import starling.display.Sprite;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jizo
	 */
	public class Tetromino extends Sprite
	{
		public var figure:Array;
		// I T L J Z S O
		// 0 1 2 3 4 5 6
		public var type:uint;
		public var rotationState:uint;
		public var Row;
		public var Col;
		private const TS:uint = 24;
		
		public function Tetromino(type:uint, figure:Array) 
		{
			this.figure = figure;
			this.type = type;
			rotationState = 0;
		}
		
		public function rotateLeft():void
		{
			if (rotationState == 0)
			{
				rotationState = figure.length - 1;
			}
			else
			{
				--rotationState;
			}
		}
		
		public function rotateRight():void
		{
			++rotationState;
			rotationState %= figure.length;
		}
		
		public function get currentFigure():Array
		{
			return figure[rotationState];
		}
		
		public function currentType():uint
		{
			return type;
		}
		
		public function setStartingPos():void
		{
			Col = 3;
			if (figure[0][0].indexOf(1) == -1)
			{
				Row = -1;
			}
			else
			{
				Row = 0;
			}
		}
		
		public function isFirstLineEmpty():Boolean
		{
			if (figure[0][0].indexOf(1) == -1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public function draw():void
		{
			removeChildren();
			for (var i:int = 0; i < currentFigure.length; ++i)
			{
				for (var j:int = 0; j < currentFigure[i].length; ++j)
				{
					if (currentFigure[i][j] == 1)
					{
						var tempImage:Image = new Image(Assets.getTextureByType(type));
						addChild(tempImage);
						tempImage.x = 2 * j + TS * j;
						tempImage.y = 2 * i + TS * i;
					}
				}
			}
		}
	}

}