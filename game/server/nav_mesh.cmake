#//-----------------------------------------------------------------------------
#//	NAV_MESH.VPC
#//
#//	Project script for navigation mesh files (no NextBot files)
#//-----------------------------------------------------------------------------
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)
#$Configuration
#{
#	$Compiler
#	{
		#$PreprocessorDefinitions		"$BASE;USE_NAV_MESH"
		add_definitions(-DUSE_NAV_MESH)
#	}
#}

#$Project
#{
#	$Folder	"Source Files"
#	{
#		$Folder	"Navigation Mesh"
#		{
			#target_sources(${OUTBINNAME} PRIVATE "nav.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_area.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_area.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_colors.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_colors.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_edit.cpp")
			target_sources(${OUTBINNAME} PRIVATE "nav_entities.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_entities.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_file.cpp")
			target_sources(${OUTBINNAME} PRIVATE "nav_generate.cpp")
			target_sources(${OUTBINNAME} PRIVATE "nav_ladder.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_ladder.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_merge.cpp")
			target_sources(${OUTBINNAME} PRIVATE "nav_mesh.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_mesh.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_mesh_factory.cpp")
			target_sources(${OUTBINNAME} PRIVATE "nav_node.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "nav_node.h"
			#target_sources(${OUTBINNAME} PRIVATE "nav_pathfind.h"
			target_sources(${OUTBINNAME} PRIVATE "nav_simplify.cpp")
#		}
#	}
#}
