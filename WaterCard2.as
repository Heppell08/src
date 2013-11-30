package  
{
	/**
	 * ...
	 * @author Heppell08
	 */
	public class WaterCard2 extends Card
	{
		public static const HEALTH:int = 80;
		
		public function WaterCard2(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(Asset.wcard2);
			health = HEALTH;
		}
		
	}

}