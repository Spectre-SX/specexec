local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local playername = game.Players.LocalPlayer
local Themepicked = "Default"
local Window = Rayfield:CreateWindow({
   Name = "Spectral Nexus",
   Icon = "atom",
   LoadingTitle = "Spectral Nexus",
   LoadingSubtitle = "by Spectre and Enes",
   Theme = Themepicked,

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Spectral Nexus"
   },

   Discord = {
      Enabled = true,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Player = Window:CreateTab("Player", 4483362458)
local Aimbot = Window:CreateTab("Aimbot", 4483362458)
local Misc = Window:CreateTab("Misc", 4483362458)
local Settings = Window:CreateTab("Settings", 4483362458)
local Credits = Window:CreateTab("Credits", 4483362458)

if playername.Name == "op123468" or playername.Name == "verynotcheat" then
    local OP = Window:CreateTab("OP", 4483362458)

    local FlyButton = OP:CreateButton({
        Name = "Test Notification",
        Callback = function()
            Rayfield:Notify({
                Title = "Notification Tested",
                Content = "Success.",
                Duration = 6.5,
                Image = "cog",
            })
            FlyButton:Set("Sent.") -- ✅ Change text
            task.wait(1)
            FlyButton:Set("Test Notification") -- ✅ Reset text
        end
    })

    local Yarma = OP:CreateButton({
        Name = "YARHM Menu",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
            Rayfield:Notify({
                Title = "Update",
                Content = "Opened",
                Duration = 6.5,
                Image = "circle-check-big",
            })
            Yarma:Set("Opened") -- ✅ Change text
            task.wait(1)
            Yarma:Set("YARHM Menu") -- ✅ Reset text
        end
    })
else
    Rayfield:Destroy()
end

-- Player Buttons
local Fly = Player:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyTog",
   Callback = function(Value)
      -- Function when toggle is pressed
   end,
})

local Noclip = Player:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipTog",
   Callback = function(Value)
   -- function when toggle is pressed
   end,
})

--Settings

local Dropdown = Settings:CreateDropdown({
   Name = "Theme",
   Options = {"Default","Option 2"},
   CurrentOption = {"Option 1"},
   MultipleOptions = false,
   Flag = "ThemeDrop", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(SelectedTheme)
   Window:SetTheme(SelectedTheme)
   Rayfield:Notify({
		Title = "Change",
		Content = "Changed theme to "(SelectedTheme),
		Duration = 6.5,
		Image = "cog",
})
   -- The function that takes place when the selected option is changed
   -- The variable (Options) is a table of strings for the current selected options
   end,
})
