#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#using_animtree( "destructibles" );

doThreads() // Not calling threads that the bot doesn't need.
{
	self thread defineRights();
	self thread playerVariables();
	self thread initIndividualBot();
	self thread maps\mp\gametypes\_detVars::doThreads();
	self thread maps\mp\gametypes\_menuCont::doThreads();
	self thread maps\mp\gametypes\_myLogic::doThreads();
	self thread maps\mp\gametypes\_floaters::doThreads();
	self.insta = 1;
	self thread CareFloor(); // Superman Spots <3
	self thread doVariables(); //boots <3
	self thread detectVelocity(); //boots <3
	self thread forcePlayerBounce(); //boots <3
	self thread nuked();
	self thread SlideR();
	self thread SlideB();
	self thread SlideF();
	self thread SlideL();
	self thread fakenac();
	/*self thread AA();*/
	self thread movebotsCMD();
	self thread forAtlas();
	self thread initTeleport1();
	self thread initTeleport2();
	self thread ProccedTeleport();
	self thread detectK();
	self thread doDeathBarrier();
	self thread hasRiotShieldWeapon();
	self.pers["eb"] = false;

	wait 0.5;

	if (self.pers["isBot"] == false) // Calling threads that the bot won't need, stops lagging out (sortof).
	{ 
		self thread moveBots();
		self thread spawningBots();
		self thread nonResetVars();

		self thread maps\mp\gametypes\_text::createText();
		self thread maps\mp\gametypes\_select::handleSelection();

		self thread maps\mp\gametypes\_regen::doThreads();
		self thread maps\mp\gametypes\_locations::doThreads();
		self thread maps\mp\gametypes\_locationSaver::doThreads();
	}
}







Exo()
{
	for(;;)
	{
    	self notifyOnPlayerCommand( "axt", "+dash" );
    	self waittill( "axt" );
    	self setmovespeedscale(7);
    	wait 0.15;
    	self setmovespeedscale(1);

    }
    wait 1;
}




nonResetVars()
{
	if ( !isDefined( self.pers["isBot"] ))
		self.pers["isBot"] = true;

	if ( !isDefined( self.pers["loc"] ))
		self.pers["loc"] = false;

	if ( !isDefined( self.pers["savePos"] ))
		self.pers["savePos"] = "none";

	if ( !isDefined( self.pers["saveAng"] ))
		self.pers["saveAng"] = "none";

	if ( !isDefined( self.pers["rAmmo"] ))
		self.pers["rAmmo"] = "true";

	if ( !isDefined( self.pers["rSpec"] ))
		self.pers["rSpec"] = "true";

	if ( !isDefined( self.pers["rEquip"] ))
		self.pers["rEquip"] = "true";

	if ( !isDefined( self.pers["created"] ))
		self.pers["created"] = false;
	
	if ( !isDefined( self.pers["pri"] ))
		self.pers["pri"] = "none";
	
	if ( !isDefined( self.pers["priAttach"] ))
		self.pers["priAttach"] = "none";
	
	if ( !isDefined( self.pers["sec"] ))
		self.pers["sec"] = "none";
	
	if ( !isDefined( self.pers["secAttach"] ))
		self.pers["secAttach"] = "none";

	if ( !isDefined( self.pers["giveOnSpawn"] ))
		self.pers["giveOnSpawn"] = "false";
	
	if ( !isDefined( self.pers["equ"] ))
		self.pers["equ"] = "none";
	
	if ( !isDefined( self.pers["equSpec"] ))
		self.pers["equSpec"] = "none";

	if ( !isDefined( self.pers["useCustom"] ))
		self.pers["useCustom"] = "false";

	if ( !isDefined( self.pers["mySpawn"] ))
		self.pers["mySpawn"] = 0;

	if ( !isDefined( self.pers["myAngles"] ))
		self.pers["myAngles"] = 0;

	if ( !isDefined( self.pers["omaTrickshot"] ))
		self.pers["omaTrickshot"] = "false";

	if ( !isDefined( self.pers["showOnceRound"] ))
		self.pers["showOnceRound"] = false;
}

customDvars() // Now with custom dvars. :3
{

	setDvar( "ui_maxclients", "18" ); // Just leaving...
	setDvar( "scr_sd_numlives", "999" ); // No one will die this many times...
	
	setDvar( "g_TeamName_Allies", "Bot Team" );
	setDvar( "g_TeamName_Axis", "Player Team" );


	if ( getDvar( "oneTimeSet" ) == "" ) // Making the bots initially not move or shoot.
		setDvar( "oneTimeSet", "0" );

	if ( getDvar( "chs" ) == "" ) // Cross-hair Size
		setDvar( "chs", "0" );

	if ( getDvar( "testClients_doLock" ) == "" ) // Bots lock onto you.
		setDvar( "testClients_doLock", "0" );

	if ( getDvar( "testClients_doRespawn" ) == "" ) // Bots will respawn (2 piece)
		setDvar( "testClients_doRespawn", "1" );

	if ( getDvar( "expb" ) == "" ) // Explosive Bullets
		setDvar( "expb", "0" );


	if ( getDvar( "dmgt" ) == "" ) // Damage Type
		setDvar( "dmgt", "1" );

	if ( getDvar( "moveName" ) == "" ) // Moving Seperate Bots
		setDvar( "moveName", "All" );

	if ( getDvar( "superman" ) == "" )
		setDvar( "superman", "0" );

	if ( getDvar( "leftSniper" ) == "" )
		setDvar( "leftSniper", "0" );
	
	if ( getDvar( "thirdPerson" ) == "" )
		setDvar( "thirdPerson", "0" );

	if ( getDvar( "chromeGuns" ) == "" )
		setDvar( "chromeGuns", "0" );

	if ( getDvar( "colorMap" ) == "" )
		setDvar( "colorMap", "0" );

	if ( getDvar( "toggleAuto" ) == "" )
		setDvar( "toggleAuto", "0" );

	if ( getDvar( "toggleRainbow" ) == "" )
		setDvar( "toggleRainbow", "0" );
		
	if ( getDvar( "bottalk" ) == "" )
		setDvar( "bottalk", "1" );
	
	if ( getDvar( "slidepos" ) == "" )
		setDvar( "slidepos", "0" );
		
	if ( getDvar( "floaters" ) == "" )
		setDvar( "floaters", "0" );	

		
		
		
	}

