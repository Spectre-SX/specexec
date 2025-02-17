-- Advanced Admin Panel for Roblox
-- Inspired by Universal
-- Features: Draggable, Minimized, 5 Tabs, Loadstring Execution, Modern UI

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui")
if not playerGui then return end

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = playerGui
gui.Name = "AdminPanel"
gui.ResetOnSpawn = false

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui
mainFrame.Visible = false

-- Draggable functionality
mainFrame.Active = true
mainFrame.Draggable = true

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Text = "Spectral Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = titleBar

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -35, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
minimizeButton.Parent = titleBar

-- Tabs
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabContainer.Parent = mainFrame

local tabButtons = {}
local tabFrames = {}

for i = 1, 5 do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 80, 1, 0)
    tabButton.Position = UDim2.new(0, (i - 1) * 80, 0, 0)
    tabButton.Text = "Tab " .. i
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tabButton.Parent = tabContainer
    tabButtons[i] = tabButton
    
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, -60)
    tabFrame.Position = UDim2.new(0, 0, 0, 60)
    tabFrame.Parent = mainFrame
    tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabFrame.Visible = (i == 1)
    tabFrames[i] = tabFrame
    
    for j = 1, 10 do
        local execButton = Instance.new("TextButton")
        execButton.Size = UDim2.new(1, -20, 0, 25)
        execButton.Position = UDim2.new(0, 10, 0, (j - 1) * 30)
        execButton.Text = "Execute Script " .. j
        execButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        execButton.BackgroundColor3 = Color3.fromRGB(50, 100, 150)
        execButton.Parent = tabFrame
        
        local scriptURLs = {
            [1] = {
                "https://your-url-here.com/script1.lua", "https://your-url-here.com/script2.lua", "https://your-url-here.com/script3.lua", "https://your-url-here.com/script4.lua", "https://your-url-here.com/script5.lua",
                "https://your-url-here.com/script6.lua", "https://your-url-here.com/script7.lua", "https://your-url-here.com/script8.lua", "https://your-url-here.com/script9.lua", "https://your-url-here.com/script10.lua"
            },
            [2] = {
                "https://your-url-here.com/script11.lua", "https://your-url-here.com/script12.lua", "https://your-url-here.com/script13.lua", "https://your-url-here.com/script14.lua", "https://your-url-here.com/script15.lua",
                "https://your-url-here.com/script16.lua", "https://your-url-here.com/script17.lua", "https://your-url-here.com/script18.lua", "https://your-url-here.com/script19.lua", "https://your-url-here.com/script20.lua"
            }
        }

        execButton.MouseButton1Click:Connect(function()
            local scriptURL = scriptURLs[i][j]
            if scriptURL and scriptURL ~= "" then
                local success, err = pcall(function()
                    loadstring(game:HttpGet(scriptURL))()
                end)
                if not success then
                    warn("Error executing script: " .. tostring(err))
                end
            end
        end)
    end
end

-- Tab Switching
for i, tabButton in pairs(tabButtons) do
    tabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabFrames) do
            tab.Visible = false
        end
        tabFrames[i].Visible = true
    end)
end

-- Minimize Animation
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    local targetSize = minimized and UDim2.new(0, 400, 0, 30) or UDim2.new(0, 400, 0, 300)
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

-- Show UI when loaded
task.wait(1)
mainFrame.Visible = true
