#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_cleanScript;

/*
	WARNING: Cluster-fuck below.
*/

doThreads()
{
	self thread doLocation1(); // Too lazy to put in an array, this works.
	self thread doLocation2(); 
	self thread doLocation3();
	self thread doLocation4();
}

doLocation1()
{

	for(;;)
	{
		self notifyOnPlayerCommand("as3", "+actionslot 3");
		self waittill("as3");
		
		if (self.menuOpen == 1)
		{
			if (self.menuPos == 1)
			{


				if (getdvar("mapname") == "mp_afghan")
					self setOrigin((-1856, -106, 508));
				else if (getdvar("mapname") == "mp_derail")
					self setOrigin((-3213, -1814, 934));
				else if (getdvar("mapname") == "mp_favela")
					self setOrigin((-7429, -309, 988));
				else if (getdvar("mapname") == "mp_highrise")
					self setOrigin((-3145, 2831, 4460));
				else if (getdvar("mapname") == "mp_nightshift")
					self setOrigin((1967, 348, 764));
				else if (getdvar("mapname") == "mp_invasion")
					self setOrigin((-1015, -4548, 1144));
				else if (getdvar("mapname") == "mp_checkpoint")
					self setOrigin((-2174, -1454, 808));
				else if (getdvar("mapname") == "mp_quarry")
					self setOrigin((-5832, 1434, 844));
				else if (getdvar("mapname") == "mp_boneyard")
					self setOrigin((-4717, 4957, 2783));
				else if (getdvar("mapname") == "mp_terminal")
					self setOrigin((-853, 4150, 804));
				else if (getdvar("mapname") == "mp_underpass")
					self setOrigin((-1843, 3134, 1159));
				
				self thread menuClose();
			}
		}
	}
}

doLocation2()
{
	for(;;)
	{
		self notifyOnPlayerCommand("as4", "+actionslot 4");
		self waittill("as4");

		if (self.menuOpen == 1)
		{
			if (self.menuPos == 1)
			{

				if (getdvar("mapname") == "mp_highrise")
					self setOrigin((-1496, -3931, 3804));
				else if (getdvar("mapname") == "mp_nightshift")
					self setOrigin((1543, -1765, 564));
				else if (getdvar("mapname") == "mp_quarry")
					self setOrigin((-5095, 1758, 679));
				else if (getdvar("mapname") == "mp_terminal")
					self setOrigin((1698, -60, 879));

				self thread menuClose();
			}
		}
	}
}

doLocation3()
{
	for(;;)
	{
		self notifyOnPlayerCommand("smoke", "+smoke");
		self waittill("smoke");

		if (self.menuOpen == 1)
		{
			if (self.menuPos == 1)
			{

				if (getdvar("mapname") == "mp_highrise")
					self setOrigin((-5496, 9566, 5524));
				else if (getdvar("mapname") == "mp_nightshift")
					self setOrigin((569, -980, 644));
				else if (getdvar("mapname") == "mp_quarry")
					self setOrigin((-5652, 532, 700));
				else if (getdvar("mapname") == "mp_terminal")
					self setOrigin((808, 2181, 616));

				self thread menuClose();
			}
		}
	}
}

doLocation4()
{
	for(;;)
	{
		self notifyOnPlayerCommand("activate", "+activate");
		self waittill("activate");

		if (self.menuOpen == 1)
		{
			if (self.menuPos == 1)
			{

				if (getdvar("mapname") == "mp_highrise")
					self setOrigin((1258, 10463, 4124));

				self thread menuClose();
			}
		}
	}
}