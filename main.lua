if not getgenv().LoadedFromLoader then game:GetService("Players").LocalPlayer:Kick("Please use the loader instead of the main script, thanks. .gg/GPVqBUmPb3") end
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local StoreRemote = game:GetService("ReplicatedStorage").Remotes.SetStoreColor
local Players = game:GetService("Players")
local LocalPlayer = Game:GetService("Players").LocalPlayer
local Window = Rayfield:CreateWindow({
   Name = "clock.lua | rt2 | .gg/GPVqBUmPb3",
   LoadingTitle = "clock.lua",
   LoadingSubtitle = "by tokken?#6694",
})

-- Functions

local function refplayertable()
    PlayerTable = {}
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name ~= game:GetService("Players").LocalPlayer.Name then
            table.insert(PlayerTable,v.Name)
        end
    end
end
refplayertable()

local function annoyfunction()
    if game:GetService("Workspace").PlayerVehicles:FindFirstChild("Vehicle_"..game:GetService("Players").LocalPlayer.Name) == nil then
        game:GetService("ReplicatedStorage").Remotes.SpawnVehicle:InvokeServer(1, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait(1)
        main = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass
    else
        main = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass
    end
    local goal = game:GetService("Players")[target].Character.LowerTorso
    main.CFrame = goal.CFrame * CFrame.Angles(math.random(0.5, 2),math.random(0.5, 2),math.random(0.5, 2))
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame
    fireproximityprompt(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].DriveSeat.Prompt, 10)
    if getgenv().annoytoggle == false then
        for i = 1,20 do
            main.CFrame = main.CFrame
            task.wait(0.05)
        end
    end
end

local function rainbowfunction()
    rainbowisrunning = true
    StoreRemote:FireServer(Color3.new(math.random(0,1), math.random(0,1), math.random(0,1)))
    task.wait(0.1)
    rainbowisrunning = false
end

local function startgokart()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.CFrame + Vector3.new(0, 5, 0)

    repeat task.wait(0.1) until game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Get ready!" or game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Race in progress"
    task.wait(2.5)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame
    task.wait(0.5)
    repeat
        task.wait(0.045)
        fireproximityprompt(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].DriveSeat.Prompt, 10)
    until game:GetService("Players").LocalPlayer.Character.Humanoid.Sit == true
    
    local TweenService = game:GetService("TweenService")
    for spots = 1,24 do
        game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Checkpoints[spots].Transparency = 0.75
        game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Checkpoints[spots].Reflectance = 10
    end
    
    repeat task.wait(0.1) until game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.LapCounter.SurfaceGui.TrackNumber.Text == "GO"
    game.Workspace.Gravity = 0
    for i = 1,gokartlaps do
        for spots = 1,24 do
            local main = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass
            local goal = game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Checkpoints[spots]
            TweenGoKart = TweenInfo.new(gokarttime)
            local tween = TweenService:Create(main, TweenGoKart, {CFrame = CFrame.new(goal.Position + Vector3.new(0, -2, 0))}):Play()
            task.wait(gokarttime)
        end
        local main = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass
        local goal2 = game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Checkpoints["1"]
        TweenGoKart = TweenInfo.new(gokarttime)
        local tween = TweenService:Create(main, TweenGoKart, {CFrame = CFrame.new(goal2.Position + Vector3.new(0, -2, 0))}):Play()
        task.wait(gokarttime)
    end
    game.Workspace.Gravity = 196.2
end

