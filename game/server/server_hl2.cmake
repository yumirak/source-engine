#//-----------------------------------------------------------------------------
#//	SERVER_CSTRIKE15.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

#There are other projects in this folder, but this cmake is focused towards csgo a.k.a. cstrike15

cmake_minimum_required(VERSION 3.16)
set(GAMENAME "hl2")
set(NOSTINKYLINKIES "1")

add_definitions(-DHL2_DLL -DUSES_SAVERESTORE)

include( ./server_base.cmake )
#include( ./server_econ_base.cmake )

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE "-Wno-narrowing")
endif()
include_directories(${SRCDIR}/game/shared/hl2)
include_directories(${SRCDIR}/game/server/hl2)

#cstrike15 protos
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/cstrike15/cstrike15_gcmessages.proto "${GENERATED_PROTO_DIR}")
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/cstrike15/cstrike15_usermessages.proto "${GENERATED_PROTO_DIR}")


#$Project "Server (HL2)"
#{
	#$Folder	"Source Files"
	#{
target_sources(${OUTBINNAME} PRIVATE "ai_eventresponse.cpp")
target_sources(${OUTBINNAME} PRIVATE "ai_relationship.cpp")
target_sources(${OUTBINNAME} PRIVATE "base_gameinterface.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_concussion.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_contact.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_timed.cpp")
target_sources(${OUTBINNAME} PRIVATE "hl2/Func_Monitor.cpp")
target_sources(${OUTBINNAME} PRIVATE "grenadethrown.cpp")
target_sources(${OUTBINNAME} PRIVATE "h_cycler.cpp")
target_sources(${OUTBINNAME} PRIVATE "logic_achievement.cpp")
target_sources(${OUTBINNAME} PRIVATE "monstermaker.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/survival_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_spawnpoint.cpp")
target_sources(${OUTBINNAME} PRIVATE "vehicle_choreo_generic.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse_default.cpp")

		#$Folder	"HL2 DLL"
		#{
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/achievements_hl2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_allymanager.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_behavior_actbusy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_behavior_functank.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_behavior_holster.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_behavior_operator.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_behavior_police.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_goal_police.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ai_spotlight.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/antlion_dust.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/antlion_maker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/ar2_explosion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "basebludgeonweapon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/basehlcombatweapon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/basehlcombatweapon_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/cbasehelicopter.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/cbasespriteprojectile.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/citadel_effects.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/combine_mine.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/env_alyxemp.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/env_headcrabcanister.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/env_speaker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/env_starfield.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/func_recharge.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/func_tank.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_ar2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_bugbait.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_frag.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_ai_network.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_client.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_eventlog.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl2_gamerules.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_gamestats.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_player.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_playerlocaldata.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_triggers.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl2_usermessages.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl_gamemovement.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl_playermove.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/info_darknessmode_lightsource.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/info_teleporter_countdown.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_ammo.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_battery.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_dynamic_resupply.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_healthkit.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_itemcrate.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/item_suit.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/look_door.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/monster_dummy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_alyx.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_antlion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_antlionguard.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_apcdriver.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_attackchopper.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_barnacle.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_barney.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_basescanner.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_BaseZombie.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_blob.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_breen.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_bullseye.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_citizen17.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_combine.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_combinecamera.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_combinedropship.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_combinegunship.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_combines.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_cranedriver.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_crow.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_dog.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_eli.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_enemyfinder.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_fastzombie.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_fisherman.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_gman.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_headcrab.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_ichthyosaur.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_kleiner.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_launcher.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_manhack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_metropolice.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_monk.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_mossman.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_playercompanion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_PoisonZombie.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_rollermine.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_scanner.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_stalker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_strider.cpp")
	target_sources(${OUTBINNAME} PRIVATE "npc_talker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_turret_ceiling.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_turret_floor.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_turret_ground.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_vortigaunt_episodic.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/npc_zombie.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/point_apc_controller.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/prop_combine_ball.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/prop_thumper.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/proto_sniper.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/rotorwash.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/script_intro.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/script_intro_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_airboat.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_cannon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_crane.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_jeep.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_prisoner_pod.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_viewcontroller.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_357.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_alyxgun.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_annabelle.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_ar2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_bugbait.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_citizenpackage.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_crossbow.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_crowbar.cpp")
	target_sources(${OUTBINNAME} PRIVATE "weapon_cubemap.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_frag.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_physcannon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_pistol.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_rpg.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_shotgun.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_smg1.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_stunstick.cpp")

			#$Folder	"Unused"
			#{
		target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_beam.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_homer.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/grenade_pathfollower.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/npc_missiledefense.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/vehicle_apc.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_cguard.cpp")
		target_sources(${OUTBINNAME} PRIVATE "hl2/weapon_flaregun.cpp")
			#}
		#}
	#}
#}
