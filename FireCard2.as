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
	 // Asset image added. Need hurt functions and animations in here.
	 
	public class FireCard2 extends Card
	{
		protected static const FIRE_ATTACK:int = 10; // 10 attack temp
		protected static const GREEN_STRONG:int = 5; // strong against
		protected static const WATER_EFFECT:int = 15; // weakness
		public static const HEALTH:int = 80; // health in general
		
		
		public function FireCard2(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(Asset.firecard2);
			health = HEALTH;
			
		}
		
	}

}
