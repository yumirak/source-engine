#//-----------------------------------------------------------------------------
#//	MATHLIB.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(mathlib_libraries)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/detect_platform.cmake)

## Build the regular mathlib ##
set(OUTLIBNAME "mathlib")
include(${CMAKE_MODULE_PATH}/source_lib_base.cmake)
include_directories(../public/mathlib)
target_compile_definitions(${OUTLIBNAME} PRIVATE -DMATHLIB_LIB)

if( LINUXALL )
    target_compile_options(${OUTLIBNAME} PRIVATE -Wno-narrowing -fpic -fno-semantic-interposition)
endif()

target_sources(${OUTLIBNAME} PRIVATE "color_conversion.cpp")
target_sources(${OUTLIBNAME} PRIVATE "halton.cpp")
target_sources(${OUTLIBNAME} PRIVATE "lightdesc.cpp")
target_sources(${OUTLIBNAME} PRIVATE "mathlib_base.cpp")
target_sources(${OUTLIBNAME} PRIVATE "powsse.cpp")
target_sources(${OUTLIBNAME} PRIVATE "sparse_convolution_noise.cpp")
target_sources(${OUTLIBNAME} PRIVATE "sseconst.cpp")
if( WINDOWS OR POSIX )
target_sources(${OUTLIBNAME} PRIVATE "sse.cpp")					#[$WINDOWS||$POSIX]
target_sources(${OUTLIBNAME} PRIVATE "3dnow.cpp")					#[$WINDOWS||$LINUX]
endif()
target_sources(${OUTLIBNAME} PRIVATE "ssenoise.cpp")
#target_sources(${OUTLIBNAME} PRIVATE "3dnow.cpp")					#[$WINDOWS||$LINUX]
target_sources(${OUTLIBNAME} PRIVATE "anorms.cpp")
target_sources(${OUTLIBNAME} PRIVATE "bumpvects.cpp")
target_sources(${OUTLIBNAME} PRIVATE "IceKey.cpp")
target_sources(${OUTLIBNAME} PRIVATE "imagequant.cpp")
target_sources(${OUTLIBNAME} PRIVATE "polyhedron.cpp")
target_sources(${OUTLIBNAME} PRIVATE "quantize.cpp")
target_sources(${OUTLIBNAME} PRIVATE "randsse.cpp")
target_sources(${OUTLIBNAME} PRIVATE "spherical.cpp")
target_sources(${OUTLIBNAME} PRIVATE "simdvectormatrix.cpp")
target_sources(${OUTLIBNAME} PRIVATE "vector.cpp")
target_sources(${OUTLIBNAME} PRIVATE "vmatrix.cpp")
target_sources(${OUTLIBNAME} PRIVATE "almostequal.cpp")

