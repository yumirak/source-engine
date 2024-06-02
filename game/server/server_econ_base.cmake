#//-----------------------------------------------------------------------------
#//	CLIENT_ECON_BASE.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)
include(${CMAKE_MODULE_PATH}/protobuf_builder.cmake)
MacroRequired( SRCDIR )

include_directories(${SRCDIR}/game/shared/econ)
include_directories(${SRCDIR}/gcsdk/steamextra)
#include_directories(${SRCDIR}/gcsdk/generated_proto)
#$Include "${SRCDIR}/gcsdk/gcsdk_game_include.vpc"
#$Include "${SRCDIR}/game/shared/base_gcmessages_include.vpc"
#$Include "${SRCDIR}/game/shared/econ_gcmessages_include.vpc"
#$include "${SRCDIR}/vpc_scripts/source_cryptlib_include.vpc"
add_definitions(-DUSES_ECON_ITEMS)

			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_view.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_view.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_interface.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_interface.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_system.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_system.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/attribute_manager.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/attribute_manager.h"
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/ihasattributes.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity_creation.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity_creation.h"
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_gcmessages.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_inventory.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_inventory.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_wearable.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_wearable.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_holidays.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_holidays.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_constants.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_constants.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_preset.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_preset.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_schema.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_schema.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_tools.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_tools.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/item_selection_criteria.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/item_selection_criteria.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_dynamic_recipe.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_dynamic_recipe.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_quests.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_quests.h"


			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gc_clientsystem.h"
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gc_clientsystem.cpp")
			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gc_replicated_convars.cpp")

			target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/localization_provider.cpp")
			#target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/localization_provider.h"
