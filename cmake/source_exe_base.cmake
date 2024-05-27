include("${CMAKE_MODULE_PATH}/platform_dirs.cmake") #defines PLATSUBDIR
include("${CMAKE_MODULE_PATH}/source_base.cmake")

if(POSIX)
    include("${CMAKE_MODULE_PATH}/source_exe_posix_base.cmake")
elseif(WINDOWS)
    message(FATAL_ERROR "Cmake Windows Unsupported!")
endif()

include("${CMAKE_MODULE_PATH}/source_video_base.cmake")
