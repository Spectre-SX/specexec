--// SPEC UI (Based on Wisl'i Universal Project)
--// Developers: aviationSpectre & enes

local SPEC_UI = Instance.new("ScreenGui")
SPEC_UI.Name = "SPEC_UI"
SPEC_UI.ResetOnSpawn = false
SPEC_UI.DisplayOrder = 999 -- Ensures it stays above the ESC menu
SPEC_UI.Parent = game:GetService("CoreGui")

-- Main UI Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = SPEC_UI

-- Title Bar
local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.Text = "SPEC Admin Panel"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextScaled = true
TitleBar.Parent = MainFrame

-- Tab Selection Bar
local TabSelection = Instance.new("Frame")
TabSelection.Size = UDim2.new(1, 0, 0, 40)
TabSelection.Position = UDim2.new(0, 0, 0, 40)
TabSelection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabSelection.Parent = MainFrame

-- Button Container
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, 0, 1, -80)
ButtonContainer.Position = UDim2.new(0, 0, 0, 80)
ButtonContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonContainer.Parent = MainFrame

-- UI Layouts
local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Parent = TabSelection

local ButtonLayout = Instance.new("UIListLayout")
ButtonLayout.Parent = ButtonContainer

-- Define tabs & their buttons
local Tabs = {
    Aimbot = {
        { Name = "Ban Player", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Ban.lua" },
        { Name = "Kick Player", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Kick.lua" },
        { Name = "Give Tools", Script = "https://raw.githubusercontent.com/YourRepo/Admin/GiveTools.lua" },
        { Name = "Freeze Player", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Freeze.lua" },
        { Name = "Unfreeze Player", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Unfreeze.lua" },
        { Name = "Force Reset", Script = "https://raw.githubusercontent.com/YourRepo/Admin/ForceReset.lua" },
        { Name = "Speed Boost", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Speed.lua" },
        { Name = "God Mode", Script = "https://raw.githubusercontent.com/YourRepo/Admin/GodMode.lua" },
        { Name = "Invisible", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Invisible.lua" },
        { Name = "Visible", Script = "https://raw.githubusercontent.com/YourRepo/Admin/Visible.lua" }
    },
    Player = {
        { Name = "Fly Mode", Script = "https://raw.githubusercontent.com/YourRepo/Player/Fly.lua" },
        { Name = "Noclip", Script = "https://raw.githubusercontent.com/YourRepo/Player/Noclip.lua" },
        { Name = "Super Jump", Script = "https://raw.githubusercontent.com/YourRepo/Player/SuperJump.lua" },
        { Name = "ESP", Script = "https://raw.githubusercontent.com/YourRepo/Player/ESP.lua" },
        { Name = "X-Ray", Script = "https://raw.githubusercontent.com/YourRepo/Player/XRay.lua" },
        { Name = "Unlock All Skins", Script = "https://raw.githubusercontent.com/YourRepo/Player/UnlockSkins.lua" },
        { Name = "Infinite Stamina", Script = "https://raw.githubusercontent.com/YourRepo/Player/InfiniteStamina.lua" },
        { Name = "No Fall Damage", Script = "https://raw.githubusercontent.com/YourRepo/Player/NoFall.lua" },
        { Name = "Silent Aim", Script = "https://raw.githubusercontent.com/YourRepo/Player/SilentAim.lua" },
        { Name = "Auto Reload", Script = "https://raw.githubusercontent.com/YourRepo/Player/AutoReload.lua" }
    },
    Enhancements = {
        { Name = "Wallhack", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/Wallhack.lua" },
        { Name = "Night Vision", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/NightVision.lua" },
        { Name = "Auto Parry", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/AutoParry.lua" },
        { Name = "Aimbot", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/Aimbot.lua" },
        { Name = "Teleport", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/Teleport.lua" },
        { Name = "No Recoil", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/NoRecoil.lua" },
        { Name = "Fast Fire", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/FastFire.lua" },
        { Name = "Custom Crosshair", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/Crosshair.lua" },
        { Name = "Auto Heal", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/AutoHeal.lua" },
        { Name = "Radar", Script = "https://raw.githubusercontent.com/YourRepo/Enhancements/Radar.lua" }
    }
}

-- Active Tab
local ActiveTab = nil

-- Create Tabs
local function CreateTab(Name, Buttons)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0.2, 0, 1, 0)
    TabButton.Text = Name
    TabButton.TextScaled = true
    TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Parent = TabSelection

    TabButton.MouseButton1Click:Connect(function()
        -- Clear old buttons
        for _, v in pairs(ButtonContainer:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end

        -- Add buttons for the tab
        for _, button in ipairs(Buttons) do
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, 0, 0, 40)
            Btn.Text = button.Name
            Btn.TextScaled = true
            Btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.Parent = ButtonContainer

            Btn.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet(button.Script))()
            end)
        end
    end)

    return TabButton
end

-- Generate Tabs
for tabName, buttons in pairs(Tabs) do
    CreateTab(tabName, buttons)
end
