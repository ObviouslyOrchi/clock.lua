getgenv().LoadedFromLoader = true
spawn(function()
    local original
    original = hookmetamethod(game:GetService("Players").LocalPlayer.Character.Humanoid, "__index", function(self, index)
        if original(self, "Name") == "Humanoid" and index == "WalkSpeed" then
            return 16
        end
        return original(self, index)
    end)
    local original
    original = hookmetamethod(game:GetService("Players").LocalPlayer.Character.Humanoid, "__index", function(self, index)
        if original(self, "Name") == "Humanoid" and index == "JumpPower" then
            return 16
        end
        return original(self, index)
    end)
    print("Initialized WalkSpeed and JumpPower bypasses.")
end)

game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100
game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 100
if game.PlaceId == 5865858426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/main.lua"))()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported.")
end
