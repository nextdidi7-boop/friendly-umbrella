local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local library = {
    flags = {},
    categories = {},
    theme = {
        background = Color3.fromRGB(24, 24, 28),
        category_bg = Color3.fromRGB(30, 30, 35),
        tab_bg = Color3.fromRGB(38, 38, 45),
        group_bg = Color3.fromRGB(45, 45, 55),
        accent = Color3.fromRGB(85, 170, 255),
        text = Color3.fromRGB(255, 255, 255),
        text_dark = Color3.fromRGB(170, 170, 180),
        border = Color3.fromRGB(60, 60, 70)
    }
}

-- สร้าง ScreenGui สำหรับ UI
local screen_gui = Instance.new("ScreenGui")
screen_gui.Name = "VirexLibrary"
screen_gui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(screen_gui)
    screen_gui.Parent = CoreGui
elseif gethui then
    screen_gui.Parent = gethui()
else
    screen_gui.Parent = CoreGui
end

-- ระบบแจ้งเตือน (Notify)
function library:notify(options)
    options = options or {}
    local title = options.title or "Notification"
    local text = options.text or ""
    local duration = options.duration or 3

    local notify_frame = Instance.new("Frame")
    notify_frame.Size = UDim2.new(0, 220, 0, 60)
    notify_frame.Position = UDim2.new(1, -230, 1, -70)
    notify_frame.BackgroundColor3 = library.theme.group_bg
    notify_frame.BorderSizePixel = 0
    notify_frame.Parent = screen_gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notify_frame

    local title_lbl = Instance.new("TextLabel")
    title_lbl.Size = UDim2.new(1, -20, 0, 20)
    title_lbl.Position = UDim2.new(0, 10, 0, 5)
    title_lbl.Text = title
    title_lbl.TextColor3 = library.theme.accent
    title_lbl.Font = Enum.Font.SourceSansBold
    title_lbl.TextSize = 16
    title_lbl.TextXAlignment = Enum.TextXAlignment.Left
    title_lbl.BackgroundTransparency = 1
    title_lbl.Parent = notify_frame

    local text_lbl = Instance.new("TextLabel")
    text_lbl.Size = UDim2.new(1, -20, 0, 30)
    text_lbl.Position = UDim2.new(0, 10, 0, 25)
    text_lbl.Text = text
    text_lbl.TextColor3 = library.theme.text
    text_lbl.Font = Enum.Font.SourceSans
    text_lbl.TextSize = 14
    text_lbl.TextXAlignment = Enum.TextXAlignment.Left
    text_lbl.TextWrapped = true
    text_lbl.BackgroundTransparency = 1
    text_lbl.Parent = notify_frame

    task.delay(duration, function()
        if notify_frame then notify_frame:Destroy() end
    end)
