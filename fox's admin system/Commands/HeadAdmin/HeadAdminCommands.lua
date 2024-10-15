-- HeadAdminCommands.lua

return {
    shutdown = function(player)
        -- Shutdown the server
        game:Shutdown()  -- Immediately shuts down the server
        print(player.Name .. " shut down the server.")
    end,

    announce = function(player, message)
        -- Broadcast an announcement to all players
        for _, plr in pairs(game.Players:GetPlayers()) do
            plr:Kick("Announcement: " .. message)  -- Or send a message instead of kicking
        end
        print(player.Name .. " announced: " .. message)
    end,

    teleport = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Teleport player to the target
            player.Character:SetPrimaryPartCFrame(target.Character:GetPrimaryPartCFrame())
            print(player.Name .. " teleported to " .. targetName)
        end
    end,

    freeze = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Freeze the target by anchoring their humanoid root part
            target.Character.HumanoidRootPart.Anchored = true
            print(targetName .. " has been frozen by " .. player.Name)
        end
    end,

    giveitem = function(player, itemName)
        -- Give the player a tool/item (assuming a tool named itemName exists)
        local tool = Instance.new("Tool")
        tool.Name = itemName
        tool.Parent = player.Backpack
        print(player.Name .. " gave item " .. itemName .. " to themselves.")
    end
}
