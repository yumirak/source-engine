#//-----------------------------------------------------------------------------
#//	SERVER_CSTRIKE15.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

#There are other projects in this folder, but this cmake is focused towards csgo a.k.a. cstrike15

cmake_minimum_required(VERSION 3.16)
project(client_base)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)

set(CLISRCDIR ${CMAKE_CURRENT_SOURCE_DIR})

set(NOSTINKYLINKIES "1")

include( ./client_hl2.cmake )
#include( ./client_tf.cmake )
#include( ./server_econ_base.cmake )
