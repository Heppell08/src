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
		
		// water below
		public static var _wcard1:WaterCard1;
		
		//Green below
		public static var _card1:Card;
		
	override public function create():void
		{
		/*	Save = new FlxSave();
			
			Save.bind("Cards");
			Save.flush();*/
			
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
		   trace(waternumber); // traces numbers right
		   trace(firenumber); // traces properly
		}
		/*public static function LoadData():void
        {
           Save = new FlxSave();
           gameload = Save.bind("Cards");
		   firenumber = Save.data.FCARDS;

              if (gameload)
              {
				  trace(firenumber); // stuck at 0 on loading
				  trace(waternumber); // same as above
                  trace("Game Loaded");
              }
        }*/
		public static function erase():void
		{
			// Use this for cleaning memory
			// just call Registry.erase();
		}
		
	}

}


/*
(Playstate.firenumber ||
			Playstate.waternumber ||
			Playstate.windnumber ||
			Playstate.earthnumber ||
			Playstate.legendsnumber == 1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9 || 10)
			*/