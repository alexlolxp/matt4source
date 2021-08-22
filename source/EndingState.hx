package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 */

class EndingState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		trace(PlayState.storyWeek);
		super.create();	
		var end:FlxSprite = new FlxSprite(0, 0);
		if (PlayState.storyWeek == 0)
			endIt();
		else
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			if (PlayState.storyWeek == 1)		
				end.loadGraphic(Paths.image("ending1"));
			if (PlayState.storyWeek == 2)	
				end.loadGraphic(Paths.image("ending2"));
			if (PlayState.storyWeek == 3)	
				end.loadGraphic(Paths.image("ending3"));
			add(end);
			if (PlayState.storyWeek == 4 && PlayState.storyDifficulty == 0)	
				end.loadGraphic(Paths.image("endingWorst"));
			add(end);
			if (PlayState.storyWeek == 4 && PlayState.storyDifficulty == 1)	
				end.loadGraphic(Paths.image("endingNeutral"));
			add(end);
			if (PlayState.storyWeek == 4 && PlayState.storyDifficulty == 2)	
				end.loadGraphic(Paths.image("ending4"));
			add(end);
	}
			
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
	}
	
	
	}public function endIt(e:FlxTimer=null)
	{
		trace("ENDING");
		FlxG.switchState(new StoryMenuState());
	}
	
}