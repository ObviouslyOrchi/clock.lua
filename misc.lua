if not getgenv().fromloader then game:GetService("Players").LocalPlayer:Kick("Please use the loader instead of the main script, thanks. .gg/GPVqBUmPb3") end
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

local Bodyexpander = Window:CreateTab("Body Expander")
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
