-- EveryoneCommands.lua

return {
    help = function(player)
        -- You can send a message in chat or display a UI with help info
        player:Kick("Use /info, /ping, /rules, or /whois to explore!")
    end,

    info = function(player)
        player:Kick("This is a fun multiplayer game! Enjoy!")
    end,

    ping = function(player)
        -- In Roblox, we can't get real-time ping data without a custom solution, so simulate it
        local pingTime = math.random(50, 100)  -- Random ping for simulation
        player:Kick("Ping: " .. tostring(pingTime) .. " ms")
    end,

    rules = function(player)
        player:Kick("Follow the rules! No cheating, no griefing, be respectful.")
    end,

    whois = function(player)
        -- Simply display the rank of the player using a message
        local rank = "Everyone"
        player:Kick(player.Name .. " is in rank: " .. rank)
    end
}