local function stealgokart()
    local oldcframe = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    if game:GetService("Workspace").PlayerVehicles:FindFirstChild("Vehicle_"..game:GetService("Players").LocalPlayer.Name) then
        
        if game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.Type.Value == "Gokart" then
            
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame
            fireproximityprompt(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].DriveSeat.Prompt, 500)
            task.wait(0.5)
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = oldcframe + Vector3.new(0, 1, 0)
        else
            
            repeat task.wait()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.CFrame + Vector3.new(0, 2.5, 0)
            until game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Get ready!" or game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Race in progress"
            task.wait(2.5)
            
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame
            fireproximityprompt(game:GetService("Workspace").PlayerVehicles["Vehicle_hr6fu56ruhyrd56"].DriveSeat.Prompt, 500)
            task.wait(0.5)
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = oldcframe + Vector3.new(0, 1, 0)
        end
    else
        
        repeat task.wait()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.CFrame + Vector3.new(0, 2.5, 0)
        until game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Get ready!" or game:GetService("Workspace").Map.Landmarks.GokartTrack.Scripted.Queue.Region.BillboardGui.Countdown.Text == "Race in progress"
        task.wait(2.5)
        
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame
        fireproximityprompt(game:GetService("Workspace").PlayerVehicles["Vehicle_hr6fu56ruhyrd56"].DriveSeat.Prompt, 500)
        task.wait(0.5)
        game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = oldcframe + Vector3.new(0, 1, 0)
    end
end

local function teleporting(placename)
    for i = 1,5 do
        if placename == "alanauto" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1838.14722, 4.99999809, -1951.10352, -0.305810153, 3.88239165e-08, 0.952092528, 9.0736016e-08, 1, -1.1633241e-08, -0.952092528, 8.28315194e-08, -0.305810153)
        elseif placename == "gokarttrack" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(801.796448, -83.4960022, -1726.03113, 0.141548485, -4.17203028e-09, 0.989931345, -2.72365908e-10, 1, 4.25340962e-09, -0.989931345, -8.71687167e-10, 0.141548485)
        elseif placename == "loadingdock" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1803.52771, -83.5000229, -1891.86597, 0.348236054, -1.47249892e-08, -0.937406898, 2.55844623e-10, 1, -1.56131712e-08, 0.937406898, 5.19723864e-09, 0.348236054)
        elseif placename == "ownplot" then
            local yourownplot = getrenv()._G.Plot
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Plots[tostring(yourownplot)].RoadModule.Center.CFrame + Vector3.new(0,2.5,0)
        elseif placename == "lighthouse" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(854.89325, 201.499954, -3092.53101, -0.546744287, -6.39081037e-08, -0.837299645, 1.27105371e-09, 1, -7.71564288e-08, 0.837299645, -4.32490879e-08, -0.546744287)
        end 
    end
end

local function carteleporting(placename)
    for i = 1,5 do
        if placename == "alanauto" then
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = CFrame.new(1838.14722, 4.99999809, -1951.10352, -0.305810153, 3.88239165e-08, 0.952092528, 9.0736016e-08, 1, -1.1633241e-08, -0.952092528, 8.28315194e-08, -0.305810153)
        elseif placename == "gokarttrack" then
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = CFrame.new(801.796448, -83.4960022, -1726.03113, 0.141548485, -4.17203028e-09, 0.989931345, -2.72365908e-10, 1, 4.25340962e-09, -0.989931345, -8.71687167e-10, 0.141548485)
        elseif placename == "loadingdock" then
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = CFrame.new(1803.52771, -83.5000229, -1891.86597, 0.348236054, -1.47249892e-08, -0.937406898, 2.55844623e-10, 1, -1.56131712e-08, 0.937406898, 5.19723864e-09, 0.348236054)
        elseif placename == "ownplot" then
            local yourownplot = getrenv()._G.Plot
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = game:GetService("Workspace").Map.Plots[tostring(yourownplot)].RoadModule.Center.CFrame + Vector3.new(0,2.5,0)
        elseif placename == "lighthouse" then
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Mass.CFrame = CFrame.new(854.89325, 201.499954, -3092.53101, -0.546744287, -6.39081037e-08, -0.837299645, 1.27105371e-09, 1, -7.71564288e-08, 0.837299645, -4.32490879e-08, -0.546744287)
        end 
    end
end

