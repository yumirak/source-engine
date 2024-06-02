#//-----------------------------------------------------------------------------
#//	SERVER_TF.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
set(GAMENAME "tf")
set(NOSTINKYLINKIES "1")
set(GENERATED_PROTO_DIR "${SRCDIR}/game/server/generated_proto")
add_definitions(-DTF_DLL -DENABLE_GC_MATCHMAKING -DGLOWS_ENABLE -DUSE_DYNAMIC_ASSET_LOADING -DNEXT_BOT -DDISABLE_STEAM=1)

include( ./server_base.cmake )
include( ./server_econ_base.cmake )
include( ./nav_mesh.cmake )
if( LINUXALL )
    #target_compile_options(${OUTBINNAME} PRIVATE "-Wno-narrowing")
endif()
include_directories(${SRCDIR}/game/shared/tf)
include_directories(${SRCDIR}/game/server/tf)
include_directories(${SRCDIR}/game/server/NextBot)
include_directories(${SRCDIR}/game/shared/Multiplayer)
include_directories(${GENERATED_PROTO_DIR}/econ)

TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/tf/tf_gcmessages.proto "${GENERATED_PROTO_DIR}")
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/gcsdk/gcsystemmsgs.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/gcsdk/steammessages.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/base_gcmessages.proto ${GENERATED_PROTO_DIR} )
#TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/econ/econ_gcmessages.proto ${GENERATED_PROTO_DIR} )
#$Include "${SRCDIR}/game/server/server_base.vpc"
#$Include "${SRCDIR}/game/server/server_econ_base.vpc"
#$include "${SRCDIR}/game/shared/tf/tf_gcmessages_include.vpc"
#$Include "${SRCDIR}/game/server/nav_mesh.vpc"

#$Configuration
#{
#	$Compiler
#	{
#		$AdditionalIncludeDirectories	"$BASE;${SRCDIR}/game/shared/hl2;./tf;./tf/vgui;${SRCDIR}/statemachine;${SRCDIR}/game/shared/Multiplayer;${SRCDIR}/game/shared/tf"
#		$PreprocessorDefinitions		"$BASE;TF_DLL;ENABLE_GC_MATCHMAKING;GLOWS_ENABLE;USE_DYNAMIC_ASSET_LOADING;NEXT_BOT"
#	}
#}

#$Project "Server (TF)"
#{
#	$Folder	"Source Files"
#	{
		#-$File	"AI_ConCommands.cpp")
