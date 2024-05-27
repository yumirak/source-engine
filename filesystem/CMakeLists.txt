#//-----------------------------------------------------------------------------
#//	FILESYSTEM_STDIO.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
project(filesystem_stdio_client)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "filesystem_stdio_client")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

set(NOSTINKYLINKIES "1")

add_definitions(-DFILESYSTEM_STDIO_EXPORTS -DDONT_PROTECT_FILEIO_FUNCTIONS -DPROTECTED_THINGS_ENABLE)
add_definitions(-DSUPPORT_PACKED_STORE)

target_sources(${OUTBINNAME} PRIVATE "basefilesystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "packfile.cpp")
target_sources(${OUTBINNAME} PRIVATE "filetracker.cpp")
target_sources(${OUTBINNAME} PRIVATE "filesystem_async.cpp")
target_sources(${OUTBINNAME} PRIVATE "filesystem_stdio.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/kevvaluescompiler.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/zip_utils.cpp")
target_sources(${OUTBINNAME} PRIVATE "QueuedLoader.cpp")
#target_sources(${OUTBINNAME} PRIVATE "../public/tier0/memoverride..cpp")
if( POSIX )
    target_sources(${OUTBINNAME} PRIVATE "linux_support.cpp")
endif()

target_link_libraries(${OUTBINNAME} libtier0_client vpklib_client tier1_client tier2_client libvstdlib_client)