local function tptoregisters()
    if game:GetService("Workspace").Map.Plots[tostring(getrenv()._G.Plot)].Objects:FindFirstChild("Floor_1") then
        for i,v in pairs(game:GetService("Workspace").Map.Plots[tostring(getrenv()._G.Plot)].Objects["Floor_1"]:GetChildren()) do
            if v.Name == "BasicCheckout" or v.Name == "DeluxeCheckout" then
                if v.Object.Light.BrickColor == BrickColor.new("Really red") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Object.CashierArea.CFrame + Vector3.new(0, 2.65, 0)
                    local elapsedTime = 0;
                    repeat
                       if v.Object.Light.BrickColor == BrickColor.new("Lime green") then
                           break;
                       end
                       elapsedTime += task.wait()
                    until elapsedTime > 7.5
                end
            end
        end
    end
    if game:GetService("Workspace").Map.Plots[tostring(getrenv()._G.Plot)].Objects:FindFirstChild("Floor_2") then
        for i,v in pairs(game:GetService("Workspace").Map.Plots[tostring(getrenv()._G.Plot)].Objects["Floor_2"]:GetChildren()) do
            if v.Name == "BasicCheckout" or v.Name == "DeluxeCheckout" then
                if v.Object.Light.BrickColor == BrickColor.new("Really red") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Object.CashierArea.CFrame + Vector3.new(0, 2.65, 0)
                    local elapsedTime = 0;
                    repeat
                       if v.Object.Light.BrickColor == BrickColor.new("Lime green") then
                           break;
                       end
                       elapsedTime += task.wait()
                    until elapsedTime > 7.5
                end
            end
        end
    end
end

local function cleanthestore()
    for i,v in pairs(game:GetService("Workspace").Map.Plots[tostring(getrenv()._G.Plot)].Trash:GetChildren()) do
        local origpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(0.25)
        repeat
            if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit == true then
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.PromptPart.CFrame + Vector3.new(0, 8.5, 0)
            fireproximityprompt(v.PromptPart.ProximityPrompt, 5)
            task.wait()
        until not v:FindFirstChild("PromptPart")
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = origpos
        task.wait(0.5)
    end
end

local function arrestrobbers()
    for i,v in pairs(game:GetService("Workspace").NPCModel:GetChildren()) do
        if v:FindFirstChild("ArrestPrompt") then
            fireproximityprompt(v.ArrestPrompt, 500)
            task.wait(0.1)
        end
    end
end

if getgenv().infjump == nil then
    game:GetService("UserInputService").JumpRequest:connect(function()
    	if getgenv().infjump == true then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    	end
    end)
end

local Shop = Window:CreateTab("Shop")
local Annoy = Window:CreateTab("Annoy")
local Gokart = Window:CreateTab("Gokart")
local Carmods = Window:CreateTab("Car mods")
local LocalPlayer = Window:CreateTab("Localplayer")
local Misc = Window:CreateTab("Misc")
Shop:CreateSection("Really simple autobuy.")
Annoy:CreateSection("Annoy players with the use of your car.")
Gokart:CreateSection("Automatically win a gokart race!")
Carmods:CreateSection("OP Car mods!")
Misc:CreateSection("Well... Misc?")

-- Shop

Shop:CreateInput({Name = "What Item To Buy",PlaceholderText = "Name From Inventory",NumbersOnly = false,CharacterLimit = 30,Enter = false,RemoveTextAfterFocusLost = false,Callback = function(Value)
	whattobuy = Value
end,})

Shop:CreateToggle({Name = "Instant Delivery",CurrentValue = false,Callback = function(Value)
    getgenv().instantdelivery = Value
end})

howmuchtobuy = 20
Shop:CreateSlider({Name = "How Much To Buy",Range = {1, 250},Increment = 1,CurrentValue = 20,Callback = function(Value)
    howmuchtobuy = Value
end})

autobuytime = 1
Shop:CreateSlider({Name = "Seconds To Wait Between Purchases",Range = {1, 60},Increment = 1,CurrentValue = 1,Callback = function(Value)
    autobuytime = Value
end})

