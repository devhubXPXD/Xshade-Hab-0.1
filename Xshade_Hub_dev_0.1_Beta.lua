local Name_Program = "Xshade Hub"
local V = " Beta 0.1"
local tag = "developing"

-- โหลด UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib(Name_Program .. V, "DarkTheme")

-- ชื่อต่าง ๆ
local Mn = "หน้าหลัก"
local au_fa_Mn = "ออโต้ฟาร์ม"
local Sever_Mn = "เซิฟเวอร์"
local other_Mn = "อื่นๆ"

local text_Name_sp = "ชื่อสคริปที่รันอยู่ : "
local text_Name_v = "เวอร์ชั่นที่เล่น : "
local text_v_tag = "เนมแท็กสคริป : "
local text_Name_Ply = "ชื่อผู้ใช้สคริป : "
local text_level = "เลเวลผู้ใช้ : "

local bu_text_farm_money = "ออโต้ฟาร์มเงินด้วยกล่อง"
local Description_farm_money = "กดเพื่อเริ่มวาร์ปไปเก็บกล่องจนกว่าจะกดอีกรอบ"
local text_Option_bu = "เลือกอาวุธที่จะออโต้"
local Description_select_weapon_frammob = "เลือกอาวุธ"

local text_jejoin = "รีเซิฟ(อาจใช้เวลานาน)"
local text_kick_All_Player = "เตะผู้เล่นทุกคนออกจากแมพ"

local ESP_ply = "ESP ผู้เล่น"



-- อ้างอิงผู้เล่นและตัวละคร
local Ply = game:GetService("Players").LocalPlayer
local character = Ply.Character or Ply.CharacterAdded:Wait()

local workspace = game:GetService("Workspace")
local chests = { -- ใส่ชื่อของกล่องใน Workspace
    "GoldChest",
    "SilverChest",
    "DimondChest",
}
local chack_auto_farm_money = false

local BackPack = Ply.Backpack
local tools = {} -- ตารางสำหรับเก็บชื่อ Tool

local ck_autofarm_mon = false

local Ply_body = workspace.Characters

-- ตรวจสอบเลเวล (Data ต้องมี)
local level = Ply:FindFirstChild("Data") and Ply.Data:FindFirstChild("Level")

-- สร้าง Tab และ Section
local Tab_Main = Window:NewTab(Mn)
Tab_Main:NewSection(text_Name_sp .. Name_Program)
Tab_Main:NewSection(text_Name_v .. V)
Tab_Main:NewSection(text_v_tag .. tag)
Tab_Main:NewSection(text_Name_Ply .. Ply.Name)
Tab_Main:NewSection(text_level .. (level and level.Value or "ไม่พบเลเวล"))

local Tab_autofarm = Window:NewTab(au_fa_Mn)
local Section_Name_autofarm = Tab_autofarm:NewSection(au_fa_Mn)

