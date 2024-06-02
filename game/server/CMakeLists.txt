#//-----------------------------------------------------------------------------
#//	SERVER_CSTRIKE15.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

#There are other projects in this folder, but this cmake is focused towards csgo a.k.a. cstrike15

cmake_minimum_required(VERSION 3.16)
project(Server)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(GAMENAME "csgo")
set(SRVSRCDIR ${CMAKE_CURRENT_SOURCE_DIR})

#set(NOSTINKYLINKIES "1")

#add_definitions(-DBOTS -DCSTRIKE_DLL -DUSE_ECONOMY_FEATURES)

#include( ./server_base.cmake )
#include( ./server_hl2.cmake )
include( ./server_tf.cmake )
