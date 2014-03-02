package  
{
	/**
	 * ...
	 * @author Jizo
	 */
	public class TetrominoGenerator 
	{
		public static var initiated:Boolean = false;
		private static var tetrominos:Array = new Array();
		
		public function TetrominoGenerator() 
		{
		}
		
		public static function init():void
		{
			tetrominos[0] = [[[0, 0, 0, 0],
							  [1, 1, 1, 1],
							  [0, 0, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 1, 0, 0]]];
			// T
			tetrominos[1] = [[[0, 0, 0, 0],
							  [1, 1, 1, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [1, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [1, 1, 1, 0],
							  [0, 0, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [0, 1, 1, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]]];
			// L
			tetrominos[2] = [[[0, 0, 0, 0],
							  [1, 1, 1, 0],
							  [1, 0, 0, 0],
							  [0, 0, 0, 0]],
							 [[1, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 0, 1, 0],
							  [1, 1, 1, 0],
							  [0, 0, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 1, 1, 0],
							  [0, 0, 0, 0]]];
			// J
			tetrominos[3] = [[[1, 0, 0, 0],
							  [1, 1, 1, 0],
							  [0, 0, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 1, 0],
							  [0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 0, 0, 0],
							  [1, 1, 1, 0],
							  [0, 0, 1, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [0, 1, 0, 0],
							  [1, 1, 0, 0],
							  [0, 0, 0, 0]]];
			// Z
			tetrominos[4] = [[[0, 0, 0, 0],
							  [1, 1, 0, 0],
							  [0, 1, 1, 0],
							  [0, 0, 0, 0]],
							 [[0, 0, 1, 0],
							  [0, 1, 1, 0],
							  [0, 1, 0, 0],
							  [0, 0, 0, 0]]];
			// S
			tetrominos[5] = [[[0, 0, 0, 0],
							  [0, 1, 1, 0],
							  [1, 1, 0, 0],
							  [0, 0, 0, 0]],
							 [[0, 1, 0, 0],
							  [0, 1, 1, 0],
							  [0, 0, 1, 0],
							  [0, 0, 0, 0]]];
			// O
			tetrominos[6] = [[[0, 1, 1, 0],
							  [0, 1, 1, 0],
							  [0, 0, 0, 0],
							  [0, 0, 0, 0]]];
			initiated = true;
		}
		
		public static function getTetromino(type:int = -1):Tetromino
		{
			if (type == -1)
			{
				type = Math.floor(Math.random() * 7);
			}
			return new Tetromino(type, tetrominos[type]);
		}

	}

}