local success,errString = pcall(function()
    if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://raw.githubusercontent.com/KikoTheDon/MT-Api-v2/main/__source/mt-api%20v2.lua", true))() end
    game:GetService("Players").LocalPlayer.Character.Humanoid:AddPropertyEmulator("WalkSpeed")
    game:GetService("Players").LocalPlayer.Character.Humanoid:AddPropertyEmulator("JumpPower")
end)
if errString ~= nil then
    print("[clock.lua] Did the script run fully:",success,"  Error:",errString)
end
if game.PlaceId == 5865858426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tokkenik/clock.lua/main/main.lua"))()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported.")
end
