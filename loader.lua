fromloader = true

if not alreadybypassed then
    spawn(function()
        local mt = getrawmetatable(game)
        local hum = game:GetService("Players").LocalPlayer.Character.Humanoid
        local old = mt.__index
        setreadonly(mt, false)
        mt.__index = newcclosure(function(instance, index)
            if instance == hum and index == "WalkSpeed" then
                return 16
            else
                return old(instance, index)
            end
        end)
        mt.__index = newcclosure(function(instance, index)
            if instance == hum and index == "JumpPower" then
                return 50
            else
                return old(instance, index)
            end
        end)
        setreadonly(mt, true)
        alreadybypassed = true
    end)
end

if game.PlaceId == 5865858426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/main.lua"))()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported.")
end
