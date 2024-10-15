-- VIPCommands.lua

return {
    fly = function(player)
        -- Enabling a very basic fly system using BodyPosition (can be extended)
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local bodyPosition = Instance.new("BodyPosition", humanoidRootPart)
            bodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)  -- Control force limits
            bodyPosition.Position = humanoidRootPart.Position + Vector3.new(0, 50, 0) -- Move up 50 studs to simulate flight
            print(player.Name .. " is now flying.")
        end
    end,

    speed = function(player, speed)
        -- Adjust player's speed
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = tonumber(speed) or 16  -- Default to 16 if no valid speed is given
            print(player.Name .. " walk speed set to: " .. humanoid.WalkSpeed)
        end
    end,

    jump = function(player, height)
        -- Adjust player's jump power
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = tonumber(height) or 50  -- Default to 50 if no valid height is given
            print(player.Name .. " jump power set to: " .. humanoid.JumpPower)
        end
    end,

    vipitem = function(player)
        -- Give a VIP-specific item (like a gear or tool)
        local vipTool = Instance.new("Tool")
        vipTool.Name = "VIP Tool"
        vipTool.Parent = player.Backpack
        print(player.Name .. " received a VIP item.")
    end,

    invisible = function(player)
        -- Make the player's character invisible
        local character = player.Character
        if character then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
            print(player.Name .. " is now invisible.")
        end
    end
}
