#//-----------------------------------------------------------------------------
#//	LAUNCHER.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
#dont build this on dedicated build
if( DEDICATED )
    return()
endif()
project(launcher_client)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "launcher_client")
set(OUTBINDIR ${SRCDIR}/../game/bin)

set(NOSTINKYLINKIES "1") #link this project carefully ourselves

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

add_definitions(-DLAUNCHERONLY -DALLOW_TEXT_MODE=1)

if( LINUXALL )
    target_link_libraries(${OUTBINNAME} SDL2)
endif()

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_init.cpp")
target_sources(${OUTBINNAME} PRIVATE "launcher.cpp")
target_sources(${OUTBINNAME} PRIVATE "reslistgenerator.cpp")

target_link_libraries(${OUTBINNAME}  libtier0_client tier1_client tier2_client tier3_client libvstdlib_client appframework_client )
target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/libsteam_api.so) # Link to proprietary steamapi
if( NOT IS_LIB_PROJECT AND GL )
    target_link_libraries(${OUTBINNAME} libtogl_client) # Link to precompiled togl
endif()
#libs = ['tier0','tier1','tier2','tier3','vstdlib','steam_api','appframework','SDL2','togl', 'UNWIND']
