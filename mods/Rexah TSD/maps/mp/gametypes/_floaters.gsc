doThreads()
{
self thread DoFloaters();
}


DoFloaters()
{
	if(getDvar("floaters") == "1")
	{
		
		
		level waittill("game_ended");
		foreach(player in level.players)
		self endon("disconnect");
		self.Float = spawn("script_model",self.origin);
		self playerLinkTo(self.Float);
		wait 0.1;
		self freezeControls(true);
		for(;;)
		{
		self.Down = self.origin - (0,0,0.5);
			self.Float moveTo(self.Down, 0.01);
			wait 0.01;
		}
	
	
	
	}
	
	else
	{
	
	}
	

}	
	
	