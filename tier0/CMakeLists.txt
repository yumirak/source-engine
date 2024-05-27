#//-----------------------------------------------------------------------------
#//	TIER0.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(libtier0_client)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "libtier0_client")
set(OUTBINDIR ${SRCDIR}/../game/bin)

set(NOSTINKYLINKIES "1")
set(NOSKELETONBASE "1")

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

add_definitions(-DTIER0_DLL_EXPORT)

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE -shared -fpic -fno-semantic-interposition)
endif()

target_sources(${OUTBINNAME} PRIVATE "assert_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "commandline.cpp")
target_sources(${OUTBINNAME} PRIVATE "cpu.cpp")
target_sources(${OUTBINNAME} PRIVATE "cpumonitoring.cpp")
target_sources(${OUTBINNAME} PRIVATE "cpu_usage.cpp")
target_sources(${OUTBINNAME} PRIVATE "dbg.cpp")
target_sources(${OUTBINNAME} PRIVATE "dynfunction.cpp")
target_sources(${OUTBINNAME} PRIVATE "fasttimer.cpp")
target_sources(${OUTBINNAME} PRIVATE "mem.cpp")
target_sources(${OUTBINNAME} PRIVATE "mem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "memdbg.cpp")
target_sources(${OUTBINNAME} PRIVATE "memstd.cpp")
target_sources(${OUTBINNAME} PRIVATE "memvalidate.cpp")
target_sources(${OUTBINNAME} PRIVATE "minidump.cpp")
target_sources(${OUTBINNAME} PRIVATE "pch_tier0.cpp")
target_sources(${OUTBINNAME} PRIVATE "PMELib.cpp")		#[$WINDOWS||$POSIX]
target_sources(${OUTBINNAME} PRIVATE "progressbar.cpp")
target_sources(${OUTBINNAME} PRIVATE "security.cpp")
target_sources(${OUTBINNAME} PRIVATE "systeminformation.cpp")
target_sources(${OUTBINNAME} PRIVATE "stacktools.cpp")
target_sources(${OUTBINNAME} PRIVATE "thread.cpp")		#[$WINDOWS||$POSIX]
target_sources(${OUTBINNAME} PRIVATE "threadtools.cpp")
target_sources(${OUTBINNAME} PRIVATE "tier0_strtools.cpp")
target_sources(${OUTBINNAME} PRIVATE "tslist.cpp")
target_sources(${OUTBINNAME} PRIVATE "vprof.cpp")
		#'../tier1/pathmatch.cpp' # [$LINUXALL]

if(WINDOWS)
	target_sources(${OUTBINNAME} PRIVATE "assert_dialog.rc")
	target_sources(${OUTBINNAME} PRIVATE "platform.cpp")
	target_sources(${OUTBINNAME} PRIVATE "pme.cpp")
	target_sources(${OUTBINNAME} PRIVATE "vcrmode.cpp")
	target_sources(${OUTBINNAME} PRIVATE "win32consoleio.cpp")
    if(WIN64)
    target_sources(${OUTBINNAME} PRIVATE "InterlockedCompareExchange128.masm")
    endif()
elseif ( POSIX )
	target_sources(${OUTBINNAME} PRIVATE "cpu_posix.cpp")
	target_sources(${OUTBINNAME} PRIVATE "platform_posix.cpp")
	target_sources(${OUTBINNAME} PRIVATE "pme_posix.cpp")
	target_sources(${OUTBINNAME} PRIVATE "vcrmode_posix.cpp")
endif()

target_link_libraries(${OUTBINNAME} dl pthread)
