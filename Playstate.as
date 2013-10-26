package  
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * ...
	 * @author Heppell08
	 * Informations here
	 * Need a few new buttons added with new sprite covers
	 * then make them only be available to press as certain cards are
	 * on show. Might need an array but for now i'll hard code
	 * one function in for now.
	 * Need alot of art and more arrangement os the screen as im slap
	 * dashing buttons for now. Will tidy them and make
	 * some new art for them too
	 */
	public class Playstate extends FlxState
	{
		// main here
		private var backdrop:FlxSprite;
		private var displayhud:FlxSprite;
		private var button01:FlxButtonPlus;
		private var button02:FlxButtonPlus; // make a few just for when i add
		private var button03:FlxButtonPlus; // 3 for now, maybe more later
		private var button04:FlxButtonPlus; // battle button
			
		// add cards below
		public var _card1:Card; // just so i can add to the playstate later
		public var _fcard1:FireCard1; // might be an easier way to add cards but unsure.
		public var _wcard1:WaterCard1;
		
		// interactive below
		public var stat:Number = 0;
		public var xp:Number = 0
		public var level:Number = 1;
		public var buttonadd:Number = 0;
		
		// onscreen texts below
		private var statstxt:FlxText;
		private var xptext:FlxText;
		private var leveltext:FlxText;
		private var cardgentxt:FlxText;
		
		// test here
		private var cardhealth:FlxText;
		private var cardgen:int = (FlxMath.rand(1, 20));
		
		override public function create():void 
		{
			FlxG.mouse.show(Asset.mouse, 3);// will change sprite in parentheses
			
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
			button01 = new FlxButtonPlus(110, 210, button01Clicked, null,"XP Gain");
			button01.borderColor = 0xEE11DD;
			add(button01);
			
			// button 2 - controls
			button02 = new FlxButtonPlus(210, 210, button02Clicked, null, "Controls");
			add(button02);
			
			// button 3 to earn a card
			button03 = new FlxButtonPlus(210, 10, button03Clicked, null, "Draw Card");
			button03.exists = true; // modify below to make nonexistant
			add(button03);
				
			// battle button tester only
			button04 = new FlxButtonPlus(10, 210, battleClicked, null, "Battle");
			add(button04);
			
			// declare cards below
			add(_card1 = new Card(150, 150)); // use this method for the X,Y position
			_fcard1 = new FireCard1(80, 80);
			_wcard1 = new WaterCard1(90, 90);
			
			// add cards here
			add(_wcard1);
			_wcard1.exists = false;
			add(_fcard1);
			_fcard1.exists = false;
			
			
			//stats below
			statstxt = new FlxText(0, 10, FlxG.width);
			statstxt.color = 0x000000;
			add(statstxt);
			
			// xp below
			xptext = new FlxText(0, 20, FlxG.width);
			xptext.color = 0x000000;
			add(xptext);
			
			//level below
			leveltext = new FlxText(0, 0, FlxG.width);
			leveltext.color = 0x000000;
			add(leveltext);	
			
			// card health
			cardhealth = new FlxText(0, 30, FlxG.width);
			cardhealth.color = 0x000000;
			cardhealth.exists = false;
			
			//tracing cardgen number on press here
			cardgentxt = new FlxText(0, 40, FlxG.width);
			cardgentxt.color = 0x000000;
			add(cardgentxt);			
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
			// activate plugin above the make sprite draggable below the enabled plugin code.
			// This below allows any extended from Card class to be draggable
			_card1.enableMouseDrag();
			
			// XP and Level up maths here
			if (xp > 5 + (level * level))
			{
                 level ++;
			     xp = 0;
            }
			
			super.update();
			
			// add the numbers below for real time show
			statstxt.text = 'Stats:' + stat.toString();
			xptext.text = 'Exp:' + xp.toString();
			leveltext.text = 'Level:' + level.toString();
			cardhealth.text = 'CardHP:' +_fcard1.health.toString() || _wcard1.health.toString(); // NICE!
			cardgentxt.text = 'CGen:' + cardgen.toString();
		}
		
		private function button01Clicked():void
		{
			// Re-spawns the same card back in (recycling the good way)
			if (_fcard1.health < 1)
			{
				button03.exists = true; // reset random card button
			}
		}
		private function button02Clicked():void
		{
			FlxG.switchState(new Options);
		}
		private function button03Clicked():void // Alot to add here... #sadface haha
		{
			cardgen = FlxMath.rand(1, 20); // super important
			
			if ((cardgen == 12) && (_fcard1.exists = true)) // can be changed to number between 1,20
			{
			add(cardhealth); 
			cardhealth = 50;
			add(_fcard1);
			_fcard1.exists = true;
			cardhealth.exists = true;
			button03.exists = false;
			}
			if ((cardgen == 8) && (_wcard1.exists = true)) // new card added
			{
				add(_wcard1);
				cardhealth = 90;
				add(cardhealth);
				cardhealth.exists = true;
				button03.exists = false;
			}
			
		}
		public function battleClicked():void // basic battle function via buttons
		{
			if (_fcard1.exists = true) // need to add alot more in here too
			{
				_fcard1.hurt(FlxMath.rand(1,15)); // and more of these functions too...
			}
			if (_fcard1.health < 1)
			{
				_fcard1.exists = false;
				cardhealth.exists = false;
			}
		}
	}

}
