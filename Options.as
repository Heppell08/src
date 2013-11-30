package  
{
   import org.flixel.*;
   import org.flixel.plugin.photonstorm.FlxButtonPlus;
   /**
	 * ...
	 * @author Heppell08
	 */
   public class Options extends FlxState
   {
	   // buttons declared here
	   private var exitbutton:FlxButtonPlus;
	   private var cardbutton:FlxButtonPlus;
	   
	   // sprite for explaining the look of the cards
	   private var cardexplain:FlxSprite;
	   
	   override public function create():void
	   {
		 
		   cardbutton = new FlxButtonPlus(0, 200, cardShow, null, "Card Info");
		   add(cardbutton);
		   
		   exitbutton = new FlxButtonPlus(200, 200, clickedExit, null, "EXIT");
		   exitbutton.borderColor = 0x00FF00;
		   add(exitbutton);
		   
		   cardexplain = new FlxSprite(0, 0);
		   cardexplain.loadGraphic(Asset.cardinfo);
	       add(cardexplain);
		   cardexplain.exists = false;
		   
	   }
	   public function Options():void
	   {
		   var text:FlxText;
		   text = new FlxText(10, 10, FlxG.width,
		   "Controls: \n" +
		   "Mouse controlled mainly \n" +
		   "Green card - Common \n" +
		   "Yellow card - Good \n" +
		   "Orange Card - Rare \n" +
		   "Purple card - Legendary \n" +
		   "Black Card - ???? \n" +
		   "Click Exit to Exit");
		   text.color = 0xFF0000;
		   text.size = 15;
		   add(text);
	   }
	   override public function update():void
	   {
		   if (FlxG.keys.justPressed("Q"))
		   {
			   cardexplain.exists = false;
		   }
		   super.update();
	   }
	   private function clickedExit():void
	   {
		   FlxG.switchState(new StartScreen);
	   }
	   private function cardShow():void
	   { 
		   cardexplain.exists = true;
	   }
   }
}