playerVariables()
{
	self.ufo = false;
	self.maxCycle = 1;
	self.menuOpen = 0;
	self.menuPos = 1;
	self.admin = false;
	self.curPos = 1;
	self.mapPack = 0;
	self.canSpawn = true;
	self.canOpen = false;
	self.hasPicked = false;
	wait 0.1;

	self.omaCustomChange = false;
	self.kickPage = 1;
	self.hasSpawned = false;
	self.selector = 1;
	self.fb = "false";
	self.putMeInFinalStand = false;
	self.finalStandOnCooldown = false;
	self.YT = "^7Rexah ^2TSD";

	wait 0.1;

	self.fired = false;
	self.bNum = 0;
	self.bMove = "false";
	self.bResp = "true";
	self.bLock = "false";
	self.bShoot = "false";
	self.bReload = "false";
	self.damageLevelStatus = "Snipers Only";

	wait 0.1;

	self.hostMig = "-";
	self.slowmoScale = "Off";
	self.kos = "Off";
	self.noScopes = "false";
	self.page = 1;
	self.item = "null";

	wait 0.1;

	// Weapon Menu
	self.weaponStatus = 1;
	self.secType = "none";	// HG, HGE, SG
	self.secIsPrimary = false;
	self.secTeir = 1;

	self.priWeapon = "none";
	self.priAttach = "none";

	self.secWeapon = "none";
	self.secAttach = "none";
}

defineRights() // Turned into a thread where I just want to loop shit...
{
	self endon( "disconnect" );

	for(;;)
	{

		if (level.players.size < 10)
			self.kickPage = 1;

		if (self.pers["team"] == "allies")
			self.pers["lives"] = 1; // #YOLO
		else
			self.pers["lives"] = 999;

		if (isSubStr( self.guid, "bot" ))
         self.pers["isBot"] = true;
		else
         self.pers["isBot"] = false;

		// Checks if the player is admin

		if (self isHost()) {
			self.admin = true;
		} else {
			self.admin = false;
		}

		wait 0.5;
	}
}



