/*
	A HUGE fucking thanks to tinkie101, as this file is a complete rip from his Retarded Smart Enemies. Thanks bro. <3
*/

Title()
{
Title = "";
switch(randomint(0))
{
case 0 : 
Title = "cardtitle_camo_desert";
break;

}
self SetcardTitle( Title );
}

Emblem()
{
Emblem = "";

switch(randomint(0))
{
case 0 : 
Emblem = "cardicon_rank_pvt1";
break;
}
self SetcardIcon( Emblem );
}