package  
{
	//makes it easier to pull seperate classes in as i go.
	import org.flixel.*;
	import org.flixel.FlxG;
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
		private var loadgame:FlxButtonPlus;
		private var fulloptions:FlxButtonPlus;
		
		override public function create():void 
		{
			FlxG.mouse.show(Asset.mouse, 3);
			
			splashscreen = new FlxSprite();
			splashscreen.loadGraphic(Asset.splashSS, false, false, 320,240);
			add(splashscreen);
			
			newgame = new FlxButtonPlus(20, 130, startGame, null, "Start");
			add(newgame); // very basic new game button added
			
			fulloptions = new FlxButtonPlus(200, 130, optionsOpen, null, "Options");
			add(fulloptions); // another basic switch state button
		}
		private function startGame():void 
		{
			FlxG.switchState(new Playstate);
		}
		private function optionsOpen():void
		{
			FlxG.switchState(new Options);
		}
		// below will be load game when coded
		
	}

}