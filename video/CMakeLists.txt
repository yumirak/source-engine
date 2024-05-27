#//-----------------------------------------------------------------------------
#//	TOGL.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(video_services)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "video_services")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

if(POSIX)
    target_compile_options(${OUTBINNAME} PRIVATE -fpic -fno-semantic-interposition -Wno-narrowing)
endif()

#//-----------------------------------------------------------------------------
#// Sources & Headers
#//-----------------------------------------------------------------------------
target_sources(${OUTBINNAME} PRIVATE "videoservices.cpp")
target_sources(${OUTBINNAME} PRIVATE "../public/tier0/memoverride.cpp")

target_link_libraries(${OUTBINNAME} tier2_client tier3_client libvstdlib_client mathlib_client )
