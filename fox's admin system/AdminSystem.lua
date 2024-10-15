-- AdminSystem.lua (Core File)

local AdminSystem = {}

-- Define ranks
AdminSystem.Ranks = {
    ["Everyone"] = 1,
    ["VIP"] = 2,
    ["Moderator"] = 3,
    ["Head Admin"] = 4,
    ["Owner"] = 5
}

-- Define special users by UserId
AdminSystem.UserPermissions = {
    VIP = {12345678, 87654321},          -- Replace with User IDs for VIP
    Moderator = {11111111, 22222222},    -- Replace with User IDs for Moderator/Admin
    HeadAdmin = {33333333, 44444444},    -- Replace with User IDs for Head Admin
    Owner = {game.CreatorId}             -- Game creator (Owner)
}

-- Load commands from separate files inside subfolders
AdminSystem.Commands = {
    Everyone = require(script:WaitForChild("Commands"):WaitForChild("Everyone"):WaitForChild("EveryoneCommands")),
    VIP = require(script:WaitForChild("Commands"):WaitForChild("VIP"):WaitForChild("VIPCommands")),
    Moderator = require(script:WaitForChild("Commands"):WaitForChild("Moderator"):WaitForChild("ModeratorCommands")),
    HeadAdmin = require(script:WaitForChild("Commands"):WaitForChild("HeadAdmin"):WaitForChild("HeadAdminCommands")),
    Owner = require(script:WaitForChild("Commands"):WaitForChild("Owner"):WaitForChild("OwnerCommands"))
}

-- Function to check player rank
function AdminSystem:GetPlayerRank(player)
    -- Check if the player is the owner
    if player.UserId == game.CreatorId then
        return AdminSystem.Ranks["Owner"]
    end
    
    -- Check if the player is a Head Admin
    for _, userId in pairs(AdminSystem.UserPermissions.HeadAdmin) do
        if player.UserId == userId then
            return AdminSystem.Ranks["Head Admin"]
        end
    end

    -- Check if the player is a Moderator
    for _, userId in pairs(AdminSystem.UserPermissions.Moderator) do
        if player.UserId == userId then
            return AdminSystem.Ranks["Moderator"]
        end
    end

    -- Check if the player is a VIP
    for _, userId in pairs(AdminSystem.UserPermissions.VIP) do
        if player.UserId == userId then
            return AdminSystem.Ranks["VIP"]
        end
    end

    -- Default rank is Everyone
    return AdminSystem.Ranks["Everyone"]
end

-- Command execution function
function AdminSystem:ExecuteCommand(player, command, args)
    local rank = AdminSystem:GetPlayerRank(player)
    
    for rankName, rankCommands in pairs(AdminSystem.Commands) do
        local rankLevel = AdminSystem.Ranks[rankName]
        if rank >= rankLevel then
            if rankCommands[command] then
                -- Execute the command logic
                rankCommands[command](player, unpack(args))
                print(player.Name .. " executed " .. command .. " command!")
                return true
            end
        end
    end

    print(player.Name .. " does not have permission to execute " .. command)
    return false
end

-- Example usage: Bind commands to chat messages
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        local args = message:split(" ")
        local command = args[1]:lower()
        table.remove(args, 1)
        AdminSystem:ExecuteCommand(player, command, args)
    end)
end)

return AdminSystem
