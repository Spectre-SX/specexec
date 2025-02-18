--// Custom UI Script based on Wisl'i Universal Project
--// UI with 5 Tabs and 10 Buttons per Tab, each executing its own loadstring

local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

--// Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

--// Ensure GUI is over the ESC menu
GuiService:AddSelectionParent("CustomUI", ScreenGui)

--// Main UI Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

--// Tab Handling
local Tabs = {}
local Buttons = {}
local Loadstrings = {
    --// Tab 1 Scripts
    ["Tab1_Button1"] = "loadstring(game:HttpGet('https://your-url.com/script1.lua'))()",
    ["Tab1_Button2"] = "loadstring(game:HttpGet('https://your-url.com/script2.lua'))()",
    ["Tab1_Button3"] = "loadstring(game:HttpGet('https://your-url.com/script3.lua'))()",
    ["Tab1_Button4"] = "loadstring(game:HttpGet('https://your-url.com/script4.lua'))()",
    ["Tab1_Button5"] = "loadstring(game:HttpGet('https://your-url.com/script5.lua'))()",
    ["Tab1_Button6"] = "loadstring(game:HttpGet('https://your-url.com/script6.lua'))()",
    ["Tab1_Button7"] = "loadstring(game:HttpGet('https://your-url.com/script7.lua'))()",
    ["Tab1_Button8"] = "loadstring(game:HttpGet('https://your-url.com/script8.lua'))()",
    ["Tab1_Button9"] = "loadstring(game:HttpGet('https://your-url.com/script9.lua'))()",
    ["Tab1_Button10"] = "loadstring(game:HttpGet('https://your-url.com/script10.lua'))()",
        --// Tab 2 Scripts
    ["Tab1_Button1"] = "loadstring(game:HttpGet('https://your-url.com/script1.lua'))()",
    ["Tab1_Button2"] = "loadstring(game:HttpGet('https://your-url.com/script2.lua'))()",
    ["Tab1_Button3"] = "loadstring(game:HttpGet('https://your-url.com/script3.lua'))()",
    ["Tab1_Button4"] = "loadstring(game:HttpGet('https://your-url.com/script4.lua'))()",
    ["Tab1_Button5"] = "loadstring(game:HttpGet('https://your-url.com/script5.lua'))()",
    ["Tab1_Button6"] = "loadstring(game:HttpGet('https://your-url.com/script6.lua'))()",
    ["Tab1_Button7"] = "loadstring(game:HttpGet('https://your-url.com/script7.lua'))()",
    ["Tab1_Button8"] = "loadstring(game:HttpGet('https://your-url.com/script8.lua'))()",
    ["Tab1_Button9"] = "loadstring(game:HttpGet('https://your-url.com/script9.lua'))()",
    ["Tab1_Button10"] = "loadstring(game:HttpGet('https://your-url.com/script10.lua'))()",
        --// Tab 3 Scripts
    ["Tab1_Button1"] = "loadstring(game:HttpGet('https://your-url.com/script1.lua'))()",
    ["Tab1_Button2"] = "loadstring(game:HttpGet('https://your-url.com/script2.lua'))()",
    ["Tab1_Button3"] = "loadstring(game:HttpGet('https://your-url.com/script3.lua'))()",
    ["Tab1_Button4"] = "loadstring(game:HttpGet('https://your-url.com/script4.lua'))()",
    ["Tab1_Button5"] = "loadstring(game:HttpGet('https://your-url.com/script5.lua'))()",
    ["Tab1_Button6"] = "loadstring(game:HttpGet('https://your-url.com/script6.lua'))()",
    ["Tab1_Button7"] = "loadstring(game:HttpGet('https://your-url.com/script7.lua'))()",
    ["Tab1_Button8"] = "loadstring(game:HttpGet('https://your-url.com/script8.lua'))()",
    ["Tab1_Button9"] = "loadstring(game:HttpGet('https://your-url.com/script9.lua'))()",
    ["Tab1_Button10"] = "loadstring(game:HttpGet('https://your-url.com/script10.lua'))()",
        --// Tab 4 Scripts
    ["Tab1_Button1"] = "loadstring(game:HttpGet('https://your-url.com/script1.lua'))()",
    ["Tab1_Button2"] = "loadstring(game:HttpGet('https://your-url.com/script2.lua'))()",
    ["Tab1_Button3"] = "loadstring(game:HttpGet('https://your-url.com/script3.lua'))()",
    ["Tab1_Button4"] = "loadstring(game:HttpGet('https://your-url.com/script4.lua'))()",
    ["Tab1_Button5"] = "loadstring(game:HttpGet('https://your-url.com/script5.lua'))()",
    ["Tab1_Button6"] = "loadstring(game:HttpGet('https://your-url.com/script6.lua'))()",
    ["Tab1_Button7"] = "loadstring(game:HttpGet('https://your-url.com/script7.lua'))()",
    ["Tab1_Button8"] = "loadstring(game:HttpGet('https://your-url.com/script8.lua'))()",
    ["Tab1_Button9"] = "loadstring(game:HttpGet('https://your-url.com/script9.lua'))()",
    ["Tab1_Button10"] = "loadstring(game:HttpGet('https://your-url.com/script10.lua'))()",
        --// Tab 5 Scripts
    ["Tab1_Button1"] = "loadstring(game:HttpGet('https://your-url.com/script1.lua'))()",
    ["Tab1_Button2"] = "loadstring(game:HttpGet('https://your-url.com/script2.lua'))()",
    ["Tab1_Button3"] = "loadstring(game:HttpGet('https://your-url.com/script3.lua'))()",
    ["Tab1_Button4"] = "loadstring(game:HttpGet('https://your-url.com/script4.lua'))()",
    ["Tab1_Button5"] = "loadstring(game:HttpGet('https://your-url.com/script5.lua'))()",
    ["Tab1_Button6"] = "loadstring(game:HttpGet('https://your-url.com/script6.lua'))()",
    ["Tab1_Button7"] = "loadstring(game:HttpGet('https://your-url.com/script7.lua'))()",
    ["Tab1_Button8"] = "loadstring(game:HttpGet('https://your-url.com/script8.lua'))()",
    ["Tab1_Button9"] = "loadstring(game:HttpGet('https://your-url.com/script9.lua'))()",
    ["Tab1_Button10"] = "loadstring(game:HttpGet('https://your-url.com/script10.lua'))()",
}

--// Function to create tabs
local function CreateTab(name)
    local Tab = Instance.new("TextButton")
    Tab.Size = UDim2.new(0, 100, 0, 30)
    Tab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tab.Text = name
    Tab.Parent = MainFrame
    
    Tabs[name] = Tab
    
    return Tab
end

--// Function to create buttons
local function CreateButton(tabName, buttonName, isToggle)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 150, 0, 30)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = buttonName
    Button.Parent = MainFrame
    
    local toggled = false
    Button.MouseButton1Click:Connect(function()
        if isToggle then
            toggled = not toggled
            if toggled then
                loadstring(Loadstrings[tabName .. "_" .. buttonName])()
            end
        else
            loadstring(Loadstrings[tabName .. "_" .. buttonName])()
        end
    end)
    
    Buttons[tabName .. "_" .. buttonName] = Button
    
    return Button
end

--// Create Tabs
for i = 1, 5 do
    local tabName = "Tab" .. i
    CreateTab(tabName)
    
    --// Create Buttons for each Tab
    for j = 1, 10 do
        CreateButton(tabName, "Button" .. j, false) -- Change false to true if you want it to be a toggle
    end
end
