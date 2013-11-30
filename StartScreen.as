package  
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * @author Heppell08
	 * 
	 * In here will be buttons for loading 
	 * the game up. There will be an options button
	 * for full rundown of the game and its processes.
	 * This will have its own "state" because the load/save
	 * needs to load a state in a specific way.
	 */
	public class StartScreen extends FlxState
	{
		//splash screen images etc here
		private var splashscreen:FlxSprite;
		
		// main buttons below **Uncoded**
		private var newgame:FlxButtonPlus;
		private var fulloptions:FlxButtonPlus;
		private var loadbox:FlxSprite;
		private var loadbutton:FlxButtonPlus;
		private var animrat:FlxSprite;
		
		public static var loadtext:FlxText;
		
		
		override public function create():void 
		{
			FlxG.mouse.show(Asset.mouse, 3);
			
			splashscreen = new FlxSprite();
			splashscreen.loadGraphic(Asset.splashSS, false, false, 320,240);
			add(splashscreen);
			
			animrat = new FlxSprite();
			animrat.loadGraphic(Asset.splashrat, true, true, 15, 9);
			animrat.addAnimation("walk", [0, 1], 5, true);
			animrat.x = 15;
			animrat.y = 5;
			add(animrat);
			
			newgame = new FlxButtonPlus(20, 130, startGame, null, "Start");
			add(newgame); // very basic new game button added
			
			fulloptions = new FlxButtonPlus(200, 130, optionsOpen, null, "Options");
			fulloptions.visible = true;
			add(fulloptions); // another basic switch state button
			
			loadbox = new FlxSprite;
			loadbox.loadGraphic(Asset.loadbox);
			loadbox..visible = false;
			add(loadbox);
			
			loadtext = new FlxText(0, 120, FlxG.width, "Game Loaded \n" +"Press Q to quit and start game \n" +"Press Erase to remove broken save");
			loadtext.alignment = "center";
			loadtext.visible = false;
			loadtext.size = 10;
			loadtext.color = 0xFF0000;
			add(loadtext);
			
			loadbutton = new FlxButtonPlus(105, 180, Playstate.LoadData, null, "Load Game");
			loadbutton.visible = false;
			add(loadbutton);
			
		}
		override public function update():void
		{
			animrat.play("walk");
			animrat.x++;
			if (animrat.x > 429)
			{
				animrat.x = -77;
			}
			super.update();
			if (FlxG.keys.justPressed("L"))
			{
				fulloptions.visible = false;
				loadbox.visible = true;
				loadbutton.visible = true;
			}
			if (FlxG.keys.justPressed("Q"))
			{
				fulloptions.visible = true;
				loadbox.visible = false;
				loadbutton.visible = false;
				if (loadtext.visible == true)
				{
					loadtext.visible = false;
				}
			}
		}
		private function startGame():void 
		{
			FlxG.switchState(new Playstate);
		}
		private function optionsOpen():void
		{
			FlxG.switchState(new Options);
		}
	}
}