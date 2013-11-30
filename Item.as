package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Heppell08
	 * Base class for all items for inventory
	 */
	public class Item extends FlxSprite
	{
		public var image:Class;
		public var name:String;
	
		
		public function Item(name:String,image:Class) 
		{
			this.image = image;
			this.name = name;
						
			loadGraphic(this.image, false, false);
			
		}
	}

}