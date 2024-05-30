#//-----------------------------------------------------------------------------
#//	SERVER_CSTRIKE15.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

#There are other projects in this folder, but this cmake is focused towards csgo a.k.a. cstrike15

cmake_minimum_required(VERSION 3.16)
set(GAMENAME "hl2")
set(NOSTINKYLINKIES "1")

add_definitions(-DHL2_CLIENT_DLL -DUSES_SAVERESTORE)

include( ./client_base.cmake )
#include( ./server_econ_base.cmake )

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE "-Wno-narrowing")
endif()
include_directories(${SRCDIR}/game/shared/hl2)
include_directories(${SRCDIR}/game/client/hl2)

#cstrike15 protos
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/cstrike15/cstrike15_gcmessages.proto "${GENERATED_PROTO_DIR}")
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/cstrike15/cstrike15_usermessages.proto "${GENERATED_PROTO_DIR}")

#$Project "Client (HL2)"
	#$Folder	"Source Files"
target_sources(${OUTBINNAME} PRIVATE "hud_chat.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_team_objectiveresource.cpp")
		#$Folder	"HL2 DLL"
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/basehlcombatweapon_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/achievements_hl2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_antlion_dust.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_ar2_explosion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_barnacle.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_barney.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_basehelicopter.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_basehlcombatweapon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_basehlplayer.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_citadel_effects.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_corpse.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_env_alyxtemp.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_env_headcrabcanister.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_env_starfield.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_func_tankmortar.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_hl2_playerlocaldata.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_info_teleporter_countdown.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_npc_antlionguard.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_npc_combinegunship.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_npc_manhack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_npc_rollermine.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_plasma_beam_node.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_prop_combine_ball.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_rotorwash.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_script_intro.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/script_intro_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_strider.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_te_concussiveexplosion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_te_flare.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_thumper_dust.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_vehicle_airboat.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_vehicle_cannon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_vehicle_crane.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_vehicle_prisoner_pod.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_weapon__stubs_hl2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_weapon_crossbow.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_weapon_physcannon.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/c_weapon_stunstick.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/clientmode_hlnormal.cpp")
	target_sources(${OUTBINNAME} PRIVATE "death.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/fx_antlion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/fx_bugbait.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/fx_hl2_impacts.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/fx_hl2_tracers.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl2_clientmode.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl2_gamerules.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl2_usermessages.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/hl_gamemovement.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl_in_main.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hl_prediction.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_ammo.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_battery.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_blood.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_credits.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_damageindicator.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_flashlight.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_health.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_poisondamageindicator.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hud_posture.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_quickinfo.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hud_squadstatus.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_suitpower.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_weaponselection.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/hud_zoom.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/shieldproxy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "hl2/vgui_rootpanel_hl2.cpp")
	target_sources(${OUTBINNAME} PRIVATE "episodic/c_vort_charge_token.cpp")

