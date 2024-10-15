-- OwnerCommands.lua

return {
    admin = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Promote target to admin (this can be tracked via datastore)
            print(targetName .. " was promoted to Admin by " .. player.Name)
        end
    end,

    vipadmin = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Promote target to VIP admin
            print(targetName .. " was promoted to VIP Admin by " .. player.Name)
        end
    end,

    unban = function(player, targetName)
        -- Unban player logic (this requires a ban list stored in a datastore)
        print(player.Name .. " unbanned " .. targetName)
    end,

    serverlock = function(player)
        -- Lock the server, preventing new players from joining
        game:GetService("Players").PlayerAdded:Connect(function(plr)
            plr:Kick("The server is locked.")
        end)
        print(player.Name .. " locked the server.")
    end,

    setrank = function(player, targetName, rank)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Set the player's rank (this needs to be tracked in a datastore or similar system)
            print(player.Name .. " set " .. targetName .. "'s rank to " .. rank)
        end
    end
}
