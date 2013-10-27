package  
{
	import flash.accessibility.ISimpleTextSelection;
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
	 * This is going to take a 
	 * long time to code. I got a small
	 * mini tut screen added for now and i'm
	 * going to look up some code ideas for a
	 * class that holds the info of cards existing
	 * so it doesnt mess up my playstate.
	 * Maybe make a class to extend playstate
	 * and use that as the final version for the main
	 * gameplay. just an idea ATM!
	 */
	public class Playstate extends FlxState
	{
		// main game important ones here
		private var backdrop:FlxSprite;
		private var displayhud:FlxSprite;
		private var optionstxt:FlxText;
		private var blackopts:FlxSprite;
		private var tutotext:FlxText;
		
		// buttons added below only
		private var button01:FlxButtonPlus;
		private var button02:FlxButtonPlus; // make a few just for when i add
		private var button03:FlxButtonPlus; // 3 for now, maybe more later
		private var button04:FlxButtonPlus; // battle button
		private var button05:FlxButtonPlus; // tutorial button
			
		// add cards below
		public static var _card1:Card; // just so i can add to the playstate later
		public static var _fcard1:FireCard1; // might be an easier way to add cards but unsure.
		public static var _wcard1:WaterCard1;
		
		// interactive below
		public var stat:Number = 0;
		public var xp:Number = 0
		public var level:Number = 1;
		public var buttonadd:Number = 0;
		
		// this is major important number
		private var cardnumber:Number = 0;
		private var cnumber:FlxText;
		
		// onscreen texts below
		private var statstxt:FlxText;
		private var xptext:FlxText;
		private var leveltext:FlxText;
		private var cardgentxt:FlxText;
		private var battlegentext:FlxText;
		
		// test here
		private var cardhealth:FlxText;
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
			button01 = new FlxButtonPlus(110, 210, button01Clicked, null,"XP Gain"); // unused ATM
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
			button04.visible = false;
			add(button04);
			
			// declare cards below
			_card1 = new Card(150, 150); // use this method for the X,Y position
			_fcard1 = new FireCard1(80, 80);
			_wcard1 = new WaterCard1(90, 90);
			
			// add cards here
			add(_card1);
			_card1.exists = false;
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
						
			//tracing card generator number on press here
			cardgentxt = new FlxText(0, 40, FlxG.width);
			cardgentxt.color = 0x000000;
			add(cardgentxt);
			
			// random battle generator damage number
			battlegentext = new FlxText(40, 0, FlxG.width);
			battlegentext.color = 0x000000;
			add(battlegentext);
			
			cnumber = new FlxText(0, 60, FlxG.width);
			cnumber.color = 0x000000;
			add(cnumber);
			
			//keep text below above the black box
			blackopts = new FlxSprite;
			blackopts.loadGraphic(Asset.blackoptions, false, false, 320, 240);
			blackopts.visible = true;
			add(blackopts);
			
			// only this button here so its ontop of blackbox
			// tutorial button to start game
			button05 = new FlxButtonPlus(110, 165, tutorialClicked, null, "Tutorial");
			button05.exists = true;
			add(button05);
			
			//keep options at bottom so ontop
			optionstxt = new FlxText(0, 0, 320, 
			"Collect cards and battle! \n" +
			"Press Q to close this menu \n" + 
			"Controls: \n " +
		    "Mouse controlled mainly \n" +
		    "Green card - Common \n" +
		    "Yellow card - Good \n" +
		    "Orange Card - Rare \n" +
		    "Purple card - Legendary \n" +
		    "Yellow Card - Unique \n" +
		    "Black Card - ???? \n" +
		    "Made by Heppell08");
		 	optionstxt.alignment = "center";
			optionstxt.size = 16;
			optionstxt.color = 0x0000FF;
			optionstxt.visible = false;
			add(optionstxt);
			
			// tutorial text here
			tutotext = new FlxText(10, 0, 300,
			"Press O for options \n" +
			"Cards are randomly generated to spawn \n" +
			"The rarity of cards can be seen on card page \n" +
			"Battle, earn XP and collect all the cards!");
			tutotext.alignment = "center";
			tutotext.color = 0x0000A0;
			tutotext.size = 16;
			add(tutotext);
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
			if (_fcard1.health < 1 ||
			    _wcard1.health < 1 ||
			    _card1.health < 1)
			{
				button04.visible = false;
				button03.exists = true;
				cardhealth.exists = false;
				_fcard1.exists = false;
				_wcard1.exists = false;
				_fcard1.health = FireCard1.HEALTH;
				_wcard1.health = WaterCard1.HEALTH;
				_card1.health = Card.HEALTH;
				battlegen = FlxMath.rand(1, 5); // keep it safe and fair
				
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//
				cardnumber = 0; //*VERY IMPORTANT* DONT TOUCH THIS AT ALL!!!!!!!!
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//
			}
			
			// update 
			super.update();
			
			// add the numbers below for real time show
			battlegentext.text = 'BGen:' + battlegen.toString();
			statstxt.text = 'Stats:' + stat.toString();
			xptext.text = 'Exp:' + xp.toString();
			leveltext.text = 'Level:' + level.toString();
			cardgentxt.text = 'CGen:' + cardgen.toString(); // Random gen card spawn
			cnumber.text = 'Card No:' +cardnumber.toString(); // test for card numbers
			
			//fuck yeah, Below code is awesome
			// need to add as i go into this code
			if (cardnumber == 2) 
			{
				cardhealth.text = 'Card HP:' + _wcard1.health.toString();
			}
			if (cardnumber == 1)
			{
				cardhealth.text = 'Card HP:' +_fcard1.health.toString();
			}
			if (_card1.exists == true)
			{
				cardhealth.text = 'Card HP:' +_card1.health.toString();
			}
			
			// options hide/show below
			if (tutotext.exists == true && FlxG.keys.justPressed("O"))
			{
				return;
			}
			if (FlxG.keys.justPressed("O"))
			{
				FlxG.mouse.hide();
				blackopts.visible = true;
				optionstxt.visible = true;
			}
			if (FlxG.keys.justPressed("Q"))
			{
				FlxG.mouse.show();
				blackopts.visible = false;
				optionstxt.visible = false;
			}
			if(button05.exists == true)
			{
				// these all need hidden
				button01.visible = 
				button02.visible = 
				button03.visible =
				button04.visible = false;
			}
			// below is all the cards in update given numbers 
			if (_fcard1.exists == true)
			{
				cardnumber = 1;
			}
			if (_wcard1.exists == true)
			{
				cardnumber = 2;
			}
		}
		
		private function button01Clicked():void // xp gain button
		{
			// Re-spawns the same card back in (recycling the good way)
			if (_fcard1.health < 1 || 
			    _wcard1.health < 1 || 
				_card1.health <1)
			{
				button03.exists = true; // reset random card button
			}
			if (_fcard1.exists == false || _wcard1.exists == false || _wcard1.exists == false)
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
			if(cardnumber==1) /*(_fcard1.exists == true && _wcard1.exists == false && _card1.exists == false)*/
			{
				cardgen = FlxMath.rand(1, 20, [12]); // safety but ive coded around this issue
			}
			if(cardnumber==2) /*(_fcard1.exists == false && _wcard1.exists == true && _card1.exists == false)*/
			{
				cardgen = FlxMath.rand(1, 20, [8]);
			}
			/*if (_card1.exists == true && _wcard1.exists == false && _fcard1.exists == false)
			{
				cardgen = FlxMath.rand(1, 20, [10]);
			}*/
			if (cardgen == 12) // can be changed to number between 1,20
			{
			    add(cardhealth); 
		    	_fcard1.exists = true;
		    	cardhealth.exists = true;
			//	button03.exists = false;
		    	button04.visible = true;
				cardgen = 1; // necessary for debug of math
			}
			if (cardgen == 8) // new card added
			{
				add(cardhealth);
				_wcard1.exists = true;
				cardhealth.exists = true;
				button03.exists = false;
				button04.visible = true;
				cardgen = 1; // for fairness same in here
			}
		/*	if (cardgen == 10)
			{
				add(cardhealth);
				_card1.exists = true;
				cardhealth.exists = true;
				button03.exists = false;
				button04.visible = true;
				cardgen = 1;
			}*/
			else 
			{
				cardgen = FlxMath.rand(1, 20); // super important
			}
			
		}
		
		private function battleClicked():void // basic battle function via buttons
		{
			// So button vidible is best approach and not glitching or
			// firing the function when it becomes an existance ingame.
			// winning and more code to come :D
			
			battlegen = FlxMath.rand(1, 50); // random battle number generator
			
			if (battlegen == 5,10,15,20,25,30,35,40,45,50 && _fcard1.exists == true) // numbers and card existance
			{
			     _fcard1.hurt(FlxMath.rand(1, 15));
			}
			if (battlegen == 6,12,18,21,27,31,37,41,47,49 && _wcard1.exists == true)
			{
				_wcard1.hurt(FlxMath.rand(1, 25));
			}
			if (battlegen == 2, 6, 11, 17, 29, 37 && _card1.exists == true)
			{
				_card1.hurt(FlxMath.rand(1, 10));
			}
		}
		private function tutorialClicked():void
		{
			FlxG.flash(0x000000, 1, tutorialOver);
			FlxG.shake(.005, 2);
		}
		private function tutorialOver():void
		{
			FlxG.flash(0x000000, 1);
			blackopts.visible = false;
			tutotext.visible = false;
			button05.exists = false;
			
		    button01.visible = 
	        button02.visible = 
			button03.visible =
			button04.visible = true;
		}
	}

}
