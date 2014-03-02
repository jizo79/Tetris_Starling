package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jizo
	 */
	public class Tetris extends Sprite
	{
		private var gameBoard:Board;
		private var nextField:Next;
		private var scoreField:Score;
		private var gameField:GameField;
		
		private var tilesHeight:uint;
		private var tilesWidth:uint;
		private var TS:uint;
		
		private var timeCount:Timer = new Timer(500);
		private var standardDelay:uint = 500;
		private var isSpaceDown:Boolean = false;
		
		private var fieldArray:Array;
		private var currentTetromino:Tetromino;
		private var nextTetromino:Tetromino;
		
		private var Row:int;
		private var Col:int;
		
		private var gameOver:Boolean = false;
		
		public function Tetris(nextField:Next, scoreField:Score) 
		{
			super();
			
			tilesHeight = 20;
			tilesWidth = 10;
			TS = 24;
			
			this.nextField = nextField;
			this.scoreField = scoreField;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			showBoard();
			initField();
		}
		
		public function run():void
		{
			initTetrominos();
			generateTetromino();
			
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function showBoard():void
		{
			gameBoard = new Board(tilesHeight, tilesWidth, TS);
			addChild(gameBoard);
		}
		
		private function initField():void
		{
			gameField = new GameField(tilesHeight, tilesWidth, TS);
			addChild(gameField);
		}
		
		private function initTetrominos():void
		{
			TetrominoGenerator.init();
			nextTetromino = TetrominoGenerator.getTetromino(-1);
		}
	
		private function generateTetromino():void
		{
			if (!gameOver)
			{
				removeChild(getChildByName("current"));
				currentTetromino = nextTetromino;
				nextTetromino = TetrominoGenerator.getTetromino(-1);
				drawNext();
				setStartingPos();
				currentTetromino.name = "current";
				addChild(currentTetromino);
				
				if (gameField.canFit(Row, Col, currentTetromino))
				{
					drawTetromino();
					timeCount.addEventListener(TimerEvent.TIMER, onTimer);
					timeCount.start();
				}
				else
				{
					gameOver = true;
				}
			}
			
		}
		
		private function setStartingPos():void
		{
			if (currentTetromino.isFirstLineEmpty())
			{
				Row = -1;
			}
			else
			{
				Row = 0;
			}
			Col = 3;
		}
		
		private function drawNext():void
		{
			nextField.showTetromino(nextTetromino);
		}
		
		private function drawTetromino():void
		{
			currentTetromino.draw();
			placeTetromino();
		}
		
		private function placeTetromino():void
		{
			currentTetromino.x = 15 + 2 * Col + TS * Col;
			currentTetromino.y = 10 + 2 * Row + TS * Row;
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (!gameOver)
			{
				switch(e.keyCode)
				{
					case 37:
						if(gameField.canFit(Row, Col -1, currentTetromino))
						{
							Col--;
							placeTetromino();
						}
						break;
					case 38:
						currentTetromino.rotateRight();
						if (gameField.canFit(Row, Col, currentTetromino))
						{
							updateRotation();
						}
						else
						{
							currentTetromino.rotateLeft();
						}
						break;
					case 39:
						if(gameField.canFit(Row, Col + 1, currentTetromino))
						{
							Col++;
							placeTetromino();
						}
						break;
					case 40:
						currentTetromino.rotateLeft();
						if (gameField.canFit(Row, Col, currentTetromino))
						{
							updateRotation();
						}
						else
						{
							currentTetromino.rotateRight();
						}
						break;
					case 32:
						if (!isSpaceDown)
						{
							isSpaceDown = true;
							standardDelay = timeCount.delay;
							timeCount.delay = 25;
						}
						break;
				}
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if(!gameOver)
			{
				switch(e.keyCode)
				{
					case 32:
						if (isSpaceDown)
						{
							isSpaceDown = false;
							timeCount.delay = standardDelay;
						}
						break;
				}
			}
		}

		private function updateRotation():void
		{
			currentTetromino.draw();
		}
		
		private function landTetromino():void
		{
			gameField.landTetromino(Row, Col, currentTetromino);
			timeCount.removeEventListener(TimerEvent.TIMER, onTimer);
			timeCount.stop();
		}
		
		
		
		private function updateScore(n:uint):void
		{
			var multiplexer:int = 1;
			if (n == 4)
			{
				multiplexer = 4;
			}
			scoreField.updateScore(n * multiplexer * 79);
		}
		
		public function onTimer(e:TimerEvent):void
		{
			if (gameField.canFit(Row + 1, Col, currentTetromino))
			{
				Row++;
				placeTetromino();
			}
			else
			{
				landTetromino();
				var cleaned:uint = gameField.updateLines();
				updateScore(cleaned);
				generateTetromino();
			}
		}
		
	}

}