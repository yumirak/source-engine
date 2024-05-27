cmake_minimum_required(VERSION 3.16)
project(libvstdlib)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "libvstdlib")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

add_definitions(-DVSTDLIB_DLL_EXPORT)

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE -U_FORTIFY_SOURCE -fno-stack-protector -fpic -fno-semantic-interposition)
endif()

if( WIN64 )
target_sources(${OUTBINNAME} PRIVATE "GetStackPtr64.masm") #[$WIN64]
endif()
if( NOT OSXALL )
target_sources(${OUTBINNAME} PRIVATE "coroutine.cpp")				#[!$X360 && !$OSXALL]
endif()
target_sources(${OUTBINNAME} PRIVATE "cvar.cpp")
target_sources(${OUTBINNAME} PRIVATE "jobthread.cpp")
target_sources(${OUTBINNAME} PRIVATE "KeyValuesSystem.cpp")
#target_sources(${OUTBINNAME} PRIVATE "osversion.cpp")
if( WINDOWS )
target_sources(${OUTBINNAME} PRIVATE "processutils.cpp")#			#[$WINDOWS]
endif()
target_sources(${OUTBINNAME} PRIVATE "random.cpp")
target_sources(${OUTBINNAME} PRIVATE "vcover.cpp")
