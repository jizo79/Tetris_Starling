package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(width = "760", height = "600", frameRate = "60", backgroundColor = "0xFFFFFF")]
	public class Main extends Sprite
	{
		private var mStarling:Starling;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			mStarling = new Starling(Game, stage);
			mStarling.start();
		}
	}
}