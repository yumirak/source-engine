#//-----------------------------------------------------------------------------
#//	APPFRAMEWORK.cmake
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(appframework)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTLIBNAME "appframework")
set(AF_SRCDIR "${SRCDIR}/appframework")
set(AF_INCDIR "${SRCDIR}/public/appframework")

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_lib_base.cmake)

if( NOT IS_LIB_PROJECT AND GL )
    message(FATAL_ERROR "can't build appframework as dll")
    #		$AdditionalProjectDependencies	"$BASE;togl"	[!$IS_LIB_PROJECT && $GL]
endif()

if( (WINDOWS AND GL) OR LINUXALL )
    add_definitions(-DVERSION_SAFE_STEAM_API_INTERFACES -DDX_TO_GL_ABSTRACTION)
endif()

#Sources
if( LINUXALL )
    #Use system SDL2 for linux
    include_directories("/usr/include/SDL2")
    target_compile_options(${OUTLIBNAME} PRIVATE -fpic -fno-semantic-interposition)
    target_compile_options(${OUTLIBNAME} PRIVATE -fpermissive)
else()
    include_directories(${SRCDIR}/thirdparty/SDL2)
endif()

target_sources(${OUTLIBNAME} PRIVATE "${AF_SRCDIR}/AppSystemGroup.cpp")
target_sources(${OUTLIBNAME} PRIVATE "${SRCDIR}/public/filesystem_init.cpp")
if( WINDOWS )
    target_sources(${OUTLIBNAME} PRIVATE "vguimatsysapp.cpp")	#[$WIN32]
    target_sources(${OUTLIBNAME} PRIVATE "winapp.cpp")		#[$WIN32]
endif()
if( POSIX )
    target_sources(${OUTLIBNAME} PRIVATE "${AF_SRCDIR}/posixapp.cpp")
endif()
if( SDL )
    target_sources(${OUTLIBNAME} PRIVATE "${AF_SRCDIR}/sdlmgr.cpp")
endif()
if( OSXALL )
    if( SDL )
        target_sources(${OUTLIBNAME} PRIVATE "${AF_SRCDIR}/glmrendererinfo_osx.mm")
    else()
        target_sources(${OUTLIBNAME} PRIVATE "${AF_SRCDIR}/cocoamgr.mm")
    endif()
endif()

#$Folder	"Link Libraries"
#{
#    $ImpLib togl [!$IS_LIB_PROJECT && $GL]
#    $ImpLib SDL2 [!$IS_LIB_PROJECT && $SDL]
#}
