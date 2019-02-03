#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

/*
All my code from TSD 1/2 is fucking horrid,
making this file, just to clean some repeated things up.
NOTE: Still need to add things along the way.
*/

menuClose()
{
	self.menuOpen = 0;
	self freezeControls(false);
	self.curPos = 1;
	self.menuPos = 1;
	self.weaponStatus = 1;
	self setBlurForPlayer( 0, 0.2 );
}

menuOpen()
{
	self.menuOpen = 1;
	self freezeControls(true);
	self.curPos = 1;
	self.menuPos = 1;
	self.weaponStatus = 1;
	self setBlurForPlayer( 4, 0.2 );
}