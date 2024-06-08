#//-----------------------------------------------------------------------------
#//	ENGINE.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
# Possible Arguments used:
# -DUSE_VALVE_HRTF
#This is the non-dedicated engine
cmake_minimum_required(VERSION 3.16)
project(engine)

set(OUTBINNAME "engine")
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(OUTBINDIR ${SRCDIR}/../game/bin)
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)
#include(${CMAKE_MODULE_PATH}/protobuf_builder.cmake)

#include(engine_inc.cmake)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/audio)
#include_directories(${SRCDIR}/thirdparty/quickhull)
#include_directories(${SRCDIR}/external/crypto++-5.61)
include_directories(${SRCDIR}/engine/audio)
include_directories(${SRCDIR}/public/engine/audio)

set(NOSTINKYLINKIES "1")

if( WINDOWS )
    include_directories(${SRCDIR}/dx9sdk/include)
endif()

add_definitions(-D__USEA3D -D_ADD_EAX_ -DENGINE_DLL -DVERSION_SAFE_STEAM_API_INTERFACES -DUSE_BREAKPAD_HANDLER -DUSE_CONVARS -DVOICE_OVER_IP -DDD)

if( DEDICATED )
    add_definitions(-DDEDICATED -DSWDS -DNO_BINK)
endif()

#$Project "engine"
#{
	#$Folder "Client"