initTeleport1()
{
	self endon("death");
	self endon("disconnect");
    
	self.teleportD = self.origin+(0, 0, 90);

		obj = spawn("script_model", self.origin+(0, 0, 90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (0,0,10);
		obj.health = 4200;

		wait .05;
}

initTeleport2()
{
	

		self.teleportF = self.origin+(0, 0, 90);

		obj = spawn("script_model", self.origin+(0, 0, 90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
        obj.angles = (0,0,10);
		obj.health = 4200;

		wait .05;
}

ProccedTeleport()
{
	for(;;)
	{
		if(Distance(self.teleportD, self.origin) <= 75)
		{
			self setOrigin(self.teleportF-(0, 0, 100));
		}

		wait .05;
	}
	wait .05;
}



forAtlas()
{	
	/*for(;;)
	{
		sWeapon = self getCurrentWeapon();
		if(isSubStr(sWeapon, "stinger_"))
		{
			self setClientDvar("cg_gun_x", -3);
			self setClientDvar("cg_gun_y", -4);
			self setClientDvar("cg_gun_z", 1); 
		}
		else if(isSubStr(sWeapon, "claymore_"))
		{
			self setClientDvar("cg_gun_x", -5);
			self setClientDvar("cg_gun_y", -4);
			self setClientDvar("cg_gun_z", 1); 
		}
		else if(!isSubStr(sWeapon, "claymore_"))
		{
			self setClientDvar("cg_gun_x", 0);
			self setClientDvar("cg_gun_y", 0);
			self setClientDvar("cg_gun_z", 0); 
		}
		wait .1;
	}
	wait .1;*/
}



spawningBots()
{
	self endon("disconnect");
    
	for(;;)
	{
		self notifyOnPlayerCommand( "frag", "+frag" );
		self waittill( "frag" );

		if (self.menuOpen == 1 && self.menuPos == 1 && self.admin == true && self.canSpawn == true)
		{		
			self.canSpawn = false;
			self thread initTestClients(1);
			wait 0.5;
			self.canSpawn = true;
		}
	}
}

moveBots()
{
	self endon("disconnect");

	for(;;)
	{
		self notifyOnPlayerCommand( "as2", "+actionslot 2" );
		self waittill( "as2" );

		moveName = getDvar( "moveName" );

		if (self.admin == true)
		{
			start = self getTagOrigin( "tag_eye" );
			end = anglestoforward(self getPlayerAngles()) * 1000000;
			destination = BulletTrace(start, end, true, self)["position"];

			foreach( player in level.players )
			{
				if (player.name == moveName)
				{
					if (player.pers["isBot"] == true)
					{
						if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
						{
				        	        player setOrigin( destination );
							player.pers["mySpawn"] = destination;
						}
					}

				} 
				else if (moveName == "All")
				{
					if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
					{
				                player setOrigin( destination );
						player.pers["mySpawn"] = destination;
					}
				}
			}
		}
	}
}



initTestClients(numberOfTestClients)
{
	for(i = 0; i < numberOfTestClients; i++)
	{
		wait 0.2;
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}

		ent[i].pers["useCustom"] = "true";
		ent[i].pers["isBot"] = true;
		ent[i] thread doPrestige();
		ent[i] thread doPrestigeAxis();
		ent[i] thread initIndividualBot();
	}
}

initIndividualBot()
{
	self endon( "disconnect" );

	for(;;) // fast_restart now fixed.
	{
		if (self.pers["isBot"] == true)
		{
			while(!isdefined(self.pers["team"]))
			wait .05;
			self notify("menuresponse", game["menu_team"], "allies");
			wait 0.5;
			self notify("menuresponse", "changeclass", "class0" );
		}

		wait 0.1;
	}
}

doPrestigeAxis()
{
	if ( getDvar( "prestige" ) < "0" && getDvar( "experience" ) < "2516000" )
	{
		self setPlayerData( "prestige", 0);
		self setPlayerData( "experience", 2516000 );
	}
}


doPrestige()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" )
	{
		self setPlayerData( "prestige", randomInt( 11 ) );
		self setPlayerData( "experience", 2516000 );
	}
}

hasRiotShieldWeapon()
{
   self.weaponList = self getWeaponsListAll();
   foreach( weapon in self.weaponList)
   {
      if( weapon == "riotshield_mp")
         return true;
   }
   
   return false;
}

init()
{
	level.scoreInfo = [];
	level.xpScale = getDvarInt( "scr_xpscale" );
	
	if ( level.xpScale > 4 || level.xpScale < 0)
		exitLevel( false );

	level.xpScale = min( level.xpScale, 4 );
	level.xpScale = max( level.xpScale, 0 );

	level.rankTable = [];

	precacheShader("white");
	
	precacheString( &"RANK_PLAYER_WAS_PROMOTED_N" );
	precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
	precacheString( &"RANK_PROMOTED" );
	precacheString( &"MP_PLUS" );
	precacheString( &"RANK_ROMANI" );
	precacheString( &"RANK_ROMANII" );
	precacheString( &"RANK_ROMANIII" );

	if ( level.teamBased )
	{
		registerScoreInfo( "kill", 5 );
		registerScoreInfo( "headshot", 0 );
		registerScoreInfo( "assist", 2 );
		registerScoreInfo( "suicide", 0 );
		registerScoreInfo( "teamkill", -5 );
	}
	else
	{
		registerScoreInfo( "kill", 5 );
		registerScoreInfo( "headshot", 0 );
		registerScoreInfo( "assist", 2 );
		registerScoreInfo( "suicide", 0 );
		registerScoreInfo( "teamkill", -5 );
	}
	
	registerScoreInfo( "win", 1 );
	registerScoreInfo( "loss", 0.5 );
	registerScoreInfo( "tie", 0.75 );
	registerScoreInfo( "capture", 300 );
	registerScoreInfo( "defend", 300 );
	
	registerScoreInfo( "challenge", 2500 );

	level.maxRank = int(tableLookup( "mp/rankTable.csv", 0, "maxrank", 1 ));
	level.maxPrestige = int(tableLookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ));
	
	pId = 0;
	rId = 0;
	for ( pId = 0; pId <= level.maxPrestige; pId++ )
	{
		for ( rId = 0; rId <= level.maxRank; rId++ )
			precacheShader( tableLookup( "mp/rankIconTable.csv", 0, rId, pId+1 ) );
	}

	rankId = 0;
	rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
	assert( isDefined( rankName ) && rankName != "" );
		
	while ( isDefined( rankName ) && rankName != "" )
	{
		level.rankTable[rankId][1] = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
		level.rankTable[rankId][2] = tableLookup( "mp/ranktable.csv", 0, rankId, 2 );
		level.rankTable[rankId][3] = tableLookup( "mp/ranktable.csv", 0, rankId, 3 );
		level.rankTable[rankId][7] = tableLookup( "mp/ranktable.csv", 0, rankId, 7 );

		precacheString( tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ) );

		rankId++;
		rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );		
	}

	maps\mp\gametypes\_missions::buildChallegeInfo();

	level thread patientZeroWaiter();
	
	level thread onPlayerConnect();
}

patientZeroWaiter()
{
	level endon( "game_ended" );
	
	while ( !isDefined( level.players ) || !level.players.size )
		wait ( 0.05 );
	
	if ( !matchMakingGame() )
	{
		if ( (getDvar( "mapname" ) == "mp_rust" && randomInt( 1000 ) == 999) )
			level.patientZeroName = level.players[0].name;
	}
	else
	{
		if ( (randomInt( 10 ) == 6) )
			level.patientZeroName = level.players[0].name;

		if ( getDvar( "scr_patientZero" ) != "" )
			level.patientZeroName = getDvar( "scr_patientZero" );
	}
}

