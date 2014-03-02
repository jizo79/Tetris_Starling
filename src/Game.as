package  
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	
	public class Game extends Sprite
	{
		private var background:Image;
		private var tetrisGame:Tetris;	
		private var nextField:Next;
		private var scoreField:Score;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init():void
		{
			Assets.init();
			background = new Image(Assets.getTexture("bg_main"));
			addChild(background);
			
			nextField = new Next();
			addChild(nextField);
			nextField.x = 50;
			nextField.y = 100;
			
			scoreField = new Score(0);
			addChild(scoreField);
			scoreField.x = 550;
			scoreField.y = 10;
			
			tetrisGame = new Tetris(nextField, scoreField);
			addChild(tetrisGame);
			tetrisGame.x = 250;
			tetrisGame.y = 30;
			
			tetrisGame.run();
		}
		
		
	}

}