Shop:CreateButton({Name = "Purchase Items",Interact = "Button",Callback = function()
    game:GetService("ReplicatedStorage").Remotes.BuyStorage:InvokeServer(whattobuy, howmuchtobuy, getgenv().instantdelivery)
end})

Shop:CreateToggle({Name = "Autobuy Items",CurrentValue = false,Callback = function(Value)
    getgenv().autobuytoggle = Value
    while getgenv().autobuytoggle == true do
        task.wait(autobuytime)
        game:GetService("ReplicatedStorage").Remotes.BuyStorage:InvokeServer(whattobuy, howmuchtobuy, getgenv().instantdelivery)
    end
end})

Shop:CreateSection("You no longer need Cashiers!")

Shop:CreateToggle({Name = "Teleport To All Cashier Spots",CurrentValue = false,Callback = function(Value)
    getgenv().autocashier = Value
    while getgenv().autocashier == true do
        local success,errString = pcall(tptoregisters)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
        task.wait()
    end
end})

Shop:CreateSection("You no longer need Janitors!")

Shop:CreateToggle({Name = "Clean The Store Automatically",CurrentValue = false,Callback = function(Value)
    getgenv().autocleantoggle = Value
    while getgenv().autocleantoggle == true do
        local success,errString = pcall(cleanthestore)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
        task.wait()
    end
end})

Shop:CreateSection("You no longer need Guards!")

Shop:CreateToggle({Name = "Arrest Robbers Automatically",CurrentValue = false,Callback = function(Value)
    getgenv().autoarresttoggle = Value
    while getgenv().autoarresttoggle == true do
        local success,errString = pcall(arrestrobbers)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
        task.wait()
    end
end})

-- Annoy

local DropdownPlayers = Annoy:CreateDropdown({Name = "Player Picker",Options = {unpack(PlayerTable)},CurrentOption = "",Callback = function(Value)
    target = Value
end})

Annoy:CreateButton({Name = "Refresh Players",Interact = "Button",Callback = function()
    local success,errString = pcall(refplayertable)
    if errString ~= nil then
        print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
    end
    DropdownPlayers:Refresh({unpack(PlayerTable)},"Re-select a player...")
end})

Annoy:CreateToggle({Name = "Toggle Annoying",CurrentValue = false,Callback = function(Value)
    getgenv().annoytoggle = Value
    while getgenv().annoytoggle == true do
        local success,errString = pcall(annoyfunction)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
        task.wait()
    end
end})

Annoy:CreateButton({Name = "Teleport To Target",Interact = "Button",Callback = function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[target].Character.HumanoidRootPart.CFrame
end})

-- Gokart

gokarttime = Value
Gokart:CreateSlider({Name = "Time Between Checkpoints",Range = {0, 1},Increment = 0.01,CurrentValue = 0.01,Callback = function(Value)
    gokarttime = Value
end})

gokartlaps = Value
Gokart:CreateSlider({Name = "How Much Laps",Range = {0, 100},Increment = 1,CurrentValue = 4,Callback = function(Value)
    gokartlaps = Value
end})

Gokart:CreateButton({Name = "Start",Interact = "Button",Callback = function()
    local success,errString = pcall(startgokart)
    if errString ~= nil then
        print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
    end
end})

Gokart:CreateSection("Get a free gokart below!")

Gokart:CreateButton({Name = "Steal Gokart",Interact = "Button",Callback = function()
    local success,errString = pcall(stealgokart)
    if errString ~= nil then
        print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
    end
end})

-- Car Mods

if not game:GetService("Workspace").PlayerVehicles:FindFirstChild("Vehicle_"..game:GetService("Players").LocalPlayer.Name) then
    Carmods:CreateSlider({Name = "Max Speed",Range = {0, 500},Increment = 1,CurrentValue = 0,Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.MaxSpeed.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})

    Carmods:CreateSlider({Name = "Torque",Range = {0, 100},Increment = 1,CurrentValue = 0,Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.Power.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})

    Carmods:CreateSlider({Name = "Braking Power",Range = {0, 100},Increment = 1,CurrentValue = 0,Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.BrakePower.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})
