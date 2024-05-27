include("${CMAKE_MODULE_PATH}/common_functions.cmake")

########source_lowest_base########
if(STATIC_LINK)
    add_definitions(-DSTATIC_LINK)
endif()
##################################

MacroRequired(SRCDIR)
MacroRequired(_DLL_EXT)

set(LIBPUBLIC "${SRCDIR}/lib/public${PLATSUBDIR}") #this is where static libs are
set(LIBCOMMON "${SRCDIR}/lib/common${PLATSUBDIR}")
set(DEVTOOLS "${SRCDIR}/devtools")

set(CMAKE_CXX_STANDARD "11")
set(CMAKE_CXX_STANDARD_REQUIRED YES)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
    message(STATUS "Build type not specified")
endif(NOT CMAKE_BUILD_TYPE)

set(LINUX_FLAGS_COMMON " -march=core2 -Wno-invalid-offsetof -Wno-ignored-attributes -Wno-enum-compare -Werror=return-type -Wno-write-strings ")
set(LINUX_DEBUG_FLAGS " -ggdb3 -Og") # -fno-eliminate-unused-debug-symbols
set(LINUX_RELEASE_FLAGS " -ggdb0 -O2 ")

if (CMAKE_BUILD_TYPE STREQUAL "DEBUG")
    message(STATUS "Building in Debug mode")
    add_definitions(-DDEBUG -D_DEBUG -DDBGFLAG_ASSERT)
    if( OSXALL )
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -gdwarf-2 -g2 -Og -march=native")
    elseif( LINUXALL )
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LINUX_DEBUG_FLAGS} ${LINUX_FLAGS_COMMON}")
    endif()
else()
    message(STATUS "Building in Release mode")
    add_definitions(-DNDEBUG)
    if( OSXALL )
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -gdwarf-2 -g2 -O2 -march=native")
    elseif( LINUXALL )
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LINUX_RELEASE_FLAGS} ${LINUX_FLAGS_COMMON}")
    endif()
endif()

#$Compiler
include_directories("${SRCDIR}/common")
include_directories("${SRCDIR}/public")
include_directories("${SRCDIR}/public/tier0")
include_directories("${SRCDIR}/public/tier1")

add_definitions(-DGNUC -DPOSIX -DCOMPILER_GCC -DMEMOVERRIDE_MODULE=${PROJECT_NAME} -D_DLL_EXT=${_DLL_EXT})

if(DEDICATED)
    add_definitions(-DDEDICATED)
endif()
if(OSXALL)
    add_definitions(-D_OSX -DOSX -D_DARWIN_UNLIMITED_SELECT -DFD_SETSIZE=10240)
endif()

if(LINUXALL)
    #add_definitions(-D_LINUX -DLINUX)
    if( DONT_DOWNGRADE_ABI )
        message(STATUS "KEEPING CXX11 ABI FOR PROJECT")
    else()
        #message(STATUS "DOWNGRADING CXX11 ABI")
        #disable cpp11 ABI so libraries <gcc 5 will work
        add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
    endif()

endif()

if(POSIX)
    set(CMAKE_CXX_VISIBILITY_PRESET hidden) #$SymbolVisibility	"hidden"
    add_definitions(-DPOSIX -D_POSIX)
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	add_definitions(-DPLATFORM_64BITS)
endif()

if(OSX64)
    add_definitions(-DPLATFORM_64BITS)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -arch x86_64")
endif()

if(NOT IS_LIB_PROJECT)
    if(OSX64)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -arch x86_64")
    endif()

    if( NOSTINKYLINKIES )
        message(STATUS "skipping stinky linkie")
    else()
        link_libraries("libtier0")
        link_libraries("tier1")
        #link_libraries("interfaces")
        include_directories("libvstdlib")
    endif()
endif()