target_sources(${OUTBINNAME} PRIVATE "masterserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "decals.cpp") #
target_sources(${OUTBINNAME} PRIVATE "disp.cpp") #
target_sources(${OUTBINNAME} PRIVATE "disp_interface.cpp") #	/
target_sources(${OUTBINNAME} PRIVATE "disp_mapload.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gl_draw.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gl_rsurf.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gl_shader.cpp") #
target_sources(${OUTBINNAME} PRIVATE "socketcreator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "console.cpp") #
target_sources(${OUTBINNAME} PRIVATE "render_pch.cpp") #
target_sources(${OUTBINNAME} PRIVATE "l_studio.cpp") #
target_sources(${OUTBINNAME} PRIVATE "matsys_interface.cpp") #	/
target_sources(${OUTBINNAME} PRIVATE "modelloader.cpp") #
target_sources(${OUTBINNAME} PRIVATE "Overlay.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clientframe.cpp") #
target_sources(${OUTBINNAME} PRIVATE "decal_clip.cpp") #
target_sources(${OUTBINNAME} PRIVATE "demofile.cpp") #
target_sources(${OUTBINNAME} PRIVATE "DevShotGenerator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "OcclusionSystem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "tmessage.cpp") #
target_sources(${OUTBINNAME} PRIVATE "r_decal.cpp") #
target_sources(${OUTBINNAME} PRIVATE "r_linefile.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseclient.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseclientstate.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cbenchmark.cpp") #
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "cl_rcon.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cdll_engine_int.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cl_main.cpp") #		[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cl_demo.cpp") #		[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cl_demoaction.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cl_demoaction_types.cpp") #  	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_demoactioneditors.cpp") #	[!$DEDICATED] 	/
target_sources(${OUTBINNAME} PRIVATE "cl_demoactionmanager.cpp") #  [!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_demoeditorpanel.cpp") #  	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_demosmootherpanel.cpp") # 	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_demouipanel.cpp") #  		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_foguipanel.cpp") #  		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_txviewpanel.cpp") #	 	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_entityreport.cpp") #	 	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_ents_parse.cpp") #			[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_localnetworkbackdoor.cpp") # [!$DEDICATED] 	/
target_sources(${OUTBINNAME} PRIVATE "cl_parse_event.cpp") #	 	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_pluginhelpers.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_pred.cpp") #		 		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "cl_texturelistpanel.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "client.cpp") #				[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "colorcorrectionpanel.cpp") #	[!$DEDICATED] 	/
target_sources(${OUTBINNAME} PRIVATE "buildcubemaps.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "debug_leafvis.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "debugoverlay.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_drawlights.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_lightmap.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_matsysiface.cpp") # [!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_rlight.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_rmain.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_rmisc.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_screen.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "gl_warp.cpp") #		[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "rpt_engine.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "cl_steamauth.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "r_areaportal.cpp") #	[!$DEDICATED]	/

target_sources(${OUTBINNAME} PRIVATE "r_efx.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "view.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "shadowmgr.cpp") #		[!$DEDICATED]
else()
target_sources(${OUTBINNAME} PRIVATE "cl_null.cpp") #	[$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "sys_stubwind.cpp") #	[$DEDICATED]	/
endif()


	#$Folder "Server"
target_sources(${OUTBINNAME} PRIVATE "server_pch.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_ipratelimit.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_rcon.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_steamauth.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_uploaddata.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_uploadgamestats.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vengineserver_impl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_main.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_client.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_ents_write.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_filter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_framesnapshot.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_log.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_packedentities.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_plugin.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_precache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_redirect.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sv_remoteaccess.cpp") #


	#$Folder	"Source Files"
target_sources(${OUTBINNAME} PRIVATE "baseautocompletefilelist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "baseserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "bitbuf_errorhandler.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/blockingudpsocket.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/bsptreedata.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/builddisp.cpp") #
target_sources(${OUTBINNAME} PRIVATE "changeframelist.cpp") #
target_sources(${OUTBINNAME} PRIVATE "checksum_engine.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ccs.cpp") #
target_sources(${OUTBINNAME} PRIVATE "clockdriftmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cl_check_process.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cmd.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cmodel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cmodel_bsp.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cmodel_disp.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/collisionutils.cpp") #
target_sources(${OUTBINNAME} PRIVATE "common.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/crtmemdebug.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cvar.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/disp_common.cpp") #
target_sources(${OUTBINNAME} PRIVATE "disp_defs.cpp") #
target_sources(${OUTBINNAME} PRIVATE "disp_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/disp_powerinfo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dispcoll_common.cpp") #
target_sources(${OUTBINNAME} PRIVATE "DownloadListGenerator.cpp") #

target_sources(${OUTBINNAME} PRIVATE "dt.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_common_eng.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_encode.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_instrumentation.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_instrumentation_server.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_localtransfer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_recv.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_recv_decoder.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_recv_eng.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_send.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_send_eng.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_stack.cpp") #
target_sources(${OUTBINNAME} PRIVATE "dt_test.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_common.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_recv.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_send.cpp") #
target_sources(${OUTBINNAME} PRIVATE "enginesingleuserfilter.cpp") #
target_sources(${OUTBINNAME} PRIVATE "enginestats.cpp") #
target_sources(${OUTBINNAME} PRIVATE "enginethreads.cpp") #
target_sources(${OUTBINNAME} PRIVATE "enginetrace.cpp") #
target_sources(${OUTBINNAME} PRIVATE "filesystem_engine.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_init.cpp") #
target_sources(${OUTBINNAME} PRIVATE "filetransfermgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "GameEventManager.cpp") #
target_sources(${OUTBINNAME} PRIVATE "GameEventManagerOld.cpp") #
target_sources(${OUTBINNAME} PRIVATE "gametrace_engine.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvclient.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvclientstate.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvdemo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "hltvtest.cpp") #
target_sources(${OUTBINNAME} PRIVATE "host.cpp") #
target_sources(${OUTBINNAME} PRIVATE "host_cmd.cpp") #
target_sources(${OUTBINNAME} PRIVATE "host_listmaps.cpp") #
target_sources(${OUTBINNAME} PRIVATE "host_phonehome.cpp") #
target_sources(${OUTBINNAME} PRIVATE "host_state.cpp") #
target_sources(${OUTBINNAME} PRIVATE "initmathlib.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/language.cpp") #
target_sources(${OUTBINNAME} PRIVATE "LocalNetworkBackdoor.cpp") #
target_sources(${OUTBINNAME} PRIVATE "materialproxyfactory.cpp") #
target_sources(${OUTBINNAME} PRIVATE "mem_fgets.cpp") #
target_sources(${OUTBINNAME} PRIVATE "mod_vis.cpp") #
target_sources(${OUTBINNAME} PRIVATE "ModelInfo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "net_chan.cpp") #
target_sources(${OUTBINNAME} PRIVATE "net_synctags.cpp") #
target_sources(${OUTBINNAME} PRIVATE "net_ws.cpp") #
target_sources(${OUTBINNAME} PRIVATE "net_ws_queued_packet_sender.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/netmessages.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/steamid.cpp") #
target_sources(${OUTBINNAME} PRIVATE "networkstringtable.cpp") #
target_sources(${OUTBINNAME} PRIVATE "NetworkStringTableItem.cpp") #
target_sources(${OUTBINNAME} PRIVATE "networkstringtableserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/networkvar.cpp") #
target_sources(${OUTBINNAME} PRIVATE "packed_entity.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pure_server.cpp") #
target_sources(${OUTBINNAME} PRIVATE "pr_edict.cpp") #
target_sources(${OUTBINNAME} PRIVATE "precache.cpp") #
target_sources(${OUTBINNAME} PRIVATE "quakedef.cpp") #
target_sources(${OUTBINNAME} PRIVATE "randomstream.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/randoverride.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/registry.cpp") #
target_sources(${OUTBINNAME} PRIVATE "engine_replay_int.cpp") #
target_sources(${OUTBINNAME} PRIVATE "replay_internal.cpp") #
target_sources(${OUTBINNAME} PRIVATE "replaydemo.cpp") #
target_sources(${OUTBINNAME} PRIVATE "replayserver.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/sentence.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sound_shared.cpp") #
target_sources(${OUTBINNAME} PRIVATE "spatialpartition.cpp") #
target_sources(${OUTBINNAME} PRIVATE "staticpropmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/studio.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sys_dll.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sys_dll2.cpp") #
target_sources(${OUTBINNAME} PRIVATE "sys_engine.cpp") #
#target_sources(${OUTBINNAME} PRIVATE "sys_linuxwind.cpp") # [$POSIX]
target_sources(${OUTBINNAME} PRIVATE "testscriptmgr.cpp") #
target_sources(${OUTBINNAME} PRIVATE "traceinit.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vallocator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "voiceserver_impl.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vprof_engine.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vprof_record.cpp") #
target_sources(${OUTBINNAME} PRIVATE "world.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/XZip.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/XUnzip.cpp") #
target_sources(${OUTBINNAME} PRIVATE "zone.cpp") #
target_sources(${OUTBINNAME} PRIVATE "cheatcodes.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/editor_sendcommand.cpp") #
target_sources(${OUTBINNAME} PRIVATE "keys.cpp") #
target_sources(${OUTBINNAME} PRIVATE "networkstringtableclient.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/scratchpad3d.cpp") #
target_sources(${OUTBINNAME} PRIVATE "servermsghandler.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/lumpfiles.cpp") #
target_sources(${OUTBINNAME} PRIVATE "MapReslistGenerator.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/SourceAppInfo.cpp") #
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "cl_bounded_cvars.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "downloadthread.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "LoadScreenUpdate.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "matchmakinghost.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "matchmakingqos.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "matchmakingclient.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "matchmakingshared.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "matchmakingmigrate.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "replaydemoplayer.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "Session.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "sys_mainwind.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "bugreporter.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "download.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "host_saverestore.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "lightcache.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "saverestore_filesystem.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "sys_getmodes.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "vgui_askconnectpanel.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "xboxsystem.cpp") # [!$DEDICATED]
endif()
	#$Folder	"Audio"
target_sources(${OUTBINNAME} PRIVATE "snd_io.cpp") #
target_sources(${OUTBINNAME} PRIVATE "EngineSoundServer.cpp") #
target_sources(${OUTBINNAME} PRIVATE "audio/voice_gain.cpp") #
target_sources(${OUTBINNAME} PRIVATE "audio/voice_wavefile.cpp") #
target_sources(${OUTBINNAME} PRIVATE "audio/vox.cpp") #


if(POSIX)
target_sources(${OUTBINNAME} PRIVATE "audio/snd_posix.cpp") #		[$POSIX]
endif()
if(SDL)
target_sources(${OUTBINNAME} PRIVATE "audio/voice_record_sdl.cpp")
endif()
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "EngineSoundClient.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "engsoundservice.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/MPAFile.cpp") # [!$DEDICATED&&!$X360]
target_sources(${OUTBINNAME} PRIVATE "audio/MPAHeader.cpp") # [!$DEDICATED&&!$X360]
target_sources(${OUTBINNAME} PRIVATE "audio/circularbuffer.cpp") # [!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_common.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dma.cpp") #			[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dsp.cpp") #			[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_mix.cpp") #			[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_sentence_mixer.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_data.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_mixer.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_mixer_adpcm.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_source.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_temp.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_win.cpp") #			[!$DEDICATED]
endif()

		#// WIN32 only audio files
if(WINDOWS)
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_direct.cpp") #	[$WINDOWS]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_wave.cpp") #	[$WINDOWS]
target_sources(${OUTBINNAME} PRIVATE "audio/voice_mixer_controls.cpp") # [$WINDOWS]	/
target_sources(${OUTBINNAME} PRIVATE "audio/voice_record_dsound.cpp") #	[$WINDOWS]	/
endif()
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "audio/snd_mp3_source.cpp") #	[!$DEDICATED]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_mixer_mp3.cpp") #	[!$DEDICATED]	/
target_sources(${OUTBINNAME} PRIVATE "audio/VBRHeader.cpp") #		[!$DEDICATED&&!$X360]
target_sources(${OUTBINNAME} PRIVATE "audio/voice.cpp") #			[!$DEDICATED&&!$X360]
target_sources(${OUTBINNAME} PRIVATE "audio/voice_sound_engine_interface.cpp") #	[!$DEDICATED&&!$X360]
endif()
		#// X360 only audio files
#target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_xaudio.cpp") #		[$X360] /
#target_sources(${OUTBINNAME} PRIVATE "audio/snd_wave_mixer_xma.cpp") #	[$X360]


		#//$File "audio/snd_stubs.cpp") #
if( SDL AND NOT OSXALL )
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_sdl.cpp") #	[$SDL && !$OSXALL]
endif()
if( OSXALL )
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_openal.cpp") #	[$OSXALL]
target_sources(${OUTBINNAME} PRIVATE "audio/snd_dev_mac_audioqueue.cpp") #	[$OSXALL]
target_sources(${OUTBINNAME} PRIVATE "audio/voice_record_mac_audioqueue.cpp") #	[$OSXALL]
endif()
if( NOT DEDICATED AND (OSXALL OR LINUXALL) )
target_sources(${OUTBINNAME} PRIVATE "audio/voice_mixer_controls_openal.cpp") #	[$OSXALL||($LINUXALL&&!$DEDICATED)]
target_sources(${OUTBINNAME} PRIVATE "audio/voice_record_openal.cpp") #	[$OSXALL||($LINUXALL&&!$DEDICATED)]
endif()

		#$Folder	"VGUI Panels" [!$DEDICATED]
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vgui_controls/vgui_controls.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/vgui/vgui_basebudgetpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/vgui/vgui_budgetbargraphpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/vgui/vgui_budgethistorypanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/vgui/vgui_budgetpanelshared.cpp") #

target_sources(${OUTBINNAME} PRIVATE "perfuipanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_basepanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_baseui_interface.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_budgetpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_DebugSystemPanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_drawtreepanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_helpers.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_texturebudgetpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_vprofgraphpanel.cpp") #
target_sources(${OUTBINNAME} PRIVATE "vgui_vprofpanel.cpp") #
endif()
		#$Folder	"Tools Framework"
if( NOT DEDICATED )
target_sources(${OUTBINNAME} PRIVATE "enginetool.cpp") # [!$DEDICATED]
endif()
target_sources(${OUTBINNAME} PRIVATE "toolframework.cpp") #

target_link_libraries(${OUTBINNAME} libtier0 vgui_controls dmxloader tier1 tier2 tier3 bitmap libvstdlib appframework datamodel vtf mathlib)
target_link_libraries(${OUTBINNAME} "${LIBPUBLIC}/libsteam_api.so") # Link to proprietary steamapi
target_link_libraries(${OUTBINNAME} matsys_controls bzip2 jpeglib z openal curl )
target_link_libraries(${OUTBINNAME} SDL2 rt )#ssl crypto)


