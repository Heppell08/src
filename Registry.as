package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Heppell08
	 */
	public class Registry 
	{
		// cards pulled in here
		
		// fire below
		public static var _fcard1:FireCard1;
		public static var _fcard2:FireCard2;
		
		// water below
		public static var _wcard1:WaterCard1;
		
		//Green below
		public static var _card1:Card;
		
		public function Registry() 
		{
		}
		
		public static function erase():void
		{
			// Use this for cleaning memory
			// just call Registry.erase();
		}
		
	}

}