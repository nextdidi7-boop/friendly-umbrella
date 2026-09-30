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

-- Next Shop visual theme (Purple Theme)
local VIREX_BG = Color3.fromRGB(13, 11, 18)
local VIREX_PANEL = Color3.fromRGB(20, 17, 27)
local VIREX_PANEL_2 = Color3.fromRGB(26, 22, 36)
local VIREX_HOVER = Color3.fromRGB(36, 30, 50)
local VIREX_ACCENT = Color3.fromRGB(175, 82, 255)
local VIREX_ACCENT_DARK = Color3.fromRGB(105, 34, 158)
local VIREX_PURPLE = Color3.fromRGB(195, 112, 255)
local VIREX_BLUE = Color3.fromRGB(112, 145, 255)
local VIREX_CYAN = Color3.fromRGB(94, 220, 255)
local VIREX_GREEN = Color3.fromRGB(72, 220, 145)
local VIREX_GOLD = Color3.fromRGB(255, 190, 72)
local VIREX_TEXT = Color3.fromRGB(245, 243, 250)
local VIREX_MUTED = Color3.fromRGB(162, 155, 178)
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

local lua_bridge_decryption_key =
	create_runtime_lua_key('ba372df66d4c9d0c2d193367a39ae77a', '56a173213cd71b164be6d19bf8c640d2')
local lua_export_decryption_key =
	create_runtime_lua_key('dc6ca3570f8d9a75a7558f26165b9274', '9565c346b9e4f19d8f7ac2a46ada1ac8')
local lua_sandbox_decryption_key =
	create_runtime_lua_key('aa1143ae1640d00049535f95a227d34d', '986d65cb6c300e7e11d97cfb990fd492')
local lua_loader_decryption_key =
	create_runtime_lua_key('e83f53ad24607d2fd2350345fd2d8265', 'c695310635c212e78fb389573ebf33a0')
local lua_register_decryption_key =
	create_runtime_lua_key('03bd60e589693d30b9f98cde0ac9bc77', '2ccde9534705153de1bf27f8b58c0db4')
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
		Color = Color3.fromRGB(60, 45, 80),
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
	properties.TextColor3 = properties.TextColor3 or Color3.fromRGB(190, 180, 205)
	properties.BorderSizePixel = 0

	return create_new('TextLabel', properties)
end)

