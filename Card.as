package  
{
	import org.flixel.*;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	/**
	 * ...
	 * @author Heppell08
	 * 
	 * This might be getting used as a template
	 * for the adding of the cards and extends from this
	 * to add stats and damage etc. Alot more functions need
	 * added before i get to that stage though.
	 */
	public class Card extends FlxExtendedSprite
	{
		// this is the first card created and also the template
		//that other cards extend from
		public static const HEALTH:int = 150;
				
		public function Card(X:int,Y:int):void 
		{
			super(X,Y);
			loadGraphic(Asset.card1);
			health = HEALTH;
		}
		public function create():void
		{
			this.health = 100;
		}
		
		public override function update():void
		{
			if (FlxG.mouse.pressed())
			{
				enableMouseDrag();
			}
			if (FlxG.mouse.justReleased())
			{
				disableMouseDrag();
			}
			
			super.update();
		}
		
	}

}