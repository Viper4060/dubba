#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_cleanScript;

// Thanks to Colourz for providing these codes, I modified slightly.
// As you can see I cut them down and made them into my own threads.

doThreads()
{
	self thread doUFO();
	self thread doSaveLocation();
	self thread doLoadLocation();
}

doUFO()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "gostand", "+gostand" );
		self waittill( "gostand" );

		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {
			        maps\mp\gametypes\_spectating::setSpectatePermissions();
	
				if (self.ufo == false) {
	
					self.ufo = true;
	        		        self allowSpectateTeam( "freelook", true );
			                self.sessionstate = "spectator";
					self iPrintLn( "^7UFO Mode: ^0On" );
	
				} else if (self.ufo == true) {
	
					self.ufo = false;
			                self allowSpectateTeam( "freelook", false );
			                self.sessionstate = "playing";
					self iPrintLn( "^7UFO Mode: ^0Off" );
	
				}
				
				self thread menuClose();
			}
		}
	}
}

doSaveLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "melee", "+melee" );
		self waittill( "melee" );

		if (self.menuOpen == 1) {

			if (self.menuPos == 1) {

				self iPrintLn( "^7Location: ^0Saved" );
				self.pers["loc"] = true;

				self.pers["savePos"] = self.origin;
				self.pers["saveAng"] = self.angles;

			}
		}
	}
}

doLoadLocation()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );

		if (self.menuOpen == 1) {

			if (self.menuPos == 1) {

				self iPrintLn( "^7Location: ^0Loaded" );
				if (self.pers["loc"] == true) {

					self setOrigin( self.pers["savePos"] );
					self setPlayerAngles( self.pers["saveAng"] );

					self thread menuClose();
				}
			}
		}
	}
}