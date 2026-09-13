--// UI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SpinCenterUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.Text = "360° Spin Toggle"
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local nameBox = Instance.new("TextBox", frame)
nameBox.Size = UDim2.new(1, -20, 0, 25)
nameBox.Position = UDim2.new(0, 10, 0, 35)
nameBox.PlaceholderText = "ชื่อผู้เล่น"
nameBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 14

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 75)
button.Text = "เริ่มหมุน"
button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.GothamBold
button.TextSize = 14

---------------------------------------------------------
-- ตัวแปรสถานะ
local active = false
local runLoop = nil

---------------------------------------------------------
-- ค้นหาผู้เล่นจากชื่อ
local function findPlayer(str)
	for _, plr in ipairs(game.Players:GetPlayers()) do
		if plr.Name:lower() == str:lower() or plr.DisplayName:lower() == str:lower() then
			return plr
		end
	end
	return nil
end

---------------------------------------------------------
-- ฟังก์ชันเริ่มหมุนแบบ 360 องศา
local function startSpin(targetChar)
	local char = player.Character
	if not char then return end

	local root = char:FindFirstChild("HumanoidRootPart")
	local tRoot = targetChar:FindFirstChild("HumanoidRootPart")
	if not root or not tRoot then return end

	runLoop = game:GetService("RunService").Heartbeat:Connect(function()
		if not active then return end
		if not tRoot.Parent then return end

		local rootPos = root.Position
		local targetPos = tRoot.Position

		-- หันหน้าเข้าหาเป้าหมาย
		local faceCF = CFrame.lookAt(rootPos, targetPos)

		-- หมุนตัวเอง 360 องศา
		local spinSpeed = 15  -- ปรับความเร็วได้
		local spin = CFrame.Angles(0, tick() * spinSpeed, 0)

		-- รวมการหมุน + หันหน้าเข้าหาเป้าหมาย
		root.CFrame = faceCF * spin
	end)
end

---------------------------------------------------------
-- ฟังก์ชันหยุดหมุน
local function stopSpin()
	active = false
	if runLoop then
		runLoop:Disconnect()
		runLoop = nil
	end
end

---------------------------------------------------------
-- ปุ่มเปิด–ปิด
button.MouseButton1Click:Connect(function()
	if not active then
		local target = findPlayer(nameBox.Text)
		if not target or not target.Character then return end

		active = true
		button.Text = "หยุดหมุน"
		button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)

		startSpin(target.Character)

	else
		stopSpin()
		button.Text = "เริ่มหมุน"
		button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
	end
end)
