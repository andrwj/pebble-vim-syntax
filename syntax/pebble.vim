" Vim syntax file
" Language:    C with Pebble API
" Author:      Ryan "ZDBioHazard" Turner
" URL:         https://github.com/ZDBioHazard/pebble-vim-syntax
" Last Change: 2014-07-08

if !exists("main_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'pebble'
endif

" Use the C syntax as a base
runtime! syntax/c.vim

"
" This syntax file is designed for SDK version 2.0
" https://developer.getpebble.com/2/api-reference/
"
" The 'Standard C' section is left out because it's not Pebble-specific.
" Use another supplemental syntax file if you want that stuff too.
"

" App
syntax keyword cFunction app_event_loop

" App Communication
syntax keyword cType SniffInterval
syntax keyword cConstant SNIFF_INTERVAL_NORMAL SNIFF_INTERVAL_REDUCED
syntax keyword cFunction app_comm_get_sniff_interval app_comm_set_sniff_interval

" AppMessage / AppSync
syntax keyword cType AppSync AppSyncTupleChangedCallback AppSyncErrorCallback
syntax keyword cType AppMessageInboxDropped AppMessageInboxReceived AppMessageOutboxFailed AppMessageOutboxSent AppMessageResult
syntax keyword cConstant APP_MSG_OK APP_MSG_SEND_TIMEOUT APP_MSG_SEND_REJECTED APP_MSG_NOT_CONNECTED APP_MSG_APP_NOT_RUNNING
syntax keyword cConstant APP_MSG_INVALID_ARGS APP_MSG_BUSY APP_MSG_BUFFER_OVERFLOW APP_MSG_ALREADY_RELEASED APP_MSG_CALLBACK_ALREADY_REGISTERED
syntax keyword cConstant APP_MSG_CALLBACK_NOT_REGISTERED APP_MSG_OUT_OF_MEMORY APP_MSG_CLOSED APP_MSG_INTERNAL_ERROR
syntax keyword cConstant APP_MESSAGE_INBOX_SIZE_MINIMUM APP_MESSAGE_OUTBOX_SIZE_MINIMUM
syntax keyword cFunction app_message_deregister_callbacks app_message_get_context app_message_inbox_size_maximum
syntax keyword cFunction app_message_open app_message_outbox_begin app_message_outbox_send app_message_outbox_size_maximum
syntax keyword cFunction app_message_register_inbox_dropped app_message_register_inbox_received app_message_register_outbox_failed
syntax keyword cFunction app_message_register_outbox_sent app_message_set_context
syntax keyword cFunction app_sync_deinit app_sync_get app_sync_init app_sync_set

" AppWorker
syntax keyword cType AppWorkerMessage AppWorkerMessageHandler AppWorkerResult
syntax keyword cConstant APP_WORKER_RESULT_SUCCESS APP_WORKER_RESULT_NO_WORKER APP_WORKER_RESULT_DIFFERENT_APP APP_WORKER_RESULT_NOT_RUNNING
syntax keyword cConstant APP_WORKER_RESULT_ALREADY_RUNNING APP_WORKER_RESULT_ASKING_CONFIRMATION
syntax keyword cFunction app_worker_is_running app_worker_kill app_worker_launch app_worker_message_subscribe app_worker_message_unsubscribe
syntax keyword cFunction app_worker_send_message
" DataLogging
syntax keyword cType DataLoggingSessionRef DataLoggingItemType DataLoggingResult
syntax keyword cConstant DATA_LOGGING_BYTE_ARRAY DATA_LOGGING_UINT DATA_LOGGING_INT
syntax keyword cConstant DATA_LOGGING_SUCCESS DATA_LOGGING_BUSY DATA_LOGGING_FULL
syntax keyword cConstant DATA_LOGGING_NOT_FOUND DATA_LOGGING_CLOSED DATA_LOGGING_INVALID_PARAMS
syntax keyword cFunction data_logging_create data_logging_finish data_logging_log

" Data Structures
syntax keyword cType Uuid
syntax keyword cConstant UUID_SIZE UUID_STRING_BUFFER_LENGTH
syntax keyword cFunction uuid_equal uuid_to_string UuidMake UuidMakeFromBEBytes UuidMakeFromLEBytes

" Dictionary
syntax keyword cType Tuple Tuplet TupleType Dictionary DictionaryResult DictionaryIterator
syntax keyword cType DictionaryKeyUpdatedCallback DictionarySerializeCallback
syntax keyword cConstant DICT_OK DICT_NOT_ENOUGH_STORAGE DICT_INVALID_ARGS DICT_INTERNAL_INCONSISTENCY DICT_MALLOC_FAILED
syntax keyword cConstant TUPLE_BYTE_ARRAY TUPLE_CSTRING TUPLE_UINT TUPLE_INT NULL_TUPLE
syntax keyword cFunction dict_calc_buffer_size dict_calc_buffer_size_from_tuplets dict_find dict_merge
syntax keyword cFunction dict_read_begin_from_buffer dict_read_first dict_read_next dict_serialize_tuplets
syntax keyword cFunction dict_serialize_tuplets_to_buffer dict_serialize_tuplets_to_buffer_with_iter dict_size
syntax keyword cFunction dict_write_begin dict_write_cstring dict_write_data dict_write_end dict_write_tuplet
syntax keyword cFunction dict_write_int dict_write_uint8 dict_write_uint16 dict_write_uint32 dict_write_int8 dict_write_int16 dict_write_int32

" Internationalization
syntax keyword cFunction i18n_get_system_locale

" AccelerometerService
syntax keyword cType AccelAxisType AccelDataHandler AccelData AccelSamplingRate AccelTapHandler AccelRawDataHandler AccelRawData
syntax keyword cConstant ACCEL_AXIS_X ACCEL_AXIS_Y ACCEL_AXIS_Z
syntax keyword cConstant ACCEL_SAMPLING_10HZ ACCEL_SAMPLING_25HZ ACCEL_SAMPLING_50HZ ACCEL_SAMPLING_100HZ
syntax keyword cFunction accel_data_service_subscribe accel_data_service_unsubscribe accel_service_peek accel_service_set_samples_per_update
syntax keyword cFunction accel_service_set_sampling_rate accel_tap_service_subscribe accel_tap_service_unsubscribe
syntax keyword cFunction accel_raw_data_service_subscribe

" CompassService
syntax keyword cType MagData CompassStatus CompassHeading CompassHeadingData CompassHeadingHandler
syntax keyword cFunction TRIANGLE_TO_DEG
syntax keyword cFunction compass_service_subscribe compass_service_unsubscribe
syntax keyword cFunction compass_service_set_heading_filter compass_service_peek

" AppFocusService
syntax keyword cType AppFocusHandler
syntax keyword cFunction app_focus_service_subscribe app_focus_service_unsubscribe

" BatteryStateService
syntax keyword cType BatteryChargeState BatteryStateHandler
syntax keyword cFunction battery_state_service_peek battery_state_service_subscribe battery_state_service_unsubscribe

" BluetoothConnectionService
syntax keyword cType BluetoothConnectionHandler
syntax keyword cFunction bluetooth_connection_service_peek bluetooth_connection_service_subscribe bluetooth_connection_service_unsubscribe

" TickTimerService
syntax keyword cType TickHandler
syntax keyword cFunction tick_timer_service_subscribe tick_timer_service_unsubscribe

" Launch Reason
syntax keyword cType AppLaunchReason
syntax keyword cConstant APP_LAUNCH_SYSTEM APP_LAUNCH_USER APP_LAUNCH_PHONE APP_LAUNCH_WAKEUP APP_LAUNCH_WORKER
syntax keyword cFunction launch_reason launch_get_args


" Logging
syntax keyword cType AppLogLevel
syntax keyword cConstant APP_LOG_LEVEL_ERROR APP_LOG_LEVEL_WARNING APP_LOG_LEVEL_INFO APP_LOG_LEVEL_DEBUG APP_LOG_LEVEL_DEBUG_VERBOSE
syntax keyword cFunction app_log APP_LOG

" Math
syntax keyword cConstant TRIG_MAX_ANGLE TRIG_MAX_RATIO
syntax keyword cFunction atan2_lookup cos_lookup sin_lookup

" Memory Management
syntax keyword cFunction heap_bytes_free heap_bytes_used

" Resources
syntax keyword cType ResHandle
syntax keyword cFunction resource_get_handle resource_load resource_load_byte_range resource_size

" Storage
syntax keyword cConstant PERSIST_DATA_MAX_LENGTH PERSIST_STRING_MAX_LENGTH
syntax keyword cFunction persist_delete persist_exists persist_get_size
syntax keyword cFunction persist_read_bool persist_read_data persist_read_int persist_read_string
syntax keyword cFunction persist_write_bool persist_write_data persist_write_int persist_write_string

" Timer
syntax keyword cType AppTimer AppTimerCallback
syntax keyword cFunction app_timer_cancel app_timer_register app_timer_reschedule psleep

" Wakeup
syntax keyword cType WakeupId WakeupHandler 
syntax keyword cFunction wakeup_cancel wakeup_cancel_all wakeup_get_launch_event wakeup_query wakeup_schedule wakeup_service_subscribe 

" Wall Time
syntax keyword cType TimeUnits WeekDay
syntax keyword cConstant SECOND_UNIT MINUTE_UNIT HOUR_UNIT DAY_UNIT MONTH_UNIT YEAR_UNIT
syntax keyword cConstant TODAY SUNDAY MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY 
syntax keyword cFunction clock_copy_time_string clock_is_24h_style clock_is_timezone_set clock_to_timestamp

" WatchInfo
syntax keyword cType WatchInfoColor WatchInfoVersion WatchInfoModel
syntax keyword cConstant WATCH_INFO_COLOR_UNKNOWN WATCH_INFO_COLOR_BLACK WATCH_INFO_COLOR_WHITE WATCH_INFO_COLOR_RED
syntax keyword cConstant WATCH_INFO_COLOR_ORANGE WATCH_INFO_COLOR_GREY WATCH_INFO_COLOR_STAINLESS_STEEL WATCH_INFO_COLOR_MATTE_BLACK
syntax keyword cConstant WATCH_INFO_COLOR_BLUE WATCH_INFO_COLOR_GREEN WATCH_INFO_COLOR_PINK WATCH_INFO_MODEL_UNKNOWN
syntax keyword cConstant WATCH_INFO_MODEL_PEBBLE_ORIGINAL WATCH_INFO_MODEL_PEBBLE_STEEL
syntax keyword cFunction watch_info_get_color watch_info_get_firmware_version watch_info_get_model

" Drawing Paths
syntax keyword cType GPath GPathInfo
syntax keyword cFunction gpath_create gpath_destroy gpath_draw_filled gpath_draw_outline gpath_move_to gpath_rotate_to

" Drawing Primitives
syntax keyword cType GCornerMask
syntax keyword cConstant GCornerNone GCornerTopLeft GCornerTopRight GCornerBottomLeft GCornerBottomRight
syntax keyword cConstant GCornersAll GCornersTop GCornersBottom GCornersLeft GCornersRight
syntax keyword cFunction graphics_draw_bitmap_in_rect graphics_draw_circle graphics_draw_line graphics_draw_pixel
syntax keyword cFunction graphics_draw_rect graphics_draw_round_rect graphics_fill_circle graphics_fill_rect
syntax keyword cFunction graphics_capture_frame_buffer graphics_release_frame_buffer graphics_frame_buffer_is_captured

" Drawing Text
syntax keyword cType GTextOverflowMode GTextAlignment GTextLayoutCacheRef
syntax keyword cConstant GTextAlignmentLeft GTextAlignmentCenter GTextAlignmentRight
syntax keyword cConstant GTextOverflowModeWordWrap GTextOverflowModeTrailingEllipsis GTextOverflowModeFill
syntax keyword cFunction graphics_draw_text graphics_text_layout_get_content_size

" Fonts
syntax keyword cType GFont
syntax keyword cConstant FONT_KEY_FONT_FALLBACK
syntax keyword cConstant FONT_KEY_GOTHIC_14 FONT_KEY_GOTHIC_14_BOLD
syntax keyword cConstant FONT_KEY_GOTHIC_18 FONT_KEY_GOTHIC_18_BOLD
syntax keyword cConstant FONT_KEY_GOTHIC_24 FONT_KEY_GOTHIC_24_BOLD
syntax keyword cConstant FONT_KEY_GOTHIC_28 FONT_KEY_GOTHIC_28_BOLD
syntax keyword cConstant FONT_KEY_BITHAM_30_BLACK
syntax keyword cConstant FONT_KEY_BITHAM_42_LIGHT FONT_KEY_BITHAM_42_BOLD
syntax keyword cConstant FONT_KEY_BITHAM_34_MEDIUM_NUMBERS
syntax keyword cConstant FONT_KEY_BITHAM_42_MEDIUM_NUMBERS
syntax keyword cConstant FONT_KEY_BITHAM_18_LIGHT_SUBSET
syntax keyword cConstant FONT_KEY_BITHAM_34_LIGHT_SUBSET
syntax keyword cConstant FONT_KEY_ROBOTO_CONDENSED_21
syntax keyword cConstant FONT_KEY_ROBOTO_BOLD_SUBSET_49
syntax keyword cConstant FONT_KEY_DROID_SERIF_28_BOLD
syntax keyword cFunction fonts_get_system_font fonts_load_custom_font fonts_unload_custom_font

" Graphics Context
syntax keyword cType GContext
syntax keyword cFunction graphics_context_set_compositing_mode graphics_context_set_fill_color
syntax keyword cFunction graphics_context_set_stroke_color graphics_context_set_text_color

" Graphics Types
syntax keyword cType GBitmap GPoint GRect GSize GAlign GColor GCompOp
syntax keyword cConstant GPointZero GRectZero GSizeZero
syntax keyword cConstant GAlignCenter GAlignTopLeft GAlignTopRight GAlignTop GAlignLeft
syntax keyword cConstant GAlignBottom GAlignRight GAlignBottomRight GAlignBottomLeft
syntax keyword cConstant GColorClear GColorBlack GColorWhite
syntax keyword cConstant PBL_COLOR GColorBlack GColorOxfordBlue GColorDukeBlue GColorBlue
syntax keyword cConstant GColorDarkGreen GColorMidnightGreen GColorCobaltBlue GColorBlueMoon
syntax keyword cConstant GColorIslamicGreen GColorJaegerGreen GColorTiffanyBlue GColorVividCerulean
syntax keyword cConstant GColorGreen GColorMalachite GColorMediumSpringGreen GColorCyan
syntax keyword cConstant GColorBulgarianRose GColorImperialPurple GColorIndigo GColorElectricUltramarine
syntax keyword cConstant GColorArmyGreen GColorDarkGray GColorLiberty GColorVeryLightBlue
syntax keyword cConstant GColorKellyGreen GColorMayGreen GColorCadetBlue GColorPictonBlue
syntax keyword cConstant GColorBrightGreen GColorScreaminGreen GColorMediumAquamarine GColorElectricBlue
syntax keyword cConstant GColorDarkCandyAppleRed GColorJazzberryJam GColorPurple GColorVividViolet
syntax keyword cConstant GColorWindsorTan GColorRoseVale GColorPurpureus GColorLavenderIndigo
syntax keyword cConstant GColorLimerick GColorBrass GColorLightGray GColorBabyBlueEyes
syntax keyword cConstant GColorSpringBud GColorInchworm GColorMintGreen GColorCeleste
syntax keyword cConstant GColorRed GColorFolly GColorFashionMagenta GColorMagenta
syntax keyword cConstant GColorOrange GColorSunsetOrange GColorBrilliantRose GColorShockingPink
syntax keyword cConstant GColorChromeYellow GColorRajah GColorMelon GColorRichBrilliantLavender
syntax keyword cConstant GColorYellow GColorIcterine GColorPastelYellow GColorClearARGB8
syntax keyword cConstant GCompOpAssign GCompOpAssignInverted GCompOpOr GCompOpAnd GCompOpClear GCompOpSet
syntax keyword cFunction gbitmap_create_as_sub_bitmap gbitmap_create_with_data gbitmap_create_with_resource gbitmap_destroy
syntax keyword cFunction gbitmap_create_blank
syntax keyword cFunction gpoint_equal grect_align grect_center_point grect_clip grect_contains_point
syntax keyword cFunction grect_crop grect_equal grect_is_empty grect_standardize gsize_equal
syntax keyword cFunction GColorEq GColorFromHEX GColorFromRGB

" Animation
syntax keyword cType Animation AnimationCurve AnimationHandlers AnimationStartedHandler AnimationStoppedHandler AnimationCurveFunction
syntax keyword cType AnimationImplementation AnimationSetupImplementation AnimationTeardownImplementation AnimationUpdateImplementation
syntax keyword cConstant AnimationCurveLinear AnimationCurveEaseIn AnimationCurveEaseOut AnimationCurveEaseInOut
syntax keyword cConstant ANIMATION_DURATION_INFINITE ANIMATION_NORMALIZED_MAX ANIMATION_NORMALIZED_MIN
syntax keyword cConstant AnimationCurveCustomFunction AnimationCurve_Reserved1 AnimationCurve_Reserved2 AnimationCurve_Reserved3
syntax keyword cFunction animation_create animation_destroy animation_get_context animation_is_scheduled animation_schedule
syntax keyword cFunction animation_set_curve animation_set_delay animation_set_duration animation_set_handlers
syntax keyword cFunction animation_set_implementation animation_unschedule animation_unschedule_all animation_set_custom_curve

" PropertyAnimation
syntax keyword cType PropertyAnimation PropertyAnimationImplementation PropertyAnimationAccessors GPointReturn GRectReturn
syntax keyword cType GPointGetter GRectGetter Int16Getter GPointSetter GRectSetter Int16Setter GColor8Setter GColor8Getter
syntax keyword cConstant property_animation_clone property_animation_get_from_grect property_animation_set_from_grect
syntax keyword cConstant property_animation_get_from_gpoint property_animation_set_from_gpoint property_animation_get_from_int16
syntax keyword cConstant property_animation_set_from_int16 property_animation_get_to_grect property_animation_set_to_grect
syntax keyword cConstant property_animation_get_to_gpoint property_animation_set_to_gpoint property_animation_get_to_int16
syntax keyword cConstant property_animation_set_to_int16 property_animation_get_subject property_animation_set_subject

syntax keyword cFunction property_animation_create property_animation_create_layer_frame property_animation_destroy
syntax keyword cFunction property_animation_update_gpoint property_animation_update_grect property_animation_update_int16
syntax keyword cFunction property_animation_get_animation property_animation_subject property_animation_from property_animation_to

" Clicks
syntax keyword cType ClickRecognizerRef ClickConfigProvider ClickHandler ButtonId
syntax keyword cConstant BUTTON_ID_BACK BUTTON_ID_UP BUTTON_ID_SELECT BUTTON_ID_DOWN NUM_BUTTONS
syntax keyword cFunction click_number_of_clicks_counted click_recognizer_get_button_id click_recognizer_is_repeating

" Layers
syntax keyword cType Layer LayerUpdateProc
syntax keyword cFunction layer_add_child layer_create layer_create_with_data layer_destroy layer_get_bounds layer_get_clips
syntax keyword cFunction layer_get_data layer_get_frame layer_get_hidden layer_get_window layer_insert_above_sibling
syntax keyword cFunction layer_insert_below_sibling layer_mark_dirty layer_remove_child_layers layer_remove_from_parent
syntax keyword cFunction layer_set_bounds layer_set_clips layer_set_frame layer_set_hidden layer_set_update_proc

" ActionBarLayer
syntax keyword cType ActionBarLayer
syntax keyword cConstant ACTION_BAR_WIDTH NUM_ACTION_BAR_ITEMS
syntax keyword cFunction action_bar_layer_add_to_window action_bar_layer_clear_icon action_bar_layer_create action_bar_layer_destroy
syntax keyword cFunction action_bar_layer_get_layer action_bar_layer_remove_from_window action_bar_layer_set_background_color
syntax keyword cFunction action_bar_layer_set_click_config_provider action_bar_layer_set_context action_bar_layer_set_icon

" BitmapLayer
syntax keyword cType BitmapLayer
syntax keyword cFunction bitmap_layer_create bitmap_layer_destroy bitmap_layer_get_bitmap bitmap_layer_get_layer
syntax keyword cFunction bitmap_layer_set_alignment bitmap_layer_set_background_color bitmap_layer_set_bitmap bitmap_layer_set_compositing_mode

" InverterLayer
syntax keyword cType InverterLayer
syntax keyword cFunction inverter_layer_create inverter_layer_destroy inverter_layer_get_layer

" MenuLayer
syntax keyword cType MenuLayer MenuIndex MenuLayerCallbacks MenuRowAlign MenuCellSpan
syntax keyword cType MenuLayerDrawHeaderCallback MenuLayerDrawRowCallback MenuLayerDrawSeparatorCallback MenuLayerGetCellHeightCallback
syntax keyword cType MenuLayerGetHeaderHeightCallback MenuLayerGetNumberOfRowsInSectionsCallback MenuLayerGetNumberOfSectionsCallback
syntax keyword cType MenuLayerGetSeparatorHeightCallback MenuLayerSelectCallback MenuLayerSelectionChangedCallback
syntax keyword cConstant MenuRowAlignNone MenuRowAlignCenter MenuRowAlignTop MenuRowAlignBottom MENU_CELL_BASIC_HEADER_HEIGHT
syntax keyword cFunction menu_cell_basic_draw menu_cell_basic_header_draw menu_cell_title_draw menu_index_compare menu_layer_create
syntax keyword cFunction menu_layer_destroy menu_layer_get_layer menu_layer_get_scroll_layer menu_layer_get_selected_index
syntax keyword cFunction menu_layer_reload_data menu_layer_set_callbacks menu_layer_set_click_config_onto_window
syntax keyword cFunction menu_layer_set_selected_index menu_layer_set_selected_next

" RotBitmapLayer
syntax keyword cType RotBitmapLayer
syntax keyword cFunction rot_bitmap_layer_create rot_bitmap_layer_increment_angle rot_bitmap_layer_set_angle
syntax keyword cFunction rot_bitmap_layer_destroy rot_bitmap_layer_set_corner_clip_color rot_bitmap_layer_set_src_ic
syntax keyword cFunction rot_bitmap_layer_set_compositing_mode

" ScrollLayer
syntax keyword cType ScrollLayer ScrollLayerCallback ScrollLayerCallbacks
syntax keyword cFunction scroll_layer_add_child scroll_layer_create scroll_layer_destroy scroll_layer_get_content_offset
syntax keyword cFunction scroll_layer_get_content_size scroll_layer_get_layer scroll_layer_get_shadow_hidden
syntax keyword cFunction scroll_layer_scroll_down_click_handler scroll_layer_scroll_up_click_handler scroll_layer_set_callbacks
syntax keyword cFunction scroll_layer_set_click_config_onto_window scroll_layer_set_content_offset scroll_layer_set_content_size
syntax keyword cFunction scroll_layer_set_context scroll_layer_set_frame scroll_layer_set_shadow_hidden

" SimpleMenuLayer
syntax keyword cType SimpleMenuLayer SimpleMenuItem SimpleMenuSection SimpleMenuLayerSelectCallback
syntax keyword cFunction simple_menu_layer_create simple_menu_layer_destroy simple_menu_layer_get_layer simple_menu_layer_get_menu_layer
syntax keyword cFunction simple_menu_layer_get_selected_index simple_menu_layer_set_selected_index

" TextLayer
syntax keyword cType TextLayer
syntax keyword cFunction text_layer_create text_layer_destroy text_layer_get_content_size text_layer_get_layer text_layer_get_text
syntax keyword cFunction text_layer_set_background_color text_layer_set_font text_layer_set_overflow_mode text_layer_set_size
syntax keyword cFunction text_layer_set_text text_layer_set_text_alignment text_layer_set_text_color

" Light
syntax keyword cFunction light_enable light_enable_interaction

" Vibes
syntax keyword cType VibePattern
syntax keyword cFunction vibes_cancel vibes_double_pulse vibes_enqueue_custom_pattern vibes_long_pulse vibes_short_pulse

" Window
syntax keyword cType Window WindowHandler WindowHandlers
syntax keyword cFunction window_create window_destroy window_get_click_config_context window_get_click_config_provider
syntax keyword cFunction window_get_fullscreen window_get_root_layer window_get_user_data window_is_loaded
syntax keyword cFunction window_long_click_subscribe window_multi_click_subscribe window_raw_click_subscribe
syntax keyword cFunction window_set_background_color window_set_click_config_provider window_set_click_config_provider_with_context
syntax keyword cFunction window_set_click_context window_set_fullscreen window_set_status_bar_icon window_set_user_data
syntax keyword cFunction window_set_window_handlers window_single_click_subscribe window_single_repeating_click_subscribe

" NumberWindow
syntax keyword cType NumberWindow NumberWindowCallback NumberWindowCallbacks
syntax keyword cFunction number_window_create number_window_destroy number_window_get_value number_window_set_label
syntax keyword cFunction number_window_set_max number_window_set_min number_window_set_step_size number_window_set_value
syntax keyword cFunction number_window_get_window

" Window Stack
syntax keyword cFunction window_stack_contains_window window_stack_get_top_window window_stack_pop
syntax keyword cFunction window_stack_pop_all window_stack_push window_stack_remove

" status_t values
" This isn't in the API reference, but it's defined in pebble.h, so I'm including it.
syntax keyword cType StatusCode status_t
syntax keyword cConstant S_SUCCESS E_ERROR E_UNKNOWN E_INTERNAL E_INVALID_ARGUMENT E_OUT_OF_MEMORY E_OUT_OF_STORAGE E_OUT_OF_RESOURCES
syntax keyword cConstant E_RANGE E_DOES_NOT_EXIST E_INVALID_OPERATION E_BUSY S_TRUE S_FALSE S_NO_MORE_ITEMS S_NO_ACTION_REQUIRED

" Other things in pebble.h but not in the API documentation.
syntax keyword cType ListNode GDrawState TextLayout
syntax keyword cFunction time_ms

"SDK 3
syntax keyword cConstant GAlignCenter PBL_PLATFORM_BASALT

" Set-up the highlight links
if version >= 508
    highlight default link cType     Type
    highlight default link cConstant Constant
    highlight default link cFunction Function
endif

let b:current_syntax = "pebble"
if main_syntax == 'pebble'
    unlet main_syntax
endif