end
-- 1. ฟังก์ชันสร้าง Category ( library:create_category )
function library:create_category(name)
    local category = {
        name = name,
        tabs = {}
    }

    local cat_frame = Instance.new("Frame")
    cat_frame.Name = name .. "_Category"
    cat_frame.Size = UDim2.new(0, 550, 0, 380)
    cat_frame.Position = UDim2.new(0.5, -275, 0.5, -190)
    cat_frame.BackgroundColor3 = library.theme.background
    cat_frame.BorderSizePixel = 0
    cat_frame.Active = true
    cat_frame.Draggable = true
    cat_frame.Parent = screen_gui

    local cat_corner = Instance.new("UICorner")
    cat_corner.CornerRadius = UDim.new(0, 8)
    cat_corner.Parent = cat_frame

    local title_lbl = Instance.new("TextLabel")
    title_lbl.Size = UDim2.new(1, -20, 0, 30)
    title_lbl.Position = UDim2.new(0, 10, 0, 5)
    title_lbl.Text = name
    title_lbl.TextColor3 = library.theme.text
    title_lbl.Font = Enum.Font.SourceSansBold
    title_lbl.TextSize = 18
    title_lbl.TextXAlignment = Enum.TextXAlignment.Left
    title_lbl.BackgroundTransparency = 1
    title_lbl.Parent = cat_frame

    local tab_bar = Instance.new("Frame")
    tab_bar.Size = UDim2.new(0, 130, 1, -45)
    tab_bar.Position = UDim2.new(0, 10, 0, 38)
    tab_bar.BackgroundColor3 = library.theme.category_bg
    tab_bar.BorderSizePixel = 0
    tab_bar.Parent = cat_frame

    local tab_bar_corner = Instance.new("UICorner")
    tab_bar_corner.CornerRadius = UDim.new(0, 6)
    tab_bar_corner.Parent = tab_bar

    local tab_layout = Instance.new("UIListLayout")
    tab_layout.SortOrder = Enum.SortOrder.LayoutOrder
    tab_layout.Padding = UDim.new(0, 5)
    tab_layout.Parent = tab_bar

    local container_frame = Instance.new("Frame")
    container_frame.Size = UDim2.new(1, -160, 1, -45)
    container_frame.Position = UDim2.new(0, 150, 0, 38)
    container_frame.BackgroundTransparency = 1
    container_frame.Parent = cat_frame

    -- 2. ฟังก์ชันสร้าง Tab ( category:create_tab )
    function category:create_tab(title, icon)
        local tab = {
            title = title,
            groups = {}
        }

        local tab_btn = Instance.new("TextButton")
        tab_btn.Size = UDim2.new(1, 0, 0, 32)
        tab_btn.BackgroundColor3 = library.theme.tab_bg
        tab_btn.Text = "  " .. title
        tab_btn.TextColor3 = library.theme.text_dark
        tab_btn.Font = Enum.Font.SourceSans
        tab_btn.TextSize = 14
        tab_btn.TextXAlignment = Enum.TextXAlignment.Left
        tab_btn.BorderSizePixel = 0
        tab_btn.Parent = tab_bar

        local btn_corner = Instance.new("UICorner")
        btn_corner.CornerRadius = UDim.new(0, 4)
        btn_corner.Parent = tab_btn

        local tab_page = Instance.new("Frame")
        tab_page.Size = UDim2.new(1, 0, 1, 0)
        tab_page.BackgroundTransparency = 1
        tab_page.Visible = false
        tab_page.Parent = container_frame

        local left_side = Instance.new("ScrollingFrame")
        left_side.Size = UDim2.new(0.48, 0, 1, 0)
        left_side.Position = UDim2.new(0, 0, 0, 0)
        left_side.BackgroundTransparency = 1
        left_side.ScrollBarThickness = 2
        left_side.Parent = tab_page

        local left_layout = Instance.new("UIListLayout")
        left_layout.SortOrder = Enum.SortOrder.LayoutOrder
        left_layout.Padding = UDim.new(0, 10)
        left_layout.Parent = left_side

        local right_side = Instance.new("ScrollingFrame")
        right_side.Size = UDim2.new(0.48, 0, 1, 0)
        right_side.Position = UDim2.new(0.52, 0, 0, 0)
        right_side.BackgroundTransparency = 1
        right_side.ScrollBarThickness = 2
        right_side.Parent = tab_page

        local right_layout = Instance.new("UIListLayout")
        right_layout.SortOrder = Enum.SortOrder.LayoutOrder
        right_layout.Padding = UDim.new(0, 10)
        right_layout.Parent = right_side

        tab_btn.MouseButton1Click:Connect(function()
            for _, t in pairs(category.tabs) do
                t.page.Visible = false
                t.button.TextColor3 = library.theme.text_dark
            end
            tab_page.Visible = true
            tab_btn.TextColor3 = library.theme.accent
        end)

        if #category.tabs == 0 then
            tab_page.Visible = true
            tab_btn.TextColor3 = library.theme.accent
        end

        tab.page = tab_page
        tab.button = tab_btn
        tab.left_side = left_side
        tab.right_side = right_side

        -- (ส่วนที่ 3 จะมาเชื่อมกับ tab:create_group ตรงนี้)
        return tab
    end

    table.insert(library.categories, category)
    return category
