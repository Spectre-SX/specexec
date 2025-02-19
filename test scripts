local flying = false
local speed = 50
local hoverHeight = 5
local bodyVelocity

local function startFlying()
    flying = true
    local character = game.Players.LocalPlayer.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyVelocity.Parent = humanoidRootPart

    -- Update velocity to keep flying and hovering
    while flying do
        -- Get the current camera direction for moving
        local moveDirection = game:GetService("Workspace").CurrentCamera.CFrame.LookVector
        local moveInput = Vector3.new(0, 0, 0)

        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            moveInput = moveDirection
        elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            moveInput = moveDirection * Vector3.new(-1, 0, 0)
        elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            moveInput = moveDirection * Vector3.new(1, 0, 0)
        elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            moveInput = moveDirection * Vector3.new(0, 0, 1)
        end
        
        -- Adjust vertical movement to hover when no keys are pressed
        if moveInput.Magnitude == 0 then
            moveInput = Vector3.new(0, hoverHeight, 0)  -- Hover upwards with the given height
        else
            moveInput = moveInput + Vector3.new(0, hoverHeight, 0)  -- Include hover height for vertical movement
        end

        bodyVelocity.Velocity = moveInput * speed
        wait(0.1)
    end
    bodyVelocity:Destroy()
end

local function stopFlying()
    flying = false
end

-- Toggle fly mode with key (e.g., "F")
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.F then
        if flying then
            stopFlying()
        else
            startFlying()
        end
    end
end)
