package  
{
	import starling.utils.AssetManager;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jizo
	 */
	public class Assets
	{
		private static var instance:Assets = null;
		private static var assetManager:AssetManager;
		
		[Embed(source = "../assets/tetris_main_001.xml", mimeType = "application/octet-stream")]
		private static const AtlasXML:Class;
		
		[Embed(source = "../assets/tetris_main_001.png")]
		private static const AtlasTexture:Class;
		
		private static var texture:Texture;
		private static var xml:XML;
		private static var atlas:TextureAtlas;
		
		public function Assets() 
		{
			assetManager = new AssetManager();
			loadGraphics();
		}
		
		public static function init():void
		{
			if (instance == null)
			{
				instance = new Assets();
			}
		}
		
		private static function loadGraphics():void
		{
			texture = Texture.fromBitmap(new AtlasTexture());
			xml = XML(new AtlasXML());
			atlas = new TextureAtlas(texture, xml);
			assetManager.addTextureAtlas("tetris", atlas);
		}
		
		public static function getTexture(string:String):Texture
		{
			return assetManager.getTexture(string);
		}
		
		public static function getTextureByType(type:uint):Texture
		{
			var name:String;
			switch(type)
			{
				case 42:
					name = "game_object_tile_stencil";
					break;
				case 0:
					name = "game_object_tile_green_dark";
					break;
				case 1:
					name = "game_object_tile_green_light"
					break;
				case 2:
					name = "game_object_tile_magenta"
					break;
				case 3:
					name = "game_object_tile_orange"
					break;
				case 4:
					name = "game_object_tile_red"
					break;
				case 5:
					name = "game_object_tile_violet"
					break;
				case 6:
					name = "game_object_tile_yellow"
					break;
			}
			return assetManager.getTexture(name);
		}
		
	}

}