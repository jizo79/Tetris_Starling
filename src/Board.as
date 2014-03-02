package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	/**
	 * ...
	 * @author Jizo
	 */
	public class Board extends Sprite
	{
		private var tilesHeight:uint;
		private var tilesWidth:uint;
		private var TS:uint;
		
		public function Board(height:uint, width:uint, ts:uint) 
		{
			tilesHeight = height;
			tilesWidth = width;
			TS = ts;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			showBorder();
			showField();
		}
		
		private function showBorder():void
		{
			var border:Image = new Image(Assets.getTexture("ui_panel_main"));
			addChild(border);
		}
		
		private function showField():void
		{
			var gameFieldSprite:Sprite = new Sprite();
			addChild(gameFieldSprite);
			gameFieldSprite.x = 15;
			gameFieldSprite.y = 10;
			gameFieldSprite.name = "gameField";
			for (var i:uint = 0; i < tilesHeight; ++i)
			{
				for (var j:uint = 0; j < tilesWidth; ++j)
				{
					var stencil:Image = new Image(Assets.getTexture("game_object_tile_stencil"));
					gameFieldSprite.addChild(stencil);
					stencil.x = 2 * j + 24 * j;
					stencil.y = 2 * i + 24 * i;
				}
			}
		}
		
		
	}

}