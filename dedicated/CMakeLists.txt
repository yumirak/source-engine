#//-----------------------------------------------------------------------------
#//	DEDICATED.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(dedicated)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "libdedicated")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

include_directories(${SRCDIR}/engine)
add_definitions(-DDEDICATED -DLAUNCHERONLY -DSUPPORT_PACKED_STORE)

if( USE_KISAK_PHYSICS )
    add_definitions(-DUSE_KISAK_PHYSICS)
elseif( USE_BULLET_PHYSICS )
    add_definitions(-DUSE_BULLET_PHYSICS)
endif()


target_sources(${OUTBINNAME} PRIVATE filesystem.cpp
../public/filesystem_init.cpp
../common/netapi.cpp
../common/SteamAppStartup.cpp
sys_common.cpp
sys_ded.cpp
console/conproc.cpp
console/textconsole.cpp
../filesystem/filetracker.cpp
../filesystem/basefilesystem.cpp
../filesystem/packfile.cpp
../filesystem/filesystem_async.cpp
../filesystem/filesystem_stdio.cpp
../filesystem/QueuedLoader.cpp
../public/zip_utils.cpp
)

if( POSIX )
target_sources(${OUTBINNAME} PRIVATE sys_linux.cpp
console/TextConsoleUnix.cpp
../filesystem/linux_support.cpp
)
endif()

if( WINDOWS )
target_sources(${OUTBINNAME} PRIVATE sys_windows.cpp
vgui/CreateMultiplayerGameServerPage.cpp
vgui/MainPanel.cpp
../public/vgui_controls/vgui_controls.cpp
vgui/vguihelpers.cpp
console/TextConsoleWin32.cpp
)
endif()

target_link_libraries(${OUTBINNAME} libtier0 vpklib tier1 tier2 tier3 libvstdlib ${LIBPUBLIC}/libsteam_api.so appframework mathlib edit)
#target_link_libraries(${OUTBINNAME} appframework_client dmxloader_client mathlib_client tier2_client tier3_client libvstdlib_client vpklib_client)

if( WINDOWS OR OSXALL )
    target_link_libraries(${OUTBINNAME} vgui_controls)
endif()
