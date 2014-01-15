package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Root extends Sprite 
	{
		private static var sAssets:AssetManager;
		
		public function Root() 
		{
			// nothing to do here -- Scaffold_Mobile will call "start" immediately.
		}
		
        public function start(background:Texture, assets:AssetManager):void
        {
            // the asset manager is saved as a static variable; this allows us to easily access
            // all the assets from everywhere by simply calling "Root.assets"
            sAssets = assets;
            
            // The background is passed into this method for two reasons:
            // 
            // 1) we need it right away, otherwise we have an empty frame
            // 2) the Startup class can decide on the right image, depending on the device.
            
            addChild(new Image(background));
            
            // The AssetManager contains all the raw asset data, but has not created the textures
            // yet. This takes some time (the assets might be loaded from disk or even via the
            // network), during which we display a progress indicator. 
            
            assets.loadQueue(function onProgress(ratio:Number):void
            {                
                if (ratio == 1)
				{
					// When all the assets are loaded we finally add our content to the stage
					var scene:Scene = new Scene();
					addChild(scene);
				}
            });
        }
		
		public static function get assets():AssetManager { return sAssets; }
	}
}