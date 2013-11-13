package  
{
	
	import org.flixel.*;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Heppell08
	 * need to read more on this
	 * stuff...
	 */
	public class GameSave 
	{
		public static const GLOBAL:int = 0;
		public static const PROFILE01:int = 1;
		public static const PROFILE02:int = 2;
		public static const PROFILE03:int = 3;
		
		public function GameSave() 
		{
		
		}
		public static function init(...args):void
		{
			FlxG.saves = new Array();
			for each (var arg:int in args)
			{
				FlxG.saves[arg] = new FlxSave();
				FlxG.saves[arg].bind("SAVE" + String(arg));
			}
		}
		public static function create(Save:int, Values:Object, Overwrite:Boolean = false):void 
		{
            for (var value:* in Values)
            if (Overwrite || FlxG.saves[FlxG.save].data[value] == undefined)
                FlxG.saves[FlxG.save].data[value] = Values[value];
                FlxG.saves[Save].flush();
        }
	}

}