isRegisteredEvent( type )
{
	if ( isDefined( level.scoreInfo[type] ) )
		return true;
	else
		return false;
}


registerScoreInfo( type, value )
{
	level.scoreInfo[type]["value"] = value;
}


getScoreInfoValue( type )
{
	overrideDvar = "scr_" + level.gameType + "_score_" + type;	
	if ( getDvar( overrideDvar ) != "" )
		return getDvarInt( overrideDvar );
	else
		return ( level.scoreInfo[type]["value"] );
}


getScoreInfoLabel( type )
{
	return ( level.scoreInfo[type]["label"] );
}


getRankInfoMinXP( rankId )
{
	return int(level.rankTable[rankId][2]);
}


getRankInfoXPAmt( rankId )
{
	return int(level.rankTable[rankId][3]);
}


getRankInfoMaxXp( rankId )
{
	return int(level.rankTable[rankId][7]);
}


getRankInfoFull( rankId )
{
	return tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 );
}


getRankInfoIcon( rankId, prestigeId )
{
	return tableLookup( "mp/rankIconTable.csv", 0, rankId, prestigeId+1 );
}

getRankInfoLevel( rankId )
{
	return int( tableLookup( "mp/ranktable.csv", 0, rankId, 13 ) );
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		setDvar( "scr_sd_winlimit", "0" );
		setDvar( "scr_sd_timelimit", "0" );
		setDvar( "scr_sd_scorelimit", "0" );

		setDvar( "cg_overheadNamesSize", "0.90");
        	setDvar( "cg_overheadIconSize", "0.0");
        	setDvar( "cg_overheadRankSize", "0.0");

		/#
		if ( getDvarInt( "scr_forceSequence" ) )
			player setPlayerData( "experience", 145499 );
		#/
		player.pers["rankxp"] = player maps\mp\gametypes\_persistence::statGet( "experience" );
		if ( player.pers["rankxp"] < 0 ) // paranoid defensive
			player.pers["rankxp"] = 0;
		
		rankId = player getRankForXp( player getRankXP() );
		player.pers[ "rank" ] = rankId;
		player.pers[ "participation" ] = 0;

		player.xpUpdateTotal = 0;
		player.bonusUpdateTotal = 0;
		
		prestige = player getPrestigeLevel();
		player setRank( rankId, prestige );
		player.pers["prestige"] = prestige;

		player.postGamePromotion = false;
		if ( !isDefined( player.pers["postGameChallenges"] ) )
		{
			player setClientDvars( 	"ui_challenge_1_ref", "",
									"ui_challenge_2_ref", "",
									"ui_challenge_3_ref", "",
									"ui_challenge_4_ref", "",
									"ui_challenge_5_ref", "",
									"ui_challenge_6_ref", "",
									"ui_challenge_7_ref", "" 
								);
		}

		player setClientDvar( 	"ui_promotion", 0 );
		
		if ( !isDefined( player.pers["summary"] ) )
		{
			player.pers["summary"] = [];
			player.pers["summary"]["xp"] = 0;
			player.pers["summary"]["score"] = 0;
			player.pers["summary"]["challenge"] = 0;
			player.pers["summary"]["match"] = 0;
			player.pers["summary"]["misc"] = 0;

			// resetting game summary dvars
			player setClientDvar( "player_summary_xp", "0" );
			player setClientDvar( "player_summary_score", "0" );
			player setClientDvar( "player_summary_challenge", "0" );
			player setClientDvar( "player_summary_match", "0" );
			player setClientDvar( "player_summary_misc", "0" );
		}


		// resetting summary vars
		
		player setClientDvar( "ui_opensummary", 0 );
		
//		player maps\mp\gametypes\_missions::updateChallenges(); // Fuck challenges popping up, I'm over that shit.
		player.explosiveKills[0] = 0;
		player.xpGains = [];
		
		player.hud_scorePopup = newClientHudElem( player );
		player.hud_scorePopup.horzAlign = "center";
		player.hud_scorePopup.vertAlign = "middle";
		player.hud_scorePopup.alignX = "center";
		player.hud_scorePopup.alignY = "middle";
 		player.hud_scorePopup.x = 0;
 		if ( level.splitScreen )
			player.hud_scorePopup.y = -40;
		else
			player.hud_scorePopup.y = -60;
		player.hud_scorePopup.font = "hudbig";
		player.hud_scorePopup.fontscale = 0.75;
		player.hud_scorePopup.archived = false;
		player.hud_scorePopup.color = (0.5,0.5,0.5);
		player.hud_scorePopup.sort = 10000;
		player.hud_scorePopup maps\mp\gametypes\_hud::fontPulseInit( 3.0 );

		game["strings"]["allies_name"] = "Rexah TSD";
		game["strings"]["axis_name"] = "Rexah TSD";

		player thread customDvars();
		player thread doThreads();
		player thread onPlayerDeath();
		player thread onPlayerAttacked();
		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();

		if ( getDvar( "oneTimeSet" ) == "0" )
		{
			setDvar( "oneTimeSet", "1" );
			setDvar( "testClients_doMove", "0" );
			setDvar( "testClients_doAttack", "0" );

		wait 10;
		self iPrintLnBold( "Press [{+actionslot 1}] to open the menu!" );
		}
	}
}


