package;
import flixel.*;
class WarningState extends MusicBeatState
{

	public function new() 
	{
		super();
	}
	override function create() 
	{
		super.create();
		var bg:FlxSprite = new FlxSprite();
		bg.loadGraphic(Paths.image("startup"));
		add(bg);
		bg.screenCenter();
	}
	override function update(elapsed:Float) 
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
			FlxG.switchState(new MainMenuState());
		}
	}
}