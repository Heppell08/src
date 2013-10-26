package  
{
	/**
	 * ...
	 * @author Heppell08
	 */
	public class Asset 
	{
		// all imports here.
		[Embed(source = "../Art/backdrop1.PNG")]public static const backdrop01:Class;
		[Embed(source = "../Art/displayhud.PNG")]public static const disphud:Class;
		[Embed(source = "../Art/swordmouse.PNG")]public static const mouse:Class;
		
		//cards imported below
		[Embed(source = "../Art/card1.PNG")]public static const card1:Class;
		[Embed(source = "../Art/firecard1.PNG")]public static const fcard1:Class;
		[Embed(source = "../Art/watercard1.PNG")]public static const wcard1:Class;
		
		public function Asset() 
		{
		}
		
	}

}