set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)

MacroRequired( SRCDIR )
MacroRequired( SRVSRCDIR )
MacroRequired( GAMENAME )

set(NOSTINKYLINKIES "1")

set(OUTBINNAME "server")
set(OUTBINDIR "${SRCDIR}/../game/${GAMENAME}/bin")
#set(GENERATED_PROTO_DIR "${SRCDIR}/game/server/generated_proto")

add_definitions(-DGAME_DLL -DVECTOR -DVERSION_SAFE_STEAM_API_INTERFACES -DPROTECTED_THINGS_ENABLE)
add_definitions(-Dstrncpy=use_Q_strncpy_instead -D_snprintf=use_Q_snprintf_instead)

include_directories(${SRCDIR}/game/shared)
include_directories(${SRCDIR}/utils/common)
include_directories(${SRVSRCDIR})

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)
#include(${CMAKE_MODULE_PATH}/protobuf_builder.cmake)

#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/engine_gcmessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/netmessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/network_connection.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/gcsdk/steammessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/base_gcmessages.proto ${GENERATED_PROTO_DIR} )

#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievement_saverestore.cpp") #)
#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievementmgr.cpp") #)
#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievements_hlx.cpp") #)
#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/activitylist.cpp") #)
#target_sources(${OUTBINNAME} PRIVATE "${SRVSRCDIR}/ai_activity.cpp") #)


target_compile_options(${OUTBINNAME} PRIVATE -fpermissive)
#$Project
#{
#	$Folder "Replay"
#	{
target_sources(${OUTBINNAME} PRIVATE "gamedll_replay.cpp") #
#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/replay_gamestats_shared.cpp") #	[$BUILD_REPLAY]
#	}

