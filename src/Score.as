package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author Jizo
	 */
	public class Score extends Sprite
	{
		private var textField:TextField;
		private var totalScore:Number;
		
		public function Score(startingScore:Number = 0) 
		{
			totalScore = startingScore;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			textField = new TextField(200, 100, totalScore.toString(), "Verdana", 70);
			 
			textField.hAlign = HAlign.RIGHT;
			textField.vAlign = VAlign.BOTTOM;
			textField.border = false;
			textField.autoScale = true;
			
			addChild(textField);
		}
		
		public function updateScore(score:Number):void
		{
			totalScore += score;
			trace(totalScore);
			textField.text = totalScore.toString();
			textField.redraw();
		}
		
		
	}

}