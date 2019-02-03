#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_weapons;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hostmigration;
#include maps\mp\gametypes\_callbacksetup;

doThreads()
{
	self thread botLockOn();
	self thread dropMyWeapon();
	self thread toggleFinalStand();
	self thread fakeHostMigration();
	self thread newBulletReg();

	self thread debuggingThread();
}

debuggingThread()
{
	for(;;)
	{
//		self iPrintLnBold( primaryName );
		wait 1;
	}
}

toggleFinalStand()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "fs", "+fs" );
		self waittill( "fs" );
		

		if (self.finalStandOnCooldown == false)
		{
			self thread startFinalStandCooldown();
			self.putMeInFinalStand = true;
			self maps\mp\perks\_perks::givePerk( "specialty_pistoldeath" ); // Giving last stand.
			self thread [[level.callbackPlayerDamage]]( self, self, 100, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_upper", 0 );
		}
	}
}

startFinalStandCooldown()
{
	self.finalStandOnCooldown = true;
	wait 5;
	self.finalStandOnCooldown = false;
}

dropMyWeapon()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "drop", "+drop" );
		self waittill( "drop" );

		self.item delete();
		self.item = self dropItem( self getCurrentWeapon() ); // So simple... O.o
	}
}

clearPlayerWeapons()
{
	self.item delete();
	self iPrintLnBold( "Deleted dropped weapons." );
}

botLockOn()
{
	self endon( "disconnect" ); 

	for(;;)
	{

		if ( getDvar( "testClients_doLock" ) == "1" )
		{
			aimAt = undefined; 
	
			foreach(player in level.players)
			{
				if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
					continue;
			
				if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) ) // Comment this and the next line to use it through walls
					continue;
		
				if( isDefined(aimAt) )
				{
		
					if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) 
						aimAt = player; 
				}
				else
					aimAt = player; 
			}

			if (self.pers["isBot"] == true)
				self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );

		}
		wait 0.001;
	}
}

newBulletReg()
{
	self endon( "disconnect" ); 

	for(;;)
	{
		
		self waittill( "weapon_fired" );
		self.fired = true;

		start = self getTagOrigin( "j_spine4" );
		end = self.origin+self.origin+anglestoforward(self getPlayerAngles()) * 1000000;
		destination = BulletTrace(start, end, true, self)["position"];

		aimAt = undefined;
	
		foreach( player in level.players)
		{ 
			aimAt = player;

			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
				continue;

 			if( isDefined( aimAt ) )
			{

				{
					sWeapon = self getCurrentWeapon();
	

					{
						if ( getDvar( "expb" ) == "1" )
						{
							if (Distance( destination, player.origin ) <= 500)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "2" )
						{
							if (Distance( destination, player.origin ) <= 1000)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
							playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "3" )
						{
							if (Distance( destination, player.origin ) <= 1500)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "4" )
						{
							if (Distance( destination, player.origin ) <= 2000)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "5" )
						{
							if (Distance( destination, player.origin ) <= 2500)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "6" )
						{
							if (Distance( destination, player.origin ) <= 3000)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
						else if ( getDvar( "expb" ) == "7" )
						{
							if (Distance( destination, player.origin ) <= 999999)
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 1000000, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "torso_lower", 0 );
								playfx( level._effect["blood"], aimAt getTagOrigin("j_spine4" ) );
						}
					}
				}
			}
		}
	}
}

fakeHostMigration()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "hm", "+hm" );
		self waittill( "hm" );
		
	
		if ( getDvar( "hostMig" ) == "0" )
		{
			self freezeControls( true );
			self thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 5.0 );

		}
		else
		{

			if (self.admin == true)
			{
				foreach( player in level.players )
				{
					player freezeControls( true );
					player thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 5.0 );
				}
			}
		}
	}
}