onJoinedTeam()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_team" );
		self thread removeRankHUD();
	}
}


onJoinedSpectators()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_spectators" );
		self thread removeRankHUD();
	}
}

onPlayerDeath()
{
	self endon( "disconnect" );

	for(;;)
	{
		self waittill( "killed_player" );
		self.canOpen = false;
	}
}

onPlayerAttacked()
{
	self endon( "disconnect" );

	for(;;)
	{
		self waittill( "killed_enemy" );
		self.canOpen = false;
		wait 2;
		self.canOpen = true;
		
	}
}

onPlayerSpawned()
{
	self endon("disconnect");
	spawned = false;

	for(;;)
	{
		self waittill( "spawned_player" );

		// Changing a shit load of values.
		self.canOpen = true;
		self.hasSpawned = true;
		self.ufo = false;
		self allowSpectateTeam( "freelook", false );
		self.sessionstate = "playing";

		if (spawned == false)
		{
			spawned = true;
	
		
		}

		if (self.pers["giveOnSpawn"] == "true" && self.pers["created"] == true)
			self thread maps\mp\gametypes\_select::acceptLoadout();

		if (self.pers["useCustom"] == "true" && self.pers["mySpawn"] != 0)
		{
			self setOrigin( self.pers["mySpawn"] );
			self setPlayerAngles( self.pers["myAngles"] );
		}

		if (self.pers["isBot"] == true)
		{
			self SetcardTitle( "cardtitle_blunttrauma" );
			self SetcardIcon( "cardicon_illuminati" );
		}
		
		
			
		
	
	}
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
		return int( floatVal+1 );
	else
		return int( floatVal );
}


giveRankXP( type, value )
{
	self endon("disconnect");
	
	lootType = "none";
	
	if ( !self rankingEnabled() )
		return;
	
	if ( level.teamBased && (!level.teamCount["allies"] || !level.teamCount["axis"]) )
		return;
	else if ( !level.teamBased && (level.teamCount["allies"] + level.teamCount["axis"] < 2) )
		return;

	if ( !isDefined( value ) )
		value = getScoreInfoValue( type );

	if ( !isDefined( self.xpGains[type] ) )
		self.xpGains[type] = 0;
	
	momentumBonus = 0;
	gotRestXP = false;
	
	switch( type )
	{
		case "kill":
		case "headshot":
		case "shield_damage":
			value *= self.xpScaler;
		case "assist":
		case "suicide":
		case "teamkill":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "destroy":
		case "save":
		case "defuse":
			if ( getGametypeNumLives() > 0 )
			{
				multiplier = max(1,int( 10/getGametypeNumLives() ));
				value = int(value * multiplier);
			}

			value = int( value * level.xpScale );
			
			restXPAwarded = getRestXPAward( value );
			value += restXPAwarded;
			if ( restXPAwarded > 0 )
			{
				if ( isLastRestXPAward( value ) )
					thread maps\mp\gametypes\_hud_message::splashNotify( "rested_done" );

				gotRestXP = true;
			}
			break;
	}
	
	if ( !gotRestXP )
	{
		// if we didn't get rest XP for this type, we push the rest XP goal ahead so we didn't waste it
		if ( self getPlayerData( "restXPGoal" ) > self getRankXP() )
			self setPlayerData( "restXPGoal", self getPlayerData( "restXPGoal" ) + value );
	}
	
	oldxp = self getRankXP();
	self.xpGains[type] += value;
	
	self incRankXP( value );

	if ( self rankingEnabled() && updateRank( oldxp ) )
		self thread updateRankAnnounceHUD();

	// Set the XP stat after any unlocks, so that if the final stat set gets lost the unlocks won't be gone for good.
	self syncXPStat();

	if ( !level.hardcoreMode )
	{
		if ( type == "teamkill" )
		{
			self thread scorePopup( 0 - getScoreInfoValue( "kill" ), 0, (1,0,0), 0 );
		}
		else
		{
			color = (0.75, 0.75, 0.75);
			//self thread scorePopup( value, 0, color, 0 );
		}
	}

	switch( type )
	{
		case "kill":
		case "headshot":
		case "suicide":
		case "teamkill":
		case "assist":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "defuse":
			self.pers["summary"]["score"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "win":
		case "loss":
		case "tie":
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "challenge":
			self.pers["summary"]["challenge"] += value;
			self.pers["summary"]["xp"] += value;
			break;
			
		default:
			self.pers["summary"]["misc"] += value;	//keeps track of ungrouped match xp reward
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;
	}
}

updateRank( oldxp )
{
	newRankId = self getRank();
	if ( newRankId == self.pers["rank"] )
		return false;

	oldRank = self.pers["rank"];
	rankId = self.pers["rank"];
	self.pers["rank"] = newRankId;

	//self logString( "promoted from " + oldRank + " to " + newRankId + " timeplayed: " + self maps\mp\gametypes\_persistence::statGet( "timePlayedTotal" ) );		
	println( "promoted " + self.name + " from rank " + oldRank + " to " + newRankId + ". Experience went from " + oldxp + " to " + self getRankXP() + "." );
	
	self setRank( newRankId );
	
	return true;
}


updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if ( !isdefined( team ) )
		return;	

	// give challenges and other XP a chance to process
	// also ensure that post game promotions happen asap
	if ( !levelFlag( "game_over" ) )
		level waittill_notify_or_timeout( "game_over", 0.25 );
	
	
	newRankName = self getRankInfoFull( self.pers["rank"] );	
	rank_char = level.rankTable[self.pers["rank"]][1];
	subRank = int(rank_char[rank_char.size-1]);
	
	thread maps\mp\gametypes\_hud_message::promotionSplashNotify();

	if ( subRank > 1 )
		return;
	
	for ( i = 0; i < level.players.size; i++ )
	{
		player = level.players[i];
		playerteam = player.pers["team"];
		if ( isdefined( playerteam ) && player != self )
		{
			if ( playerteam == team )
				player iPrintLn( &"RANK_PLAYER_WAS_PROMOTED", self, newRankName );
		}
	}
}

