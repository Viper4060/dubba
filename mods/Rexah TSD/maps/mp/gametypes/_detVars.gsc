#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doThreads() // Trying to cut back on threads...
{
	for(;;)
	{

	// Crosshair Size.
		if ( getDvar( "chs" ) == "0" )
		{
			self setClientDvar( "perk_weapSpreadMultiplier", "1" ); 	// Commando
			self.noScopes = "Commando";
		}
		else if ( getDvar( "chs" ) == "1" )
		{
			self setClientDvar( "perk_weapSpreadMultiplier", "0.65" ); 	// Steady Aim
			self.noScopes = "Steady Aim";
		}
		else if ( getDvar( "chs" ) == "2" )
		{
			self setClientDvar( "perk_weapSpreadMultiplier", "0.001" ); 	// Straight Noscopes
			self.noScopes = "Straight";
		}

	// Slow Motion
		if ( getDvar( "timescale" ) == "1" )
			self.slowmoScale = "Off";
		else if ( getDvar( "timescale" ) == "0.75" )
			self.slowmoScale = "75 Percent";
		else if ( getDvar( "timescale" ) == "0.5" )
			self.slowmoScale = "50 Percent";
		else if ( getDvar( "timescale" ) == "0.25" )
			self.slowmoScale = "25 Percent";

	// Bot Dvars
		if ( getDvar( "testClients_doMove" ) == "0" )
			self.bMove = "false";
		else if ( getDvar( "testClients_doMove" ) == "1" )
			self.bMove = "true";

		if ( getDvar( "testClients_doAttack" ) == "0" )
			self.bShoot = "false";
		else if ( getDvar( "testClients_doAttack" ) == "1" )
			self.bShoot = "true";
		
		if ( getDvar( "testClients_doReload" ) == "0" )
			self.bReload = "false";
		else if ( getDvar( "testClients_doReload" ) == "1" )
			self.bReload = "true";
		
		if ( getDvar( "testClients_doLock" ) == "0" )
			self.bLock = "false";
		else if ( getDvar( "testClients_doLock" ) == "1" )
			self.bLock = "true";
		
		if ( getDvar( "testClients_doRespawn" ) == "0" )
			self.bResp = "false";
		else if ( getDvar( "testClients_doRespawn" ) == "1" )
			self.bResp = "true";
		
		if ( getDvar( "testClients_doTalk" ) == "0" )
			self.bTalk = "false";
		else if ( getDvar( "testClients_doTalk" ) == "1" )
			self.bTalk = "true";	

	// Explosive Bullets
		if ( getDvar( "expb" ) == "0" )
			self.kos = "Off";
		else if ( getDvar( "expb" ) == "1" )
			self.kos = "Regular - 500";
		else if ( getDvar( "expb" ) == "2" )
			self.kos = "Strong - 1000";
		else if ( getDvar( "expb" ) == "3" )
			self.kos = "Super - 1500";
		else if ( getDvar( "expb" ) == "4" )
			self.kos = "Powerful - 2000";
		else if ( getDvar( "expb" ) == "5" )
			self.kos = "Extreme - 2500";
		else if ( getDvar( "expb" ) == "6" )
			self.kos = "Flawless - 3000";
		else if ( getDvar( "expb" ) == "7" )
			self.kos = "Ebola - 999999";	

	// Damage Type
		if ( getDvar( "dmgt" ) == "0" )
			self.damageLevelStatus = "Snipers Only";
		else if ( getDvar( "dmgt" ) == "1" )
			self.damageLevelStatus = "Snipers and Hitmarkers";
		else if ( getDvar( "dmgt" ) == "2" )
			self.damageLevelStatus = "Normal Damage";
		else if ( getDvar( "dmgt" ) == "3" )
			self.damageLevelStatus = "Hitmarkers";

	//	Superman Lobby
		if ( getDvar( "superman" ) == "0" )
		{
			setDvar( "jump_height", "39" ); 
			self setClientDvar( "g_speed" , "200" );

			self setClientDvar( "g_knockback", "1000" );
	        self setClientDvar( "cl_demoBackJump", "20000" );
	        self setClientDvar( "cl_demoForwardJump", "4000" );

			self.supermanLB = "Disabled";
		}
		else if ( getDvar( "superman" ) == "1" )
		{
			setDvar( "jump_height", "1000" );
			self setClientDvar( "g_speed" , "1000" );
			
			self setClientDvar( "g_knockback", "9999999" );
	        self setClientDvar( "cl_demoBackJump", "9999999" );
	       	self setClientDvar( "cl_demoForwardJump", "9999999" );

			self.supermanLB = "Enabled";
		}

	//	Left Sided Sniper
		if ( getDvar( "leftSniper" ) == "0" )
		{
			self setClientDvar("cg_gun_y", "0");

			self.sniperLFT = "Disabled";
		}
		else if ( getDvar( "leftSniper" ) == "1" )
		{
			self setClientDvar("cg_gun_y", "10");

			self.sniperLFT = "Enabled";
		}

	//	EarthQuakes
		if ( getDvar( "thirdPerson" ) == "0" )
		{
			self setClientDvar( "cg_thirdperson", "0" );

			self.thirdPerson = "Disabled";
		}
		else if ( getDvar( "thirdPerson" ) == "1" )
		{
			self setClientDvar( "cg_thirdperson", "1" );

			self.thirdPerson = "Enabled";
		}

	//	Chrome Guns
		if ( getDvar( "chromeGuns" ) == "0" )
		{
			self setClientDvar( "r_specularMap", "1" );

			self.chromeGuns = "Disabled";
		}
		else if ( getDvar( "chromeGuns" ) == "1" )
		{
			self setClientDvar( "r_specularMap", "2" );

			self.chromeGuns = "Enabled";
		}

	//	Color Map
		if ( getDvar( "colorMap" ) == "0" )
		{
			self setClientDvar( "r_colorMap", 1 );

			self.colorMap = "Disabled";
		}
		else if ( getDvar( "colorMap" ) == "1" )
		{
			self setClientDvar( "r_colorMap", 3 );

			self.colorMap = "Enabled";
		}

	//	Rainbow Map
		if ( getDvar( "toggleRainbow" ) == "0" )
		{
			self setClientDvar( "r_debugShader", 0 );

			self.toggleRainbow = "Disabled";
		}
		else if ( getDvar( "toggleRainbow" ) == "1" )
		{
			self setClientDvar( "r_debugShader", 3 );

			self.toggleRainbow = "Enabled";
		}

	//	Automatic Snipers
		if ( getDvar( "toggleAuto" ) == "0" )
		{
			self setClientDvar( "perk_weapReloadMultiplier", 0.5 );

			self.toggleAuto = "Disabled";
		}
		else if ( getDvar( "toggleAuto" ) == "1" )
		{
			self thread maps\mp\perks\_perks::givePerk( "specialty_fastreload" );
            self setClientDvar( "perk_weapReloadMultiplier", 0.01 );

			self.toggleAuto = "Enabled";
		}
		wait 0.2;
	
	// Bots Talk
		if ( getDvar( "bottalk" ) == "0" )
		{

			self setClientDvar( "bottalk", 0 );

			self.bottalk = "false";
		}
		else if ( getDvar( "bottalk" ) == "1" )
		{

			self setClientDvar( "bottalk", 1 );

			self.bottalk = "true";
		}
		
		// Slide Position
		if ( getDvar( "slidepos" ) == "" )
		setDvar( "slidepos", "0" );
		
		
	// Floaters
		if ( getDvar( "floaters" ) == "0" )
		{

			self setClientDvar( "floaters", 0 );

			self.floaters = "Disabled";
			
		}
		else if ( getDvar( "floaters" ) == "1" )
		{

			self setClientDvar( "floaters", 1 );

			self.floaters = "Enabled";
		}	
		
	}
}