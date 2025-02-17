--// Admin Panel Script
--// Uses a custom UI library

local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua"))()

local AdminPanel = UI:CreateWindow({
    Title = "Admin Panel",
    Size = UDim2.new(0, 500, 0, 300),
    CanDrag = true,
    CanMinimize = true
})

local Tabs = {
    "Commands",
    "Settings",
    "Users",
    "Logs",
    "Other"
}

local Scripts = {
    Commands = {
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()",
        "loadstring(game:HttpGet(''))()"
    },
    Settings = {},
    Users = {},
    Logs = {},
    Other = {}
}

for _, tabName in ipairs(Tabs) do
    local Tab = AdminPanel:CreateTab(tabName)
    for i = 1, 10 do
        Tab:CreateButton({
            Text = "Run Script " .. i,
            Callback = function()
                local scriptToRun = Scripts[tabName][i]
                if scriptToRun and scriptToRun ~= "" then
                    loadstring(game:HttpGet(scriptToRun))()
                end
            end
        })
    end
end

return AdminPanel