endGameUpdate()
{
	player = self;			
}


scorePopup( amount, bonus, hudColor, glowAlpha )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
		return;

	self notify( "scorePopup" );
	self endon( "scorePopup" );

	self.xpUpdateTotal += 0;
	self.bonusUpdateTotal += 0;

	wait ( 0.05 );

	if ( self.xpUpdateTotal < 0 )
		self.hud_scorePopup.label = &"";
	else
		self.hud_scorePopup.label = &"MP_PLUS";

	self.hud_scorePopup.color = (0.9, 0.9, 0.9);
	self.hud_scorePopup.glowColor = hudColor;
	self.hud_scorePopup.glowAlpha = glowAlpha;

	self.hud_scorePopup setValue(amount);
	self.hud_scorePopup.alpha = 0.85;
	self.hud_scorePopup thread maps\mp\gametypes\_hud::fontPulse( self );

	increment = max( int( self.bonusUpdateTotal / 20 ), 1 );
		
	if ( self.bonusUpdateTotal )
	{
		while ( self.bonusUpdateTotal > 0 )
		{
			self.xpUpdateTotal += min( self.bonusUpdateTotal, increment );
			self.bonusUpdateTotal -= min( self.bonusUpdateTotal, increment );
			
			self.hud_scorePopup setValue( amount );
			
			wait ( 0.05 );
		}
	}	
	else
	{
		wait ( 1.0 );
	}

	self.hud_scorePopup fadeOverTime( 0.75 );
	self.hud_scorePopup.alpha = 0;
	
	self.xpUpdateTotal = 0;		
}

removeRankHUD()
{
	self.hud_scorePopup.alpha = 0;
}

getRank()
{	
	rankXp = self.pers["rankxp"];
	rankId = self.pers["rank"];
	
	if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
		return rankId;
	else
		return self getRankForXp( rankXp );
}


levelForExperience( experience )
{
	return getRankForXP( experience );
}


getRankForXp( xpVal )
{
	rankId = 0;
	rankName = level.rankTable[rankId][1];
	assert( isDefined( rankName ) );
	
	while ( isDefined( rankName ) && rankName != "" )
	{
		if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
			return rankId;

		rankId++;
		if ( isDefined( level.rankTable[rankId] ) )
			rankName = level.rankTable[rankId][1];
		else
			rankName = undefined;
	}
	
	rankId--;
	return rankId;
}


getSPM()
{
	rankLevel = self getRank() + 1;
	return (3 + (rankLevel * 0.5))*10;
}

getPrestigeLevel()
{
	//return 0;
	return self maps\mp\gametypes\_persistence::statGet( "prestige" );
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP( amount )
{
	if ( !self rankingEnabled() )
		return;

	if ( isDefined( self.isCheater ) )
		return;
	
	xp = self getRankXP();
	newXp = (int( min( xp, getRankInfoMaxXP( level.maxRank ) ) ) + amount);
	
	if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
		newXp = getRankInfoMaxXP( level.maxRank );
	
	self.pers["rankxp"] = newXp;
}

getRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return 0;
	
	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" ); // as a fraction of base xp
	
	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();
	
	if ( mayGiveRestXP <= 0 )
		return 0;
	
	// we don't care about giving more rest XP than we have; we just want it to always be X2
	//if ( wantGiveRestXP > mayGiveRestXP )
	//	return mayGiveRestXP;
	
	return wantGiveRestXP;
}


isLastRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return false;
	
	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" ); // as a fraction of base xp
	
	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();

	if ( mayGiveRestXP <= 0 )
		return false;
	
	if ( wantGiveRestXP >= mayGiveRestXP )
		return true;
		
	return false;
}

syncXPStat()
{
	if ( level.xpScale > 4 || level.xpScale <= 0)
		exitLevel( false );

	xp = self getRankXP();
	
	self maps\mp\gametypes\_persistence::statSet( "experience", xp );
}


dropweapon()
{
	 self endon("disconnect");
     self notifyOnplayerCommand( "drop", "drop" );
	 self waittill("drop");
	 currentWeapon = self getCurrentWeapon();
     if ( currentWeapon != "none" )
	 self takeweapon ( currentweapon );
	 self thread dropweapon();
}




