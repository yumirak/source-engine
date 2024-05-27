#//-----------------------------------------------------------------------------
#//	VGUIMATSURFACE.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
project(vguimatsurface)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "vguimatsurface")
set(OUTBINDIR ${SRCDIR}/../game/bin)

set(NOSTINKYLINKIES "1") #this project requires precise linking

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

if( LINUXALL )
    include_directories(/usr/include/freetype2)
endif()

add_definitions( -DVGUIMATSURFACE_DLL_EXPORT -DGAMEUI_EXPORTS -DDONT_PROTECT_FILEIO_FUNCTIONS ) # -DPROTECTED_THINGS_ENABLE -DBENCHMARK

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE -fpermissive)
endif()

target_sources(${OUTBINNAME} PRIVATE "Clip2D.cpp")
target_sources(${OUTBINNAME} PRIVATE "Cursor.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "FontTextureCache.cpp")
target_sources(${OUTBINNAME} PRIVATE "Input.cpp")
target_sources(${OUTBINNAME} PRIVATE "MatSystemSurface.cpp")
if(WIN32)
target_sources(${OUTBINNAME} PRIVATE "memorybitmap.cpp")						#[$WIN32]
endif()
target_sources(${OUTBINNAME} PRIVATE "TextureDictionary.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/vgui2/src/vgui_key_translation.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vgui_controls/vgui_controls.cpp")

target_link_libraries(${OUTBINNAME} bitmap mathlib libtier0 vgui_controls tier1 libvstdlib tier2 tier3 vgui_surfacelib )
#libs = [,'FT2','FC','SDL2']
if( LINUXALL )
    target_link_libraries(${OUTBINNAME} fontconfig freetype SDL2)
endif()
