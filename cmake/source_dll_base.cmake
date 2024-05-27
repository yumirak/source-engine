include("${CMAKE_MODULE_PATH}/common_functions.cmake")
include("${CMAKE_MODULE_PATH}/platform_dirs.cmake") #defines PLATSUBDIR
include("${CMAKE_MODULE_PATH}/source_base.cmake")

MacroRequired(OUTDLLEXT ".so")

add_definitions(-DCSTRIKE15)

if(POSIX)
    include("${CMAKE_MODULE_PATH}/source_dll_posix_base.cmake")
elseif(WINDOWS)
    message(FATAL_ERROR "Cmake Windows Unsupported!")
endif()

include("${CMAKE_MODULE_PATH}/source_video_base.cmake")