target_sources(${OUTBINNAME} PRIVATE "ai_relationship.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_concussion.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_contact.cpp")
target_sources(${OUTBINNAME} PRIVATE "basegrenade_timed.cpp")
target_sources(${OUTBINNAME} PRIVATE "hl2/Func_Monitor.cpp")
target_sources(${OUTBINNAME} PRIVATE "grenadethrown.cpp")
target_sources(${OUTBINNAME} PRIVATE "monstermaker.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/playerclass_info_parse.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hl2/survival_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_control_point.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_control_point_master.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_control_point_round.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_objectiveresource.cpp")
target_sources(${OUTBINNAME} PRIVATE "team_train_watcher.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplay_round_timer.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplayroundbased_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "trigger_area_capture.cpp")
		#$Folder	"Economy"
		#{
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item_inventory.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item_wearable.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_claimcode.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item_system.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item_schema.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_quest_restriction.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_wardata.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_ladder_data.cpp")
		#}

		#$Folder "Steam Workshop"
		#{
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/workshop/ugc_utils.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/tf/workshop/maps_workshop.cpp")
		#}

		#$Folder	"TF"
		#{
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_passtime_gun.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/passtime_game_events.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/passtime_convars.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/trigger_catapult_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_passtime_ball_spawn.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_passtime_goal.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_passtime_no_ball_zone.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_passtime_goalie_zone.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_glow.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_passtime_ball.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_passtime_logic.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/trigger_catapult.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/trigger_passtime_ball.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/passtime_ballcontroller.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/passtime_ballcontroller_homing.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/passtime_ballcontroller_playerseek.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_logic_on_holiday.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_demoman.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_engineer.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_heavy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_medic.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_pyro.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_scout.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_sniper.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_soldier.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_spy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_maps.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_mvm.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/achievements_tf_halloween.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/baseobject_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_ammopack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_rune.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_armor.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_bird.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/entity_bonuspack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/entity_halloween_pickup.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_currencypack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/entity_capture_flag.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_forcerespawn.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_game_text_tf.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_healthkit.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_intermission.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_roundwin.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_training_annotations.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/entity_tfstart.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_capture_zone.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_changeclass.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_forcefield.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_no_build.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_suggested_build.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_nogrenades.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_achievement.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_powerupvolume.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_regenerate.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_respawnroom.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_respawnflag.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/func_flag_alert.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/Multiplayer/multiplayer_animstate.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/te_tfblood.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_ammo_pack.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_autobalance.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_bot_temp.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_client.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_extra_map_entity.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_eventlog.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_filters.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_fx.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_fx_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_gameinterface.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_gamemovement.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_gamerules.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_classdata.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_gamestats.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_hltvdirector.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_mapinfo.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_obj_baseupgrade_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_item_powerup_bottle.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/quest_objective_trackers.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/quest_objective_manager.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/shared_object_tracker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_catapult.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_dispenser.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_sapper.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_sentrygun.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_spy_trap.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_obj_teleporter.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_objective_resource.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_player.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_player_resource.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_condition.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_player_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_playeranimstate.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_playerclass.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_playerclass_info_parse.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_playerclass_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_playermove.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_powerup.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_halloween_souls_pickup.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_projectile_base.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_projectile_nail.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_projectile_rocket.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/tf/serverbenchmark_tf.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_wartracker.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_shareddefs.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_duckleaderboard.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_tactical_mission.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_team.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_turret.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_triggers.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_entity_spawner.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_taunt_prop.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_props.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_generic_bomb.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_pumpkin_bomb.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_target_dummy.cpp")
	target_sources(${OUTBINNAME} PRIVATE "tf/tf_pushentity.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_usermessages.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_viewmodel.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/steamworks_gamestats.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_gamestats_shared.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/tf/tf_gc_api.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_revive.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_wheel_of_doom.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_logic_halloween_2014.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_logic_robot_destruction.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_robot_destruction_robot.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_logic_player_destruction.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/tf/tf_voteissues.cpp")
			#$Folder	"Weapon"
			#{
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_dropped_weapon.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_bat.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_bonesaw.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_bottle.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_buff_item.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/tf_weapon_builder.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_club.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_compound_bow.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_fireaxe.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_fists.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_flamethrower.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_grapplinghook.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_grenade_pipebomb.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_grenadelauncher.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_invis.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_jar.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_knife.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_laser_pointer.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_lunchbox.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_medigun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_minigun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_parachute.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_parse.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_particle_cannon.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_pda.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_pipebomblauncher.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_pistol.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_raygun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_revolver.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_rocketlauncher.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_shotgun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_shovel.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_smg.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_sniperrifle.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_sword.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_syringegun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_throwable.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_wrench.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase_grenadeproj.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase_merasmus_grenade.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase_gun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase_melee.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weaponbase_rocket.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_flaregun.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/tf_projectile_flare.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/tf_projectile_arrow.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/tf_projectile_energy_ball.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_projectile_energy_ring.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_wearable_item_demoshield.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_wearable_levelable_item.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_weapon_mechanical_arm.cpp")
			#}

			#$Folder	"Raid"
			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/raid/tf_raid_logic.cpp")
			#}

			#$Folder	"MiniGames"
			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/minigames/tf_duel.cpp")
			#}

			#$Folder	"Bot"
			#{
			#	$Folder	"Behavior"
			#	{
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_behavior.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_tactical_monitor.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_scenario_monitor.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_attack.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_seek_and_destroy.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_retreat_to_cover.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_melee_attack.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_approach_object.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_get_health.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_get_ammo.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_dead.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_move_to_vantage_point.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_taunt.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_use_teleporter.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_destroy_enemy_sentry.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_escort.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_use_item.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/tf_bot_mvm_deploy_bomb.cpp")
					#$Folder	"Scenario"
					#{
					#	$Folder	"CapturePoint"
					#	{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_point/tf_bot_capture_point.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_point/tf_bot_defend_point.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_point/tf_bot_defend_point_block_capture.cpp")

						#}

						#$Folder	"Payload"
						#{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/payload/tf_bot_payload_push.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/payload/tf_bot_payload_block.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/payload/tf_bot_payload_guard.cpp")
						#}

						#$Folder	"Raid"
						#{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/raid/tf_bot_wander.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/raid/tf_bot_companion.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/raid/tf_bot_mob_rush.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/raid/tf_bot_squad_attack.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/raid/tf_bot_guard_area.cpp")
						#}

						#$Folder	"CreepWave"
						#{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/creep_wave/tf_bot_creep_wave.cpp")
						#}

						#$Folder	"CaptureTheFlag"
						#{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_the_flag/tf_bot_fetch_flag.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_the_flag/tf_bot_deliver_flag.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_the_flag/tf_bot_escort_flag_carrier.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/scenario/capture_the_flag/tf_bot_attack_flag_defenders.cpp")
						#}
					#}

					#$Folder	"Engineer"
					#{
						#$Folder	"MvMEngineer"
						#{
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/mvm_engineer/tf_bot_mvm_engineer_idle.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/mvm_engineer/tf_bot_mvm_engineer_build_sentry.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/mvm_engineer/tf_bot_mvm_engineer_build_teleporter.cpp")
					target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/mvm_engineer/tf_bot_mvm_engineer_teleport_spawn.cpp")
						#}

				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_build.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_move_to_build.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_build_teleport_entrance.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_build_teleport_exit.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_build_sentrygun.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_build_dispenser.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/engineer/tf_bot_engineer_building.cpp")
					#}

					#$Folder	"Medic"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/medic/tf_bot_medic_heal.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/medic/tf_bot_medic_retreat.cpp")
					#}

					#$Folder	"Sniper"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/sniper/tf_bot_sniper_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/sniper/tf_bot_sniper_lurk.cpp")

					#}

					#$Folder	"Spy"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_infiltrate.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_backstab.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_sap.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_escape.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_leave_spawn_room.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_lurk.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/spy/tf_bot_spy_hide.cpp")
					#}

					#$Folder	"Demoman"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/demoman/tf_bot_prepare_stickybomb_trap.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/demoman/tf_bot_stickybomb_sentrygun.cpp")
					#}

					#$Folder	"NavEntities"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/nav_entities/tf_bot_nav_ent_move_to.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/nav_entities/tf_bot_nav_ent_wait.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/nav_entities/tf_bot_nav_ent_destroy_entity.cpp")
					#}

					#$Folder "Training"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/training/tf_bot_training.cpp")
					#}
					#$Folder "Missions"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/missions/tf_bot_mission_destroy_sentries.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/missions/tf_bot_mission_reprogrammed.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/missions/tf_bot_mission_suicide_bomber.cpp")
					#}

					#$Folder "Squad"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/behavior/squad/tf_bot_escort_squad_leader.cpp")
					#}
				#}

				#$Folder "MapEntities"
				#{
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_generator.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_proxy.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_hint_engineer_nest.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_hint_sentrygun.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_hint_teleporter_exit.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_hint_entity.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_roster.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_bot_hint.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_spawner_boss.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/bot/map_entities/tf_spawner.cpp")
				#}

		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot_manager.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot_vision.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot_body.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot_squad.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot/tf_bot_locomotion.cpp")
			#}

			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/nav_mesh/tf_nav_mesh.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/nav_mesh/tf_nav_mesh_edit.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/nav_mesh/tf_nav_area.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/nav_mesh/tf_path_follower.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/nav_mesh/tf_nav_interface.cpp")
			#}

			#$Folder "Halloween"
			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_base_boss.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/halloween/headless_hatman.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/halloween/headless_hatman_body.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_gift_spawn_locations.cpp")
				#$Folder "Behavior"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_behavior/headless_hatman_attack.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_behavior/headless_hatman_dying.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_behavior/headless_hatman_emerge.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/halloween_behavior/headless_hatman_terrify.cpp")
				#}

				#$Folder "Ghost"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/ghost/ghost.cpp")
				#}

				#$Folder "Eyeball Boss"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_boss.cpp")
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/halloween/eyeball_boss/teleport_vortex.cpp")
					#$Folder "Behavior"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_behavior.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_approach_target.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_emerge.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_idle.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_launch_rockets.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_notice.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_stunned.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_teleport.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/eyeball_boss/eyeball_behavior/eyeball_boss_emote.cpp")
					#}
				#}

				#$Folder "Merasmus"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_body.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_trick_or_treat_prop.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_dancer.cpp")
					#$Folder "Behavior"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_aoe_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_disguise.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_dying.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_reveal.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_staff_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_stunned.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_teleport.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_throwing_grenade.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/merasmus/merasmus_behavior/merasmus_zap.cpp")
					#}
				#}

				#$Folder "Zombie"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/zombie/zombie.cpp")
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/zombie/zombie_spawner.cpp")
					#$Folder "Behavior"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/zombie/zombie_behavior/zombie_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/zombie/zombie_behavior/zombie_special_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/halloween/zombie/zombie_behavior/zombie_spawn.cpp")
					#}
				#}

				#$Folder "Spell"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/halloween/spell/tf_spell_pickup.cpp")
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/halloween/tf_weapon_spellbook.cpp")
				#}
			#}

			#$Folder "Bot NPC"
			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc_mini.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc_body.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc_archer.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc_minion.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/bot_npc/bot_npc_decoy.cpp")
			#}

			#$Folder "PvE"
			#{
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/archer_proxy.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/monster_resource.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_mann_vs_machine_stats.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_upgrades_shared.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_populators.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_populator_spawners.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_population_manager.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_populator_interface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_boss_battle_logic.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_upgrades.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_mann_vs_machine_logic.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_base_boss.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_tank_boss.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_tank_boss_body.cpp")
		target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/tf_point_weapon_mimic.cpp")
				#$Folder "Boss Alpha"
				#{
			target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/boss_alpha.cpp")


					#$Folder "Behavior"
					#{
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_behavior.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_chase_victim.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_get_off_me.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_guard_spot.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_launch_grenades.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_launch_rockets.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_lost_victim.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_nuke_attack.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_stunned.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_tactical_monitor.cpp")
				target_sources(${OUTBINNAME} PRIVATE "tf/player_vs_environment/boss_alpha/behavior/boss_alpha_wait_for_players.cpp")
					#}
				#}
			#}

			#$Folder	"Matchmaking"
			#{
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/server/tf/tf_gc_server.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/lobby.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_lobby_server.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_party.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_matchmaking_shared.cpp")
		target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/tf/tf_match_description.cpp")
			#}
		#}

		#$Folder "NextBot"
		#{
	target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBot.cpp")
	target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotManager.cpp")
	target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotGroundLocomotion.cpp")
	target_sources(${OUTBINNAME} PRIVATE "NextBot/simple_bot.cpp")


			#$Folder "NextBotInterfaces"
			#{
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotBodyInterface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotComponentInterface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotIntentionInterface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotInterface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotLocomotionInterface.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NextBotVisionInterface.cpp")
			#}

			#{
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Path/NextBotChasePath.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Path/NextBotPath.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Path/NextBotPathFollow.cpp")
			#}

			#$Folder "NextBotPlayer"
			#{
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Player/NextBotPlayerBody.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Player/NextBotPlayerLocomotion.cpp")
		target_sources(${OUTBINNAME} PRIVATE "NextBot/Player/NextBotPlayer.cpp")
			#}

			#$Folder "NextBotNavMeshEntities"
			#{
		target_sources(${OUTBINNAME} PRIVATE "NextBot/NavMeshEntities/func_nav_prerequisite.cpp")
			#}
		#}
		#$Folder	"IFM"
		#{
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_ifmbase.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_ifmbasecamera.cpp")
	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_ifmsteadycam.cpp")
		#}
	#}
#}

