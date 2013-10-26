package  
{
	/**
	 * ...
	 * @author Heppell08
	 */
	public class WaterCard1 extends Card
	{
		protected static const FIRE_ATTACK:int = 2; // only does 2 dmg
		protected static const GREEN_STRONG:int = 5; // not effective
		protected static const WATER_EFFECT:int = 10; // standard 10 attack
		public static const HEALTH:int = 90; // health in general
		
		public function WaterCard1(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(Asset.wcard1);
			health = HEALTH;
			
		}
		
	}

}