#//-----------------------------------------------------------------------------
#//	SHADEREMPTY.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(shaderapiempty)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "shaderapiempty")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

include_directories(../)
add_definitions(-DSHADER_DLL_EXPORT -DPROTECTED_THINGS_ENABLE)

target_sources(${OUTBINNAME} PRIVATE "shaderapiempty.cpp")
