-- Name: PlotEggs
-- Path: game:GetService("ReplicatedStorage").Utilities.PlotEggs
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5588047000001097 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:11
-- Luau version 6, Types version 3
-- Time taken: 0.009708 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events_upvr = ReplicatedStorage.Events
local tbl_upvr = {}
local EggsConfig_upvr = require(ReplicatedStorage.Configs.EggsConfig)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local module = {}
local function ToggleProximityPrompts_upvr(arg1) -- Line 27, Named "ToggleProximityPrompts"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	for _, v in pairs(tbl_upvr) do
		if v:IsA("ProximityPrompt") then
			v.Enabled = arg1
		end
	end
end
local TweenService_upvr = game:GetService("TweenService")
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local random_state_upvr = Random.new()
local Debris_upvr = game:GetService("Debris")
local function HatchAnimation_upvr(arg1) -- Line 35, Named "HatchAnimation"
	--[[ Upvalues[4]:
		[1]: TweenService_upvr (readonly)
		[2]: PlaySound_upvr (readonly)
		[3]: random_state_upvr (readonly)
		[4]: Debris_upvr (readonly)
	]]
	local class_BillboardGui = arg1:FindFirstChildWhichIsA("BillboardGui")
	class_BillboardGui.Enabled = false
	local CFrame = arg1.CFrame
	for i_2 = 1, 10 do
		local maximum = math.max(0.11 - i_2 * 0.01, 0.06)
		local var21 = 15 + i_2 * 4
		local var22
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var22 = var21
			return var22
		end
		if i_2 % 2 ~= 0 or not INLINED() then
			var22 = -var21
		end
		local any_Create_result1_2 = TweenService_upvr:Create(arg1, TweenInfo.new(maximum, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			CFrame = CFrame * CFrame.Angles(0, 0, math.rad(var22));
		})
		any_Create_result1_2:Play()
		local var25 = 0.95 + i_2 * 0.06
		PlaySound_upvr("Impact", random_state_upvr:NextNumber(var25, var25 + 0.12))
		any_Create_result1_2.Completed:Wait()
		local any_Create_result1 = TweenService_upvr:Create(arg1, TweenInfo.new(maximum * 0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			CFrame = CFrame;
		})
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		task.wait(math.max(0.08 - i_2 * 0.006, 0.03))
	end
	PlaySound_upvr("Impact")
	PlaySound_upvr("Wind")
	local clone_2 = arg1:Clone()
	clone_2.Parent = arg1.Parent
	clone_2:ClearAllChildren()
	clone_2.Material = Enum.Material.Neon
	clone_2.Color = Color3.fromHSV(0, 0, 1)
	clone_2.TextureID = ""
	TweenService_upvr:Create(arg1, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = CFrame;
	}):Play()
	TweenService_upvr:Create(clone_2, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = clone_2.Size * 1.5;
		Transparency = 1;
	}):Play()
	Debris_upvr:AddItem(clone_2, 0.2)
	class_BillboardGui.Enabled = true
end
local function _(arg1, arg2, arg3) -- Line 93, Named "SetupEggLocked"
	local clone = script.Locked:Clone()
	clone.Adornee = arg2
	clone.RebirthsRequired.Text = arg3.RequiredRebirths.." Rebirths Required"
	clone.Parent = arg2
