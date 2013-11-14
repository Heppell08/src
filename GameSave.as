package
{
import org.flixel.*;
 
public class SaveGame
{
public var _save:FlxSave;
public var _loaded:Boolean = false;

public function load():void
{
_save = new FlxSave();
_loaded = _save.bind("LocalSharedObjectName");

if (_save.data.exampleInt == null) createNewSave(); 
}

public function createNewSave():void
{
_save.data.exampleInt = 0;
_save.data.exampleBoolean = true;
_save.data.exampleArray = [];

_save.flush();
}
}
}