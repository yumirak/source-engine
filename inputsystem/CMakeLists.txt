#//-----------------------------------------------------------------------------
#//	INPUTSYSTEM.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
#dont build this on dedicated build
if( DEDICATED )
    return()
endif()

project(inputsystem)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "inputsystem")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

add_definitions(-DVERSION_SAFE_STEAM_API_INTERFACES)

target_sources(${OUTBINNAME} PRIVATE "inputsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "steamcontroller.cpp")
target_sources(${OUTBINNAME} PRIVATE "key_translation.cpp")
target_sources(${OUTBINNAME} PRIVATE "touch_sdl.cpp")
target_sources(${OUTBINNAME} PRIVATE "joystick_sdl.cpp")

if( WIN32 )
    target_sources(${OUTBINNAME} PRIVATE "novint.cpp")
endif()

if( LINUXALL )
    target_link_libraries(${OUTBINNAME} SDL2)
endif()

target_link_libraries(${OUTBINNAME} tier2 )#mathlib)
#Requires evil proprietary link to libsteam_api
target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/libsteam_api.so)
