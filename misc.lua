local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "clock.lua | universal | .gg/GPVqBUmPb3",
   LoadingTitle = "clock.lua",
   LoadingSubtitle = "by tokken?#6694",
})

function removech()
	for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			if v.Name == "Handle" or v.Name == "Head" then
				if game:GetService("Players").LocalPlayer.Character.Head:FindFirstChild("OriginalSize") then
					game:GetService("Players").LocalPlayer.Character.Head.OriginalSize:Destroy()
				end
			else
				for i,cav in pairs(v:GetDescendants()) do
					if cav:IsA("Attachment") then
						if cav:FindFirstChild("OriginalPosition") then
							cav.OriginalPosition:Destroy()  
						end
					end
				end
				v:FindFirstChild("OriginalSize"):Destroy()
				if v:FindFirstChild("AvatarPartScaleType") then
					v:FindFirstChild("AvatarPartScaleType"):Destroy()
				end
			end
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

local Bodyexpander = Window:CreateTab("Body Expander")
local LocalPlayer = Window:CreateTab("LocalPlayer")
local Misc = Window:CreateTab("Misc")
Bodyexpander:CreateSection("Put body type to 100% in avatar settings, won't work if the game doesn't support body type.")

Bodyexpander:CreateButton({Name = "Expand BodyProportionScale",Interact = "Button",Callback = function()
    pcall(removech)
    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
end})

Bodyexpander:CreateButton({Name = "Expand HeadScale",Interact = "Button",Callback = function()
    pcall(removech)
    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("HeadScale"):Destroy()
end})

Bodyexpander:CreateButton({Name = "Expand BodyWidthScale",Interact = "Button",Callback = function()
    pcall(removech)
game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
end})

Bodyexpander:CreateButton({Name = "Expand BodyDepthScale",Interact = "Button",Callback = function()
    pcall(removech)
    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
end})

Bodyexpander:CreateButton({Name = "Expand BodyHeightScale",Interact = "Button",Callback = function()
    pcall(removech)
    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
end})

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

Misc:CreateButton({Name = "Fps Booster",Interact = "Button",Callback = function()
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = (9e9 * 9e9)
    sethiddenproperty(game.Lighting, "Technology", 0)
    settings().Rendering.QualityLevel = "Automatic"
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("UnionOperation") or v:IsA("WedgePart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Remove()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v:Remove()
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 0
        elseif v:IsA("Terrain") then
            v.Transparency = 1
        elseif v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
end})
