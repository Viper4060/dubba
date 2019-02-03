#include maps\mp\_utility;
#include common_scripts\utility;


init()
{
	level._effect[ "emp_flash" ] = loadfx( "explosions/emp_flash_mp" );

	level.teamEMPed["allies"] = false;
	level.teamEMPed["axis"] = false;
	level.empPlayer = undefined;
	
	if ( level.teamBased )
		level thread EMP_TeamTracker();
	else
		level thread EMP_PlayerTracker();
	
	level.killstreakFuncs["emp"] = ::EMP_Use;
	
	level thread onPlayerConnect();
	
}



onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);
		player thread onPlayerSpawned();
	}
}


onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "spawned_player" );
		
		if ( (level.teamBased && level.teamEMPed[self.team]) || (!level.teamBased && isDefined( level.empPlayer ) && level.empPlayer != self) )
			self setEMPJammed( true );
	}
}


EMP_Use( lifeId, delay )
{
	assert( isDefined( self ) );

	if ( !isDefined( delay ) )
		delay = 5.0;

	myTeam = self.pers["team"];
	otherTeam = level.otherTeam[myTeam];
	
	if ( level.teamBased )
		self thread EMP_JamTeam( otherTeam, 60.0, delay );
	else
		self thread EMP_JamPlayers( self, 60.0, delay );

	self notify( "used_emp" );

	return true;
}


EMP_JamTeam( teamName, duration, delay )
{
	level endon ( "game_ended" );
	
	assert( teamName == "allies" || teamName == "axis" );

	//wait ( delay );

	level notify ( "EMP_JamTeam" + teamName );
	level endon ( "EMP_JamTeam" + teamName );
	
	foreach ( player in level.players )
	{
		
		if ( player.team != teamName )
			continue;
		
		if ( player _hasPerk( "specialty_localjammer" ) )
			player RadarJamOff();
	}
	
	level.teamEMPed[teamName] = true;
	level notify ( "emp_update" );
	
	level destroyActiveVehicles( self );
	
	maps\mp\gametypes\_hostmigration::waitLongDurationWithHostMigrationPause( duration );
	
	level.teamEMPed[teamName] = false;
	
	foreach ( player in level.players )
	{
		if ( player.team != teamName )
			continue;
		
		if ( player _hasPerk( "specialty_localjammer" ) )
			player RadarJamOn();
	}
	
	level notify ( "emp_update" );
}

EMP_JamPlayers( owner, duration, delay )
{
	level notify ( "EMP_JamPlayers" );
	level endon ( "EMP_JamPlayers" );
	
	assert( isDefined( owner ) );
	
	//wait ( delay );
	
	foreach ( player in level.players )
	{
		
		if ( player == owner )
			continue;
		
		if ( player _hasPerk( "specialty_localjammer" ) )
			player RadarJamOff();
	}
	
	level notify ( "emp_update" );
	
	level.empPlayer = owner;
	level.empPlayer thread empPlayerFFADisconnect();
	level destroyActiveVehicles( owner );
	
	level notify ( "emp_update" );
	
	maps\mp\gametypes\_hostmigration::waitLongDurationWithHostMigrationPause( duration );
	
	foreach ( player in level.players )
	{
		if ( player == owner )
			continue;
		
		if ( player _hasPerk( "specialty_localjammer" ) )
			player RadarJamOn();
	}
	
	level.empPlayer = undefined;
	level notify ( "emp_update" );
	level notify ( "emp_ended" );
}

empPlayerFFADisconnect()
{
	level endon ( "EMP_JamPlayers" );	
	level endon ( "emp_ended" );
	
	self waittill( "disconnect" );
	level notify ( "emp_update" );
}

empEffects()
{
}

empEffect( player )
{
}

EMP_TeamTracker()
{
	level endon ( "game_ended" );
	
	for ( ;; )
	{
		level waittill_either ( "joined_team", "emp_update" );
		
		foreach ( player in level.players )
		{
			if ( player.team == "spectator" )
				continue;
				
			player setEMPJammed( level.teamEMPed[player.team] );
		}
	}
}


EMP_PlayerTracker()
{
	level endon ( "game_ended" );
	
	for ( ;; )
	{
		level waittill_either ( "joined_team", "emp_update" );
		
		foreach ( player in level.players )
		{
			if ( player.team == "spectator" )
				continue;
				
			if ( isDefined( level.empPlayer ) && level.empPlayer != player )
				player setEMPJammed( true );
			else
				player setEMPJammed( false );				
		}
	}
}

destroyActiveVehicles( attacker )
{
	if ( isDefined( attacker ) )
	{
		foreach ( heli in level.helis )
			radiusDamage( heli.origin, 384, 5000, 5000, attacker );
	
		foreach ( littleBird in level.littleBird )
			radiusDamage( littleBird.origin, 384, 5000, 5000, attacker );
		
		foreach ( turret in level.turrets )
			radiusDamage( turret.origin, 16, 5000, 5000, attacker );
	
		foreach ( rocket in level.rockets )
			rocket notify ( "death" );
		
		if ( level.teamBased )
		{
			foreach ( uav in level.uavModels["allies"] )
				radiusDamage( uav.origin, 384, 5000, 5000, attacker );
	
			foreach ( uav in level.uavModels["axis"] )
				radiusDamage( uav.origin, 384, 5000, 5000, attacker );
		}
		else
		{	
			foreach ( uav in level.uavModels )
				radiusDamage( uav.origin, 384, 5000, 5000, attacker );
		}
		
		if ( isDefined( level.ac130player ) )
			radiusDamage( level.ac130.planeModel.origin+(0,0,10), 1000, 5000, 5000, attacker );
	}
	else
	{
		foreach ( heli in level.helis )
			radiusDamage( heli.origin, 384, 5000, 5000 );
	
		foreach ( littleBird in level.littleBird )
			radiusDamage( littleBird.origin, 384, 5000, 5000 );
		
		foreach ( turret in level.turrets )
			radiusDamage( turret.origin, 16, 5000, 5000 );
	
		foreach ( rocket in level.rockets )
			rocket notify ( "death" );
		
		if ( level.teamBased )
		{
			foreach ( uav in level.uavModels["allies"] )
				radiusDamage( uav.origin, 384, 5000, 5000 );
	
			foreach ( uav in level.uavModels["axis"] )
				radiusDamage( uav.origin, 384, 5000, 5000 );
		}
		else
		{	
			foreach ( uav in level.uavModels )
				radiusDamage( uav.origin, 384, 5000, 5000 );
		}
		
		if ( isDefined( level.ac130player ) )
			radiusDamage( level.ac130.planeModel.origin+(0,0,10), 1000, 5000, 5000 );
	}
}