# Kisak-Strike: Gentoo Offensive
# Main CMake File

# List of targets from VPC
#                        Dmserializers*         Matchmaking_DS_CSGO*   ServerBrowser*         tier3*
#                        Dmxloader*             materialsystem*        Server_CSGO*           Unitlib*
# appframework*          engine*                mathlib*               shaderapiempty*        valve_avi*
# bitmap*                engine_ds              mathlib_extended*      shaderlib*             vgui2*
# bitmap_byteswap*       Fgdlib*                matsys_controls*                              vgui_controls*
# bonesetup*             filesystem_stdio*      meshutils*                                    vguimatsurface*
# Bzip2*                 inputsystem*           particles*             soundemittersystem*    vgui_surfacelib*
# choreoobjects*         interfaces*            quickhull*             soundsystem_lowlevel*  videocfg*
#                        launcher*              Raytrace*              stdshader_dx9*         vpklib*
#                        launcher_main*                                studiorender*          vscript*
#                        localize*                                                            vstdlib*
# Client_CSGO*           matchmakingbase*       resourcefile*          tier0*                 vtf*
# datacache*             matchmakingbase_ds*    responserules_runtime* tier1*
# Dedicated*             Matchmaking_CSGO*      SceneFileCache*        tier2*

cmake_minimum_required(VERSION 3.16)
project(KisakStrike)

include(build-options.cmake)

add_subdirectory(appframework)
add_subdirectory(external/crypto++-5.61)

add_subdirectory(gcsdk)
add_subdirectory(tier0)
add_subdirectory(tier1)
add_subdirectory(tier2)
add_subdirectory(tier3)
add_subdirectory(vstdlib)
add_subdirectory(mathlib) #also does mathlib_extended.
add_subdirectory(vpklib)
add_subdirectory(vgui2/matsys_controls)
add_subdirectory(vgui2/src)
add_subdirectory(vgui2/vgui_controls)
add_subdirectory(vgui2/vgui_surfacelib)
add_subdirectory(gameui)
#add_subdirectory(soundsystem/lowlevel)
#add_subdirectory(thirdparty/quickhull)
add_subdirectory(thirdparty/protobuf-2.5.0/cmake)
add_subdirectory(utils/bzip2)
add_subdirectory(utils/jpeglib)
add_subdirectory(unitlib)
#if( NOT DEDICATED )
add_subdirectory(video)
#endif()
add_subdirectory(vtf)
add_subdirectory(bitmap) #also does bitmap_byteswap
add_subdirectory(choreoobjects)
add_subdirectory(datacache)
add_subdirectory(datamodel)
if( DEDICATED )
#add_subdirectory(dedicated)
#add_subdirectory(dedicated_main)
endif()
add_subdirectory(dmxloader)
if( NOT DEDICATED)
#add_subdirectory(engine/voice_codecs/minimp3)
add_subdirectory(engine)
else()
#add_subdirectory(engine_ds)
endif()
add_subdirectory(filesystem)
add_subdirectory(inputsystem)
add_subdirectory(materialsystem)
add_subdirectory(materialsystem/shaderlib)
add_subdirectory(materialsystem/stdshaders)
#if( DEDICATED )
add_subdirectory(materialsystem/shaderapiempty)
#else()
add_subdirectory(materialsystem/shaderapidx9)
#endif()
add_subdirectory(particles)
add_subdirectory(raytrace)
add_subdirectory(scenefilecache)
add_subdirectory(serverbrowser)
add_subdirectory(soundemittersystem)
add_subdirectory(studiorender)
#if(NOT WIN32 AND NOT GL)
add_subdirectory(togl)
#endif()
#if(NOT DEDICATED)
add_subdirectory(vguimatsurface)
#endif()

#add_subdirectory(game/client) #CSGO Client
add_subdirectory(game/server) #CSGO Server
if( NOT DEDICATED )
add_subdirectory(launcher)
add_subdirectory(launcher_main) #The actual executable that just dlopen's launcher
endif()
