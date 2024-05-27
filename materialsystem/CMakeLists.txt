#//-----------------------------------------------------------------------------
#//	MATERIALSYSTEM.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
project(materialsystem)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "materialsystem")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

set(SHADERAPIDX9DIR "shaderapidx9")
set(SHADERLIBDIR "shaderlib")
set(STDSHADERSDIR "stdshaders")
set(NOSTINKYLINKIES "1")
add_definitions(-DDEFINE_MATERIALSYSTEM_INTERFACE -DMATERIALSYSTEM_EXPORTS ) #-DPROTECTED_THINGS_ENABLE)
add_definitions(-Dstrncpy=use_Q_strncpy_instead -D_snprintf=use_Q_snprintf_instead)

if( DEDICATED )
    add_definitions(-DDEDICATED)
endif()

if( GL )
    add_definitions(-DGL_GLEXT_PROTOTYPES -DDX_TO_GL_ABSTRACTION)
    add_definitions(-fpermissive)
endif()
if( NOT POSIX )
    #"$BASE;strncpy=use_Q_strncpy_instead;_snprintf=use_Q_snprintf_instead" [!$POSIX]
endif()

target_sources(${OUTBINNAME} PRIVATE "CColorCorrection.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmaterial.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmaterial_queuefriendly.cpp")
target_sources(${OUTBINNAME} PRIVATE "CMaterialSubRect.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmaterialvar.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmatnullrendercontext.cpp")
target_sources(${OUTBINNAME} PRIVATE "colorspace.cpp")
target_sources(${OUTBINNAME} PRIVATE "ctexture.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "imagepacker.cpp")
target_sources(${OUTBINNAME} PRIVATE "mat_stub.cpp")
target_sources(${OUTBINNAME} PRIVATE "materialsystem_global.cpp")
target_sources(${OUTBINNAME} PRIVATE "morph.cpp")
target_sources(${OUTBINNAME} PRIVATE "occlusionquerymgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "shadersystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "texturemanager.cpp")
target_sources(${OUTBINNAME} PRIVATE "pch_materialsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmaterialdict.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmaterialsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmatlightmaps.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmatrendercontext.cpp")
target_sources(${OUTBINNAME} PRIVATE "cmatqueuedrendercontext.cpp")
target_sources(${OUTBINNAME} PRIVATE "ctexturecompositor.cpp")

target_link_libraries(${OUTBINNAME} libtier0 tier1 tier2 libvstdlib mathlib bitmap shaderlib vtf)
#libs = ['tier0','tier1','tier2','vstdlib','mathlib','bitmap','shaderlib','vtf']
#tier3 libvstdlib
#if building as dll..
#$Implib togl [!$IS_LIB_PROJECT && $GL && !$DEDICATED]