local create_divider = LPH_NO_VIRTUALIZE(function(parent, position, size)
	return create_new('Frame', {
		BackgroundColor3 = Color3.fromRGB(45, 38, 60),
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

local read_only = LPH_JIT_MAX(function(source)
	return _freeze(shallow_copy(source))
end)

local round_number = LPH_NO_VIRTUALIZE(function(number, decimals)
	local multiplier = 10 ^ (decimals or 0)

	return _floor(number * multiplier + 0.5 - (number < 0 and 1 or 0)) / multiplier
end)

local lua_internal_callbacks = {}
local lua_internal_exports = {}
local protect_lua_value
			local dispatch_lua_internal = LPH_ENCFUNC(function(handle, ...)
	local callback = lua_internal_callbacks[handle]

	if _type(callback) ~= 'function' then
		error('ไม่พบฟังก์ชันภายในระบบ', 2)
	end

	local results = _pack(callback(...))

	for index = 1, results.n do
		results[index] = protect_lua_value(results[index])
	end

	return _unpack(results, 1, results.n)
end, 'ba372df66d4c9d0c2d193367a39ae77a56a173213cd71b164be6d19bf8c640d2', lua_bridge_decryption_key)

protect_lua_value = LPH_ENCFUNC(function(value, visited)
	local value_type = _type(value)

	if value_type == 'function' then
		local handle = {}
		lua_internal_callbacks[handle] = value

		return LPH_NO_UPVALUES(function(...)
			return dispatch_lua_internal(handle, ...)
		end)
	end

	if value_type ~= 'table' then
		return value
	end

	visited = visited or {}

	if visited[value] then
		return visited[value]
	end

	local copy = {}
	visited[value] = copy

	for index, child in value do
		copy[protect_lua_value(index, visited)] = protect_lua_value(child, visited)
	end

	_freeze(copy)

	return copy
end, 'dc6ca3570f8d9a75a7558f26165b92749565c346b9e4f19d8f7ac2a46ada1ac8', lua_export_decryption_key)
			if not isfolder('NEXTSHOP') then
	makefolder('NEXTSHOP')
end

if not isfolder('NEXTSHOP/configs') then
	makefolder('NEXTSHOP/configs')
end

if not isfolder('NEXTSHOP/assets') then
	makefolder('NEXTSHOP/assets')
end

if not isfolder('NEXTSHOP/luas') then
	makefolder('NEXTSHOP/luas')
end

function library._save(self: runtime_typeof)
	return true
end

function library._disabled_save(self: runtime_typeof)
	if not isfile(`NEXTSHOP/configs/{game.GameId}.json`) then
		writefile(`NEXTSHOP/configs/{game.GameId}.json`, http_service:JSONEncode({}))
	end

	for index, value in _pairs(self._flags) do
		self._config[index] = _type(value) == 'table' and http_service:JSONDecode(http_service:JSONEncode(value))
			or value
	end

	_pcall(function()
		writefile(`NEXTSHOP/configs/{game.GameId}.json`, http_service:JSONEncode(self._config))
	end)
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

	local loading = create_new('Frame', {
		Name = '_nextshop_loading',
		BackgroundColor3 = VIREX_BG,
		Size = _new_udim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		ZIndex = 1000,
		Parent = _main,
	})

	local loading_scale = create_new('UIScale', {
		Scale = 0.94,
		Parent = loading,
	})

	local loading_title = create_label({
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, -24),
		Size = _new_udim2(0, 320, 0, 48),
		Text = 'NEXT SHOP',
		TextColor3 = VIREX_TEXT,
		TextSize = 34,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 1002,
		Parent = loading,
	})

	create_new('UIGradient', {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, VIREX_ACCENT),
			ColorSequenceKeypoint.new(0.5, VIREX_TEXT),
			ColorSequenceKeypoint.new(1, VIREX_PURPLE),
		}),
		Parent = loading_title,
	})

	local loading_subtitle = create_label({
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 18),
		Size = _new_udim2(0, 320, 0, 24),
		Text = 'กำลังเตรียมความพร้อมระบบ',
		TextColor3 = VIREX_MUTED,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 1002,
		Parent = loading,
	})

	local loading_track = create_new('Frame', {
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 54),
		Size = _new_udim2(0, 210, 0, 4),
		BackgroundColor3 = VIREX_PANEL_2,
		BorderSizePixel = 0,
		ZIndex = 1002,
		Parent = loading,
	})
	create_pill(loading_track)

	local loading_fill = create_new('Frame', {
		Size = _new_udim2(0, 0, 1, 0),
		BackgroundColor3 = VIREX_ACCENT,
		BorderSizePixel = 0,
		ZIndex = 1003,
		Parent = loading_track,
	})
	create_pill(loading_fill)

	local loading_status = create_label({
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 78),
		Size = _new_udim2(0, 320, 0, 20),
		Text = 'กำลังโหลด 0%',
		TextColor3 = Color3.fromRGB(140, 130, 160),
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 1002,
		Parent = loading,
	})

	_create_tween(tween_service, loading_scale, _new_tween_info(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Scale = 1,
	}):Play()
	_create_tween(tween_service, loading_fill, _new_tween_info(1.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Size = _new_udim2(1, 0, 1, 0),
	}):Play()

	task.spawn(function()
		for _, percent in {25, 50, 75, 100} do
			task.wait(0.28)
			if loading_status.Parent then
				loading_status.Text = `กำลังโหลด {percent}%`
			end
		end
		task.wait(0.25)
		if loading.Parent then
			for _, object in {loading, loading_title, loading_subtitle, loading_status, loading_track, loading_fill} do
				local property = object:IsA('TextLabel') and 'TextTransparency' or 'BackgroundTransparency'
				_create_tween(tween_service, object, _new_tween_info(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					[property] = 1,
				}):Play()
			end
			task.wait(0.4)
			if loading.Parent then
				loading:Destroy()
			end
		end
	end)

	local container = create_new('Frame', {
		BackgroundColor3 = VIREX_BG,
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 0),
		Size = _new_udim2(0, 0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Active = true,
		Parent = _main,
	})

	create_round(container, 12)
	local container_outline = create_outline(container)
	container_outline.Color = VIREX_ACCENT_DARK
	container_outline.Transparency = 0.25

	task.delay(0.65, function()
		if container.Parent then
			_create_tween(tween_service, container, _new_tween_info(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = _udim2_from_offset(600, 400),
			}):Play()
		end
	end)

	local ui_scale = create_new('UIScale', {
		Parent = container,
	})

	self._ui_scale_object = ui_scale

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

	local apply_scale = LPH_NO_VIRTUALIZE(function()
		if self._is_mobile then
			local viewport_size = workspace.CurrentCamera.ViewportSize

			if self._ui and self._ui.AbsoluteSize.Y > 0 then
				viewport_size = self._ui.AbsoluteSize
			end

			local screen_scale = (viewport_size.X / 1400) * 1.4375
			self._ui_scale = _clamp(
				_min(screen_scale, (viewport_size.X * 0.95) / 600, (viewport_size.Y * 0.95) / 400),
				0.503125,
				1.4375
			)
		else
			self._ui_scale = 1
		end

		local scale = self._ui_scale

		ui_scale.Scale = scale

		if self._keybind_scale then
			self._keybind_scale.Scale = scale
		end

		if self._notification_holder and self._notification_scale then
			self._notification_holder.Position = _new_udim2(0.5, 0, 0.5, 178 * scale)
			self._notification_scale.Scale = scale
		end

		_defer(function()
			if self._active_tab and self._pin then
				local button = self._active_tab._btn
				local pin_y = (button.AbsolutePosition.Y - self._sidebar.AbsolutePosition.Y + button.AbsoluteSize.Y / 2)
						/ self._ui_scale
					- 8
				self._pin.Position = _new_udim2(0, 10, 0, pin_y)
			end
		end)
	end)

	self._apply_scale = apply_scale

	apply_scale()

	workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(function()
		_defer(apply_scale)
	end)

	local _toggle_gui = create_new('ScreenGui', {
		Name = '_nextshop_toggle',
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = _main,
	})

	local mobile_toggle = create_new('TextButton', {
		BackgroundColor3 = VIREX_PANEL_2,
		AnchorPoint = _new_vector2(0, 0),
		Position = _new_udim2(0, 18, 0, 54),
		Size = _new_udim2(0, 44, 0, 44),
		Text = '',
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Visible = true,
		Active = true,
		ZIndex = 100,
		Parent = _toggle_gui,
	})

	create_round(mobile_toggle, 999)
	local toggle_outline = create_outline(mobile_toggle)
	toggle_outline.Color = VIREX_ACCENT_DARK
	toggle_outline.Thickness = 1.5

	local vx_logo = create_new('TextLabel', {
		BackgroundTransparency = 1,
		AnchorPoint = _new_vector2(0.5, 0.5),
		Position = _new_udim2(0.5, 0, 0.5, 0),
		Size = _new_udim2(1, -8, 1, -8),
		Text = 'NS',
		TextColor3 = VIREX_TEXT,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 101,
		Parent = mobile_toggle,
	})

	create_new('UIStroke', {
		Color = VIREX_ACCENT,
		Thickness = 0.65,
		Transparency = 0.15,
		Parent = vx_logo,
	})

	local vx_gradient = create_new('UIGradient', {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, VIREX_ACCENT),
			ColorSequenceKeypoint.new(0.5, VIREX_PURPLE),
			ColorSequenceKeypoint.new(1, VIREX_CYAN),
		}),
		Rotation = 0,
		Parent = vx_logo,
	})

	mobile_toggle.MouseEnter:Connect(function()
		_create_tween(tween_service, mobile_toggle, _new_tween_info(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundColor3 = VIREX_HOVER,
			Size = _new_udim2(0, 48, 0, 48),
		}):Play()
		_create_tween(tween_service, vx_logo, _new_tween_info(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			TextSize = 17,
		}):Play()
	end)

	mobile_toggle.MouseLeave:Connect(function()
		_create_tween(tween_service, mobile_toggle, _new_tween_info(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundColor3 = VIREX_PANEL_2,
			Size = _new_udim2(0, 44, 0, 44),
		}):Play()
		_create_tween(tween_service, vx_logo, _new_tween_info(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			TextSize = 15,
		}):Play()
	end)

	task.spawn(function()
		local palette = { VIREX_ACCENT, VIREX_PURPLE, VIREX_BLUE, VIREX_CYAN, VIREX_GREEN, VIREX_GOLD }
		local index = 1
		while vx_logo.Parent do
			local next_index = (index % #palette) + 1
			_create_tween(tween_service, toggle_outline, _new_tween_info(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Color = palette[next_index] }):Play()
			_create_tween(tween_service, vx_gradient, _new_tween_info(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Rotation = vx_gradient.Rotation + 90 }):Play()
			task.wait(1.1)
			index = next_index
		end
	end)

	local sidebar = create_new('Frame', {
		BackgroundColor3 = Color3.fromRGB(16, 13, 22),
		BackgroundTransparency = 0,
		Size = _new_udim2(0, 160, 1, 0),
		Parent = container,
	})

	create_divider(sidebar, _new_udim2(1, -1, 0, 48), _new_udim2(0, 1, 1, -48))

	local logo_area = create_new('Frame', {
		BackgroundTransparency = 1,
		Size = _new_udim2(1, 0, 0, 48),
		Parent = sidebar,
	})

	create_label({
		Position = _new_udim2(0, (10 + 10), 0, 0),
		Size = _new_udim2(1, -((10 + 10) + 10), 1, 0),
		Text = 'NEXT SHOP',
		TextColor3 = VIREX_TEXT,
		TextSize = self._is_mobile and 16 or 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = logo_area,
	})

	create_divider(logo_area, _new_udim2(0, 0, 1, -1), _new_udim2(1, 0, 0, 1))

	local pin = create_new('Frame', {
		BackgroundColor3 = VIREX_ACCENT,
		BackgroundTransparency = 1,
		Position = _new_udim2(0, 10, 0, 0),
		Size = _new_udim2(0, 4, 0, 16),
		BorderSizePixel = 0,
		ZIndex = 50,
		Parent = sidebar,
	})

	create_pill(pin)

	local tabs_container = create_new('ScrollingFrame', {
		BackgroundTransparency = 1,
		Position = _new_udim2(0, 0, 0, 48),
		Size = _new_udim2(1, 0, 1, -48),
		CanvasSize = _new_udim2(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		Parent = sidebar,
	})

	tabs_container.ScrollBarThickness = 0
	tabs_container.ScrollBarImageTransparency = 1
	tabs_container.VerticalScrollBarInset = Enum.ScrollBarInset.None
	tabs_container.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	tabs_container.ClipsDescendants = true
	create_padding(tabs_container, 6, 16, 10, 10)
	create_vertical_list(tabs_container, 6)

	tabs_container:GetPropertyChangedSignal('CanvasPosition'):Connect(function()
		if self._active_tab then
			local button = self._active_tab._btn
			local pin_y = (button.AbsolutePosition.Y - self._sidebar.AbsolutePosition.Y + button.AbsoluteSize.Y / 2)
					/ self._ui_scale
				- 8
			pin.Position = _new_udim2(0, 10, 0, pin_y)
		end
	end)

	local main_content = create_new('Frame', {
		BackgroundTransparency = 1,
		Position = _new_udim2(0, 160, 0, 0),
		Size = _new_udim2(0, (600 - 160), 1, 0),
		Parent = container,
	})

	local topbar = create_new('Frame', {
		BackgroundTransparency = 1,
		Size = _new_udim2(1, 0, 0, 48),
		ZIndex = 5,
		Parent = main_content,
	})

	create_new('Frame', {
		BackgroundColor3 = VIREX_ACCENT,
		BackgroundTransparency = 0.2,
		Position = _new_udim2(0, 0, 1, -2),
		Size = _new_udim2(0.34, 0, 0, 2),
		BorderSizePixel = 0,
		ZIndex = 7,
		Parent = topbar,
	})

	local topbar_divider = create_divider(topbar, _new_udim2(0, 0, 1, -1), _new_udim2(1, 0, 0, 1))
	topbar_divider.ZIndex = 6

	local sections_viewport = create_new('Frame', {
		BackgroundTransparency = 1,
		Position = _new_udim2(0, 0, 0, 48),
		Size = _new_udim2(1, 0, 1, -48),
		ClipsDescendants = true,
		Parent = main_content,
	})

	local sections = create_new('Folder', {
		Parent = sections_viewport,
	})

	local input_ended_connection = nil

	local on_drag = LPH_JIT_MAX(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
		then
			self._dragging = true

			self._drag_start = input.Position
			self._container_position = container.Position

			self:close_all_dropdowns()

			if input_ended_connection then
				input_ended_connection:Disconnect()
				input_ended_connection = nil
			end

			input_ended_connection = input.Changed:Connect(function()
				if input.UserInputState ~= Enum.UserInputState.End then
					return
				end

				if input_ended_connection then
					input_ended_connection:Disconnect()
					input_ended_connection = nil
				end

				self._dragging = false
			end)
		end
	end)

	local drag = LPH_JIT_MAX(function(input)
		if not self._dragging then
			return
		end

		if
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		then
			local scale = self._ui_scale
			local delta = (input.Position - self._drag_start) / scale

			_create_tween(tween_service, container, _new_tween_info(0.2), {
				Position = (_new_udim2(
					self._container_position.X.Scale,
					self._container_position.X.Offset + delta.X,
					self._container_position.Y.Scale,
					self._container_position.Y.Offset + delta.Y
				)),
			}):Play()
		end
	end)

	container.InputBegan:Connect(on_drag)
	user_input_service.InputChanged:Connect(drag)

	function self:change_visibility(state)
		if state then
			container.Visible = true

			_create_tween(
				tween_service,
				container,
				_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{
					Size = _udim2_from_offset(600, 400),
				}
			):Play()
		else
			self:close_all_dropdowns()

			_create_tween(
				tween_service,
				container,
				_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{
					Size = _new_udim2(0, 0, 0, 0),
				}
			):Play()

			_delay(0.5, function()
				if not self._ui_open then
					container.Visible = false
				end
			end)
		end
	end

	user_input_service.InputBegan:Connect(function(input, processed)
		if processed then
			return
		end

		local minimize_flag = self._flags.minimize
		local minimize_key = Enum.KeyCode.Insert

		if minimize_flag then
			local success, result = _pcall(function()
				return Enum.KeyCode[minimize_flag]
			end)

			if success then
				minimize_key = result
			end
		end

		if input.KeyCode == minimize_key then
			self._ui_open = not self._ui_open

			self:change_visibility(self._ui_open)
		end
	end)

	mobile_toggle.MouseButton1Click:Connect(function()
		self._ui_open = not self._ui_open

		_create_tween(tween_service, vx_logo, _new_tween_info(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Rotation = self._ui_open and 0 or -8,
			TextSize = self._ui_open and 17 or 15,
		}):Play()

		self:change_visibility(self._ui_open)
	end)

	self._container = container
	self._sidebar = sidebar
	self._pin = pin

	self._tabs_container = tabs_container
	self._main_content = main_content
	self._sections = sections
	self._topbar = topbar
		end
			function library.update_tabs(self: _runtime, tab: tab_typeof)
	for _, tab_data in self._tabs do
		local btn = tab_data._btn

		local tab_icon = btn:FindFirstChildWhichIsA('ImageLabel')
		local tab_label = btn:FindFirstChildWhichIsA('TextLabel')

		if tab_data == tab then
			tab_data._active = true

			_create_tween(tween_service, btn, _new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0,
			}):Play()

			if tab_label then
				_create_tween(
					tween_service,
					tab_label,
					_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{
						TextColor3 = Color3.fromRGB(255, 255, 255),
					}
				):Play()
			end

			if tab_icon then
				_create_tween(
					tween_service,
					tab_icon,
					_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{
						ImageColor3 = Color3.fromRGB(255, 255, 255),
					}
				):Play()
			end

			local target_y = (btn.AbsolutePosition.Y - self._sidebar.AbsolutePosition.Y + btn.AbsoluteSize.Y / 2)
					/ self._ui_scale
				- 8

			if self._pin.BackgroundTransparency == 1 then
				self._pin.Position = _new_udim2(0, 10, 0, target_y)
				self._pin.BackgroundTransparency = 0
			else
				_create_tween(
					tween_service,
					self._pin,
					_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{
						Position = _new_udim2(0, 10, 0, target_y),
					}
				):Play()
			end

			continue
		end

		if tab_data._active then
			tab_data._active = false

			_create_tween(tween_service, btn, _new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				BackgroundTransparency = 1,
			}):Play()

			if tab_label then
				_create_tween(
					tween_service,
					tab_label,
					_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{
						TextColor3 = Color3.fromRGB(190, 180, 205),
					}
				):Play()
			end

			if tab_icon then
				_create_tween(
					tween_service,
					tab_icon,
					_new_tween_info(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{
						ImageColor3 = Color3.fromRGB(190, 180, 205),
					}
				):Play()
			end
		end
	end
end

function library.update_sections(self: _runtime, left_section: ScrollingFrame, right_section: ScrollingFrame)
	for _, object in self._sections:GetChildren() do
		if object == left_section or object == right_section then
			object.Visible = true

			for index, child in object:GetChildren() do
				if child:IsA('Frame') and child ~= object then
					local original = child.BackgroundTransparency
					child.BackgroundTransparency = 1
					_create_tween(
						tween_service,
						child,
						_new_tween_info(0.28 + (index * 0.025), Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
						{ BackgroundTransparency = original }
					):Play()
				end
			end

			continue
		end

		object.Visible = false
	end
end

local function resolve_runtime(self: runtime_typeof): _runtime?
	if self ~= library and _type(self) == 'table' and self._tabs then
		return self :: _runtime
	end

	return library._current
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

	local text_width =
		text_service:GetTextSize(text, self._label_text_size, Enum.Font.GothamSemibold, _new_vector2(1000, 26)).X
	local width = _clamp(text_width + 24, 72, 540)

	self._notification_order += 1

	local notification = create_new('Frame', {
		Name = '_notification',
		BackgroundColor3 = VIREX_PANEL,
		BackgroundTransparency = 1,
		LayoutOrder = self._notification_order,
		Size = _new_udim2(0, width - 12, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 200,
		Parent = self._notification_holder,
	})

	create_round(notification, 6)

	local notification_outline = create_outline(notification)
	notification_outline.Color = VIREX_ACCENT
	notification_outline.Transparency = 1

	local notification_label = create_label({
		Position = _new_udim2(0, 10, 0, 0),
		Size = _new_udim2(1, -20, 1, 0),
		Text = text,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = self._label_text_size,
		TextTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 201,
		Parent = notification,
	})

	_create_tween(
		tween_service,
		notification,
		_new_tween_info(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{
			BackgroundTransparency = 0,
			Size = _new_udim2(0, width, 0, 26),
		}
	):Play()
	_create_tween(
		tween_service,
		notification_label,
        _new_tween_info(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{
			TextTransparency = 0.1,
		}
	):Play()
	_create_tween(
		tween_service,
		notification_outline,
		_new_tween_info(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{
			Transparency = 0,
		}
	):Play()

	_delay(2.7, function()
		if not notification.Parent then
			return
		end

		_create_tween(
			tween_service,
			notification,
			_new_tween_info(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
			{
				BackgroundTransparency = 1,
				Size = _new_udim2(0, width - 12, 0, 0),
			}
		):Play()
		_create_tween(
			tween_service,
			notification_label,
			_new_tween_info(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
			{
				TextTransparency = 1,
			}
		):Play()
		_create_tween(
			tween_service,
			notification_outline,
			_new_tween_info(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
			{
				Transparency = 1,
			}
		):Play()
	end)

	_delay(3, function()
		if notification.Parent then
			notification:Destroy()
		end
	end)
end

function library._init_keybind_list(self: _runtime)
	local keybind_list = create_new('Frame', {
		Name = '_keybind_list',
		BackgroundColor3 = Color3.fromRGB(20, 17, 27),
		Position = _new_udim2(0, 16, 0.2, 0),
		Size = _new_udim2(0, 250, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Visible = false,
		Active = true,
		Parent = self._ui,
	})

	local keybind_scale = create_new('UIScale', {
		Scale = self._ui_scale,
		Parent = keybind_list,
	})

	self._keybind_scale = keybind_scale

	create_round(keybind_list, 4)
	create_outline(keybind_list, true)
	create_vertical_list(keybind_list)

	local keybind_list_header = create_new('Frame', {
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		Size = _new_udim2(1, 0, 0, 32),
		Parent = keybind_list,
	})

	create_new('ImageLabel', {
		BackgroundTransparency = 1,
		AnchorPoint = _new_vector2(0, 0.5),
		Position = _new_udim2(0, 12, 0.5, 0),
		Size = _new_udim2(0, 14, 0, 14),
		Image = 'rbxassetid://10723416765',
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		Parent = keybind_list_header,
	})

	create_label({
		Size = _new_udim2(1, 0, 1, 0),
		Text = 'ปุ่มลัด',
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Center,
		Parent = keybind_list_header,
	})

	create_divider(keybind_list_header, _new_udim2(0, 0, 1, -1), _new_udim2(1, 0, 0, 1))

	local keybind_content = create_new('Frame', {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = _new_udim2(1, 0, 0, 0),
		Parent = keybind_list,
	})

	create_vertical_list(keybind_content, 2)
	create_padding(keybind_content, 6, 8, 12, 12)

	self._keybind_list_frame = keybind_list
	self._keybind_list_content = keybind_content

	local keybind_dragging = false
	local keybind_drag_start = nil
	local keybind_list_position = nil

	keybind_list.InputBegan:Connect(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
		then
			keybind_dragging = true

			keybind_drag_start = input.Position
			keybind_list_position = keybind_list.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					keybind_dragging = false
				end
			end)
		end
	end)

	user_input_service.InputChanged:Connect(function(input)
		if not keybind_dragging then
			return
		end

		if
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		then
			local scale = self._ui_scale
			local delta = (input.Position - keybind_drag_start) / scale

			_create_tween(tween_service, keybind_list, _new_tween_info(0.15), {
				Position = _new_udim2(
					keybind_list_position.X.Scale,
					keybind_list_position.X.Offset + delta.X,
					keybind_list_position.Y.Scale,
					keybind_list_position.Y.Offset + delta.Y
				),
			}):Play()
		end
	end)
end

return library
==])()
end)
			
