include("${CMAKE_MODULE_PATH}/common_functions.cmake")
include("${CMAKE_MODULE_PATH}/source_posix_base.cmake")

MacroRequired(SRCDIR)
MacroRequired(OUTBINNAME)
MacroRequired(OUTBINDIR)

set( IS_LIB_PROJECT "1")

add_definitions( -DEXENAME=${OUTBINNAME} )

add_executable(${OUTBINNAME})

set_target_properties(${OUTBINNAME} PROPERTIES OUTPUT_NAME "${OUTBINNAME}")
set_target_properties(${OUTBINNAME} PROPERTIES SUFFIX "")
set_target_properties(${OUTBINNAME} PROPERTIES PREFIX "")

message("Adding executable target: ${OUTBINNAME}\n")

set_target_properties( ${OUTBINNAME} PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${OUTBINDIR}"
        LIBRARY_OUTPUT_DIRECTORY "${OUTBINDIR}"
        RUNTIME_OUTPUT_DIRECTORY "${OUTBINDIR}"
        )

if( LINUXALL AND NOT DEDICATED )
    #// In order to get the Valve standard allocator memory alignment (16-byte
    #// alignment for objects that are a multiple of 16 bytes) we use tcmalloc.
    #// Using -l will ask the linker to use it, but if there are no references
    #// to malloc/free then it may not actually use it. Wrapping the flag in the
    #// as-needed controls forces it to be pulled in (from libtcmalloc_minimal.so).
    #target_compile_options(${OUTBINNAME} PRIVATE "-Wl,--no-as-needed -ltcmalloc_minimal -Wl,--as-needed")
endif()

if( NOSKELETONBASE )
    message(STATUS "Not including Skeleton base.")
else()
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/tier0/memoverride.cpp")
endif()


