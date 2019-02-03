#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

// Not the easiest way, but I understand it the best.

createText()
{

	MyYT = self createFontString("default", 2);	// Main Menu Text
	MyYT setPoint("CENTER", "CENTER", 0, -175);
	Menu1 = self createFontString("default", 2);	// Main Menu Text
	Menu1 setPoint("CENTER", "CENTER", 0, -150);
	Menu2 = self createFontString("default", 1.75); // Sub Menu Text
	Menu2 setPoint("CENTER", "CENTER", 0, -125);
	Menu3 = self createFontString("default", 1.75); // Sub Sub Menu Text
	Menu3 setPoint("CENTER", "CENTER", 0, -105);

	subMenu1 = self createFontString("default", 1.5);
	subMenu1 setPoint("CENTER", "CENTER", -200, -150);
	subMenu2 = self createFontString("default", 1.5);
	subMenu2 setPoint("CENTER", "CENTER", 200, -150);

	Text1 = self createFontString("default", 1.5);
	Text1 setPoint("CENTER", "CENTER", 0, -80);
	Text2 = self createFontString("default", 1.5);
	Text2 setPoint("CENTER", "CENTER", 0, -60);
	Text3 = self createFontString("default", 1.5);
	Text3 setPoint("CENTER", "CENTER", 0, -40);
	Text4 = self createFontString("default", 1.5);
	Text4 setPoint("CENTER", "CENTER", 0, -20);
	Text5 = self createFontString("default", 1.5);
	Text5 setPoint("CENTER", "CENTER", 0, 0);
	Text6 = self createFontString("default", 1.5);
	Text6 setPoint("CENTER", "CENTER", 0, 20);
	Text7 = self createFontString("default", 1.5);
	Text7 setPoint("CENTER", "CENTER", 0, 40);
	Text8 = self createFontString("default", 1.5);
	Text8 setPoint("CENTER", "CENTER", 0, 60);
	Text9 = self createFontString("default", 1.5);
	Text9 setPoint("CENTER", "CENTER", 0, 80);
	Text10 = self createFontString("default", 1.5);
	Text10 setPoint("CENTER", "CENTER", 0, 100);
	Text11 = self createFontString("default", 1.5);
	Text11 setPoint("CENTER", "CENTER", 0, 120);
	Text12 = self createFontString("default", 1.5);
	Text12 setPoint("CENTER", "CENTER", 0, 140);

	Left1 = self createFontString("default", 1.5);
	Left1 setPoint("CENTER", "CENTER", -300, -40);

	Right1 = self createFontString("default", 1.5);
	Right1 setPoint("CENTER", "CENTER", 300, -40);

	Close1 = self createFontString("default", 2);
	Close1 setPoint("CENTER", "CENTER", 0, 180);

	for(;;)
	{
		self.mEqu = [];
		self.mEqu[0] = "Claymore";
		self.mEqu[1] = "C4";
		
		self.tEqu = [];
		self.tEqu[0] = "claymore_mp";
		self.tEqu[1] = "c4_mp";

		if (self.menuOpen == 0)
		{
			MyYT setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Left1 setText( "" );
			Right1 setText( "" );
			Close1 setText( "" );

		} else if (self.menuOpen == 1) {

			MyYT setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Close1 setText( "" );

			Close1 setText( "Press [{+actionslot 1}] to close the menu!" );

			MyYT setText( "Rexah TSD" );

			if (self.menuOpen == 1) { // This will be avaliable for every player
				if (self.menuPos == 1) {
	
					if (self.admin == true)
						subMenu1 setText( "^7Kick Players" );
					else
						subMenu1 setText( "^7Character Preferences" );
			// Teleports
					subMenu2 setText( "^7Equipment" );
	
				} else if (self.menuPos == 2) {
	
					subMenu1 setText( "^7Teleports" );
			// Equipment
					subMenu2 setText( "^7Weapons" );
	
				} else if (self.menuPos == 3) {
	
					subMenu1 setText( "^7Equipment" );
			// Weapons
					subMenu2 setText( "^7Killstreaks" );
	
				}  else if (self.menuPos == 4) {
	
					subMenu1 setText( "^7Weapons" );
			// Killstreak
					subMenu2 setText( "^7Character Preferences" );
	
				} else if (self.menuPos == 5) { // Char. Prefs.
	
					subMenu1 setText( "^7Killstreaks" );
			// Character Prefs
					if (self.admin == true)
						subMenu2 setText( "^7Fun Stuff" );
					else
						subMenu2 setText( "^7Teleports" );
	
				} else if (self.menuPos == 6) {

					subMenu1 setText( "^7Character Preferences" );
			// Fun Stuff
					subMenu2 setText( "^7Match Settings" );

				} else if (self.menuPos == 7) {

					subMenu1 setText( "^7Fun Stuff" );
			// Match Settings
					subMenu2 setText( "^7Change Map" );

				} else if (self.menuPos == 8) {

					subMenu1 setText( "^7Match Settings" );
			// Change Map
					subMenu2 setText( "^7Bot Settings" );

				} else if (self.menuPos == 9) {

					subMenu1 setText( "^7Change Map" );
			// Bot Settings
					subMenu2 setText( "^7Kick Player Menu" );

				} else if (self.menuPos == 10) {

					subMenu1 setText( "^7Bot Settings" );
			// Kick Players
					subMenu2 setText( "^7Teleports" );
			
				}
				
			
			}	
		

			Right1 setText( "[Credits]\n\n^7- Rexah (Nacmod/TP Spots/etc)\n^7- Auhx (Floor/Slides/etc)\n^7- Boots (Menu Base)\n^7- Kvrma (Fun Menu)" );
			Left1 setText( "[Menu Controls]\n W: Up\n S: Down\n A: Previous\n D: Next\n Space: Select" );

			// Teleport Menu
			if (self.menuPos == 1) {

				if (self.admin == true) {
					Text1 setText( "^0Press ^7[{+frag}] ^0to ^7spawn a bot" );
					Text2 setText( "^0Press ^7[{+actionslot 2}] ^0to ^7move bots to crosshair" );
				}

				if (getdvar("mapname") == "mp_afghan") {
					Menu1 setText( "^0Afghan Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_derail") {
					Menu1 setText( "^0Derail Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_favela") {
					Menu1 setText( "^0Favela Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_highrise") {
					Menu1 setText( "^0Highrise Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
					Text4 setText( "^0Press ^7[{+actionslot 4}] ^0to teleport to: ^7Distant Superman" );
					Text5 setText( "^0Press ^7[{+smoke}] ^0to teleport to: ^7Other Superman v1" );
					Text6 setText( "^0Press ^7[{+activate}] ^0to teleport to: ^7Other Superman v2" );
				} else if (getdvar("mapname") == "mp_nightshift") {
					Menu1 setText( "^0Skidrow Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
					Text4 setText( "^0Press ^7[{+actionslot 4}] ^0to teleport to: ^7Elevator Superman" );
					Text5 setText( "^0Press ^7[{+smoke}] ^0to teleport to: ^7Other Superman" );
				} else if (getdvar("mapname") == "mp_invasion") {
					Menu1 setText( "^0Invasion Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_checkpoint") {
					Menu1 setText( "^0Karachi Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_quarry") {
					Menu1 setText( "^0Quarry Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
					Text4 setText( "^0Press ^7[{+actionslot 4}] ^0to teleport to: ^7Other Superman" );
					Text5 setText( "^0Press ^7[{+smoke}] ^0to teleport to: ^7Distant Superman" );
				} else if (getdvar("mapname") == "mp_boneyard") {
					Menu1 setText( "^0Scrapyard Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				} else if (getdvar("mapname") == "mp_terminal") {
					Menu1 setText( "^0Terminal Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
					Text4 setText( "^0Press ^7[{+actionslot 4}] ^0to teleport to: ^7Distant Superman" );
					Text5 setText( "^0Press ^7[{+smoke}] ^0to teleport to: ^7Other Superman" );
				} else if (getdvar("mapname") == "mp_underpass") {
					Menu1 setText( "^0Underpass Teleport Menu" );
					Text3 setText( "^0Press ^7[{+actionslot 3}] ^0to teleport to: ^7Main Superman" );
				}

				else {
					Menu1 setText( "^7ERROR" );
					Text3 setText( "^7This map has no out of map spots OR is not supported." );
					Text4 setText( "^7...UFO around if still want to play it." );
				}

				Text8 setText( "^0Press ^7[{+melee}] ^0to ^7save ^0your current location" );

				if (self.ufo == false) {
					Text7 setText( "^0Press ^7[{+gostand}] ^0to ^7enter ^0into ^7UFO mode" );
				} else {
					Text7 setText( "^0Press ^7[{+gostand}] ^0to ^7exit ^0out of ^7UFO mode" );
				}
				
				if (self.pers["loc"] == false) {
					Text9 setText( "^0You have to ^7save ^0a location to ^7load ^0it." );
				} else if (self.pers["loc"] == true) {
					Text9 setText( "^0Press ^7[{+reload}] ^0to ^7load ^0your saved location" );
				}

				if (self.pers["mySpawn"] == 0) {
					Text10 setText( "^0Press ^7[{+forward}] ^0to set your spawn point. (Not Set)" );
				} else {
					Text10 setText( "^0Press ^7[{+forward}] ^0to set your spawn point. (Set)" );
				}

			} else if (self.menuPos == 2) {

				Menu1 setText( "^0Equipment Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^0Frag Grenade" );
				} else if (self.curPos != 1) {
					Text1 setText( "^7Frag Grenade" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^0Semtex Grenade" );
				} else if (self.curPos != 2) {
					Text2 setText( "^7Semtex Grenade" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^0Throwing Knife" );
				} else if (self.curPos != 3) {
					Text3 setText( "^7Throwing Knife" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^0Tactical Insertion" );
				} else if (self.curPos != 4) {
					Text4 setText( "^7Tactical Insertion" );
				}

				if (self.curPos == 5) {
					Text5 setText( "^0Blast Shield" );
				} else if (self.curPos != 5) {
					Text5 setText( "^7Blast Shield" );
				}

				if (self.curPos == 6) {
					Text6 setText( "^0Claymore" );
				} else if (self.curPos != 6) {
					Text6 setText( "^7Claymore" );
				}

				if (self.curPos == 7) {
					Text7 setText( "^0C4" );
				} else if (self.curPos != 7) {
					Text7 setText( "^7C4" );
				}

				if (self.curPos == 8) {
					Text8 setText( "^0GlowStick" );
				} else if (self.curPos != 8) {
					Text8 setText( "^7GlowStick" );
				}

				if (self.curPos == 9) {
					Menu2 setText( "^0Press ^7[{+reload}] ^0to ^7cycle" );
					Text9 setText( "^0Tactical Insertion With: ^7" + self.mEqu[ self.selector - 1 ] );
				} else if (self.curPos != 9) {
					Text9 setText( "^7Tactical Insertion With: ^7" + self.mEqu[ self.selector - 1 ] );
				}

			} else if (self.menuPos == 3) {
				
				Menu1 setText( "^0Weapons Menu" );
			
				if (self.weaponStatus == 1) {

					if (self.secIsPrimary == true) {

						if (self.weaponStatus == 1) {
							Menu2 setText( "^0Press ^7[{+reload}] ^0to ^7switch teirs" );

							if (self.secTeir == 1) {
								Menu3 setText( "^0Current Teir: ^0Assualt Rifles" );
							} else if (self.secTeir == 2) {
								Menu3 setText( "^0Current Teir: ^0Sub Machine Guns" );
							} else if (self.secTeir == 3) {
								Menu3 setText( "^0Current Teir: ^0Sniper Rifles" );
							} else if (self.secTeir == 4) {
								Menu3 setText( "^0Current Teir: ^0Light Machine Guns" );
							} else if (self.secTeir == 5) {
								Menu3 setText( "^0Current Teir: ^0Riot Shield" );
							}
						} else {
							Menu2 setText( "" );
							Menu3 setText( "" );
						}
					} else {
						Menu2 setText( "^7Choose a primary weapon" );
						Menu3 setText( "" );
					}

					if (self.secIsPrimary == true) {

						if (self.secTeir == 1) {

							if (self.curPos == 1) {
								Text1 setText( "^0M4A1" );
							} else if (self.curPos != 1) {
								Text1 setText( "^7M4A1" );
							}

							if (self.curPos == 2) {
								Text2 setText( "^0Famas" );
							} else if (self.curPos != 2) {
								Text2 setText( "^7Famas" );
							}

							if (self.curPos == 3) {
								Text3 setText( "^0SCAR-H" );
							} else if (self.curPos != 3) {
								Text3 setText( "^7SCAR-H" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^0TAR-21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^7TAR-21" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^0FAL" );
							} else if (self.curPos != 5) {
								Text5 setText( "^7FAL" );
							}
	
							if (self.curPos == 6) {
								Text6 setText( "^0M16A4" );
							} else if (self.curPos != 6) {
								Text6 setText( "^7M16A4" );
							}
	
							if (self.curPos == 7) {
								Text7 setText( "^0ACR" );
							} else if (self.curPos != 7) {
								Text7 setText( "^7ACR" );
							}
	
							if (self.curPos == 8) {
								Text8 setText( "^0F2000" );
							} else if (self.curPos != 8) {
								Text8 setText( "^7F2000" );
							}
	
							if (self.curPos == 9) {
								Text9 setText( "^0AK-47" );
							} else if (self.curPos != 9) {
								Text9 setText( "^7AK-47" );
							}
		
						} else if (self.secTeir == 2) {

							if (self.curPos == 1) {
								Text1 setText( "^0MP5K" );
							} else if (self.curPos != 1) {
								Text1 setText( "^7MP5K" );
							}
	
							if (self.curPos == 2) {
								Text2 setText( "^0UMP 45" );
							} else if (self.curPos != 2) {
								Text2 setText( "^7UMP 45" );
							}
	
							if (self.curPos == 3) {
								Text3 setText( "^0Vector" );
							} else if (self.curPos != 3) {
								Text3 setText( "^7Vector" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^0P90" );
							} else if (self.curPos != 4) {
								Text4 setText( "^7P90" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^0Mini-Uzi" );
							} else if (self.curPos != 5) {
								Text5 setText( "^7Mini-Uzi" );
							}
	
						} else if (self.secTeir == 3) {

							if (self.curPos == 1) {
								Text1 setText( "^0Intervention" );
							} else if (self.curPos != 1) {
								Text1 setText( "^7Intervention" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^0Barrett .50cal" );
							} else if (self.curPos != 2) {
								Text2 setText( "^7Barrett .50cal" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^0WA2000" );
							} else if (self.curPos != 3) {
								Text3 setText( "^7WA2000" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^0M21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^7M21" );
							}
	
						} else if (self.secTeir == 4) {

							if (self.curPos == 1) {
								Text1 setText( "^0L86 LSW" );
							} else if (self.curPos != 1) {
								Text1 setText( "^7L86 LSW" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^0MG4" );
							} else if (self.curPos != 2) {
								Text2 setText( "^7MG4" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^0RPD" );
							} else if (self.curPos != 3) {
								Text3 setText( "^7RPD" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^0AUG H Bar" );
							} else if (self.curPos != 4) {
								Text4 setText( "^7AUG H Bar" );
							}
		
							if (self.curPos == 5) {
								Text5 setText( "^0M240" );
							} else if (self.curPos != 5) {
								Text5 setText( "^7M240" );
							}
	
						} else if (self.secTeir == 5) {

							Text1 setText( "^0Riotshield" );
						}
					} else {
						if (self.curPos == 1) {
							Text1 setText( "^0Intervention" );
						} else if (self.curPos != 1) {
							Text1 setText( "^7Intervention" );
						}
							
						if (self.curPos == 2) {
							Text2 setText( "^0Barrett .50cal" );
						} else if (self.curPos != 2) {
							Text2 setText( "^7Barrett .50cal" );
						}
	
						if (self.curPos == 3) {
							Text3 setText( "^0WA2000" );
						} else if (self.curPos != 3) {
							Text3 setText( "^7WA2000" );
						}
	
						if (self.curPos == 4) {
							Text4 setText( "^0M21" );
						} else if (self.curPos != 4) {
							Text4 setText( "^7M21" );
						}
	
						if (self.curPos == 5) {
							Text5 setText( "^0Default Trickshot Class" );
						} else if (self.curPos != 5) {
							Text5 setText( "^7Default Trickshot Class" );
						}
	
						if (self.pers["created"] == false)
						{
							if (self.curPos == 6)
								Text6 setText( "^0Create a class to use this feature" );
							else
								Text6 setText( "^7Create a class to use this feature" );
						}
						else
						{
							if (self.curPos == 6)
								Text6 setText( "^0Load last saved class" );
							else
								Text6 setText( "^7Load last saved class" );
						}
					}

				} else if (self.weaponStatus == 2) { // Sniper Rifle
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Silencer" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Silencer" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0ACOG" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7ACOG" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0Heartbeat Sensor" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7Heartbeat Sensor" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0Thermal Scope" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7Thermal Scope" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Extended Mags" );
					}

				} else if (self.weaponStatus == 3) { // Developing.
					Menu2 setText( "^7Choose a secondary weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^0Machine Pistols" );
						Text2 setText( "^7Handguns" );
						Text3 setText( "^7Shotguns" );
						Text4 setText( "^7Launchers" );
						Text5 setText( "^7One Man Army" );
						Text6 setText( "^7Second Primary" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7Machine Pistols" );
						Text2 setText( "^0Handguns" );
						Text3 setText( "^7Shotguns" );
						Text4 setText( "^7Launchers" );
						Text5 setText( "^7One Man Army" );
						Text6 setText( "^7Second Primary" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7Machine Pistols" );
						Text2 setText( "^7Handguns" );
						Text3 setText( "^0Shotguns" );
						Text4 setText( "^7Launchers" );
						Text5 setText( "^7One Man Army" );
						Text6 setText( "^7Second Primary" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7Machine Pistols" );
						Text2 setText( "^7Handguns" );
						Text3 setText( "^7Shotguns" );
						Text4 setText( "^0Launchers" );
						Text5 setText( "^7One Man Army" );
						Text6 setText( "^7Second Primary" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7Machine Pistols" );
						Text2 setText( "^7Handguns" );
						Text3 setText( "^7Shotguns" );
						Text4 setText( "^7Launchers" );
						Text5 setText( "^0One Man Army" );
						Text6 setText( "^7Second Primary" );
					} else if (self.curPos == 6) {
						Text1 setText( "^7Machine Pistols" );
						Text2 setText( "^7Handguns" );
						Text3 setText( "^7Shotguns" );
						Text4 setText( "^7Launchers" );
						Text5 setText( "^7One Man Army" );
						Text6 setText( "^0Second Primary" );
					}

				} else if (self.weaponStatus == 4) { // Pistols
					Menu2 setText( "^7Choose a pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^0USP .45" );
						Text2 setText( "^7.44 Magnum" );
						Text3 setText( "^7M9" );
						Text4 setText( "^7Desert Eagle" );
						Text5 setText( "^7Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7USP .45" );
						Text2 setText( "^0.44 Magnum" );
						Text3 setText( "^7M9" );
						Text4 setText( "^7Desert Eagle" );
						Text5 setText( "^7Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7USP .45" );
						Text2 setText( "^7.44 Magnum" );
						Text3 setText( "^0M9" );
						Text4 setText( "^7Desert Eagle" );
						Text5 setText( "^7Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7USP .45" );
						Text2 setText( "^7.44 Magnum" );
						Text3 setText( "^7M9" );
						Text4 setText( "^0Desert Eagle" );
						Text5 setText( "^7Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7USP .45" );
						Text2 setText( "^7.44 Magnum" );
						Text3 setText( "^7M9" );
						Text4 setText( "^7Desert Eagle" );
						Text5 setText( "^0Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 5) { // USP | M9
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Akimbo" );
						Text5 setText( "^7Tactical Knife" );
						Text6 setText( "^7Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7None" );
						Text2 setText( "^0FMJ" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Akimbo" );
						Text5 setText( "^7Tactical Knife" );
						Text6 setText( "^7Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^0Silencer" );
						Text4 setText( "^7Akimbo" );
						Text5 setText( "^7Tactical Knife" );
						Text6 setText( "^7Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^0Akimbo" );
						Text5 setText( "^7Tactical Knife" );
						Text6 setText( "^7Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Akimbo" );
						Text5 setText( "^0Tactical Knife" );
						Text6 setText( "^7Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 6) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Akimbo" );
						Text5 setText( "^7Tactical Knife" );
						Text6 setText( "^0Extended Mags" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 6) { // .44 Magnum | Desert Eagle
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Akimbo" );
						Text4 setText( "^7Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7None" );
						Text2 setText( "^0FMJ" );
						Text3 setText( "^7Akimbo" );
						Text4 setText( "^7Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^0Akimbo" );
						Text4 setText( "^7Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Akimbo" );
						Text4 setText( "^0Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 7) { // Shotguns
					Menu2 setText( "^7Choose a shotgun" );

					if (self.curPos == 1) {
						Text1 setText( "^0Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^0AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^0Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^0Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^0M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^0Model 1887" );
						Text7 setText( "^7Back" );
					} else if (self.curPos == 7) {
						Text1 setText( "^7Spas12" );
						Text2 setText( "^7AA12" );
						Text3 setText( "^7Striker" );
						Text4 setText( "^7Ranger" );
						Text5 setText( "^7M1014" );
						Text6 setText( "^7Model 1887" );
						Text7 setText( "^0Back" );
					}
				} else if (self.weaponStatus == 8) { // Spas 12 | AA12 | Striker | M1014
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7None" );
						Text2 setText( "^0Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^0Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^0Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^0FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 6) {
						Text1 setText( "^7None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^0Holographic Sight" );
						Text7 setText( "^7Extended Mags" );
					} else if (self.curPos == 7) {
						Text1 setText( "^7None" );
						Text2 setText( "^7Red Dot Sight" );
						Text3 setText( "^7Silencer" );
						Text4 setText( "^7Grip" );
						Text5 setText( "^7FMJ" );
						Text6 setText( "^7Holographic Sight" );
						Text7 setText( "^0Extended Mags" );
					}
				} else if (self.weaponStatus == 9) { // Ranger | Model 1887
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^7Akimbo" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7None" );
						Text2 setText( "^0FMJ" );
						Text3 setText( "^7Akimbo" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7None" );
						Text2 setText( "^7FMJ" );
						Text3 setText( "^0Akimbo" );
					}
				} else if (self.weaponStatus == 10) {
					Menu2 setText( "^7Choose a launcher" );

					if (self.curPos == 1) {
						Text1 setText( "^0AT4-HS" );
						Text2 setText( "^7Thumper" );
						Text3 setText( "^7Stinger" );
						Text4 setText( "^7Javelin" );
						Text5 setText( "^7RPG-7" );
						Text6 setText( "^7Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^7AT4-HS" );
						Text2 setText( "^0Thumper" );
						Text3 setText( "^7Stinger" );
						Text4 setText( "^7Javelin" );
						Text5 setText( "^7RPG-7" );
						Text6 setText( "^7Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^7AT4-HS" );
						Text2 setText( "^7Thumper" );
						Text3 setText( "^0Stinger" );
						Text4 setText( "^7Javelin" );
						Text5 setText( "^7RPG-7" );
						Text6 setText( "^7Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^7AT4-HS" );
						Text2 setText( "^7Thumper" );
						Text3 setText( "^7Stinger" );
						Text4 setText( "^0Javelin" );
						Text5 setText( "^7RPG-7" );
						Text6 setText( "^7Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^7AT4-HS" );
						Text2 setText( "^7Thumper" );
						Text3 setText( "^7Stinger" );
						Text4 setText( "^7Javelin" );
						Text5 setText( "^0RPG-7" );
						Text6 setText( "^7Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^7AT4-HS" );
						Text2 setText( "^7Thumper" );
						Text3 setText( "^7Stinger" );
						Text4 setText( "^7Javelin" );
						Text5 setText( "^7RPG-7" );
						Text6 setText( "^0Back" );
					}
				} else if (self.weaponStatus == 11) {
					Menu2 setText( "^7Choose a machine pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^0PP2000" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7PP2000" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0G18" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7G18" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0M93 Raffica" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7M93 Raffica" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0TMP" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7TMP" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0Back" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7Back" );
					}
				} else if (self.weaponStatus == 12) {
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Red Dot Sight" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Red Dot Sight" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0Silencer" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7Silencer" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0Akimbo" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7Akimbo" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0Holographic Sight" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7Holographic Sight" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Extended Mags" );
					}

				} else if (self.weaponStatus == 13) {
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Grenade Launcher" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Grenade Launcher" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Shotgun Attachment" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Shotgun Attachment" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^0Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^7Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^0Heartbeat Sensor" );
					} else if (self.curPos != 9) {
						Text9 setText( "^7Heartbeat Sensor" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^0Thermal Scope" );
					} else if (self.curPos != 10) {
						Text10 setText( "^7Thermal Scope" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^0Extended Mags" );
					} else if (self.curPos != 11) {
						Text11 setText( "^7Extended Mags" );
					}

				} else if (self.weaponStatus == 14) {
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Rapid Fire" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Rapid Fire" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Akimbo" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Akimbo" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^0Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^7Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^0Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^7Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^0Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^7Extended Mags" );
					}
				} else if (self.weaponStatus == 15) {
					Menu2 setText( "^7Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^0None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Grip" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Grip" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Holographic Sight" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Holographic Sight" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^0Heartbeat Sensor" );
					} else if (self.curPos != 8) {
						Text8 setText( "^7Heartbeat Sensor" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^0Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^7Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^0Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^7Extended Mags" );
					}
				}

			} else if (self.menuPos == 4) {
				Menu1 setText( "^0Killstreak Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^0UAV" );
				} else if (self.curPos != 1) {
					Text1 setText( "^7UAV" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^0Care Package" );
				} else if (self.curPos != 2) {
					Text2 setText( "^7Care Package" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^0Sentry Gun" );
				} else if (self.curPos != 3) {
					Text3 setText( "^7Sentry Gun" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^0Predator Missile" );
				} else if (self.curPos != 4) {
					Text4 setText( "^7Predator Missile" );
				}
				
				if (self.curPos == 5) {
					Text5 setText( "^0Nuke" );
				} else if (self.curPos != 5) {
					Text5 setText( "^7Nuke" );
				}
				
				
				

			} else if (self.menuPos == 5) {
				Menu1 setText( "^0Character Preferences" );

				if (self.curPos == 1) {
					Text1 setText( "^0Set Ammo In Stock To 0" );
				} else if (self.curPos != 1) {
					Text1 setText( "^7Set Ammo In Stock To 0" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^0Set Ammo In Clip To 0" );
				} else if (self.curPos != 2) {
					Text2 setText( "^7Set Ammo In Clip To 0" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^0Refill Everything" );
				} else if (self.curPos != 3) {
					Text3 setText( "^7Refill Everything" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^0Regen. Ammo On Reload: ^7" + self.pers["rAmmo"] );
				} else if (self.curPos != 4) {
					Text4 setText( "^7Regen. Ammo On Reload: ^7" + self.pers["rAmmo"] );
				}

				if (self.curPos == 5) {
					Text5 setText( "^0Regen. Special Grenades On Use: ^7" + self.pers["rSpec"] );
				} else if (self.curPos != 5) {
					Text5 setText( "^7Regen. Special Grenades On Use: ^7" + self.pers["rSpec"] );
				}

				if (self.curPos == 6) {
					Text6 setText( "^0Regen. Equipment On Use: ^7" + self.pers["rEquip"] );
				} else if (self.curPos != 6) {
					Text6 setText( "^7Regen. Equipment On Use: ^7" + self.pers["rEquip"] );
				}

				if (self.curPos == 7) {
					Text7 setText( "^0Disable One Many Army popup: ^7" + self.pers["omaTrickshot"] );
				} else if (self.curPos != 7) {
					Text7 setText( "^7Disable One Many Army popup: ^7" + self.pers["omaTrickshot"] );
				}

				if (self.curPos == 8) {
					Text8 setText( "^0Use Custom Spawn Point: ^7" + self.pers["useCustom"] );
				} else if (self.curPos != 8) {
					Text8 setText( "^7Use Custom Spawn Point: ^7" + self.pers["useCustom"] );
				}

				if (self.curPos == 9) {
					Text9 setText( "^0Fullbright: ^7" + self.fb );
				} else if (self.curPos != 9) {
					Text9 setText( "^7Fullbright: ^7" + self.fb );
				}
				
					} else if (self.menuPos == 6) {
				Menu1 setText( "^0Fun Stuff" );

				
				if (self.curPos == 1) {
					Text1 setText( "^0Create:^7 Left Slide");
				} else if (self.curPos != 1) {
					Text1 setText( "^7Create:^7 Left Slide");
				}
				
				if (self.curPos == 2) {
					Text2 setText( "^0Create:^7 Right Slide");
				} else if (self.curPos != 2) {
					Text2 setText( "^7Create:^7 Right Slide");
				}
				
				if (self.curPos == 3) {
					Text3 setText( "^0Create:^7 Back Slide");
				} else if (self.curPos != 3) {
					Text3 setText( "^7Create:^7 Back Slide");
				}
				
				if (self.curPos == 4) {
					Text4 setText( "^0Create:^7 Front Slide");
				} else if (self.curPos != 4) {
					Text4 setText( "^7Create:^7 Front Slide");
				}
				
				
				if (self.curPos == 5) {
					Text5 setText( "^0Set SlidePos: ^7Left");
				} else if (self.curPos != 5) {
					Text5 setText( "^7Set SlidePos: ^7Left");
				}
				
				if (self.curPos == 6) {
					Text6 setText( "^0Set SlidePos: ^7Back");
				} else if (self.curPos != 6) {
					Text6 setText( "^7Set SlidePos: ^7Back");
				}
				
				if (self.curPos == 7) {
					Text7 setText( "^0Set SlidePos: ^7Front");
				} else if (self.curPos != 7) {
					Text7 setText( "^7Set SlidePos: ^7Front");
				}
				
				if (self.curPos == 8) {
					Text8 setText( "^0Set SlidePos: ^7Right");
				} else if (self.curPos != 8) {
					Text8 setText( "^7Set SlidePos: ^7Right");
				}
				
			
				if (self.curPos == 9) {
					Text9 setText( "^0Disable Slides");
				} else if (self.curPos != 9) {
					Text9 setText( "^7Disable Slides");
				}
				
				if (self.curPos == 10) {
					Text10 setText( "^0Create Floor");
				} else if (self.curPos != 10) {
					Text10 setText( "^7Create Floor");
				}
				
				if (self.curPos == 11) {
					Text11 setText( "^0Set 1st Teleport Point");
				} else if (self.curPos != 11) {
					Text11 setText( "^7Set 1st Teleport Point");
				}
				
				if (self.curPos == 12) {
					Text12 setText( "^0Set 2nd Teleport Point");
				} else if (self.curPos != 12) {
					Text12 setText( "^7Set 2nd Teleport Point");
				}
				
			
			
			
			}	else if (self.menuPos == 7) {
				Menu1 setText( "^0Match Settings" );
				
				
				if (self.curPos == 1) {
					Text1 setText( "^0Third Person: ^7" + self.thirdPerson );
				} else if (self.curPos != 1) {
					Text1 setText( "^7Third Person: ^7" + self.thirdPerson );
				}

				if (self.curPos == 2) {
					Text2 setText( "^0Superman Settings: ^7" + self.supermanLB );
				} else if (self.curPos != 2) {
					Text2 setText( "^7Superman Settings: ^7" + self.supermanLB );
				}

				if (self.curPos == 3) {
					Text3 setText( "^0Left Sided Sniper: ^7" + self.sniperLFT );
				} else if (self.curPos != 3) {
					Text3 setText( "^7Left Sided Sniper: ^7" + self.sniperLFT );
				}

				if (self.curPos == 4) {
					Text4 setText( "^0Damage: ^7" + self.damageLevelStatus );
				} else if (self.curPos != 4) {
					Text4 setText( "^7Damage: ^7" + self.damageLevelStatus );
				}

				if (self.curPos == 5) {
					Text5 setText( "^0Explosive Bullets: ^7" + self.kos );
				} else if (self.curPos != 5) {
					Text5 setText( "^7Explosive Bullets: ^7" + self.kos );
				}

				if (self.curPos == 6) {
					Text6 setText( "^0Crosshair Size: ^7" + self.noScopes );
				} else if (self.curPos != 6) {
					Text6 setText( "^7Crosshair Size: ^7" + self.noScopes );
				}

				if (self.curPos == 7) {
					Text7 setText( "^0Slow Motion: ^7" + self.slowmoScale );
				} else if (self.curPos != 7) {
					Text7 setText( "^7Slow Motion: ^7" + self.slowmoScale );
				}

				if (self.curPos == 8) {
					Text8 setText( "^0Chrome Guns: ^7" + self.chromeGuns );
				} else if (self.curPos != 8) {
					Text8 setText( "^7Chrome Guns: ^7" + self.chromeGuns );
				}
				
				if (self.curPos == 9) {
					Text9 setText( "^0Barbie Map: ^7" + self.colorMap );
				} else if (self.curPos != 9) {
					Text9 setText( "^7Barbie Map: ^7" + self.colorMap );
				}

				if (self.curPos == 10) {
					Text10 setText( "^0Automatic Snipers: ^7" + self.toggleAuto );
				} else if (self.curPos != 10) {
					Text10 setText( "^7Automatic Snipers: ^7" + self.toggleAuto );
				}

				if (self.curPos == 11) {
					Text11 setText( "^0Rainbow Map: ^7" + self.toggleRainbow );
				} else if (self.curPos != 11) {
					Text11 setText( "^7Rainbow Map: ^7" + self.toggleRainbow );
				}
				
				if (self.curPos == 12) {
					Text12 setText( "^0Floaters: ^7" + self.floaters );
				} else if (self.curPos != 12) {
					Text12 setText( "^7Floaters: ^7" + self.floaters );
				}
				
			} else if (self.menuPos == 8) {
				Menu1 setText( "^0Change Map" );
				Menu2 setText( "^0Press ^7[{+reload}] ^0to ^7swap between DLC. ^0Press ^7[{+melee}] ^0to ^7swap pages." );

				if (self.mapPack == 0)
					Menu3 setText( "^0Normal Maps: ^7Page " + self.page + "/2" );
				else
					Menu3 setText( "^0DLC Maps: ^7Page " + self.page + "/2" );

				if (self.mapPack == 0) {
					if (self.page == 1) {

						if (self.curPos == 1) {
							Text1 setText( "^0Afghan" );
						} else if (self.curPos != 1) {
							Text1 setText( "^7Afghan" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^0Derail" );
						} else if (self.curPos != 2) {
							Text2 setText( "^7Derail" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^0Estate" );
						} else if (self.curPos != 3) {
							Text3 setText( "^7Estate" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^0Favela" );
						} else if (self.curPos != 4) {
							Text4 setText( "^7Favela" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^0Highrise" );
						} else if (self.curPos != 5) {
							Text5 setText( "^7Highrise" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^0Invasion" );
						} else if (self.curPos != 6) {
							Text6 setText( "^7Invasion" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^0Karachi" );
						} else if (self.curPos != 7) {
							Text7 setText( "^7Karachi" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^0Quarry" );
						} else if (self.curPos != 8) {
							Text8 setText( "^7Quarry" );
						}

					} else if (self.page == 2) {

						if (self.curPos == 1) {
							Text1 setText( "^0Rundown" );
						} else if (self.curPos != 1) {
							Text1 setText( "^7Rundown" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^0Rust" );
						} else if (self.curPos != 2) {
							Text2 setText( "^7Rust" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^0Scrapyard" );
						} else if (self.curPos != 3) {
							Text3 setText( "^7Scrapyard" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^0Skidrow" );
						} else if (self.curPos != 4) {
							Text4 setText( "^7Skidrow" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^0Sub Base" );
						} else if (self.curPos != 5) {
							Text5 setText( "^7Sub Base" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^0Terminal" );
						} else if (self.curPos != 6) {
							Text6 setText( "^7Terminal" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^0Underpass" );
						} else if (self.curPos != 7) {
							Text7 setText( "^7Underpass" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^0Wasteland" );
						} else if (self.curPos != 8) {
							Text8 setText( "^7Wasteland" );
						}
					}
				
				} else if (self.mapPack == 1) {
					if (self.page == 1) {
					
					if (self.curPos == 1) {
						Text1 setText( "^0Bailout" );
					} else if (self.curPos != 1) {
						Text1 setText( "^7Bailout" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^0Crash" );
					} else if (self.curPos != 2) {
						Text2 setText( "^7Crash" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^0Overgrown" );
					} else if (self.curPos != 3) {
						Text3 setText( "^7Overgrown" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^0Salvage" );
					} else if (self.curPos != 4) {
						Text4 setText( "^7Salvage" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^0Storm" );
					} else if (self.curPos != 5) {
						Text5 setText( "^7Storm" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^0Carnival" );
					} else if (self.curPos != 6) {
						Text6 setText( "^7Carnival" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^0Fuel" );
					} else if (self.curPos != 7) {
						Text7 setText( "^7Fuel" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^0Strike" );
					} else if (self.curPos != 8) {
						Text8 setText( "^7Strike" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^0Trailer Park" );
					} else if (self.curPos != 9) {
						Text9 setText( "^7Trailer Park" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^0Vacant" );
					} else if (self.curPos != 10) {
						Text10 setText( "^7Vacant" );
					}
					}
					
					else if (self.page == 2) {
					
					if (self.curPos == 1) {
							Text1 setText( "^0Bog" );
						} else if (self.curPos != 1) {
							Text1 setText( "^7Bog" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^0Bloc" );
						} else if (self.curPos != 2) {
							Text2 setText( "^7Bloc" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^0Crossfire" );
						} else if (self.curPos != 3) {
							Text3 setText( "^7Crossfire" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^0Killhouse" );
						} else if (self.curPos != 4) {
							Text4 setText( "^7Killhouse" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^0Nuketown" );
						} else if (self.curPos != 5) {
							Text5 setText( "^7Nuketown" );
						}
						
						if (self.curPos == 6) {
							Text6 setText( "^0Wet Work" );
						} else if (self.curPos != 6) {
							Text6 setText( "^7Wet Work" );
						}
					
					}
					
				}

			} else if (self.menuPos == 9) {

				Menu1 setText( "^0Bot Settings" );
				Menu2 setText( "^0Press ^7[{+reload}] ^0to ^7cycle up." );
				Menu3 setText( "^0Press ^7[{+melee}] ^0to ^7cycle down." );

				moveName = getDvar( "moveName" );

				if (self.curPos == 1) {
					Text1 setText( "^0Controll Bot: ^7" + moveName );
				} else if (self.curPos != 1) {
					Text1 setText( "^7Controll Bot: ^7" + moveName );
				}

				if (self.curPos == 2) {
					Text2 setText( "^0Bots Move: ^7" + self.bMove );
				} else if (self.curPos != 2) {
					Text2 setText( "^7Bots Move: ^7" + self.bMove );
				}

				if (self.curPos == 3) {
					Text3 setText( "^0Bots Shoot: ^7" + self.bShoot );
				} else if (self.curPos != 3) {
					Text3 setText( "^7Bots Shoot: ^7" + self.bShoot );
				}

				if (self.curPos == 4) {
					Text4 setText( "^0Bots Reload: ^7" + self.bReload );
				} else if (self.curPos != 4) {
					Text4 setText( "^7Bots Reload: ^7" + self.bReload );
				}

				if (self.curPos == 5) {
					Text5 setText( "^0Bots Lock On: ^7" + self.bLock );
				} else if (self.curPos != 5) {
					Text5 setText( "^7Bots Lock On: ^7" + self.bLock );
				}

				if (self.curPos == 6) {
					Text6 setText( "^0Bots Respawn: ^7" + self.bResp );
				} else if (self.curPos != 6) {
					Text6 setText( "^7Bots Respawn: ^7" + self.bResp );
				}
			} else if (self.menuPos == 10) { // Kick Menu

				Menu1 setText( "^0Kick Player Menu" );

				if (level.players.size > 9) {
					Menu2 setText( "^0Press ^7[{+reload}] ^0to ^7switch pages." );
					Menu3 setText( "^7Page: ^7" + self.kickPage + "/2" );
				} else {
					Menu2 setText( "^7The second page will open up" );
					Menu3 setText( "^7once there's more than 9 players." );
				}

				if (self.kickPage == 1) {
					if (self.curPos == 1)
						Text1 setText( "^0" + level.players[0].name );
					else
						Text1 setText( "^7" + level.players[0].name );

					if (self.curPos == 2)
						Text2 setText( "^0" + level.players[1].name );
					else
						Text2 setText( "^7" + level.players[1].name );

					if (self.curPos == 3)
						Text3 setText( "^0" + level.players[2].name );
					else	
						Text3 setText( "^7" + level.players[2].name );

					if (self.curPos == 4)
						Text4 setText( "^0" + level.players[3].name );
					else
						Text4 setText( "^7" + level.players[3].name );

					if (self.curPos == 5)
						Text5 setText( "^0" + level.players[4].name );
					else
						Text5 setText( "^7" + level.players[4].name );

					if (self.curPos == 6)
						Text6 setText( "^0" + level.players[5].name );
					else
						Text6 setText( "^7" + level.players[5].name );

					if (self.curPos == 7)
						Text7 setText( "^0" + level.players[6].name );
					else
						Text7 setText( "^7" + level.players[6].name );

					if (self.curPos == 8)
						Text8 setText( "^0" + level.players[7].name );
					else
						Text8 setText( "^7" + level.players[7].name );

					if (self.curPos == 9)
						Text9 setText( "^0" + level.players[8].name );
					else
						Text9 setText( "^7" + level.players[8].name );

				} else if (self.kickPage == 2) {

					if (self.curPos == 1)
						Text1 setText( "^0" + level.players[9].name );
					else
						Text1 setText( "^7" + level.players[9].name );

					if (self.curPos == 2)
						Text2 setText( "^0" + level.players[10].name );
					else
						Text2 setText( "^7" + level.players[10].name );

					if (self.curPos == 3)
						Text3 setText( "^0" + level.players[11].name );
					else	
						Text3 setText( "^7" + level.players[11].name );

					if (self.curPos == 4)
						Text4 setText( "^0" + level.players[12].name );
					else
						Text4 setText( "^7" + level.players[12].name );

					if (self.curPos == 5)
						Text5 setText( "^0" + level.players[13].name );
					else
						Text5 setText( "^7" + level.players[13].name );

					if (self.curPos == 6)
						Text6 setText( "^0" + level.players[14].name );
					else
						Text6 setText( "^7" + level.players[14].name );

					if (self.curPos == 7)
						Text7 setText( "^0" + level.players[15].name );
					else
						Text7 setText( "^7" + level.players[15].name );

					if (self.curPos == 8)
						Text8 setText( "^0" + level.players[16].name );
					else
						Text8 setText( "^7" + level.players[16].name );

					if (self.curPos == 9)
						Text9 setText( "^0" + level.players[17].name );
					else
						Text9 setText( "^7" + level.players[17].name );
					}
			

				
				
			}
		}
		wait 0.001;
	}
	
}