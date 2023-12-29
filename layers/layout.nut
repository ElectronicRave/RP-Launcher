//////////////////////////////////////////////////////////////////////////////////////////////////
//
//      Attract-Mode Front-End - Layout based on "Pandora Box 6" sample layout
//
//////////////////////////////////////////////////////////////////////////////////////////////////

// USER OPTIONS

class UserConfig {
 </ label="Resolution Change", help="Change Resolution High to 1360x768 or Low to 640x480", options="High,Low", order=1 /> res_change="High";
 </ label="Media Sound", help="Enable or Disable Media Sound", options="On,Off", order=2 /> media_sound="On";
}

local my_config = fe.get_config();

////////////////////////////////////////////////////////////////////////////////////////////////

// CHANGE RESOLUTION HIGH

if ( my_config["res_change"] == "High" )
{
fe.do_nut( "resolution/high.nut" );

// MEDIA SOUND HIGH

if ( my_config["media_sound"] == "On" )
{
local snap = fe.add_artwork( "snap", 764, 193, 571, 354 );
snap.trigger = Transition.EndNavigation;
}

if (my_config["media_sound"] == "Off" )
{
local snap = fe.add_artwork( "snap", 764, 193, 571, 354 );
snap.video_flags = Vid.NoAudio;
snap.trigger = Transition.EndNavigation;
}

}

////////////////////////////////////////////////////////////////////////////////////////////////

// CHANGE RESOLUTION LOW

if (my_config["res_change"] == "Low" )
{
fe.do_nut( "resolution/low.nut" );

// MEDIA SOUND LOW

if ( my_config["media_sound"] == "On" )
{
local snap = fe.add_artwork( "snap", 360, 121, 267, 220 );
snap.trigger = Transition.EndNavigation;
}

if (my_config["media_sound"] == "Off" )
{
local snap = fe.add_artwork( "snap", 360, 121, 267, 220 );
snap.video_flags = Vid.NoAudio;
snap.trigger = Transition.EndNavigation;
}

}