package  
{
	import starling.display.Image;
	import starling.events.Event;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jizo
	 */
	public class Next extends Sprite
	{
		private var currentTetromino:Sprite;
		
		public function Next() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			showNextField();
		}
		
		private function showNextField():void
		{
			var field:Image = new Image(Assets.getTexture("ui_panel_short"));
			addChild(field);
			var icon:Image = new Image(Assets.getTexture("ui_icon_tile_next"));
			addChild(icon);
			icon.x = 13;
			icon.y = 16;
		}
		
		public function showTetromino(tetromino:Tetromino):void
		{
			if (getChildByName("nextTetro") != null)
			{
				removeChild(getChildByName("nextTetro"));
			}
			
			var currentTetromino:Sprite = new Sprite();
			var currentTetrominoFigure:Array = tetromino.currentFigure;
			currentTetromino.name = "nextTetro";
			var type:uint = tetromino.currentType();
			
			for (var i:int = 0; i < currentTetrominoFigure.length; ++i)
			{
				for (var j:int = 0; j < currentTetrominoFigure[i].length; ++j)
				{
					if (currentTetrominoFigure[i][j] == 1)
					{
						var tempImage:Image = new Image(Assets.getTextureByType(type));
						currentTetromino.addChild(tempImage);
						tempImage.x = 2 * j + 24 * j;
						tempImage.y = 2 * i + 24 * i;
					}
				}
			}
			addChild(currentTetromino);
			currentTetromino.x = 80;
			if (currentTetrominoFigure[0].indexOf(1) == -1)
			{
				currentTetromino.y = -11;
			}
			else
			{
				currentTetromino.y = 15;
			}
		}
		
	}

}