set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)

MacroRequired( SRCDIR )
#MacroRequired( SRVSRCDIR )
MacroRequired( GAMENAME )

set(NOSTINKYLINKIES "1")

set(OUTBINNAME "client")
set(OUTBINDIR "${SRCDIR}/../game/${GAMENAME}/bin")
#set(GENERATED_PROTO_DIR "${SRCDIR}/game/server/generated_proto")

add_definitions(-DNO_STRING_T -DCLIENT_DLL -DVECTOR -DVERSION_SAFE_STEAM_API_INTERFACES -DPROTECTED_THINGS_ENABLE)
add_definitions(-DENABLE_CHROMEHTMLWINDOW -DENABLE_STUDIO_SOFTBODY)
add_definitions(-Dstrncpy=use_Q_strncpy_instead -D_snprintf=use_Q_snprintf_instead)

include_directories(${SRCDIR}/game/shared)
include_directories(${SRCDIR}/utils/common)
include_directories(${CLISRCDIR})
include_directories(${CLISRCDIR}/game_controls)
#include_directories(${SRVSRCDIR})

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)
#include(${CMAKE_MODULE_PATH}/protobuf_builder.cmake)

#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/engine_gcmessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/netmessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/network_connection.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/gcsdk/steammessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/base_gcmessages.proto ${GENERATED_PROTO_DIR} )
target_compile_options(${OUTBINNAME} PRIVATE -fpermissive)
#$Project
	#$Folder "Replay"
target_sources(${OUTBINNAME} PRIVATE "replay/replaycamera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "replay/cdll_replay.cpp") #
	if( BUILD_REPLAY )
	target_sources(${OUTBINNAME} PRIVATE "replay/gamedefs.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/replay_ragdoll.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/replay_screenshot.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/replayperformanceplaybackhandler.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/replayrenderer.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/replayvideo.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/genericclassbased_replay.cpp") #	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/replay_gamestats_shared.cpp") #	[$BUILD_REPLAY]


	#$Folder "UI"	[$BUILD_REPLAY]
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserbasepage.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserbasepanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayconfirmquitdlg.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserdetailspanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowseritemmanager.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserlistitempanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserlistpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowsermainpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowsermovieplayerpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserpreviewpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaybrowserrenderdialog.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayinputpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replaymessagepanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayperformanceeditor.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayperformancesavedlg.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayrenderoverlay.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "replay/vgui/replayreminderpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/slideshowpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/movieobjects/timeutils.cpp") #
	endif()

	#$Folder	"Source Files"