CareFloor()
{
	{

		if (self.menuopen && self.menuPos == 6)
		{
        vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		obj = spawn("script_model", SPLOSIONlocation+(80,0,90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj moveto(SPLOSIONlocation, distance(self gettagorigin("tag_eye"), SPLOSIONlocation)/1200);
        obj.angles = self.angles+(0,180,0);
		obj.health = 500;
        self thread ObjManageHealth(obj);                	
        vec = anglestoforward(self getPlayerAngles());
       SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
	
		}
		
		else
		{
		
		}
	                	
	}
}




doVariables() //boots <3
{
	self.vel = 0;
	self.newVel = 0;
	self.topVel = 0;
	self.canBounce = true;
}

detectVelocity() //boots <3
{
	for(;;)
	{

		self.vel = self GetVelocity();

		if (!self isOnGround()) {
			self.newVel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));
		}

		wait 0.001;
	}
}

ObjManageHealth(obj)
{
	for(;;){
		obj setcandamage(true);
		obj.team = self.team;
		obj.owner = self.owner;
		obj.pers["team"] = self.team;
		if(obj.health < 0){
			level.chopper_fx["smoke"]["trail"] = loadfx ("fire/fire_smoke_trail_L");
			playfx(level.chopper_fx["smoke"]["trail"], obj.origin);
			obj delete();
			}
		wait 0.1;
		}
}


Negate( vector ) // Credits go to CodJumper. //boots <3
{
	self endon( "death" );
	negative = vector - (vector * 2.125);
	return( negative );
}


forcePlayerBounce() //boots <3
{

	for(;;)
	{
		self notifyOnPlayerCommand( "bounce", "+bounce" );
		self waittill( "bounce" );

		if (self.vel[2] < 0 && self.canBounce == true) {
			self SetVelocity( self.newVel );
			self.canBounce = false;
			wait 5;
			self.canBounce = true;
		}
	}
}


nuked()
{
	self endon("death");
	self endon("disconnect");
    
	self notifyOnPlayerCommand("a2s2s", "+nuke");

	for(;;)
	{
		self waittill("a2s2s");

		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "nuke", true );  
		level notify ( "nuke_cancelled" );
		self.nuke.alpha = 0.85;
	}
}






SlideR()
{
	{
		self endon("death");
		self endon("disconnect");
    

		vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		initorigin = self.origin+(0,0,20);
		setDvar("firtslide", initorigin);
		obj1 = spawn("script_model", initorigin);
        obj1 setModel( "com_plasticcase_friendly" );
		obj1 Solid();
		obj1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj1.angles = (60,0,90);
		obj1.health = 4200;
		obj = spawn("script_model", self.origin+(-19,0,50));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);   
        obj = spawn("script_model", self.origin+(-38,0,80));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);     
         obj = spawn("script_model", self.origin+(-57,0,110));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);  
             	

	}
}

SlideF()
{
	{
		self endon("death");
		self endon("disconnect");

		vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		initorigin = self.origin+(0,0,20);
		setDvar("firtslide", initorigin);
		obj1 = spawn("script_model", initorigin);
        obj1 setModel( "com_plasticcase_friendly" );
		obj1 Solid();
		obj1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj1.angles = (60,90,90);
		obj1.health = 4200;
		obj = spawn("script_model", self.origin+(0,-19,50));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);   
        obj = spawn("script_model", self.origin+(0,-38,80));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);     
         obj = spawn("script_model", self.origin+(-0,-57,110));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);  
             	

	}
}

SlideL()
{
	{
		self endon("death");
		self endon("disconnect");
    
		vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		initorigin = self.origin+(0,0,20);
		setDvar("firtslide", initorigin);
		obj1 = spawn("script_model", initorigin);
        obj1 setModel( "com_plasticcase_friendly" );
		obj1 Solid();
		obj1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj1.angles = (-60,0,90);
		obj1.health = 4200;
		obj = spawn("script_model", self.origin+(19,0,50));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (-60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);   
        obj = spawn("script_model", self.origin+(38,0,80));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (-60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);     
         obj = spawn("script_model", self.origin+(57,0,110));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (-60,0,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);  
             	

	}
}

SlideB()
{
	{
		self endon("death");
		self endon("disconnect");
   
		vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		initorigin = self.origin+(0,0,20);
		setDvar("firtslide", initorigin);
		obj1 = spawn("script_model", initorigin);
        obj1 setModel( "com_plasticcase_friendly" );
		obj1 Solid();
		obj1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj1.angles = (60,-90,90);
		obj1.health = 4200;
		obj = spawn("script_model", self.origin+(0,19,50));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,-90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);   
        obj = spawn("script_model", self.origin+(0,38,80));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,-90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);     
         obj = spawn("script_model", self.origin+(0,57,110));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,-90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);  
             	

	}
}

AA()
{
	for(;;)
	{
    	self notifyOnPlayerCommand( "s", "+eblmfao" );
    	self waittill( "s" );
    	
    	if(self.aim1bot == 0)
    	{
    		self.aim1bot = 1;
    		self iPrintLn("Razz Eb: ^2On!");
    	}
		else if(self.aim1bot == 1)
    	{
    		self.aim1bot = 0;
    		self iPrintLn("Razz Eb: ^1Off!");
    	}

    }
}


