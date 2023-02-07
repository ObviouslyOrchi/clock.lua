getgenv().fromloader = true

spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/finayv2/UAB/main/Main.lua"))()
end)

if game.PlaceId == 5865858426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/rt2.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/misc.lua"))()
end
