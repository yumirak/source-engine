#//-----------------------------------------------------------------------------
#//	CLIENT_ECON_BASE.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)

MacroRequired( SRCDIR )

include_directories(${SRCDIR}/game/shared/econ)
include_directories(${SRCDIR}/gcsdk/steamextra)
#include_directories(${SRCDIR}/gcsdk/generated_proto)
#$Include "${SRCDIR}/gcsdk/gcsdk_game_include.vpc"
#$Include "${SRCDIR}/game/shared/base_gcmessages_include.vpc"
#$Include "${SRCDIR}/game/shared/econ_gcmessages_include.vpc"
#$include "${SRCDIR}/vpc_scripts/source_cryptlib_include.vpc"
add_definitions(-DUSES_ECON_ITEMS)

#$Project
	#$Folder	"Source Files"
		#$Folder	"Economy"
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_view.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_interface.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_description.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_system.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/attribute_manager.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_entity_creation.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_inventory.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_wearable.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_holidays.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_preset.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_constants.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_schema.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_item_tools.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_store.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_storecategory.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/item_selection_criteria.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_dynamic_recipe.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/econ_quests.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/client/econ/econ_consumables.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gc_clientsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gc_replicated_convars.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/econ/localization_provider.cpp")

		#$Folder	"Economy Client"
target_sources(${OUTBINNAME} PRIVATE "econ/backpack_panel.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/base_loadout_panel.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/trading_start_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/item_model_panel.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/item_pickup_panel.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/confirm_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/confirm_delete_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/item_confirm_delete_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/item_style_select_dialog.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/econ_controls.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/econ_notifications.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/item_rental_ui.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/client_community_market.cpp")
target_sources(${OUTBINNAME} PRIVATE "econ/local_steam_shared_object_listener.cpp")
			#// Temp UI to allow you to test
target_sources(${OUTBINNAME} PRIVATE "econ/econ_sample_rootui.cpp")

			
			#$Folder	"Trading"
	target_sources(${OUTBINNAME} PRIVATE "econ/econ_trading.cpp")
			#$Folder "VGUI dependencies"
	target_sources(${OUTBINNAME} PRIVATE "game_controls/navigationpanel.cpp")
			#$Folder	"Store"
	target_sources(${OUTBINNAME} PRIVATE "econ/store/store_page.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/store/store_page_new.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/store/store_panel.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/store/store_preview_item.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/store/store_viewcart.cpp")

			
			#$Folder	"tool_items"
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/tool_items.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/rename_tool_ui.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/decoder_ring_tool.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/paint_can_tool.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/custom_texture_cache.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/custom_texture_tool.cpp")
	target_sources(${OUTBINNAME} PRIVATE "econ/tool_items/gift_wrap_tool.cpp")

		
		#// For item image stamping

	target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/imageutils.cpp")
