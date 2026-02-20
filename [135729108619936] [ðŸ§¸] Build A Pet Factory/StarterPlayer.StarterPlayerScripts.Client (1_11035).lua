-- Name: Client
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client
-- Class: LocalScript
-- Exploit: Xeno 
-- Time to decompile: 0.2617932000011933 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:25
-- Luau version 6, Types version 3
-- Time taken: 0.005085 seconds

if not game.Loaded then
	game.Loaded:Wait()
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
if not Character then
	Character = LocalPlayer.CharacterAdded:Wait()
end
local ScreenGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local Interface = require(script.Interface)
local Gameplay = require(script.Gameplay)
local function CharacterAdded_upvr(arg1) -- Line 27, Named "CharacterAdded"
	--[[ Upvalues[1]:
		[1]: ClientSignals_upvr (readonly)
	]]
	if not arg1 then
	else
		ClientSignals_upvr.CharacterAdded:Fire(arg1)
		local class_Humanoid = arg1:FindFirstChildWhichIsA("Humanoid")
		if class_Humanoid then
			class_Humanoid.Died:Connect(function() -- Line 36
				--[[ Upvalues[2]:
					[1]: ClientSignals_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				ClientSignals_upvr.HumanoidDied:Fire(arg1)
			end)
		end
	end
end
local function _(arg1) -- Line 42, Named "CharacterRemoved"
	--[[ Upvalues[1]:
		[1]: ClientSignals_upvr (readonly)
	]]
	ClientSignals_upvr.CharacterRemoving:Fire(arg1)
end
LocalPlayer.CharacterAdded:Connect(function(arg1) -- Line 46
	--[[ Upvalues[1]:
		[1]: CharacterAdded_upvr (readonly)
	]]
	CharacterAdded_upvr(arg1)
end)
LocalPlayer.CharacterRemoving:Connect(function(arg1) -- Line 50
	--[[ Upvalues[1]:
		[1]: ClientSignals_upvr (readonly)
	]]
	ClientSignals_upvr.CharacterRemoving:Fire(arg1)
end)
repeat
	local StarterGui_upvr = game:GetService("StarterGui")
	local pcall_result1, pcall_result2 = pcall(function() -- Line 55
		--[[ Upvalues[1]:
			[1]: StarterGui_upvr (readonly)
		]]
		StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	end)
	if pcall_result1 then break end
	task.wait()
until pcall_result1
local any_Initialize_result1 = require(script.Data):Initialize(LocalPlayer)
repeat
	task.wait()
until LocalPlayer:GetAttribute("PlotName")
local SOME = workspace:WaitForChild("Plots"):WaitForChild(LocalPlayer:GetAttribute("PlotName"))
if not SOME then
	LocalPlayer:Kick("Something went wrong when loading, try to rejoin")
end
if not SOME:WaitForChild("Placements") then
	LocalPlayer:Kick("Something went wrong when loading, try to rejoin")
end
task.wait(0.5)
Interface:Initialize(ScreenGui, any_Initialize_result1, LocalPlayer)
task.wait(0.25)
Gameplay:Initialize(ScreenGui, any_Initialize_result1, LocalPlayer)
Interface:Start()
task.wait(0.25)
Gameplay:Start()
CharacterAdded_upvr(Character)
task.wait(Random.new():NextNumber(0.1, 0.5))
require(ReplicatedStorage.Utilities.ClientData).LoadingComplete = true