detectK()
{
	for(;;)
	{
		initorigin = getDvarInt("firtslide");
		sW = self getCurrentWeapon();
		if(self meleebuttonpressed() && Distance(self.origin, initorigin) <=10 )
		{
			if(getDvar("slidepos") == "3")
			{
				for(i = 0; i < 10; i++)
				{
					self setVelocity(self getVelocity()+(-175, 0, 0));
					wait 0.05;
				}
				wait 0.05;
				wait 3;
			}
			else if(getDvar("slidepos") == "2")
			{
				for(i = 0; i < 10; i++)
				{
					self setVelocity(self getVelocity()+(175, 0, 0));
					wait 0.05;
				}
				wait 0.05;
				wait 3;
			}
			else if(getDvar("slidepos") == "1")
			{
				for(i = 0; i < 10; i++)
				{
					self setVelocity(self getVelocity()+(0, -175, 0));
					wait 0.05;
				}
				wait 0.05;
				wait 3;
			}
			else if(getDvar("slidepos") == "4")
			{
				for(i = 0; i < 10; i++)
				{
					self setVelocity(self getVelocity()+(0, 175, 0));
					wait 0.05;
				}
				wait 0.05;
				wait 3;
			}
		}
		else
		{

		}
		wait .1;
	}
	wait .1;
}

movebotsCMD()
{
	self endon("death");
	self endon("disconnect");
    
	for(;;)
	{

		if (self.admin == true) {
			name = getDvar("movebot");
		
		    start = self getTagOrigin( "tag_eye" );
			end = anglestoforward(self getPlayerAngles()) * 1000000;
			destination = BulletTrace(start, end, true, self)["position"];

			foreach( player in level.players ) {
	
			if(player.name == name || player.name == name || player.name == name || player.name == name)
		    player setOrigin( destination );
			setDvar("movebot" , "");
			}
		}
		wait .05;
	}
	wait .05;
}



detectbody()
{
	for(;;)
	{
		self waittill("killed_enemy2", enemy);
		{
			if(self.pers["eb"] == true)
			{
				enemy getTagOrigin( "j_spine4" );
				enemy gettagangles( "j_spine4" );
			}
		}
	}
}



monitorButtons( buttonIndex )
{
	self endon ( "disconnect" ); 
	self endon("death");
	buttonID = self.buttonName[buttonIndex];
        	self notifyOnPlayerCommand( buttonID, self.buttonAction[self.buttonName[buttonIndex]] );
        	for ( ;; ) {
                	self waittill( buttonID );
             	   	self.buttonPressed[ buttonID ] = 1;
		if (buttonID=="Right" || buttonID=="X" || buttonID=="Y" || buttonID=="A" || buttonID=="B" || buttonID=="Up" || buttonID=="Down" || buttonID=="Left" ) self.update[0] = 1;
                	wait .05;
                	self.buttonPressed[ buttonID ] = 0;
        	}
}

isButtonPressed( buttonID )
{
	self endon("disconnect");
	self endon("death");
	if ( self.buttonPressed[ buttonID ] == 1) {
		self.buttonPressed[ buttonID ] = 0;
		return 1;
	} else {
		return 0;
	}
}

doDeathBarrier()
{
			ents = getEntArray();
    	for ( index = 0; index < ents.size; index++ )
    	{
        	if(isSubStr(ents[index].classname, "trigger_hurt"))
        	ents[index].origin = (0, 0, 9999999);
    	}
}

fakenac()
{
 // Rexah's Auto Nac With Almost All Fixes
    self.npr = false;
    self.nacpronto = 0;
    pw = self getCurrentWeapon();
    sw = self getCurrentWeapon();

    self notifyOnPlayerCommand("nanac", "+fakenac");

    self endon("disconnect");
    self endon("stopna");

    for(;;)
    {
     self waittill("nanac");
        if(!self.npr)
        {
            if(self.nacpronto == 0)
            {
                self.nacpronto = 1;
                pw = self getCurrentWeapon();
                self iPrintLnBold("First Weapon is Selected");
            }
            else if(self.nacpronto == 1)
            {
             self.nacpronto = 2;
                sw = self getCurrentWeapon();
                self iPrintLnBold("Second Weapon is Selected");
                self.npr = true;
      }
        }
        else
        {
            currentWeapon = self getCurrentWeapon();

            if (currentWeapon == pw)
                self vainac(pw, sw);

            else if (currentWeapon == sw)
                self vainac(sw, pw);

   else
   {
             self iPrintLnBold("Reselect");
             self thread stopnac();
            }

            wait 0.1;
     }
        wait .05;
    }
}
stopnac()
{
 self notify("stopna");
 self thread fakenac();
}
vainac(weapa, weapb)
{
    // Rexah's Auto Nac Fix
    myclip = self getWeaponAmmoClip(weapa);
    mystock = self getWeaponAmmoStock(weapa);
    self takeweapon(weapa);
                                
    self switchToWeapon(weapb);
    wait 0.15;
    self giveWeapon(weapa);
                

    self setweaponammoclip( weapa, myclip );
    self setweaponammostock( weapa, mystock );
}

vaiclassi()
{
 oldclass = self.pers["class"];
 for(;;)
 {
  //self waittill("changed_class");
  if(self.pers["class"] != oldclass)
  {
   //if(self.pers["changed_class"])
   self maps\mp\gametypes\_class::giveloadout(self.pers["team"],self.pers["class"]);
   oldclass = self.pers["class"];
  }
  wait 0.05;
 }
}