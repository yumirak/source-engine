#//-----------------------------------------------------------------------------
#//	VGUI_SURFACELIB.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
project(vgui_surfacelib)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTLIBNAME "vgui_surfacelib")

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_lib_base.cmake)

if( LINUXALL )
    include_directories(/usr/include/freetype2)
    target_compile_options(${OUTLIBNAME} PRIVATE -fpic -fno-semantic-interposition)
endif()

target_sources(${OUTLIBNAME} PRIVATE "BitmapFont.cpp")
target_sources(${OUTLIBNAME} PRIVATE "FontAmalgam.cpp")
target_sources(${OUTLIBNAME} PRIVATE "FontManager.cpp")
target_sources(${OUTLIBNAME} PRIVATE "FontEffects.cpp")
target_sources(${OUTLIBNAME} PRIVATE "FontEffects.h")
if( WIN32 )
target_sources(${OUTLIBNAME} PRIVATE "Win32Font.cpp")#			[$WIN32 && !$X360]
endif()
#target_sources(${OUTLIBNAME} PRIVATE "Win32Font_x360.cpp")#	[$X360]
if( OSX )
target_sources(${OUTLIBNAME} PRIVATE "osxfont.cpp")#			[$OSXALL]
endif()
if( LINUXALL )
    target_sources(${OUTLIBNAME} PRIVATE "linuxfont.cpp")
endif()
