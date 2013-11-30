package  
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * ...
	 * @author Heppell08
	 * Informations here
	 * My next labourious task is to create the percentages
	 * of gaining a card from the button. Also need some
	 * sort of enemy to battle against and a reverse background
	 * code to give the "Enemy" a card as the player gets cards but
	 * in an even yet challenging way. Need to assign battlements and 
	 * a correct battle structure. At the minute the cards are killed
	 * because im telling them to die by pressing a button. I want it 
	 * so that if you are level X:amount then you have so many "Clicks"
	 * to kill the enemy and vice versa. The xp and level system is in place
	 * and ready to be used once he battelments are coded correctly and everything
	 * is saving, loading and hitting correctly. 
	 */
	public class Playstate extends FlxState
	{
		// main game important ones here
		private var backdrop:FlxSprite;
		private var background:FlxSprite;
		private var displayhud:FlxSprite;
		private var optionstxt:FlxText;
		private var blackopts:FlxSprite;
		private var savebox:FlxSprite;
		private var tutotext:FlxText;
		private var invBG:FlxSprite;
		
		// inventory here **testing it**
		private var Inv:FlxGroup = new FlxGroup();
		private var inventory:Array = new Array();
		private var items:Array = new Array();
		
		// buttons added below only
		private var button01:FlxButtonPlus;
		private var button02:FlxButtonPlus; // make a few just for when i add
		private var button03:FlxButtonPlus; // 3 for now, maybe more later
		private var button04:FlxButtonPlus; // battle button
		private var button05:FlxButtonPlus; // tutorial button
		
		//save button and text below
		public static var savebutton:FlxButtonPlus;
		public static var savetext:FlxText;
				
		// interactive below
		public var stat:Number = 0;
		public var xp:Number = 0
		public var level:Number = 1;
		public var buttonadd:Number = 0;
		
		// this is major important number
		public static var cardnumber:Number = 0;
		private var cnumber:FlxText; // unused but needed later
		
		// seperate card numbers per stat of card below
		public static var firenumber:Number = 0; // firecards assigned in here
		public static var waternumber:Number = 0; // watercards assigned in here
		public static var earthnumber:Number = 0; // earth cards assigned in here
		public static var windnumber:Number = 0; // wind cards assigned in here
		public static var powerupnumber:Number = 0; // power ups assigned in here
		
		// special legend number below
		public static var legendsnumber:Number = 0; //LEGENDARY CARDS HERE
		
		// onscreen texts below
		private var statstxt:FlxText;
		private var xptext:FlxText;
		private var leveltext:FlxText;
		private var battlegentext:FlxText;
		private var nocardtext:FlxText;
		
		// test here
		private var cardhealth:FlxText;
		private var battlegen:int = (FlxMath.rand(1, 50));
		
		override public function create():void 
		{			
			FlxG.mouse.show(Asset.mouse, 3);// will change sprite in parentheses
			
			//add backdrop first so its at the back
			/*backdrop = new FlxSprite;
			backdrop.loadGraphic(Asset.backdrop01, false, false, 400, 300);
			backdrop.offset.x = backdrop.offset.y = 30;
			backdrop.antialiasing = true;
			add(backdrop);*/
			
			background = new FlxSprite;
			background.loadGraphic(Asset.mainBG, false, false, 320, 240);
			add(background);
			
			// Lower HUD here			
			/*displayhud = new FlxSprite;
			displayhud.loadGraphic(Asset.disphud, false, false, 320, 80);
			displayhud.offset.x = 0;
			displayhud.offset.y = -200;
			displayhud.antialiasing = true;
			add(displayhud);*/
			
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
			
            // save button below
			savebutton = new FlxButtonPlus(10, 210, Registry.SaveData, null, "Save Game");
			savebutton.visible = false;
						
			// card health below
			cardhealth = new FlxText(0, 30, FlxG.width);
			cardhealth.color = 0x00FFFF;
			
			// declare cards below
			Registry._card1 = new Card(150, 150); // use this method for the X,Y position
			
			// declare fire cards below
			Registry._fcard1 = new FireCard1(80, 80);
			Registry._fcard2 = new FireCard2(90, 90);
			Registry._fcard3 = new FireCard3(100, 100);
			
			// declare water cards below
			Registry._wcard1 = new WaterCard1(90, 90);
			Registry._wcard2 = new WaterCard2(90, 100);
			
			// add cards here
			// earth cards below here
			add(Registry._card1);
			Registry._card1.exists = false;
			
			add(Registry._fcard1);
			add(Registry._fcard2);
			add(Registry._fcard3);
			add(Registry._wcard1);
			add(Registry._wcard2);
			Registry._fcard1.exists =
			Registry._fcard2.exists = 
			Registry._fcard3.exists =
			Registry._wcard1.exists =
			Registry._wcard2.exists = false;
			
			
			// water cards below here
			add(Registry._wcard1);
			if (waternumber == 0)
			{
			Registry._wcard1.exists =
			Registry._wcard2.exists = false;
			}
			if (waternumber == 1)
			{
				Registry._wcard1.exists = true;
				add(cardhealth);
				cardhealth.exists = true;
				addInv("Watercard1");
			}
			if (waternumber == 2)
			{
				Registry._wcard2.exists = true;
				add(cardhealth);
				cardhealth.exists = true;
				addInv("Watercard2");
			}
			
			// BREAK++++++ //	
			// firecards below here
			if (firenumber == 0)
			{
			Registry._fcard1.exists = false;
			Registry._fcard2.exists = false;
			}
			if (firenumber == 1)
			{
				Registry._fcard1.exists = true;
				add(cardhealth);
				cardhealth.exists = true;
				addInv("Firecard1");
			}
			if (firenumber == 2)
			{
				Registry._fcard2.exists = true;
				add(cardhealth);
				cardhealth.exists = true;
				addInv("Firecard2");
			}
			if (firenumber == 3)
			{
				Registry._fcard3.exists = true;
				add(cardhealth);
				cardhealth.exists = true;
				addInv("Firecard3");
			}
			// BREAK+++++++ //
						
			//stats below
			statstxt = new FlxText(0, 10, FlxG.width);
			statstxt.color = 0x00FFFF;
			add(statstxt);
			
			// xp below
			xptext = new FlxText(0, 20, FlxG.width);
			xptext.color = 0x00FFFF;
			add(xptext);
			
			//level below
			leveltext = new FlxText(0, 0, FlxG.width);
			leveltext.color = 0x00FFFF;
			add(leveltext);	
			
			// random battle generator damage number
			battlegentext = new FlxText(40, 0, FlxG.width);
			battlegentext.color = 0x00FFFF;
			add(battlegentext);
			
			cnumber = new FlxText(0, 60, FlxG.width);
			cnumber.color = 0x00FFFF;
			add(cnumber);
			
			// fail chance roll here
			nocardtext = new FlxText(100, 100, FlxG.width,"Card Failed \n" + "Try again!");
			nocardtext.color = 0xFF0000;
			nocardtext.size = 14;
			add(nocardtext);
			nocardtext.visible = false;
			
			//keep text below above the black box
			blackopts = new FlxSprite;
			blackopts.loadGraphic(Asset.blackoptions, false, false, 320, 240);
			blackopts.visible = true;
			add(blackopts);
			
			//save box here
			savebox = new FlxSprite;
			savebox.loadGraphic(Asset.savebox);
			savebox.visible = false;
			add(savebox);
			
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
			
			// save text for onscreen acknowledgement of game saved
			savetext = new FlxText(70, 130, FlxG.width, "Game Save Success");
			savetext.visible = false;
			savetext.size = 14;
			savetext.color = 0xFF0000;
			add(savetext);
			
			add(savebutton);
			
			// inv group added here
			// add to this group BELOW this add();
			add(Inv);
						
			// changing to a full screen HUD look..
			invBG = new FlxSprite(0, 0);
			invBG.loadGraphic(Asset.inventory, false, false, 320, 240);
			invBG.alpha = 0.75;
			invBG.visible = false;
			add(invBG);
			
			Inv.visible = false;
			//water cards
			items.push(new Item("Watercard1", Asset.wcard1));
			items.push(new Item("Watercard2", Asset.wcard2));
			//firecards
			items.push(new Item("Firecard1", Asset.firecard1));
			items.push(new Item("Firecard2", Asset.firecard2));
			items.push(new Item("Firecard3", Asset.firecard3));
			// green cards
			items.push(new Item("Greencard1", Asset.card1));
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
			Registry._card1.enableMouseDrag();
			
			// XP and Level up maths here
			if (xp > 5 + (level * level))
			{
                 level ++;
			     xp = 0;
            }
			
			// background of inventory buttons here
			if (FlxG.keys.justPressed("X"))
			{
				updateInv();
				Inv.visible = true;
				invBG.visible = true
			}
			if (FlxG.keys.justReleased("X"))
			{
				Inv.visible = false;
				invBG.visible = false;
			}
			
			// update card numbers in here for less in playstate code
			if (Registry._fcard1.health < 0)
			{
				firenumber = 0;
			}
			if (Registry._fcard2.health < 0)
			{
				firenumber = 0;
			}
			if (Registry._fcard3.health < 0)
			{
				firenumber = 0;
			}
			if (Registry._wcard1.health < 0)
			{
				waternumber = 0;
			}
			if (Registry._wcard2.health < 0)
			{
				waternumber = 0;
			}
			
			//works perfectly *DONT DISTURB THIS*
		    if 
			    (Registry._fcard1.health < 1 ||
			     Registry._fcard2.health < 1 ||
				 Registry._fcard3.health < 1 ||
			     Registry._wcard1.health < 1 ||
				 Registry._wcard2.health < 1 ||
			     Registry._card1.health  < 1)
			{
				button04.visible = false;
				button03.exists = true;
				cardhealth.exists = false;
				Registry._fcard1.exists = false;
				Registry._fcard2.exists = false;
				Registry._fcard3.exists = false;
				Registry._wcard1.exists = false;
				Registry._wcard2.exists = false;
				Registry._fcard1.health = FireCard1.HEALTH;
				Registry._fcard2.health = FireCard2.HEALTH;
				Registry._fcard3.health = FireCard3.HEALTH;
				Registry._wcard1.health = WaterCard1.HEALTH;
				Registry._wcard2.health = WaterCard2.HEALTH;
				Registry._card1.health = Card.HEALTH;
				battlegen = 1; // keep it safe and fair
			}
			
			// update 
			super.update();
			
			// below is all the cards in update given numbers 
			if (firenumber == 1)
			{
				Registry._fcard1.exists = true; // made 1 for first card in fire deck
			}
			if (firenumber == 2)
			{
				Registry._fcard2.exists = true;
			}
			if (firenumber == 3)
			{
				Registry._fcard3.exists = true;
			}
			if (waternumber == 1)
			{
				Registry._wcard1.exists = true; // same applied to water as fire for card numbers
			}
			if (waternumber == 2)
			{
				Registry._wcard2.exists = true;
			}
						
			// add the numbers below for real time show
			battlegentext.text = 'BGen:' + battlegen.toString();
			statstxt.text = 'Stats:' + stat.toString();
			xptext.text = 'Exp:' + xp.toString();
			leveltext.text = 'Level:' + level.toString();
			cnumber.text = 'Card No:' +cardnumber.toString(); // test for card numbers
			
			// Water cards HP below
			if (waternumber == 1) 
			{
				cardhealth.text = 'Card HP:' + Registry._wcard1.health.toString();
			}
			if (waternumber == 2)
			{
				cardhealth.text = 'Card HP:' + Registry._wcard2.health.toString();
			}
			
			// Fire cards HP below
			if (firenumber == 1)
			{
				cardhealth.text = 'Card HP:' + Registry._fcard1.health.toString();
			}
			if (firenumber == 2)
			{
				cardhealth.text = 'Card HP:' + Registry._fcard2.health.toString();
			}
			if (firenumber == 3)
			{
				cardhealth.text = 'Card HP:' + Registry._fcard3.health.toString();
			}
			
			// Green cards HP below
			if (Registry._card1.exists == true) // havent set a number for this yet
			{
				cardhealth.text = 'Card HP:' + Registry._card1.health.toString();
			}
			
			// options hide/show below
			if (tutotext.exists == true && FlxG.keys.justPressed("O"))
			{
				return;
			}
			if (FlxG.keys.justPressed("S"))
			{
				savebox.visible = true;
				savebutton.visible = true;
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
				if (savebox.visible == true)
				{
					savebox.visible = false;
				}
				if (savebutton.visible == true)
				{
					savebutton.visible = false;
				}
				if (savetext.visible = true)
				{
					savetext.visible = false;
				}
			}
			if(button05.exists == true)
			{
				// these all need hidden
				button01.visible = 
				button02.visible = 
				button03.visible =
				button04.visible = false;
			}
		}
		
		private function button01Clicked():void // xp gain button
		{
			// All debug infos below
			if (Registry.gameload == true)
			{
			trace(Registry.Save.data.FCARDS);
			trace(Registry.Save.data.WCARDS);
			}
			else 
			{
			trace("Game not Loaded")	
			trace("Water:" +waternumber.toString())
			trace("FireCard:" +firenumber.toString())
			}
		}
		
		private function button02Clicked():void
		{
			FlxG.switchState(new Options);
		}
		
		private function button03Clicked():void // Alot to add here... #sadface haha
		{
			if (FlxMath.chanceRoll(33)) 
			{
				firenumber = FlxMath.rand(1, 3);
				if (firenumber == 1)
			{
				add(cardhealth); 
		    	Registry._fcard1.exists = true;
				addInv("Firecard1");
				firenumber = 1;
		    	cardhealth.exists = true;
				button03.exists = false;
		    	button04.visible = true;
				if (nocardtext.visible == true)
				{
					nocardtext.visible = false;
				}
			}
			if (firenumber==2)
			{
				add(cardhealth);
				addInv("Firecard2");
				firenumber = 2;
				Registry._fcard2.exists = true;
				cardhealth.exists = true;
				button03.exists = false;
		    	button04.visible = true;
				if (nocardtext.visible == true)
				{
					nocardtext.visible = false;
				}
			}
			if (firenumber==3)
			{
				add(cardhealth);
				addInv("Firecard3");
				firenumber = 3;
				Registry._fcard3.exists = true;
				cardhealth.exists = true;
				button03.exists = false;
				button04.visible = true;
				if (nocardtext.visible == true)
				{
					nocardtext.visible = false;
				}
			}
			}
			else if (FlxMath.chanceRoll(33))
			{
				waternumber = FlxMath.rand(1, 2);
				if (waternumber == 1)
				{
					add(cardhealth);
				    addInv("Watercard1");
			    	waternumber = 1;
			    	Registry._wcard1.exists = true;
			    	cardhealth.exists = true;
			    	button03.exists = false;
			    	button04.visible = true;
					if (nocardtext.visible == true)
			    	{
					nocardtext.visible = false;
			    	}
			 	}
				if (waternumber == 2)
				{
					add(cardhealth);
					addInv("Watercard2");
					waternumber = 2;
					Registry._wcard2.exists = true;
					cardhealth.exists =
					button04.visible = true;
					button03.exists = false;
					if (nocardtext.visible == true)
			    	{
					nocardtext.visible = false;
			    	}
				}
			}
			// Quite coded but alot more needed in!
			else if (FlxMath.chanceRoll(66))
			{
				nocardtext.visible = true;
			}
		}
		
		private function battleClicked():void // basic battle function via buttons
		{
			// So button visible is best approach and not glitching or
			// firing the function when it becomes an existance ingame.
			// winning and more code to come :D
			
			battlegen = FlxMath.rand(1, 50); // random battle number generator
			
			if (battlegen == 5,10,15,20,25,30,35,40,45,50 && Registry._fcard1.exists == true) // numbers and card existance
			{
			     Registry._fcard1.hurt(FlxMath.rand(1, 15));
			}
		    if (battlegen == 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 && Registry._fcard2.exists == true)
			{
				Registry._fcard2.hurt(FlxMath.rand(5, 20));
			}
			if (battlegen == 6,12,18,21,27,31,37,41,47,49 && Registry._wcard1.exists == true)
			{
				Registry._wcard1.hurt(FlxMath.rand(1, 25));
			}
			if (battlegen == 2, 6, 11, 17, 29, 37 && Registry._card1.exists == true)
			{
				Registry._card1.hurt(FlxMath.rand(1, 10));
			}
			if (battlegen == 1, 11, 2, 22, 3, 33 && Registry._wcard2.exists == true)
			{
				Registry._wcard2.hurt(FlxMath.rand(2, 30));
			}
			if (battlegen == 2, 3, 4, 11, 19, 33 && Registry._fcard3.exists == true)
			{
				Registry._fcard3.hurt(FlxMath.rand(10, 35));
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
		private function updateInv():void
		{
			for (var i:int = 0; i < inventory.length; i++)
			{
				inventory[i].x = 55 * i;
				inventory[i].y = 82;
			}
			
		}
		public function addInv(name:String):void
        {
	        var newItem:Item;
			
		    for (var i:int = 0; i < items.length; i++)
	        {
		        if (items[i].name == name)
	            {
	        	newItem = new Item(items[i].name, items[i].image);
	            }
            }
			
            newItem.scrollFactor.x = 0;
            newItem.scrollFactor.y = 0;
	
        	inventory.push(newItem);
		  
         	Inv.add(newItem);
		  
       	    updateInv();
        }
        private function remInv(input:String):void
        {
        	for (var i:int = 0; i < inventory.length; i++ )
 	        {
	             if (inventory[i].name == input.split(",")[0])
	            {
	         	 Inv.remove(inventory[i], true);
	        	 inventory.splice(i, 1);
			  
	        	 if (input.split(",")[1] == "true")
	         	   i--;
	         	 else
	        	   break;
	            }
            }
			
 	        updateInv();
        }
		public static function LoadData():void
        {
           Registry.Save = new FlxSave();
           Registry.gameload = Registry.Save.bind("Cards");
		   
		        firenumber = Registry.Save.data.FCARDS;
				waternumber = Registry.Save.data.WCARDS;
				windnumber = Registry.Save.data.WICARDS;
				earthnumber = Registry.Save.data.ECARDS;
				legendsnumber = Registry.Save.data.LCARDS;
		   
              if (Registry.gameload)
              {
				  StartScreen.loadtext.visible = true;
				  trace(firenumber); // stuck at 0 on loading
				  trace(waternumber); // same as above
                  trace("Game Loaded");
              }
        }
   }

}
