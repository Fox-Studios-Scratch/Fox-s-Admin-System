-- ModeratorCommands.lua

return {
    kick = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            target:Kick("You have been kicked by a Moderator.")
            print(targetName .. " has been kicked by " .. player.Name)
        else
            print("Player " .. targetName .. " not found.")
        end
    end,

    ban = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- You will need to manage the ban list in a datastore for persistence
            -- This is a temporary ban for the session
            target:Kick("You have been banned by a Moderator.")
            print(targetName .. " has been banned by " .. player.Name)
        else
            print("Player " .. targetName .. " not found.")
        end
    end,

    mute = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            target.Muted = true  -- You need to track this as Roblox doesn't have built-in muting
            print(targetName .. " has been muted by " .. player.Name)
        end
    end,

    unmute = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            target.Muted = false  -- Unmute logic (custom, no built-in mute system)
            print(targetName .. " has been unmuted by " .. player.Name)
        end
    end,

    warn = function(player, targetName)
        local target = game.Players:FindFirstChild(targetName)
        if target then
            -- Warning logic (could add a message to a datastore or display warning text)
            print(targetName .. " has been warned by " .. player.Name)
        end
    end
}
