package  
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	/**
	 * ...
	 * @author Heppell08
	 * Informations here
	 * Testing a new function to make button
	 * for drawing a card appear then make it disappear
	 * after pulling a "new" card
	 */
	public class Playstate extends FlxState
	{
		// main here
		private var backdrop:FlxSprite;
		private var displayhud:FlxSprite;
		private var button01:FlxButtonPlus;
		private var button02:FlxButtonPlus; // make a few just for when i add
		private var button03:FlxButtonPlus; // 3 for now, maybe more later
			
		// add cards below
		public var _card1:Card; // just so i can add to the playstate later
		public var _fcard1:FireCard1; // might be an easier way to add cards but unsure.
		
		// interactive below
		public var stat:Number = 0;
		public var xp:Number = 0
		public var level:Number = 1;
		public var buttonadd:Number = 0;
		
		// onscreen texts below
		private var statstxt:FlxText;
		private var xptext:FlxText;
		private var leveltext:FlxText;
		
		override public function create():void 
		{
			FlxG.mouse.show(); // will change sprite in parentheses
			
			//add backdrop first so its at the back
			backdrop = new FlxSprite;
			backdrop.loadGraphic(Asset.backdrop01, false, false, 400, 300);
			backdrop.offset.x = backdrop.offset.y = 30;
			backdrop.antialiasing = true;
			add(backdrop);	
			
			// Lower HUD here			
			displayhud = new FlxSprite;
			displayhud.loadGraphic(Asset.disphud, false, false, 320, 80);
			displayhud.offset.x = 0;
			displayhud.offset.y = -200;
			displayhud.antialiasing = true;
			add(displayhud);
			
			// Keep buttons on top
			// first button below
			button01 = new FlxButtonPlus(50, 50, button01Clicked,null,"Button1");
			button01.borderColor = 0xEE11DD;
			add(button01);
			
			// button 2 - controls
			button02 = new FlxButtonPlus(0, 190, button02Clicked, null, "Controls");
			add(button02);
			
			// button 3 to earn a card
			button03 = new FlxButtonPlus(100, 100, button03Clicked, null, "Draw Card");
			add(button03);
				
			// cards added below
			add(_card1 = new Card(150, 150)); // use this method for the X,Y position
			_fcard1 = new FireCard1(80,80);
			//stats below
			statstxt = new FlxText(0, 10, FlxG.width);
			add(statstxt);
			
			// xp below
			xptext = new FlxText(0, 20, FlxG.width);
			add(xptext);
			
			//level below
			leveltext = new FlxText(0, 0, FlxG.width);
			add(leveltext);	
			
			}
			
		override public function update():void
		{
			// mouse input below
        	var mouseX:Number = FlxG.mouse.x;	
        	var screenX:Number = FlxG.mouse.screenX;
        	var pressed:Boolean = FlxG.mouse.pressed();
	        var justPressed:Boolean = FlxG.mouse.justPressed();
        	var justReleased:Boolean = FlxG.mouse.justReleased();
			
			//activate plugin below for power tools
			if (FlxG.getPlugin(FlxMouseControl) == null)
                           {
                               FlxG.addPlugin(new FlxMouseControl);
                           }
			
			// the card movement is below in update and the activated plugin code above
			// * Should only need this 1 card movement hopefully *
			_card1.enableMouseDrag();
			
			// XP and Level up maths here
			if (xp > 5 + (level * level))
			{
                           level ++;
			   xp = 0;
                        }
			
			/*if (level > 3)
			{
				add(button03); 
			}
			else
			{
				button03.kill(); // works but is kind of a cop out
			}*/
		
			super.update();
			
			// add the numbers below for real time show
			statstxt.text = 'Stats:' + stat.toString();
			xptext.text = 'Exp:' + xp.toString();
			leveltext.text = 'Level:' + level.toString();
		}
		
		private function button01Clicked():void
		{
			// Make this button startgame later on
			xp += 10; // works for testing only
		}
		private function button02Clicked():void
		{
			FlxG.switchState(new Options);
		}
		private function button03Clicked():void
		{
			add(_fcard1);
		}
		private function cardKill():void
		{
		   _fcard1.kill();
		}
	}

}
