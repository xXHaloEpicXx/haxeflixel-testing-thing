package;

// required libraries
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxFilterFrames;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tweens.FlxEase.EaseFunction;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import haxe.EnumTools;
import openfl.filters.BitmapFilter;
import openfl.filters.BlurFilter;

// import flixel.addons.effects.FlxTrailArea;
// import flixel.addons.ui.FlxUI9SliceSprite;
// import flixel.addons.ui.FlxUIButton;
// import flixel.addons.ui.FlxUIDropDownMenu;

var tween:FlxTween;
var blurTween:FlxTween;
var filters:Array<BitmapFilter> = [];

class PlayState extends FlxState
{
	override public function create()
	{
		// new(Width:Float = 1280, Height:Float = 720)

		FlxG.autoPause = false;

		var loadingBG = new FlxSprite("assets/images/LoadingBG.png");
		loadingBG.screenCenter();
		loadingBG.setGraphicSize(FlxG.width, FlxG.height);

		var loadingSprite = new FlxSprite("assets/images/LoadingSpinner.png");
		loadingSprite.x = FlxG.width - 100;
		loadingSprite.y = FlxG.height - 100;
		loadingSprite.setGraphicSize(50, 50);

		var bgFilter:FlxFilterFrames;

		// var blurFilter = new BlurFilter();
		// loadingBG = createSprite(0.75, -100, "Blur");
		// bgFilter = createFilterFrames(loadingBG, blurFilter);
		// blurTween = FlxTween.tween(blurFilter, {blurX: 50, blurY: 50}, 1.5, {type: PINGPONG});
		// blurTween.active = false;

		FlxTween.angle(loadingSprite, 0, 360, 1, {
			type: FlxTweenType.LOOPING,
			ease: FlxEase.linear,
			startDelay: 0,
			loopDelay: 0
		});

		// var trail = new FlxTrail(_sprite, "assets/logo.png", 12, 0, 0.4, 0.02);

		var loadingText = new FlxText(0, 0, FlxG.width, "Press ESC to cancel loading");
		loadingText.alignment = FlxTextAlign.LEFT;
		loadingText.color = FlxColor.BLACK;
		loadingText.setFormat("assets/fonts/GothamSSm-Book.otf");
		loadingText.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xff333333);
		loadingText.setSize(FlxG.width, 100);
		loadingText.x = 10;
		loadingText.size = 32;
		loadingText.y = 10;

		// var blurFilter = filter:newBlurFilter();

		var soundButton:FlxButton = new FlxButton(0, 0, "play game!!!!!", playSFX);
		soundButton.screenCenter();
		// soundButton.loadGraphic("assets/images/button.png");
		// soundButton.label.setFormat("assets/fonts/Ubuntu-Regular.ttf");
		// soundButton.label.size = 32;
		soundButton.label.setGraphicSize(750, 100);
		soundButton.y = FlxG.height / 4 + FlxG.height / 2;
		soundButton.setGraphicSize(750, 100);

		add(loadingBG);
		add(loadingSprite);
		add(loadingText);
		// add(blurFilter);
		// add(soundButton);

		super.create();
	}

	function playSFX()
	{
		FlxG.sound.play("assets/sounds/nikocado fart.ogg", 1, false, false);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
			tween.cancel();
	}
}
