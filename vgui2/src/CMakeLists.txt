#//-----------------------------------------------------------------------------
#//	VGUI_DLL.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(vgui2)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "vgui2")
set(OUTBINDIR ${SRCDIR}/../game/bin)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

if( LINUXALL )
    include_directories(/usr/include/freetype2)
endif()
include_directories(${SRCDIR}/thirdparty)
#$PreprocessorDefinitions		"$BASE;DONT_PROTECT_FILEIO_FUNCTIONS"

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE -fpermissive)
endif()

if( LINUXALL )
    target_link_libraries(${OUTBINNAME} SDL2)
endif()

target_sources(${OUTBINNAME} PRIVATE "Bitmap.cpp")
target_sources(${OUTBINNAME} PRIVATE "Bitmap.cpp")
target_sources(${OUTBINNAME} PRIVATE "Border.cpp")
target_sources(${OUTBINNAME} PRIVATE "ScalableImageBorder.cpp")
target_sources(${OUTBINNAME} PRIVATE "ImageBorder.cpp")
target_sources(${OUTBINNAME} PRIVATE "fileimage.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_init.cpp")
target_sources(${OUTBINNAME} PRIVATE "InputWin32.cpp")
target_sources(${OUTBINNAME} PRIVATE "LocalizedStringTable.cpp")
target_sources(${OUTBINNAME} PRIVATE "MemoryBitmap.cpp")
target_sources(${OUTBINNAME} PRIVATE "MessageListener.cpp")
target_sources(${OUTBINNAME} PRIVATE "Scheme.cpp")
if( WINDOWS )
if( WIN32 )
target_sources(${OUTBINNAME} PRIVATE "Surface.cpp")#					[$WIN32]
endif()
target_sources(${OUTBINNAME} PRIVATE "System.cpp")#					[$WINDOWS||$X360]
endif()
if(POSIX)
target_sources(${OUTBINNAME} PRIVATE "system_posix.cpp")# [$POSIX]
endif()
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/UnicodeFileHelpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_internal.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_key_translation.cpp")
target_sources(${OUTBINNAME} PRIVATE "VPanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "VPanelWrapper.cpp")
target_sources(${OUTBINNAME} PRIVATE "keyrepeat.cpp")

target_link_libraries(${OUTBINNAME} libvstdlib vgui_surfacelib tier2 tier3 )