end
-- ต่อจากส่วนที่ 2: ฟังก์ชันสร้าง Group และ Controls ย่อย
local function apply_group_methods(tab)
    -- 3. ฟังก์ชันสร้าง Group ( tab:create_group )
    function tab:create_group(title, side)
        local group = {}
        local parent_side = (side == "right") and tab.right_side or tab.left_side

        local group_frame = Instance.new("Frame")
        group_frame.Size = UDim2.new(1, -5, 0, 40)
        group_frame.BackgroundColor3 = library.theme.group_bg
        group_frame.BorderSizePixel = 0
        group_frame.Parent = parent_side

        local group_corner = Instance.new("UICorner")
        group_corner.CornerRadius = UDim.new(0, 6)
        group_corner.Parent = group_frame

        local group_title = Instance.new("TextLabel")
        group_title.Size = UDim2.new(1, -10, 0, 25)
        group_title.Position = UDim2.new(0, 10, 0, 2)
        group_title.Text = title
        group_title.TextColor3 = library.theme.accent
        group_title.Font = Enum.Font.SourceSansBold
        group_title.TextSize = 14
        group_title.TextXAlignment = Enum.TextXAlignment.Left
        group_title.BackgroundTransparency = 1
        group_title.Parent = group_frame

        local group_layout = Instance.new("UIListLayout")
        group_layout.SortOrder = Enum.SortOrder.LayoutOrder
        group_layout.Padding = UDim.new(0, 5)
        group_layout.Parent = group_frame

        local function update_group_size()
            local total_height = group_layout.AbsoluteContentSize.Y + 15
            group_frame.Size = UDim2.new(1, -5, 0, total_height)
        end
        group_layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update_group_size)

        -- 4. ฟังก์ชันสร้าง Elements ต่างๆ ใน Group ( group:create_... )

        -- Toggle
        function group:create_toggle(flag, values)
            values = values or {}
            local text = values.title or flag
            local default = values.default or false
            local callback = values.callback or function() end

            library.flags[flag] = default

            local toggle_btn = Instance.new("TextButton")
            toggle_btn.Size = UDim2.new(1, -16, 0, 25)
            toggle_btn.Position = UDim2.new(0, 8, 0, 0)
            toggle_btn.BackgroundTransparency = 1
            toggle_btn.Text = "  " .. text
            toggle_btn.TextColor3 = default and library.theme.text or library.theme.text_dark
            toggle_btn.Font = Enum.Font.SourceSans
            toggle_btn.TextSize = 13
            toggle_btn.TextXAlignment = Enum.TextXAlignment.Left
            toggle_btn.Parent = group_frame

            local box = Instance.new("Frame")
            box.Size = UDim2.new(0, 16, 0, 16)
            box.Position = UDim2.new(1, -20, 0.5, -8)
            box.BackgroundColor3 = default and library.theme.accent or library.theme.tab_bg
            box.BorderSizePixel = 0
            box.Parent = toggle_btn

            local box_corner = Instance.new("UICorner")
            box_corner.CornerRadius = UDim.new(0, 4)
            box_corner.Parent = box

            toggle_btn.MouseButton1Click:Connect(function()
                library.flags[flag] = not library.flags[flag]
                local state = library.flags[flag]
                box.BackgroundColor3 = state and library.theme.accent or library.theme.tab_bg
                toggle_btn.TextColor3 = state and library.theme.text or library.theme.text_dark
                callback(state)
            end)
        end

        -- Button
        function group:create_button(values)
            values = values or {}
            local text = values.title or "Button"
            local callback = values.callback or function() end

            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -16, 0, 26)
            btn.BackgroundColor3 = library.theme.tab_bg
            btn.Text = text
            btn.TextColor3 = library.theme.text
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 13
            btn.BorderSizePixel = 0
            btn.Parent = group_frame

            local btn_corner = Instance.new("UICorner")
            btn_corner.CornerRadius = UDim.new(0, 4)
            btn_corner.Parent = btn

            btn.MouseButton1Click:Connect(function()
                callback()
            end)
        end

        -- Slider
        function group:create_slider(flag, values)
            values = values or {}
            local text = values.title or flag
            local min = values.min or 0
            local max = values.max or 100
            local default = values.default or min
            local callback = values.callback or function() end

            library.flags[flag] = default

            local slider_frame = Instance.new("Frame")
            slider_frame.Size = UDim2.new(1, -16, 0, 40)
            slider_frame.BackgroundTransparency = 1
            slider_frame.Parent = group_frame

            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, 0, 0, 18)
            lbl.Text = text .. ": " .. tostring(default)
            lbl.TextColor3 = library.theme.text
            lbl.Font = Enum.Font.SourceSans
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.BackgroundTransparency = 1
            lbl.Parent = slider_frame

            local bar = Instance.new("Frame")
            bar.Size = UDim2.new(1, 0, 0, 8)
            bar.Position = UDim2.new(0, 0, 0, 22)
            bar.BackgroundColor3 = library.theme.tab_bg
            bar.BorderSizePixel = 0
            bar.Parent = slider_frame

            local fill = Instance.new("Frame")
            fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            fill.BackgroundColor3 = library.theme.accent
            fill.BorderSizePixel = 0
            fill.Parent = bar

            -- Simple Slider Drag Logic
            local dragging = false
            bar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                    local val = math.floor(min + (max - min) * pos)
                    fill.Size = UDim2.new(pos, 0, 1, 0)
                    lbl.Text = text .. ": " .. tostring(val)
                    library.flags[flag] = val
                    callback(val)
                end
            end)
        end

        -- Textbox
        function group:create_textbox(flag, values)
            values = values or {}
            local text = values.title or flag
            local default = values.default or ""
            local callback = values.callback or function() end

            library.flags[flag] = default

            local box_frame = Instance.new("Frame")
            box_frame.Size = UDim2.new(1, -16, 0, 30)
            box_frame.BackgroundTransparency = 1
            box_frame.Parent = group_frame

            local tb = Instance.new("TextBox")
            tb.Size = UDim2.new(1, 0, 1, 0)
            tb.BackgroundColor3 = library.theme.tab_bg
            tb.Text = default ~= "" and default or text
            tb.TextColor3 = library.theme.text
            tb.Font = Enum.Font.SourceSans
            tb.TextSize = 13
            tb.BorderSizePixel = 0
            tb.Parent = box_frame

            local tb_corner = Instance.new("UICorner")
            tb_corner.CornerRadius = UDim.new(0, 4)
            tb_corner.Parent = tb

            tb.FocusLost:Connect(function()
                library.flags[flag] = tb.Text
                callback(tb.Text)
            end)
        end

        -- Dropdown
        function group:create_dropdown(flag, values)
            values = values or {}
            local text = values.title or flag
            local list = values.list or {}
            local default = values.default or list[1]
            local callback = values.callback or function() end

            library.flags[flag] = default

            local dd_btn = Instance.new("TextButton")
            dd_btn.Size = UDim2.new(1, -16, 0, 26)
            dd_btn.BackgroundColor3 = library.theme.tab_bg
            dd_btn.Text = text .. ": " .. tostring(default)
            dd_btn.TextColor3 = library.theme.text
            dd_btn.Font = Enum.Font.SourceSans
            dd_btn.TextSize = 13
            dd_btn.BorderSizePixel = 0
            dd_btn.Parent = group_frame

            local dd_corner = Instance.new("UICorner")
            dd_corner.CornerRadius = UDim.new(0, 4)
            dd_corner.Parent = dd_btn

            local count = 0
            dd_btn.MouseButton1Click:Connect(function()
                count = count + 1
                local selected = list[(count % #list) + 1] or list[1]
                dd_btn.Text = text .. ": " .. tostring(selected)
                library.flags[flag] = selected
                callback(selected)
            end)
        end

        -- Keybind
        function group:create_keybind(flag, values)
            values = values or {}
            local text = values.title or flag
            local default = values.default or Enum.KeyCode.E
            local callback = values.callback or function() end

            library.flags[flag] = default

            local kb_btn = Instance.new("TextButton")
            kb_btn.Size = UDim2.new(1, -16, 0, 26)
            kb_btn.BackgroundColor3 = library.theme.tab_bg
            kb_btn.Text = text .. ": " .. default.Name
            kb_btn.TextColor3 = library.theme.text
            kb_btn.Font = Enum.Font.SourceSans
            kb_btn.TextSize = 13
            kb_btn.BorderSizePixel = 0
            kb_btn.Parent = group_frame

            local kb_corner = Instance.new("UICorner")
            kb_corner.CornerRadius = UDim.new(0, 4)
            kb_corner.Parent = kb_btn

            local binding = false
            kb_btn.MouseButton1Click:Connect(function()
                kb_btn.Text = text .. ": Press Key..."
                binding = true
            end)

            UserInputService.InputBegan:Connect(function(input)
                if binding and input.UserInputType == Enum.UserInputType.Keyboard then
                    binding = false
                    library.flags[flag] = input.KeyCode
                    kb_btn.Text = text .. ": " .. input.KeyCode.Name
                    callback(input.KeyCode)
                end
            end)
        end

        return group
    end
end

-- Hook ฟังก์ชันให้กับ Tab
local old_create_tab = library.categories
-- Hook ระบบ Tab ให้สามารถเรียกสร้าง Group ได้สมบูรณ์
local raw_create_cat = library.create_category
function library:create_category(name)
    local cat = raw_create_cat(self, name)
    local raw_create_tab = cat.create_tab
    function cat:create_tab(title, icon)
        local tab = raw_create_tab(self, title, icon)
        apply_group_methods(tab)
        return tab
    end
    return cat
end

-- =============================================================
-- ตัวอย่างการนำไปใช้งานทันที (Example Usage)
-- =============================================================

-- 1. สร้าง Main Window (Category)
local MainCategory = library:create_category("Virex Hub")

-- 2. สร้าง Tab
local MainTab = MainCategory:create_tab("Main", "")
local SettingsTab = MainCategory:create_tab("Settings", "")

-- 3. สร้าง Group ด้านซ้ายและขวา
local FarmGroup = MainTab:create_group("Auto Farm Options", "left")
local PlayerGroup = MainTab:create_group("Player Settings", "right")

-- 4. เพิ่ม Controls ต่างๆ
FarmGroup:create_toggle("autofarm", {
    title = "Enable Auto Farm",
    default = false,
    callback = function(state)
        print("Auto Farm:", state)
    end
})

FarmGroup:create_dropdown("selected_mode", {
    title = "Farm Mode",
    list = {"Level", "Coins", "Items"},
    default = "Level",
    callback = function(selected)
        print("Selected Mode:", selected)
    end
})

PlayerGroup:create_slider("walkspeed", {
    title = "Walk Speed",
    min = 16,
    max = 100,
    default = 16,
    callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

PlayerGroup:create_keybind("teleport_key", {
    title = "Teleport Key",
    default = Enum.KeyCode.E,
    callback = function(key)
        print("Pressed Teleport Key:", key)
    end
})

PlayerGroup:create_button({
    title = "Test Notification",
    callback = function()
        library:notify({
            title = "Success",
            text = "Button Clicked Successfully!",
            duration = 3
        })
    end
})

-- แจ้งเตือนเมื่อโหลดสำเร็จ
library:notify({
    title = "Virex UI",
    text = "Loaded successfully!",
    duration = 4
})