#	$Folder	"Source Files"
#	{
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievement_saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievementmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievements_hlx.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/activitylist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_activity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_baseactor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basehumanoid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_flyer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_flyer_new.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_movement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_physicsflyer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_schedule.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_basenpc_squad.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_assault.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_fear.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_follow.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_lead.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_rappel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_behavior_standoff.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_blended_movement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_concommands.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_condition.cpp") #
target_sources(${OUTBINNAME} PRIVATE "AI_Criteria.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_default.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_dynamiclink.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_event.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_goalentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_hint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_hull.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_initutils.cpp") #
target_sources(${OUTBINNAME} PRIVATE "AI_Interest_Target.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_link.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_localnavigator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_looktarget.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_memory.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_motor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_moveprobe.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_moveshoot.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_movesolver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_namespaces.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_navigator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_network.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_networkmanager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_node.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_pathfinder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_planesolver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_playerally.cpp") #
target_sources(${OUTBINNAME} PRIVATE "AI_ResponseSystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_route.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_schedule.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_scriptconditions.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_senses.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_sentence.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_speech.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_speechfilter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_squad.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_squadslot.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_tacticalservices.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_task.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_trackpather.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_utils.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ai_waypoint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ammodef.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/animation.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/base_playeranimstate.cpp") #
target_sources(${OUTBINNAME} PRIVATE "base_transmit_proxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseachievement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseanimating.cpp") #
target_sources(${OUTBINNAME} PRIVATE "BaseAnimatingOverlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "basecombatcharacter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatcharacter_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "basecombatweapon.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatweapon_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseentity_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseflex.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basegrenade_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "basemultiplayerplayer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseparticleentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseplayer_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseprojectile.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseviewmodel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseviewmodel_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/beam_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "bitstring.cpp") #
target_sources(${OUTBINNAME} PRIVATE "bmodels.cpp") #
target_sources(${OUTBINNAME} PRIVATE "buttons.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cbase.cpp") #
target_sources(${OUTBINNAME} PRIVATE "client.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/collisionproperty.cpp") #
target_sources(${OUTBINNAME} PRIVATE "colorcorrection.cpp") #
target_sources(${OUTBINNAME} PRIVATE "colorcorrectionvolume.cpp") #
target_sources(${OUTBINNAME} PRIVATE "CommentarySystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "controlentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cplane.cpp") #
target_sources(${OUTBINNAME} PRIVATE "CRagdollMagnet.cpp") #
target_sources(${OUTBINNAME} PRIVATE "damagemodifier.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/death_pose.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/debugoverlay_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/decals.cpp") #
target_sources(${OUTBINNAME} PRIVATE "doors.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dynamiclight.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/effect_dispatch_data.cpp") #
target_sources(${OUTBINNAME} PRIVATE "effects.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EffectsServer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ehandle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "entityblocker.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EntityDissolve.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EntityFlame.cpp") #
target_sources(${OUTBINNAME} PRIVATE "entitylist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/entitylist_base.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EntityParticleTrail.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/EntityParticleTrail_Shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_debughistory.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_detail_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_effectsscript.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_entity_maker.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_particlescript.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_player_surface_trigger.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_projectedtexture.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_screenoverlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_texturetoggle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_tonemap_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_wind_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "env_zoom.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvBeam.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvFade.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvHudHint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvLaser.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvMessage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "envmicrophone.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvShake.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EnvSpark.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/eventlist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EventLog.cpp") #
target_sources(${OUTBINNAME} PRIVATE "explode.cpp") #
target_sources(${OUTBINNAME} PRIVATE "filters.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fire.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fire_smoke.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fish.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fogcontroller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "fourwheelvehiclephysics.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_areaportal.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_areaportalbase.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_areaportalwindow.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_break.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_breakablesurf.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_dust.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/func_ladder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_ladder_endpoint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_lod.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_movelinear.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_occluder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_reflective_glass.cpp") #
target_sources(${OUTBINNAME} PRIVATE "func_smokevolume.cpp") #
target_sources(${OUTBINNAME} PRIVATE "game.cpp") #
target_sources(${OUTBINNAME} PRIVATE "game_ui.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gameinterface.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamemovement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules_register.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/GameStats.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamestringpool.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gametrace_dll.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamevars_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gameweaponmanager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "genericactor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "genericmonster.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gib.cpp") #
target_sources(${OUTBINNAME} PRIVATE "globals.cpp") #
target_sources(${OUTBINNAME} PRIVATE "globalstate.cpp") #
target_sources(${OUTBINNAME} PRIVATE "guntarget.cpp") #
target_sources(${OUTBINNAME} PRIVATE "h_ai.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hierarchy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvdirector.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintmessage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintsystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/igamesystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "info_camera_link.cpp") #
target_sources(${OUTBINNAME} PRIVATE "info_overlay_accessor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "intermission.cpp") #
target_sources(${OUTBINNAME} PRIVATE "item_world.cpp") #
target_sources(${OUTBINNAME} PRIVATE "lightglow.cpp") #
target_sources(${OUTBINNAME} PRIVATE "lights.cpp") #
target_sources(${OUTBINNAME} PRIVATE "logic_measure_movement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "logic_navigation.cpp") #
target_sources(${OUTBINNAME} PRIVATE "logicauto.cpp") #
target_sources(${OUTBINNAME} PRIVATE "logicentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "logicrelay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "mapentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mapentities_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "maprules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "MaterialModifyControl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "message_entity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "modelentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ModelSoundsCache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "movehelper_server.cpp") #
target_sources(${OUTBINNAME} PRIVATE "movement.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/movevars_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/multiplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ndebugoverlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "npc_vehicledriver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/obstacle_pushaway.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_light.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_parse.cpp") #
target_sources(${OUTBINNAME} PRIVATE "particle_system.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particlesystemquery.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pathcorner.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pathtrack.cpp") #
target_sources(${OUTBINNAME} PRIVATE "phys_controller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physconstraint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_bone_follower.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_cannister.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_fx.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_impact_damage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_main.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_main_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_npc_solver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physics_prop_ragdoll.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "physobj.cpp") #
target_sources(${OUTBINNAME} PRIVATE "player.cpp") #
target_sources(${OUTBINNAME} PRIVATE "player_command.cpp") #
target_sources(${OUTBINNAME} PRIVATE "player_lagcompensation.cpp") #
target_sources(${OUTBINNAME} PRIVATE "player_pickup.cpp") #
target_sources(${OUTBINNAME} PRIVATE "player_resource.cpp") #
target_sources(${OUTBINNAME} PRIVATE "playerinfomanager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "playerlocaldata.cpp") #
target_sources(${OUTBINNAME} PRIVATE "plugin_check.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_bonusmaps_accessor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "point_camera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "point_devshot_camera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "point_playermoveconstraint.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_posecontroller.cpp") #
target_sources(${OUTBINNAME} PRIVATE "point_spotlight.cpp") #
target_sources(${OUTBINNAME} PRIVATE "point_template.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pointanglesensor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "PointAngularVelocitySensor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pointhurt.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pointteleport.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/precache_register.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictableid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "props.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/props_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/querycache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ragdoll_manager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ragdoll_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "RagdollBoogie.cpp") #
target_sources(${OUTBINNAME} PRIVATE "recipientfilter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "rope.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/rope_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/saverestore.cpp") #
target_sources(${OUTBINNAME} PRIVATE "saverestore_gamedll.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SceneCache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sceneentity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sceneentity_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "scratchpad_gamedll_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "scripted.cpp") #
target_sources(${OUTBINNAME} PRIVATE "scriptedtarget.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sendproxy.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sequence_Transitioner.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/serverbenchmark_base.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ServerNetworkProperty.cpp") #
target_sources(${OUTBINNAME} PRIVATE "shadowcontrol.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/simtimer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/singleplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "SkyCamera.cpp") #
target_sources(${OUTBINNAME} PRIVATE "slideshow_display.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sound.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SoundEmitterSystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "soundent.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/soundenvelope.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/SoundParametersInternal.cpp") #
target_sources(${OUTBINNAME} PRIVATE "soundscape.cpp") #
target_sources(${OUTBINNAME} PRIVATE "soundscape_system.cpp") #
target_sources(${OUTBINNAME} PRIVATE "spotlightend.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/Sprite.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sprite_perfmonitor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/studio_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "subs.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sun.cpp") #
target_sources(${OUTBINNAME} PRIVATE "tactical_mission.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/takedamageinfo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "tanktrain.cpp") #
target_sources(${OUTBINNAME} PRIVATE "team.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplay_gamerules.cpp") #
target_sources(${OUTBINNAME} PRIVATE "TemplateEntities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "tempmonster.cpp") #
target_sources(${OUTBINNAME} PRIVATE "tesla.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/test_ehandle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "test_proxytoggle.cpp") #
target_sources(${OUTBINNAME} PRIVATE "test_stressentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "testfunctions.cpp") #
target_sources(${OUTBINNAME} PRIVATE "testtraceline.cpp") #
target_sources(${OUTBINNAME} PRIVATE "textstatsmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "timedeventmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "trains.cpp") #
target_sources(${OUTBINNAME} PRIVATE "triggers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usercmd.cpp") #
target_sources(${OUTBINNAME} PRIVATE "util.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/util_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "variant_t.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vehicle_base.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vehicle_baseserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/vehicle_viewblend_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vguiscreen.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/voice_gamemgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "waterbullet.cpp") #
target_sources(${OUTBINNAME} PRIVATE "WaterLODControl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "wcedit.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_proficiency.cpp") #
target_sources(${OUTBINNAME} PRIVATE "weight_button.cpp") #
target_sources(${OUTBINNAME} PRIVATE "world.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mp_shareddefs.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/vote_controller.cpp") #
		#//Haptics
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/haptics/haptic_msgs.cpp") #
if(WIN32)
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/haptics/haptic_utils.cpp") #	[$WIN32]
endif()
		#// Not using precompiled header cbase.h

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/bone_setup.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/collisionutils.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_send.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_common.cpp") #			/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_send.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/editor_sendcommand.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "gamehandle.cpp") #									/
target_sources(${OUTBINNAME} PRIVATE "h_export.cpp") #										/
target_sources(${OUTBINNAME} PRIVATE "init_factory.cpp") #									/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/interpolatortypes.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/interval.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/keyframe/keyframe.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/language.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/map_utils.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/networkvar.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/steamid.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/randoverride.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/registry.cpp") #						/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/rope_physics.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/scratchpad3d.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/ScratchPadUtils.cpp") #				/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/server_class.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sheetsimulator.cpp") #			/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/simple_physics.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/stringregistry.cpp") #					/
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/studio.cpp") #							/
target_sources(${OUTBINNAME} PRIVATE "GameStats_BasicStatsFunctions.cpp") #

		#$Folder	"Precompiled Header"
	target_sources(${OUTBINNAME} PRIVATE "stdafx.cpp") #
		#$Folder	"temporary entities"
	target_sources(${OUTBINNAME} PRIVATE "basetempentity.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "event_tempentity_tester.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "movie_explosion.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "particle_fire.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "particle_smokegrenade.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "plasma.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "smokestack.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "smoke_trail.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SpriteTrail.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "steamjet.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_armorricochet.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_basebeam.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamentpoint.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beaments.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamfollow.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamlaser.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beampoints.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamring.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamringpoint.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_beamspline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_bloodsprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_bloodstream.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_breakmodel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_bspdecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_bubbles.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_bubbletrail.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_clientprojectile.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_decal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_dynamiclight.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_effect_dispatch.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_energysplash.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_explosion.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_fizz.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_footprintdecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "hl2/te_gaussexplosion.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_glassshatter.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_glowsprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_impact.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_killplayerattachments.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_largefunnel.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_muzzleflash.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_particlesystem.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_physicsprop.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_playerdecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_projecteddecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_showline.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_smoke.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_sparks.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_sprite.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_spritespray.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "te_worlddecal.cpp") #
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usermessages.cpp") #
	#$Folder	"Tools Framework"
target_sources(${OUTBINNAME} PRIVATE "entity_tools_server.cpp") #
target_sources(${OUTBINNAME} PRIVATE "toolframework_server.cpp") #



		#$Lib	choreoobjects
		#$Lib	dmxloader
		#$Lib	mathlib
		#$Lib	particles
		#$Lib	tier2
		#$Lib	tier3
target_link_libraries(${OUTBINNAME} libtier0 particles dmxloader tier1 tier2 tier3 mathlib libvstdlib choreoobjects ${LIBPUBLIC}/libsteam_api.so)
#libs = []
#target_link_libraries(${OUTBINNAME} choreoobjects dmxloader mathlib libtier0 tier1 libvstdlib)
#target_link_libraries(${OUTBINNAME} particles tier2 tier3 )
#target_link_libraries(${OUTBINNAME} ) # Link to proprietary steamapi
#target_link_libraries(${OUTBINNAME} kisak_gcsdk)
#target_link_libraries(${OUTBINNAME} libprotobuf) #from /thirdparty
#target_link_libraries(${OUTBINNAME} bitmap dmxloader tier2)
