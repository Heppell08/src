package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Heppell08
	 */
	public class Registry extends Playstate
	{
		// game saves
		public static var Save:FlxSave;
		public static var gameload:Boolean = false;
		
		// fire below
		public static var _fcard1:FireCard1;
		public static var _fcard2:FireCard2;
		public static var _fcard3:FireCard3;
		
		// water below
		public static var _wcard1:WaterCard1;
		public static var _wcard2:WaterCard2;
		
		//Green below
		public static var _card1:Card;
		
	override public function create():void
		{	
		}
		public static function SaveData():void
        {
			Save = new FlxSave();
			Save.bind("Cards");
			
			// this should save the number to load saved cards
		    Save.data.FCARDS = firenumber;
		    Save.data.WCARDS = waternumber;
		    Save.data.WICARDS = windnumber;
		    Save.data.ECARDS = earthnumber;
		    Save.data.LCARDS = legendsnumber;
		
	        Save.flush();
		   trace("Pre:" + Playstate.waternumber.toString());
		   
		        Playstate.cardnumber = 
				Playstate.firenumber = 
				Playstate.waternumber =
				Playstate.windnumber =  
				Playstate.powerupnumber =
				Playstate.earthnumber = 
				Playstate.legendsnumber = 0;
				
		   trace("After:" + Playstate.waternumber.toString()); // traces numbers right
		   Playstate.savetext.visible = true;
		   Playstate.savebutton.visible = false;
		}
		
		override public function update():void
		{
			// update card numbers in here for less in playstate code
			if (_fcard1.health < 0)
			{
				Playstate.firenumber = 0;
			}
			if (_fcard2.health < 0)
			{
				Playstate.firenumber = 0;
			}
			if (_fcard3.health < 0)
			{
				Playstate.firenumber = 0;
			}
			if (_wcard1.health < 0)
			{
				Playstate.waternumber = 0;
			}
			if (_wcard2.health < 0)
			{
				Playstate.waternumber = 0;
			}
		}
		public static function erase():void
		{
			// Use this for cleaning memory
			// just call Registry.erase();
		}
		
	}

}