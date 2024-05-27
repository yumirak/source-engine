#//-----------------------------------------------------------------------------
#//	source_base.cmake
#//
#//  This is the base VPC file that is included by all others, on all platforms.
#//
#//	Project Script
#//-----------------------------------------------------------------------------

# Set which branch we are building out of.
# This is one file we expect to be different between branches and so it must be merged carefully

#Rel Branch
#set(CSTRIKE_TRUNK_BUILD "0")
#set(CSTRIKE_STAGING_BUILD "0")
#set(CSTRIKE_REL_BUILD "1")

#add_definitions(-DCSTRIKE_REL_BUILD) #without this, some weird stuff is included like fatdemos
add_definitions(-DALLOW_DEVELOPMENT_CVARS) #let's allow development convars since this is an open source project.

#Rad telemetry profiler is not enabled with kisak-strike
set(RAD_TELEMETRY_DISABLED "1")
add_definitions(-DRAD_TELEMETRY_DISABLED)


#CMAKE FILLS THESE IN BY DEFAULT. NUKE THEM!
set(CMAKE_CXX_FLAGS_RELEASE "")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "")
set(CMAKE_CXX_FLAGS_MINSIZEREL "")
set(CMAKE_CXX_FLAGS_DEBUG "")
