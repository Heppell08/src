package  
{
   import org.flixel.*;
   import org.flixel.plugin.photonstorm.FlxButtonPlus;
   import org.flixel.plugin.photonstorm.FlxVelocity;
   /**
	 * ...
	 * @author Heppell08
	 */
   public class Options extends FlxState
   {
	   private var exitbutton:FlxButtonPlus;
	   
	   override public function create():void
	   {
		   exitbutton = new FlxButtonPlus(200, 200, clickedExit, null, "EXIT");
		   exitbutton.borderColor = 0x00FF00;
		   add(exitbutton);
	   }
	   public function Options():void
	   {
		   var text:FlxText;
		   text = new FlxText(20, 25, FlxG.width,
		   "Controls: \n \n" +
		   "Mouse controlled mainly \n" +
		   "Green card - Common \n" +
		   "Yellow card - Good \n" +
		   "Orange Card - Rare \n" +
		   "Purple card - Legendary \n" +
		   "Yellow Card - Unique \n" +
		   "Black Card - ???? \n" +
		   "Click Exit to Exit");
		   text.color = 0xFF8000;
		   text.size = 15;
		   add(text);
	   }
	   private function clickedExit():void
	   {
		   FlxG.switchState(new Playstate);
	   }
   }
}