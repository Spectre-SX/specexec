--// Custom UI Library
--// Lightweight and efficient

local Library = {}

function Library:CreateWindow(config)
    local Window = Instance.new("ScreenGui")
    Window.Name = config.Title or "UI Window"
    Window.Parent = game.CoreGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = config.Size or UDim2.new(0, 500, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = Window
    
    local Tabs = {}
    
    function Library:CreateTab(name)
        local Tab = {}
        Tab.Frame = Instance.new("Frame")
        Tab.Frame.Size = UDim2.new(1, 0, 1, 0)
        Tab.Frame.BackgroundTransparency = 1
        Tab.Frame.Parent = MainFrame
        Tab.Buttons = {}
        
        function Tab:CreateButton(config)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 0, 30)
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Text = config.Text or "Button"
            Button.Parent = Tab.Frame
            Button.MouseButton1Click:Connect(function()
                if config.Callback then
                    config.Callback()
                end
            end)
            table.insert(Tab.Buttons, Button)
            return Button
        end
        
        Tabs[name] = Tab
        return Tab
    end
    
    return Library
end

return Library
