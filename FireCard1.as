package  
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Heppell08
	 * Only a test here
	 * 
	 */
	// Needs an image to test bed in asset!
	 
	public class FireCard1 extends Card
	{
		protected static const FIRE_ATTACK:int = 10; // 10 attack temp
		protected static const GREEN_STRONG:int = 5; // strong againt
		protected static const WATER_EFFECT:int = 15; // weakness
		protected static const HEALTH:int = 50; // health in general
		
		
		public function FireCard1(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(Asset.fcard1);
			health = HEALTH;
			
		}
		
	}

}