target_sources(${OUTBINNAME} PRIVATE "hl2/C_Func_Monitor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "geiger.cpp") #
target_sources(${OUTBINNAME} PRIVATE "history_resource.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_weapon.cpp") #
target_sources(${OUTBINNAME} PRIVATE "train.cpp") #
if(NOT GAMENAME STREQUAL "tf")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse_default.cpp") #
endif()
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievement_saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievementmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievements_hlx.cpp") #
target_sources(${OUTBINNAME} PRIVATE "achievement_notification_panel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/activitylist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "alphamaterialproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ammodef.cpp") #
target_sources(${OUTBINNAME} PRIVATE "animatedentitytextureproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "animatedoffsettextureproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "animatedtextureproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "AnimateSpecificTextureProxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/animation.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/base_playeranimstate.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseachievement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseanimatedtextureproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseclientrendertargets.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatcharacter_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatweapon_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseentity_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basegrenade_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseparticleentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseplayer_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseprojectile.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseviewmodel_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "beamdraw.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/beam_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/bone_accessor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "bone_merge_cache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_ai_basehumanoid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_ai_basenpc.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseanimating.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseanimatingoverlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_basecombatcharacter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_basecombatweapon.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_basedoor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseflex.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseplayer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_baseviewmodel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_breakableprop.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_colorcorrection.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_colorcorrectionvolume.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_dynamiclight.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_entitydissolve.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_entityparticletrail.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_env_fog_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_env_particlescript.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_env_projectedtexture.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_env_screenoverlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_env_tonemap_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_fire_smoke.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_fish.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_areaportalwindow.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_breakablesurf.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_conveyor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_dust.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_lod.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_occluder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_reflective_glass.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_rotating.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_smokevolume.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_func_tracktrain.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_gib.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_hairball.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_info_overlay_accessor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_lightglow.cpp") #
target_sources(${OUTBINNAME} PRIVATE "C_MaterialModifyControl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_particle_system.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_physbox.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_physicsprop.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_physmagnet.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_pixel_visibility.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_plasma.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_playerresource.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_point_camera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_point_commentary_node.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_props.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_ragdoll_manager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_rope.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_rumble.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_sceneentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_shadowcontrol.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_slideshow_display.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_soundscape.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_spotlight_end.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_sprite.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_sprite_perfmonitor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_sun.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_team.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_tesla.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_test_proxytoggle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_user_message_register.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_vehicle_choreo_generic.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_vehicle_jeep.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_vguiscreen.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hl2/c_waterbullet.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hl2/hud_autoaim.cpp") #
target_sources(${OUTBINNAME} PRIVATE "C_WaterLODControl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "c_world.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/cam_thirdperson.cpp") #
target_sources(${OUTBINNAME} PRIVATE "camomaterialproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cdll_client_int.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cdll_bounded_cvars.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cdll_util.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cl_mat_stub.cpp") #
target_sources(${OUTBINNAME} PRIVATE "classmap.cpp") #
target_sources(${OUTBINNAME} PRIVATE "client_factorylist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "client_thinklist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "client_virtualreality.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clienteffectprecachesystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cliententitylist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientleafsystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientmode_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientshadowmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientsideeffects.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientsideeffects_test.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientsteamcontext.cpp") #
target_sources(${OUTBINNAME} PRIVATE "colorcorrectionmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "commentary_modelviewer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/collisionproperty.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/death_pose.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/debugoverlay_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/decals.cpp") #
target_sources(${OUTBINNAME} PRIVATE "detailobjectsystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dummyproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/effect_dispatch_data.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EffectsClient.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ehandle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/entitylist_base.cpp") #
target_sources(${OUTBINNAME} PRIVATE "entityoriginmaterialproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/EntityParticleTrail_Shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_detail_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_wind_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/eventlist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "flashlighteffect.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/func_ladder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "functionproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_blood.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_cube.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_explosion.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_fleck.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_impact.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_interpvalue.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_quad.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_shelleject.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_staticline.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_tracer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_trail.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fx_water.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamemovement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules_register.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/GameStats.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamestringpool.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gametrace_client.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamevars_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "glow_outline_effect.cpp") #
target_sources(${OUTBINNAME} PRIVATE "glow_overlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintmessage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintsystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvcamera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_animationinfo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_basechat.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_basetimer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_bitmapnumericdisplay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_closecaption.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_crosshair.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_element_helper.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hl2/hud_filmdemo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hl2/hud_hdrdemo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_hintdisplay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_msg.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_numericdisplay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_pdump.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_redraw.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hud_vehicle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/igamesystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "in_camera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "in_joystick.cpp") #
target_sources(${OUTBINNAME} PRIVATE "in_steamcontroller.cpp") #
#target_sources(${OUTBINNAME} PRIVATE "in_touch.cpp") #
target_sources(${OUTBINNAME} PRIVATE "in_main.cpp") #
target_sources(${OUTBINNAME} PRIVATE "initializer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "interpolatedvar.cpp") #
target_sources(${OUTBINNAME} PRIVATE "IsNPCProxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "lampbeamproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "lamphaloproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mapentities_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "mathproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "matrixproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "menu.cpp") #
target_sources(${OUTBINNAME} PRIVATE "message.cpp") #
target_sources(${OUTBINNAME} PRIVATE "movehelper_client.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/movevars_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/multiplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/obstacle_pushaway.cpp") #
target_sources(${OUTBINNAME} PRIVATE "panelmetaclassmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_collision.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_litsmokeemitter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_parse.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_property.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_proxies.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_simple3d.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particlemgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particles_attractor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particles_ez.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particles_localspace.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particles_new.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particles_simple.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particlesystemquery.cpp") #
target_sources(${OUTBINNAME} PRIVATE "perfvisualbenchmark.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_main_client.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_main_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physpropclientside.cpp") #
target_sources(${OUTBINNAME} PRIVATE "playerandobjectenumerator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "playerspawncache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_bonusmaps_accessor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_posecontroller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/precache_register.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictableid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "prediction.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictioncopy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/props_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "proxyentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ProxyHealth.cpp") #
target_sources(${OUTBINNAME} PRIVATE "proxyplayer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "proxypupil.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ragdoll.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ragdoll_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "recvproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "basepresence.cpp") #			[$WIN32||$POSIX]
#target_sources(${OUTBINNAME} PRIVATE "basepresence_xbox.cpp") #		[$X360]
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/rope_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sceneentity_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ScreenSpaceEffects.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sequence_Transitioner.cpp") #
target_sources(${OUTBINNAME} PRIVATE "simple_keys.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/simtimer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/singleplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SoundEmitterSystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/soundenvelope.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/SoundParametersInternal.cpp") #
target_sources(${OUTBINNAME} PRIVATE "splinepatch.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/Sprite.cpp") #
target_sources(${OUTBINNAME} PRIVATE "spritemodel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SpriteTrail.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/studio_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "studio_stats.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/takedamageinfo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplayroundbased_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/test_ehandle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "text_message.cpp") #
target_sources(${OUTBINNAME} PRIVATE "texturescrollmaterialproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "timematerialproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "toggletextureproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usercmd.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usermessages.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/util_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/vehicle_viewblend_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_avatarimage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_basepanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmapbutton.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmapimage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmappanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_schemevisualizer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_centerstringpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_consolepanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_debugoverlaypanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_fpspanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_game_viewport.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_grid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_int.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_loadingdiscpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_messagechars.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_netgraphpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_slideshow_display_screen.cpp") #
target_sources(${OUTBINNAME} PRIVATE "view.cpp") #
target_sources(${OUTBINNAME} PRIVATE "view_beams.cpp") #
target_sources(${OUTBINNAME} PRIVATE "view_effects.cpp") #
target_sources(${OUTBINNAME} PRIVATE "view_scene.cpp") #
target_sources(${OUTBINNAME} PRIVATE "viewangleanim.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ViewConeImage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "viewdebug.cpp") #
target_sources(${OUTBINNAME} PRIVATE "viewpostprocess.cpp") #
target_sources(${OUTBINNAME} PRIVATE "viewrender.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/voice_banmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/voice_status.cpp") #
target_sources(${OUTBINNAME} PRIVATE "warp_overlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "WaterLODMaterialProxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse.cpp") #
target_sources(${OUTBINNAME} PRIVATE "weapon_selection.cpp") #
target_sources(${OUTBINNAME} PRIVATE "weapons_resource.cpp") #
target_sources(${OUTBINNAME} PRIVATE "WorldDimsProxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_video.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_video_player.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mp_shareddefs.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/client/c_vote_controller.cpp") #
		#//Haptics
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/haptics/haptic_msgs.cpp") #	[!$X360]
if( WIN32 )
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/haptics/haptic_utils.cpp") #	[$WIN32&&!$X360]
endif()
#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/client/touch.cpp") #
		#$Folder	"Sixense"
	target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense_gesture_bindings.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sixense/sixense_convars.cpp") #


		#// Files not using precompiled header cbase.h

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/bone_setup.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/posedebugger.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/client_class.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/compiledcaptionswap.cpp") #			/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/collisionutils.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/crtmemdebug.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_recv.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_common.cpp") #			/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_recv.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/interpolatortypes.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/interval.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/language.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/networkvar.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/randoverride.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/steamid.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/rope_physics.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/scratchpad3d.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/ScratchPadUtils.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/sentence.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sheetsimulator.cpp") #			/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/simple_physics.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/stringregistry.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/studio.cpp") #							/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vallocator.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vgui_controls/vgui_controls.cpp") #	/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/jigglebones.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "hud_lcd.cpp") #										/
target_sources(${OUTBINNAME} PRIVATE "in_mouse.cpp") #										/
target_sources(${OUTBINNAME} PRIVATE "mumble.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/renamed_recvtable_compat.cpp") #		/
target_sources(${OUTBINNAME} PRIVATE "rendertexture.cpp") #

		#$Folder	"Temporary Entities"
	target_sources(${OUTBINNAME} PRIVATE "c_basetempentity.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_effects.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_impact_effects.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_movie_explosion.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_particle_fire.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_particle_smokegrenade.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_prop_vehicle.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_recipientfilter.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_smoke_trail.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_smokestack.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_steamjet.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_stickybolt.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_armorricochet.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_basebeam.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamentpoint.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beaments.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamfollow.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamlaser.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beampoints.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamring.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamringpoint.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_beamspline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_bloodsprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_bloodstream.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_breakmodel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_bspdecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_bubbles.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_bubbletrail.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_clientprojectile.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_decal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_dynamiclight.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_effect_dispatch.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_energysplash.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_explosion.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_fizz.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_footprint.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_glassshatter.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_glowsprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_impact.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_killplayerattachments.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_largefunnel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_legacytempents.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_muzzleflash.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_particlesystem.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_physicsprop.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_playerdecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_projecteddecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_showline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_smoke.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_sparks.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_sprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_spritespray.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_te_worlddecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_testtraceline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "c_tracer.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "fx.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "fx_discreetline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "fx_envelope.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "fx_line.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "fx_sparks.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "particlesphererenderer.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "smoke_fog_overlay.cpp") #

		#$Folder	"game_controls"
	target_sources(${OUTBINNAME} PRIVATE "game_controls/baseviewport.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/basemodelpanel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/basemodel_panel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/ClientScoreBoardDialog.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/commandmenu.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/intromenu.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/MapOverview.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/NavProgress.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/SpectatorGUI.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/teammenu.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/vguitextwindow.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "game_controls/IconPanel.cpp") #

target_sources(${OUTBINNAME} PRIVATE "mp3player.cpp") #


	#$Folder	"Tool Framework"
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/tools/bonelist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "entity_client_tools.cpp") #
target_sources(${OUTBINNAME} PRIVATE "toolframework_client.cpp") #


target_link_libraries(${OUTBINNAME} libtier0 particles dmxloader vgui_controls matsys_controls tier1 tier2 tier3 mathlib libvstdlib choreoobjects ${LIBPUBLIC}/libsteam_api.so bitmap vtf z)


#target_link_libraries(${OUTBINNAME} bitmap choreoobjects dmxloader mathlib matsys_controls particles )
#target_link_libraries(${OUTBINNAME} libtier0 tier1  tier2 tier3 libvstdlib vgui_controls vtf )
#target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/libsteam_api.so) # Link to proprietary steamapi
#target_link_libraries(${OUTBINNAME} curl z ssl)
#target_link_libraries(${OUTBINNAME} kisak_gcsdk)
#target_link_libraries(${OUTBINNAME} libprotobuf) #from /thirdparty
#target_link_libraries(${OUTBINNAME} bitmap dmxloader tier2)
