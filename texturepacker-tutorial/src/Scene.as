package  
{
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Scene extends Sprite 
	{		
		private var guy:MovieClip;
		private var startButton:Button;
		private var stopButton:Button;
		
		public function Scene() 
		{
			var background:Image = new Image(Root.assets.getTexture("background"));
			addChild(background);
			
			guy = new MovieClip(Root.assets.getTextures("walking_guy"), 12);
			guy.x = (Constants.STAGE_WIDTH - guy.width)/2;
			guy.y = 220;
			addChild(guy);

			Starling.juggler.add(guy);
			guy.stop();
			
			startButton = new Button(Root.assets.getTexture("start_button"));
			startButton.name = "start";
			startButton.x = (Constants.STAGE_WIDTH - startButton.width)/2;
			startButton.y = 400;			
			addChild(startButton);
			
			stopButton = new Button(Root.assets.getTexture("stop_button"));
			stopButton.name = "stop";
			stopButton.x = (Constants.STAGE_WIDTH - stopButton.width)/2;
			stopButton.y = 400;
			stopButton.visible = false;
			addChild(stopButton);
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			
			/**
			Starling.juggler.tween(guy, 3, {
				repeatCount: 0,
				reverse: true,
				x: Constants.STAGE_WIDTH - guy.width
			});	
			*/
		}
		private function onButtonTriggered(event:Event):void 
		{
            			var button:Button = event.target as Button;
			
			if (button.name == "start")
			{
				startButton.visible = false;
				stopButton.visible = true;
				guy.play();	
			}
			else if (button.name == "stop")
			{
				startButton.visible = true;
				stopButton.visible = false;
				guy.stop();	
			}
		}
	}
}