-- ฟังก์ชันสำหรับดึง Tool จาก Backpack
local function FramSelectFunction()
    tools = {} -- รีเซ็ตตารางก่อน
    for _, tool in pairs(BackPack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name ~= "Agility" and tool.Name ~= "Tool" then
		if tool:FindFirstChild("Exp") and tool:FindFirstChild("Level") then
			table.insert(tools, tool.Name)
		end
        end
    end
end


local function teleportToChests()
    local Part_chest = workspace.ChestModels

    for _, chestName in ipairs(chests) do
        local chest = Part_chest:FindFirstChild(chestName)
		while chack_auto_farm_money == true and Wait() do
			
		end
        if chest and chest:FindFirstChild("RootPart") and character and character:FindFirstChild("HumanoidRootPart") then
            --print(chest.RootPart.CFrame)
            character.HumanoidRootPart.CFrame = chest.RootPart.CFrame
            task.wait(1) -- รอ 1 วินาที
        else
            print("Cannot use auto Chest for " .. chestName)
        end
    end
end

--------------------------------------------------------------------------------------------------------


-- สร้าง Dropdown สำหรับเลือก Tool
--local Dropdown = Section_Name_autofarm:NewDropdown(text_Option_bu)

-- อัปเดต Dropdown แบบเรียลไทม์
--Ply.Backpack.ChildAdded:Connect(function()
    --FramSelectFunction()
    --Dropdown:Refresh(tools)
--end)

--Ply.Backpack.ChildRemoved:Connect(function()
    --FramSelectFunction()
    --Dropdown:Refresh(tools) -- อัปเดต Dropdown
--end)

-- เรียกใช้งาน FramSelectFunction เมื่อเริ่มต้น
--FramSelectFunction()
--Dropdown:Refresh(tools)

Section_Name_autofarm:NewToggle(bu_text_farm_money, Description_farm_money, function(state)
    if state then
        chack_auto_farm_money = true
        if chack_auto_farm_money == true then
            teleportToChests()
        end
    else
        chack_auto_farm_money = false
    end
end)



Section_Name_autofarm:NewToggle(bu_text_farm_mob, Description_farm_mob, function(state)
     if state then
	ck_autofarm_mon = true
	   if ck_autofarm_mon == true then
			local args = {
    [1] = workspace.Enemies[v.Name],
    [2] = {},
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))

local args = {
    [1] = 0.4000000059604645
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(unpack(args))

for i, v in ipairs(workspace.Enemies:GetChildren()) do
	if v.Name == "Bandit" then
		local args = {
    [1] = workspace.Enemies[v.Name],
    [2] = {},
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))

local args = {
    [1] = 0.4000000059604645
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(unpack(args))
	end
end	
	end
	   else
	ck_autofarm_mon = false
     end
and)






local Tab_sever = Window:NewTab(Sever_Mn)
local text_sever = Tab_sever:NewSection(Sever_Mn)


text_sever:NewButton(text_jejoin, "ButtonInfo", function()
    game.Players.PlayerAdded:Connect(function(plr)
			game:GetService("TeleportService"):Teleport(game.PlaceId, plr, {feature="rejoin";source="game"})
	end)
end)

text_sever:NewButton(text_kick_All_Player, "???", function()
	local ply_1 = game:GetService("Players")
	for _, ply_0 in pairs(ply_1:GetPlayers()) do
		if ply_0.Name ~= Ply.Name then
			ply_0:kick("Ummm...I think you're using a cheat program, so I'm banning you!")
		end
	end
end)

------------------------------------------------------------------------------------

local Tab_other = Window:NewTab(other_Mn)
local text_other = Tab_other:NewSection(other_Mn)

local ck_ESP = false

text_other:NewToggle(ESP_ply, "ButtonInfo", function(state)
ck_ESP = true
    if state and ck_ESP == true then
        while wait() do
			pcall(function()
				for i, v in ipairs(game.Players:GetChildren()) do
		if not v.Character.Head:FindFirstChild("ESP") then
			local BillboardGui = Instance.new("BillboardGui")
            local name = Instance.new("TextLabel")

BillboardGui.Parent = v.Character.Head
BillboardGui.Name = "ESP"
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.Active = true
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 1.000
BillboardGui.Size = UDim2.new(0, 200, 0, 50)
BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

name.Name = "name"
name.Parent = BillboardGui
name.AnchorPoint = Vector2.new(0.5, 0.5)
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.BorderColor3 = Color3.fromRGB(0, 255, 0)
name.Position = UDim2.new(0.5, 0, 0.5, 0)
name.Size = UDim2.new(1, 0, 0.75, 0)
name.Font = Enum.Font.Nunito
name.Text = v.Name
name.TextColor3 = Color3.fromRGB(85, 255, 127)
name.TextScaled = true
name.TextSize = 14.000
name.TextStrokeColor3 = Color3.fromRGB(0, 95, 0)
name.TextStrokeTransparency = 0.000
name.TextWrapped = true
            end
		end
			end)
		end
    else
	
       for i, v in ipairs(game.Players:GetChildren()) do
           if v.Character.Head:FindFirstChild("ESP") then
			   v.Character.Head:FindFirstChild("ESP"):Destroy()
		   end
	   end
    end
end)




--ลิ้งค์ https://xheptcofficial.gitbook.io/kavo-library
--สอน https://www.youtube.com/watch?v=coTkW5AWkZg
--data loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
