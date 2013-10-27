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
	 * Apparently i cant reset the health interger
	 * so i might need multiple texts per health card
	 * I did think using the (_fcard1.health.toString()) || (extra here())
	 * would have worked but apparently not or im doing it wrong.
	 * For now ill have different texts per card with names instead.
	 * Might look better. Also need new font but that will be at
	 * a later date.
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
		private var battlegentext:FlxText;
		
		// test here
		private var cardhealth:FlxText;
		private var water1hlth:FlxText;
		private var cardgen:int = (FlxMath.rand(1, 20));
		private var battlegen:int = (FlxMath.rand(1, 50));
		
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
			button04.exists = false;
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
			
			// card health below
			cardhealth = new FlxText(0, 30, FlxG.width);
			cardhealth.color = 0x000000;
		//	cardhealth.exists = false;
			
			water1hlth = new FlxText(0, 50, FlxG.width);
			water1hlth.color = 0x000000;
		//	water1hlth.exists = false;
			
			//tracing cardgen number on press here
			cardgentxt = new FlxText(0, 40, FlxG.width);
			cardgentxt.color = 0x000000;
			add(cardgentxt);
			
			battlegentext = new FlxText(40, 0, FlxG.width);
			battlegentext.color = 0x000000;
			add(battlegentext);
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
			
			//works perfectly *DONT DISTURB THIS*
			if (_fcard1.health < 1 || _wcard1.health < 1)
			{
				button04.exists = false;
				button03.exists = true;
				cardhealth.exists = false;
				water1hlth.exists = false;
				_fcard1.exists = false;
				_wcard1.exists = false;
				_fcard1.health = FireCard1.HEALTH;
				_wcard1.health = WaterCard1.HEALTH;
				battlegen = 1;
				trace(_wcard1.health);
				trace(_fcard1.health);
			}
			
			super.update();
			
			// add the numbers below for real time show
			battlegentext.text = 'BGen:' + battlegen.toString();
			statstxt.text = 'Stats:' + stat.toString();
			xptext.text = 'Exp:' + xp.toString();
			leveltext.text = 'Level:' + level.toString();
			cardhealth.text = 'Card HP:' + _fcard1.health.toString();  // Fire1 Card
			water1hlth.text = 'WaterCard:' + _wcard1.health.toString(); // Water 1 Card
			cardgentxt.text = 'CGen:' + cardgen.toString(); // Random gen card spawn
		}
		
		private function button01Clicked():void // xp gain button
		{
			// Re-spawns the same card back in (recycling the good way)
			if (_fcard1.health < 1 || _wcard1.health < 1)
			{
				button03.exists = true; // reset random card button
			}
			if (_fcard1.exists == false || _wcard1.exists == false)
			{
				button03.exists = true;
			}
		}
		private function button02Clicked():void
		{
			FlxG.switchState(new Options);
		}
		private function button03Clicked():void // Alot to add here... #sadface haha
		{
			// Make sure only one at a time is onscreen
			if (_fcard1.exists == true && _wcard1.exists == false)
			{
				cardgen = FlxMath.rand(1, 20, [12]); // i suspect this isnt active
			}
			if (_fcard1.exists == false && _wcard1.exists == true)
			{
				cardgen = FlxMath.rand(1, 20, [8]);
			}
			if (cardgen == 12) // can be changed to number between 1,20
			{
			    add(cardhealth); 
		    	_fcard1.exists = true;
		    	cardhealth.exists = true;
		    	button03.exists = false;
		    	button04.exists = true;
				cardgen = 1; // necessary for debug of math
			}
			if (cardgen == 8) // new card added
			{
				add(water1hlth);
				_wcard1.exists = true;
				water1hlth.exists = true;
				button03.exists = false;
				button04.exists = true;
				cardgen = 1; // for fairness same in here
			}
			else 
			{
				cardgen = FlxMath.rand(1, 20); // super important
			}
			
		}
		private function battleClicked():void // basic battle function via buttons
		{
			//TODO: Make damage not hurt card on spawning in new card.
			// Maybe something simple can fit in somewhere
			battlegen = FlxMath.rand(1, 50);
			if (battlegen == 5,10,15,20,25,30,35,40,45,50 && _fcard1.exists == true)
			{
			     _fcard1.hurt(FlxMath.rand(1, 15));
		         trace(_wcard1.health);
		         trace(_fcard1.health);
			}
			if (battlegen == 6,12,18,21,27,31,37,41,47,49 && _wcard1.exists == true)
			{
				_wcard1.hurt(FlxMath.rand(1, 25));
				trace(_wcard1.health);
				trace(_fcard1.health);
			}
		}
	}

}
