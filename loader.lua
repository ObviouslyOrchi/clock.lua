getgenv().LoadedFromLoader = true
if game.PlaceId == 5865858426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/main.lua"))()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported.")
end