else
    Carmods:CreateSlider({Name = "Max Speed",Range = {0, 500},Increment = 1,CurrentValue = tonumber(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.MaxSpeed.Value),Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.MaxSpeed.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})

    Carmods:CreateSlider({Name = "Torque",Range = {0, 100},Increment = 1,CurrentValue = tonumber(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.Power.Value),Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.Power.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})

    Carmods:CreateSlider({Name = "Braking Power",Range = {0, 100},Increment = 1,CurrentValue = tonumber(game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.BrakePower.Value),Callback = function(Value)
        local success,errString = pcall(function()
            game:GetService("Workspace").PlayerVehicles["Vehicle_"..game:GetService("Players").LocalPlayer.Name].Config.BrakePower.Value = Value
        end)
        if errString ~= nil then
            print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
        end
    end})
end

-- LocalPlayer

LocalPlayer:CreateSlider({Name = "Walk Speed",Range = {0, 100},Increment = 1,CurrentValue = 16,Callback = function(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
end})

LocalPlayer:CreateSlider({Name = "Jump Power",Range = {0, 100},Increment = 1,CurrentValue = 50,Callback = function(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
end})

LocalPlayer:CreateSlider({Name = "Gravity",Range = {0, 196.2},Increment = 0.2,CurrentValue = 196.2,Callback = function(Value)
    game:GetService("Workspace").Gravity = Value
end})

LocalPlayer:CreateToggle({Name = "Toggle Infinite Jump",CurrentValue = false,Callback = function(Value)
    getgenv().infjump = Value
end})

-- Misc

Misc:CreateToggle({Name = "Toggle RGB Store",CurrentValue = false,Callback = function(Value)
    getgenv().rainbowmode = Value
    while getgenv().rainbowmode == true do
        if rainbowisrunning ~= true then
            local success,errString = pcall(rainbowfunction)
            if errString ~= nil then
                print("[clock.lua] Did the script run fully:",success,"  Error:" , errString)
            end
            task.wait()
        end
    end
end})

Misc:CreateDropdown({Name = "Teleport",Options = {"Alan's Auto", "Gokart Track", "Loading Dock", "Your Own Plot", "Lighthouse"},CurrentOption = "",Callback = function(Value)
    if Value == "Alan's Auto" then
        teleporting("alanauto")
    elseif Value == "Gokart Track" then
        teleporting("gokarttrack")
    elseif Value == "Loading Dock" then
        teleporting("loadingdock")
    elseif Value == "Your Own Plot" then
        teleporting("ownplot")
    elseif Value == "Lighthouse" then
        teleporting("lighthouse")
    end
end})

Misc:CreateDropdown({Name = "Car Teleport",Options = {"Alan's Auto", "Gokart Track", "Loading Dock", "Your Own Plot", "Lighthouse"},CurrentOption = "",Callback = function(Value)
    if Value == "Alan's Auto" then
        carteleporting("alanauto")
    elseif Value == "Gokart Track" then
        carteleporting("gokarttrack")
    elseif Value == "Loading Dock" then
        carteleporting("loadingdock")
    elseif Value == "Your Own Plot" then
        carteleporting("ownplot")
    elseif Value == "Lighthouse" then
        carteleporting("lighthouse")
    end
end})

Misc:CreateToggle({Name = "Farm Distance Driven",CurrentValue = false,Callback = function(Value)
    getgenv().distancedriven = Value
    while getgenv().distancedriven == true do
        game:GetService("ReplicatedStorage").Remotes.IncrementDistanceDriven:FireServer(309.26824951171875 + math.random(-100, 100))
        task.wait()
    end
end})

Misc:CreateButton({Name = "Join Discord",Interact = "Button",Callback = function()
    pcall(function()
        (request or syn and syn.request)({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                ['Origin'] = 'https://discord.com'
            },
            Body = httpService:JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = httpService:GenerateGUID(false),
                args = {code = 'GPVqBUmPb3'}
            })
        }) 
    end)
end})
