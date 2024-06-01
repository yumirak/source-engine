#Something custom/made by me(lwss).
#Include this in your CMakeLists.txt to set the various platform defines the codebase expects
if(UNIX)
    add_definitions(-DNO_HOOK_MALLOC)
endif()
if(WIN32)
    message(FATAL_ERROR "install gentoo")
elseif(UNIX AND NOT APPLE) #LINUX
    add_definitions(-DLINUX -D_LINUX -DPOSIX -D_POSIX)
    set(LINUXALL "1")
    set(POSIX "1")
    set(GL "1")
    set(_DLL_EXT ".so")
    add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        add_definitions(-DLINUX64)
        set(LINUX64 "1")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        add_definitions(-DLINUX32)
        set(LINUX32 "1")
    else()
        message(FATAL_ERROR "Weird pointer size! Couldn't detect x64/x86")
    endif()
elseif(UNIX AND APPLE) #MAC
    set(OSXALL "1")
    message(FATAL_ERROR "install gentoo")
else()
    message(FATAL_ERROR "platform undetected!")
endif()