end
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local Serg_AutoTextScaling_upvr = require(ReplicatedStorage.Utilities.Serg_AutoTextScaling)
local var34_upvw = false
local function SetupEggProximityPrompt_upvr(arg1, arg2, arg3) -- Line 103, Named "SetupEggProximityPrompt"
	--[[ Upvalues[8]:
		[1]: tbl_upvr (readonly)
		[2]: AbbreviateNumber_upvr (readonly)
		[3]: Serg_AutoTextScaling_upvr (readonly)
		[4]: ClientSignals_upvr (readonly)
		[5]: var34_upvw (read and write)
		[6]: ToggleProximityPrompts_upvr (readonly)
		[7]: HatchAnimation_upvr (readonly)
		[8]: Events_upvr (readonly)
	]]
	if tbl_upvr[arg1] then
	else
		for _, v_4 in pairs(arg2:GetChildren()) do
			if v_4:IsA("BillboardGui") then
				v_4:Destroy()
			end
		end
		local ProximityPrompt = Instance.new("ProximityPrompt")
		local clone_3 = script.Cost:Clone()
		clone_3.Frame.Cost.Text = AbbreviateNumber_upvr(arg3.Cost, true)
		Serg_AutoTextScaling_upvr.Update(clone_3.Frame.Cost, 0.09)
		clone_3.Adornee = arg2
		ProximityPrompt.RequiresLineOfSight = false
		ProximityPrompt.HoldDuration = 0.25
		ProximityPrompt.ActionText = "Hatch"
		ProximityPrompt.ObjectText = arg1
		clone_3.Parent = arg2
		ProximityPrompt.Parent = arg2
		tbl_upvr[arg1] = ProximityPrompt
		ProximityPrompt.Triggered:Connect(function() -- Line 131
			--[[ Upvalues[9]:
				[1]: ClientSignals_upvr (copied, readonly)
				[2]: arg3 (readonly)
				[3]: AbbreviateNumber_upvr (copied, readonly)
				[4]: var34_upvw (copied, read and write)
				[5]: ToggleProximityPrompts_upvr (copied, readonly)
				[6]: HatchAnimation_upvr (copied, readonly)
				[7]: arg2 (readonly)
				[8]: Events_upvr (copied, readonly)
				[9]: arg1 (readonly)
			]]
			ClientSignals_upvr.GetCurrency:Fire("Gems", function(arg1_2) -- Line 132
				--[[ Upvalues[9]:
					[1]: arg3 (copied, readonly)
					[2]: ClientSignals_upvr (copied, readonly)
					[3]: AbbreviateNumber_upvr (copied, readonly)
					[4]: var34_upvw (copied, read and write)
					[5]: ToggleProximityPrompts_upvr (copied, readonly)
					[6]: HatchAnimation_upvr (copied, readonly)
					[7]: arg2 (copied, readonly)
					[8]: Events_upvr (copied, readonly)
					[9]: arg1 (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [5] 4. Error Block 29 start (CF ANALYSIS FAILED)
				local var44 = arg3.Cost - arg1_2
				ClientSignals_upvr.Notification:Fire({
					Message = "You need "..AbbreviateNumber_upvr(var44, true).." Gems!";
					IsWarning = true;
				})
				if var44 <= 10000 then
					-- KONSTANTWARNING: GOTO [49] #39
				end
				-- KONSTANTERROR: [5] 4. Error Block 29 end (CF ANALYSIS FAILED)
			end)
		end)
	end
end
function module.Setup(arg1, arg2) -- Line 179
	--[[ Upvalues[2]:
		[1]: EggsConfig_upvr (readonly)
		[2]: SetupEggProximityPrompt_upvr (readonly)
	]]
	local var50
	if 10 <= arg2 then
		var50 = true
	else
		var50 = false
	end
	arg1.EggBillboardGui.Enabled = var50
	var50 = EggsConfig_upvr
	for i_3, v_2 in pairs(var50) do
		local SOME_2 = arg1.EggMeshes:FindFirstChild(i_3)
		if SOME_2 then
			if v_2.RequiredRebirths <= arg2 then
				SetupEggProximityPrompt_upvr(i_3, SOME_2, v_2)
			else
				local clone_4 = script.Locked:Clone()
				clone_4.Adornee = SOME_2
				clone_4.RebirthsRequired.Text = v_2.RequiredRebirths.." Rebirths Required"
				clone_4.Parent = SOME_2
			end
		end
	end
end
function module.Update(arg1, arg2) -- Line 194
	--[[ Upvalues[2]:
		[1]: EggsConfig_upvr (readonly)
		[2]: SetupEggProximityPrompt_upvr (readonly)
	]]
	local var60
	if 10 <= arg2 then
		var60 = true
	else
		var60 = false
	end
	arg1.EggBillboardGui.Enabled = var60
	var60 = EggsConfig_upvr
	for i_4, v_3 in pairs(var60) do
		local SOME = arg1.EggMeshes:FindFirstChild(i_4)
		if SOME and v_3.RequiredRebirths <= arg2 then
			SetupEggProximityPrompt_upvr(i_4, SOME, v_3)
		end
	end
end
Events_upvr.HatchAnimation.OnClientEvent:Connect(function(...) -- Line 207
	--[[ Upvalues[1]:
		[1]: ClientSignals_upvr (readonly)
	]]
	ClientSignals_upvr.HatchPet:Fire(...)
end)
return module