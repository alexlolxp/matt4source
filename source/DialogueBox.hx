package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitLeftgf:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'war-of-honour' | 'combat' | 'opponent' | 'endless-battle':
							FlxG.sound.playMusic(Paths.music('swordplay'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'light-it-up':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'ruckus':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
				
			case 'target-practice':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'sporting':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'boxing-match':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
	
			case 'fisticuffs':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
	
			case 'deathmatch':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'wind-up':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'king-hit':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			case 'en-garde':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'war-of-honour':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'opponent':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'combat':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'endless-battle':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'champion':
				hasDialog = false;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			case 'purgatory':
				hasDialog = false;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'swordfight':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'combat':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

			case 'final-showdown':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;
			default:
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.y = FlxG.height - box.height + 50;
				box.x = box.x - 20;

		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;

		if (PlayState.SONG.song.toLowerCase()=='senpai' || PlayState.SONG.song.toLowerCase()=='roses' || PlayState.SONG.song.toLowerCase()=='thorns')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
	
			portraitRight = new FlxSprite(0, 40);
			portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		}	
		
		if (PlayState.SONG.song.toLowerCase()=='light-it-up' || PlayState.SONG.song.toLowerCase()=='ruckus' || PlayState.SONG.song.toLowerCase()=='target-practice' || PlayState.SONG.song.toLowerCase()=='sporting' || PlayState.SONG.song.toLowerCase()=='boxing-match' || PlayState.SONG.song.toLowerCase()=='fisticuffs' || PlayState.SONG.song.toLowerCase()=='deathmatch' || PlayState.SONG.song.toLowerCase()=='wind-up')
		{
			portraitLeft = new FlxSprite(30,250);
			portraitLeft.frames = Paths.getSparrowAtlas('matt-portrait');
			portraitLeft.animation.addByPrefix('enter', 'matt portrait', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.5));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(800,250);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend-portrait');
			portraitRight.animation.addByPrefix('enter', 'boyfriend-portrait', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.5));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		} 
		if (PlayState.SONG.song.toLowerCase()=='fisticuffs' || PlayState.SONG.song.toLowerCase()=='wind-up') 
		{
			portraitLeft = new FlxSprite(158,150.45);
			portraitLeft.frames = Paths.getSparrowAtlas('matt box portrait');
			portraitLeft.animation.addByPrefix('enter', 'Matt Box portrait enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.8));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(804,170);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend portrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		} 
		if (PlayState.SONG.song.toLowerCase() =='deathmatch' || PlayState.SONG.song.toLowerCase()=='king-hit') 
		{
			portraitLeft = new FlxSprite(160,154.4);
			portraitLeft.frames = Paths.getSparrowAtlas('matt chill portrait');
			portraitLeft.animation.addByPrefix('enter', 'Matt Chill portrait enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 0.8));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(804,170);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend portrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() =='en-garde' || PlayState.SONG.song.toLowerCase()=='swordfight' || PlayState.SONG.song.toLowerCase()=='war-of-honour' || PlayState.SONG.song.toLowerCase()=='opponent' || PlayState.SONG.song.toLowerCase()=='endless-battle') 
		{
			portraitLeft = new FlxSprite(160,150);
			portraitLeft.frames = Paths.getSparrowAtlas('matt fight portrait');
			portraitLeft.animation.addByPrefix('enter', 'matt_portrait_animated', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 1.2));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(804,170);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend portrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() =='combat')
		{
			portraitLeft = new FlxSprite(160,150);
			portraitLeft.frames = Paths.getSparrowAtlas('matt hurt portrait');
			portraitLeft.animation.addByPrefix('enter', 'matt_portrait_animated2', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 1.2));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(804,170);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend portrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;

			portraitLeftgf = new FlxSprite(0, 40);
			portraitLeftgf.frames = Paths.getSparrowAtlas('gfportraitplaceholder');
			portraitLeftgf.animation.addByPrefix('enter', 'girlfriend-portrait', 24, false);
			portraitLeftgf.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
			portraitLeftgf.updateHitbox();
			portraitLeftgf.scrollFactor.set();
			add(portraitLeftgf);
			portraitLeftgf.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() =='final-showdown')
		{
			portraitLeft = new FlxSprite(160,150);
			portraitLeft.frames = Paths.getSparrowAtlas('matt hurt portrait');
			portraitLeft.animation.addByPrefix('enter', 'matt_portrait_animated2', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * 1.2));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		
			portraitRight = new FlxSprite(804,170);
			portraitRight.frames = Paths.getSparrowAtlas('boyfriend portrait');
			portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * 0.8));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
		}

		box.animation.play('normalOpen');
		if (PlayState.curStage != 'swordarena' && PlayState.curStage != 'arenanight' && PlayState.curStage != 'boxarena' && PlayState.curStage != 'boxFC' && PlayState.curStage != 'boxDM' && PlayState.curStage != 'boxWU' && PlayState.curStage != 'boxKH' && PlayState.curStage != 'volcano' && PlayState.curStage != 'volcano_gf')
		{
			box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		}

		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Continuum Bold';
		dropText.color = 0xFFffffff;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Continuum Bold';
		swagDialogue.color = 0xFF000000;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('mattText'), 0.3);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'war-of-honour' || PlayState.SONG.song.toLowerCase() == 'opponent' || PlayState.SONG.song.toLowerCase() == 'combat' || PlayState.SONG.song.toLowerCase() == 'endless-battle')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.03, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'gf':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
