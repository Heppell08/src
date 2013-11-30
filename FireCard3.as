package  
{
	/**
	 * ...
	 * @author Heppell08
	 */
	public class FireCard3 extends Card
	{
		public static const HEALTH:int = 120;
		
		public function FireCard3(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(Asset.firecard3);
			health = HEALTH;
		}
		
	}

}