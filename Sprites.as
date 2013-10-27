package  
{
	/**
	 * ...
	 * @author Heppell08
	 * 
	 * This will hold all card data. Also going to write
	 * the card data more hardcoded into the card.as files
	 * that belong to the respective card.
	 */
	public class Sprites extends Playstate
	{
		// number for cards below
		public static var spnumber:Number = 0; // use this to number each card
		
		//cards imported below here
		public static var _card1:Card; // just so i can add to the playstate later
		public static var _fcard1:FireCard1; // might be an easier way to add cards but unsure.
		public static var _wcard1:WaterCard1;
		// and so on
		
		public function Sprites()
		{
			
		}
		
	}

}