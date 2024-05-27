#//-----------------------------------------------------------------------------
#//	BITMAP.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(bitmap_libraries)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTLIBNAME "bitmap_client")

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_lib_base.cmake)
include_directories(${CMAKE_SOURCE_DIR}/thirdparty/stb)

if( LINUXALL )
    target_compile_options(${OUTLIBNAME} PRIVATE -fpic -fno-semantic-interposition)
endif()

target_sources(${OUTLIBNAME} PRIVATE "ImageByteSwap.cpp")
target_sources(${OUTLIBNAME} PRIVATE "colorconversion.cpp")
target_sources(${OUTLIBNAME} PRIVATE "float_bm.cpp")
target_sources(${OUTLIBNAME} PRIVATE "float_bm2.cpp")
target_sources(${OUTLIBNAME} PRIVATE "float_bm3.cpp")
if( WINDOWS )
target_sources(${OUTLIBNAME} PRIVATE "float_bm4.cpp")					#[$WINDOWS]
endif()
target_sources(${OUTLIBNAME} PRIVATE "float_bm_bilateral_filter.cpp")
target_sources(${OUTLIBNAME} PRIVATE "float_cube.cpp")
target_sources(${OUTLIBNAME} PRIVATE "imageformat.cpp")
target_sources(${OUTLIBNAME} PRIVATE "psd.cpp")
target_sources(${OUTLIBNAME} PRIVATE "resample.cpp")
target_sources(${OUTLIBNAME} PRIVATE "tgaloader.cpp")
target_sources(${OUTLIBNAME} PRIVATE "tgawriter.cpp")
target_sources(${OUTLIBNAME} PRIVATE "bitmap.cpp")

if( WINDOWS )
    #$Folder "Link Libraries" [$WINDOWS]
	#{
	#	$Lib	"$SRCDIR\lib\public\nvtc"			[!$WIN64]
	#	$Lib	"$SRCDIR\lib\public\nvtc64"			[$WIN64]
	#	$Lib	"bitmap_byteswap"
	#}
endif()
