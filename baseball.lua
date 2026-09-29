task.spawn(function()  
  
local Library = loadstring([==[
if not LPH_OBFUSCATED then
	LPH_ENCFUNC = function(callback)
		return callback
	end
	LPH_NO_VIRTUALIZE = function(...)
		return ...
	end
	LPH_NO_UPVALUES = function(...)
		return ...
	end
	LPH_JIT_MAX = function(...)
		return ...
	end
	LPH_JIT = function(...)
		return ...
	end
end

local _cloneref = cloneref

local user_input_service = _cloneref(game:GetService('UserInputService'))
local tween_service = _cloneref(game:GetService('TweenService'))
local text_service = _cloneref(game:GetService('TextService'))
local http_service = _cloneref(game:GetService('HttpService'))
local core_gui = _cloneref(game:GetService('CoreGui'))
local debris = _cloneref(game:GetService('Debris'))

local NEXTSHOP_BG = Color3.fromRGB(12, 13, 17)
local NEXTSHOP_PANEL = Color3.fromRGB(18, 19, 24)
local NEXTSHOP_PANEL_2 = Color3.fromRGB(22, 23, 29)
local NEXTSHOP_HOVER = Color3.fromRGB(30, 31, 39)
local NEXTSHOP_ACCENT = Color3.fromRGB(255, 72, 92)
local NEXTSHOP_ACCENT_DARK = Color3.fromRGB(145, 34, 50)
local NEXTSHOP_PURPLE = Color3.fromRGB(165, 92, 255)
local NEXTSHOP_BLUE = Color3.fromRGB(72, 145, 255)
local NEXTSHOP_CYAN = Color3.fromRGB(64, 220, 255)
local NEXTSHOP_GREEN = Color3.fromRGB(72, 220, 145)
local NEXTSHOP_GOLD = Color3.fromRGB(255, 190, 72)
local NEXTSHOP_TEXT = Color3.fromRGB(245, 245, 248)
local NEXTSHOP_MUTED = Color3.fromRGB(155, 158, 168)
local _new_instance = Instance.new
local _new_tween_info = TweenInfo.new
local _new_udim = UDim.new
local _new_udim2 = UDim2.new
local _udim2_from_offset = UDim2.fromOffset
local _new_vector2 = Vector2.new

local _clamp = math.clamp
local _floor = math.floor
local _max = math.max
local _min = math.min

local _clear = table.clear
local _find = table.find
local _freeze = table.freeze
local _insert = table.insert
local _pack = table.pack
local _unpack = table.unpack

local _defer = task.defer
local _delay = task.delay
local _create_tween = tween_service.Create

local _pairs = pairs
local _pcall = pcall
local _tostring = tostring
local _type = type

local create_runtime_lua_key = function(left, right)
	return left .. right .. _tostring(game.GameId):sub(1, 0)
end

local library = {
	_config = {},
	_flags = {},
	_current = nil,
}
library.__index = library
 type tab_typeof = {
	_btn: TextButton,
	_left: ScrollingFrame,
	_right: ScrollingFrame,
	_active: boolean,
	_enabled: boolean,
	_title: string,
	_category: string?,
	_manager: any,
}

type runtime_default = {
	_tab: number,
	_tabs: { tab_typeof },
	_tab_registry: { [string]: { any } },
	_categories: { any },
	_category_registry: { [string]: { any } },
	_active_tab: tab_typeof?,
	_layout_order: number,
	_category_order: number,
	_manager_loaded: boolean,
	_type: string?,
	_config: { [string]: any },
	_flags: { [string]: any },
	_active_dropdowns: { any },
	_keybind_entries: { any },
	_keybind_list_visible: boolean,
	_is_mobile: boolean,
	_ui_scale: number,
	_label_text_size: number,
	_small_text_size: number,
	_ui_open: boolean,
	_dragging: boolean,
	_drag_start: Vector2?,
	_container_position: UDim2?,
	_ui: ScreenGui?,
	_container: Frame?,
	_sidebar: Frame?,
	_pin: Frame?,
	_tabs_container: ScrollingFrame?,
	_main_content: Frame?,
	_sections: Folder?,
	_topbar: Frame?,
	_ui_scale_object: UIScale?,
	_keybind_scale: UIScale?,
	_keybind_list_content: Frame?,
	_keybind_list_frame: Frame?,
	_notification_holder: Frame?,
	_notification_scale: UIScale?,
	_notification_order: number,
	_apply_scale: (() -> ())?,
	_lua_manager: any?,
}

type _runtime = typeof(setmetatable({} :: runtime_default, library))
type runtime_typeof = _runtime | typeof(library)

local interface_parent = (gethui and gethui()) or core_gui
local old_interface = interface_parent:FindFirstChild('_nextshop')

if old_interface then
	debris:AddItem(old_interface, 0)
        end
local create_new = LPH_NO_VIRTUALIZE(function(class_name, properties)
	local instance = _new_instance(class_name)

	for property, value in properties do
		if property ~= 'Parent' then
			instance[property] = value
		end
	end

	instance.Parent = properties.Parent

	return instance
end)

local create_round = LPH_NO_VIRTUALIZE(function(instance, radius)
	return create_new('UICorner', {
		CornerRadius = _new_udim(0, radius),
		Parent = instance,
	})
end)

local create_pill = LPH_NO_VIRTUALIZE(function(instance)
	return create_new('UICorner', {
		CornerRadius = _new_udim(1, 0),
		Parent = instance,
	})
end)

local create_outline = LPH_NO_VIRTUALIZE(function(instance, refresh)
	local stroke = create_new('UIStroke', {
		Color = Color3.fromRGB(48, 50, 60),
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = instance,
	})

	if refresh then
		instance:GetPropertyChangedSignal('AbsoluteSize'):Connect(function()
			stroke.Enabled = false
			stroke.Enabled = true
		end)
	end

	return stroke
end)
local create_vertical_list = LPH_NO_VIRTUALIZE(function(instance, gap)
	return create_new('UIListLayout', {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = _new_udim(0, gap or 0),
		Parent = instance,
	})
end)

local create_padding = LPH_NO_VIRTUALIZE(function(instance, top, bottom, left, right)
	return create_new('UIPadding', {
		PaddingTop = _new_udim(0, top),
		PaddingBottom = _new_udim(0, bottom),
		PaddingLeft = _new_udim(0, left),
		PaddingRight = _new_udim(0, right),
		Parent = instance,
	})
end)

local create_label = LPH_NO_VIRTUALIZE(function(properties)
	properties.BackgroundTransparency = 1
	properties.FontFace =
		Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	properties.TextColor3 = properties.TextColor3 or Color3.fromRGB(180, 180, 180)
	properties.BorderSizePixel = 0

	return create_new('TextLabel', properties)
end)

local create_divider = LPH_NO_VIRTUALIZE(function(parent, position, size)
	return create_new('Frame', {
		BackgroundColor3 = Color3.fromRGB(35, 35, 35),
		Position = position,
		Size = size,
		BorderSizePixel = 0,
		Parent = parent,
	})
end)
local normalize_name = LPH_NO_VIRTUALIZE(function(value)
	local normalized = string.lower(_tostring(value or ''))
	normalized = string.gsub(normalized, '^%s+', '')

	return string.gsub(normalized, '%s+$', '')
end)

local shallow_copy = LPH_NO_VIRTUALIZE(function(source)
	local copy = {}

	for index, value in source or {} do
		copy[index] = value
	end

	return copy
end)

local round_number = LPH_NO_VIRTUALIZE(function(number, decimals)
	local multiplier = 10 ^ (decimals or 0)

	return _floor(number * multiplier + 0.5 - (number < 0 and 1 or 0)) / multiplier
end)

if not isfolder('NEXTSHOP') then
	makefolder('NEXTSHOP')
end

if not isfolder('NEXTSHOP/configs') then
	makefolder('NEXTSHOP/configs')
end

function library._save(self: runtime_typeof)
	return true
end

function library.load(self: runtime_typeof)
	return self._flags
end

function library.close_all_dropdowns(self: _runtime)
	for _, dropdown in self._active_dropdowns do
		if dropdown._state then
			dropdown:unfold()
		end
	end
        end
 library._new = function(runtime_type: string?): _runtime
	local is_mobile = user_input_service.TouchEnabled
		or not (user_input_service.KeyboardEnabled and user_input_service.MouseEnabled)
	local self = setmetatable({
		_tab = 0,
		_tabs = {},
		_tab_registry = {},
		_categories = {},
		_category_registry = {},
		_active_tab = nil,
		_layout_order = 0,
		_category_order = 0,
		_manager_loaded = false,
		_type = runtime_type,
		_config = library._config,
		_flags = library._flags,
		_active_dropdowns = {},
		_keybind_entries = {},
		_keybind_list_visible = false,
		_is_mobile = is_mobile,
		_ui_scale = 1,
		_label_text_size = is_mobile and 15 or 14,
		_small_text_size = is_mobile and 11 or 10,
		_ui_open = true,
		_dragging = false,
		_drag_start = nil,
		_container_position = nil,
		_ui = nil,
		_container = nil,
		_sidebar = nil,
		_pin = nil,
		_tabs_container = nil,
		_main_content = nil,
		_sections = nil,
		_topbar = nil,
		_ui_scale_object = nil,
		_keybind_scale = nil,
		_keybind_list_content = nil,
		_keybind_list_frame = nil,
		_notification_holder = nil,
		_notification_scale = nil,
		_notification_order = 0,
		_apply_scale = nil,
		_lua_manager = nil,
	}, library) :: _runtime

	library._current = self

	self:_init()
	self:_init_keybind_list()

	if self._apply_scale then
		self._apply_scale()
	end

	return self
        end
function library._init(self: _runtime)
	set_thread_identity(6)

	local _main = create_new('ScreenGui', {
		Name = '_nextshop',
		ResetOnSpawn = false,
		IgnoreGuiInset = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = interface_parent,
	})

	if syn and syn.protect_gui then
		syn.protect_gui(_main)
	end

	self._ui = _main

	local container = create_new('Frame', {
		BackgroundColor3 = NEXTSHOP_BG,
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 0),
		Size = _new_udim2(0, 600, 0, 400),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
		Parent = _main,
	})

	create_round(container, 12)
	local container_outline = create_outline(container)
	container_outline.Color = NEXTSHOP_ACCENT_DARK
	container_outline.Transparency = 0.25

	local ui_scale = create_new('UIScale', {
		Parent = container,
	})

	self._ui_scale_object = ui_scale
        end
 	local notification_holder = create_new('Frame', {
		Name = '_notifications',
		BackgroundTransparency = 1,
		AnchorPoint = _new_vector2(0.5, 1),
		Position = _new_udim2(0.5, 0, 0.5, 178),
		Size = _new_udim2(0, 560, 0, 180),
		BorderSizePixel = 0,
		ZIndex = 199,
		Parent = _main,
	})

	create_new('UIListLayout', {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = _new_udim(0, 6),
		Parent = notification_holder,
	})

	local notification_scale = create_new('UIScale', {
		Scale = self._ui_scale,
		Parent = notification_holder,
	})

	self._notification_holder = notification_holder
	self._notification_scale = notification_scale
end

function library.notify(self: runtime_typeof, message)
	self = resolve_runtime(self)

	if not self or not self._notification_holder then
		return
	end

	local text = _tostring(message or ''):gsub('[\r\n]+', ' '):gsub('^%s+', ''):gsub('%s+$', '')

	if text == '' then
		return
	end

	print(text)
        end
function resolve_runtime(self: runtime_typeof)
	if self ~= library and _type(self) == 'table' and self._tabs then
		return self :: _runtime
	end

	return library._current
end

return library
end)
            
