-- Name: Customer
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Plot.Customer
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5830590999994456 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:31
-- Luau version 6, Types version 3
-- Time taken: 0.017604 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players_upvr = game:GetService("Players")
local tbl_upvr = {}
local module = {}
local function InitializePlayerCache_upvr(arg1) -- Line 24, Named "InitializePlayerCache"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if not tbl_upvr[arg1] then
		tbl_upvr[arg1] = {
			CharacterModels = {};
			ActiveCharacters = {};
			AnimationTracks = {};
		}
	end
end
local function ClearPlayerCache_upvr(arg1) -- Line 34, Named "ClearPlayerCache"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if tbl_upvr[arg1] then
		if tbl_upvr[arg1].ActiveCharacters then
			for i, _ in pairs(tbl_upvr[arg1].ActiveCharacters) do
				if i then
					i:Destroy()
				end
			end
		end
		if tbl_upvr[arg1].CharacterModels then
			for _, v_2 in pairs(tbl_upvr[arg1].CharacterModels) do
				if v_2 then
					v_2:Destroy()
				end
			end
		end
		if tbl_upvr[arg1].AnimationTracks then
			tbl_upvr[arg1].AnimationTracks = nil
		end
		tbl_upvr[arg1] = nil
	end
end
local function _(arg1) -- Line 64, Named "GetHumanoidDescription"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local pcall_result1_3, pcall_result2 = pcall(function() -- Line 65
		--[[ Upvalues[2]:
			[1]: Players_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		return Players_upvr:GetHumanoidDescriptionFromUserId(arg1)
	end)
	if pcall_result1_3 and pcall_result2 then
		return pcall_result2
	end
	return nil
end
local function SetupAnimations_upvr(arg1, arg2) -- Line 76, Named "SetupAnimations"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local WalkAnimation = arg1:FindFirstChild("WalkAnimation")
	local HoldAnimation = arg1:FindFirstChild("HoldAnimation")
	local var21
	if WalkAnimation and HoldAnimation then
		var21 = arg2:LoadAnimation(WalkAnimation)
		local _ = arg2:LoadAnimation(HoldAnimation)
	else
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "rbxassetid://180426354"
		Animation.Name = "WalkAnimation"
		Animation.Parent = arg1
		local Animation_2 = Instance.new("Animation")
		Animation_2.AnimationId = "rbxassetid://97558784916978"
		Animation_2.Name = "HoldAnimation"
		Animation_2.Parent = arg1
		var21 = arg2:LoadAnimation(Animation)
	end
	var21.Priority = Enum.AnimationPriority.Core
	arg2:LoadAnimation(Animation_2).Priority = Enum.AnimationPriority.Action
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	arg2:LoadAnimation(Animation_2).Looped = true
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return var21, arg2:LoadAnimation(Animation_2)
end
local function GetCharacterModel_upvr(arg1, arg2) -- Line 108, Named "GetCharacterModel"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: Players_upvr (readonly)
	]]
	if tbl_upvr[arg1].CharacterModels[arg2] then
		local var43 = tbl_upvr[arg1].CharacterModels[arg2]
		if var43 and not var43.Parent then
			tbl_upvr[arg1].CharacterModels[arg2] = nil
			return var43
		end
	end
	local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 65
		--[[ Upvalues[2]:
			[1]: Players_upvr (copied, readonly)
			[2]: arg2 (readonly)
		]]
		return Players_upvr:GetHumanoidDescriptionFromUserId(arg2)
	end)
	local var47
	if pcall_result1_2 and pcall_result2_2 then
		var47 = pcall_result2_2
	else
		var47 = nil
	end
	if not var47 then
		return nil
	end
	local any_CreateHumanoidModelFromDescription_result1 = Players_upvr:CreateHumanoidModelFromDescription(var47, Enum.HumanoidRigType.R6)
	local Animate = any_CreateHumanoidModelFromDescription_result1:FindFirstChild("Animate")
	if Animate then
		Animate:Destroy()
	end
	for _, v_3 in pairs(any_CreateHumanoidModelFromDescription_result1:GetDescendants()) do
		if v_3:IsA("Part") then
			v_3.CollisionGroup = "Customers"
		end
	end
	local class_Humanoid = any_CreateHumanoidModelFromDescription_result1:FindFirstChildOfClass("Humanoid")
	if class_Humanoid then
		class_Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		class_Humanoid.WalkSpeed = 10
	end
	return any_CreateHumanoidModelFromDescription_result1
end
local function ReturnCharacterToCache_upvr(arg1, arg2, arg3) -- Line 145, Named "ReturnCharacterToCache"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1] 2. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [1] 2. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 3 end (CF ANALYSIS FAILED)
end
local function SafeMoveTo_upvr(arg1, arg2) -- Line 166, Named "SafeMoveTo"
	local var54_upvw = false
	local any_Connect_result1 = arg1.MoveToFinished:Connect(function() -- Line 170
		--[[ Upvalues[1]:
			[1]: var54_upvw (read and write)
		]]
		var54_upvw = true
	end)
	arg1:MoveTo(arg2)
	while not var54_upvw and tick() - tick() < 5 do
		task.wait()
	end
	if any_Connect_result1 then
		any_Connect_result1:Disconnect()
	end
	return var54_upvw
end
local SetPackageHeight_upvr = require(ReplicatedStorage.Utilities.SetPackageHeight)
local cframe_upvr = CFrame.new(0, 2.5, 0)
local function WeldPackageToCharacter_upvr(arg1, arg2) -- Line 189, Named "WeldPackageToCharacter"
	--[[ Upvalues[2]:
		[1]: SetPackageHeight_upvr (readonly)
		[2]: cframe_upvr (readonly)
	]]
	local Package = arg1:FindFirstChild("Package")
	if Package and Package:IsA("Model") then
		Package:Destroy()
	end
	local clone = script.Package:Clone()
	local UpperTorso = arg1:FindFirstChild("UpperTorso")
	if not UpperTorso then
		UpperTorso = arg1:FindFirstChild("Torso")
	end
	if not UpperTorso then
		clone:Destroy()
		return nil
	end
	local PrimaryPart = clone.PrimaryPart
	if not PrimaryPart then
		clone:Destroy()
		return nil
	end
	SetPackageHeight_upvr(clone, arg2)
	clone:PivotTo(UpperTorso.CFrame * cframe_upvr)
	local Motor6D = Instance.new("Motor6D")
	Motor6D.Name = "PackageWeld"
	Motor6D.Part0 = UpperTorso
	Motor6D.Part1 = PrimaryPart
	Motor6D.C0 = cframe_upvr
	Motor6D.C1 = CFrame.new()
	Motor6D.Parent = PrimaryPart
	if not clone.Parent then
		clone.Parent = arg1
	end
end
local PlacementUtil_upvr = require(ReplicatedStorage.Utilities.PlacementUtil)
local Temporary_upvr = workspace.Temporary
function module.SpawnCustomer(arg1, arg2, arg3) -- Line 227
	--[[ Upvalues[9]:
		[1]: PlacementUtil_upvr (readonly)
		[2]: InitializePlayerCache_upvr (readonly)
		[3]: GetCharacterModel_upvr (readonly)
		[4]: Temporary_upvr (readonly)
		[5]: WeldPackageToCharacter_upvr (readonly)
		[6]: SetupAnimations_upvr (readonly)
		[7]: tbl_upvr (readonly)
		[8]: SafeMoveTo_upvr (readonly)
		[9]: ReturnCharacterToCache_upvr (readonly)
	]]
	if not arg1 or not arg1.Parent then
	else
		local any_GetPlotFolder_result1_2 = PlacementUtil_upvr.GetPlotFolder(arg1)
		if not any_GetPlotFolder_result1_2 then return end
		InitializePlayerCache_upvr(arg1)
		if not arg1.Parent then return end
		local CustomerWaypoints_2 = any_GetPlotFolder_result1_2.Interactables.CustomerWaypoints
		local tbl = {
			Spawn = CustomerWaypoints_2['1'].CFrame;
			Target = CustomerWaypoints_2['2'].Position;
			End = CustomerWaypoints_2['3'].Position;
		}
		local GetCharacterModel_result1 = GetCharacterModel_upvr(arg1, arg2)
		if not GetCharacterModel_result1 then return end
		local class_Humanoid_4_upvr = GetCharacterModel_result1:FindFirstChildOfClass("Humanoid")
		class_Humanoid_4_upvr.RootPart.CFrame = tbl.Spawn + Vector3.new(0, 3, 0)
		GetCharacterModel_result1.Parent = Temporary_upvr
		WeldPackageToCharacter_upvr(GetCharacterModel_result1, arg3)
		local SetupAnimations_upvr_result1, SetupAnimations_upvr_result2_2 = SetupAnimations_upvr(GetCharacterModel_result1, class_Humanoid_4_upvr)
		SetupAnimations_upvr_result2_2:Play()
		if tbl_upvr[arg1] then
			if tbl_upvr[arg1].ActiveCharacters then
				tbl_upvr[arg1].ActiveCharacters[GetCharacterModel_result1] = true
			end
		end
		local function _(arg1_3) -- Line 266, Named "MoveTo"
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: SafeMoveTo_upvr (copied, readonly)
				[3]: class_Humanoid_4_upvr (readonly)
			]]
			if not arg1.Parent then
				return false
			end
			return SafeMoveTo_upvr(class_Humanoid_4_upvr, arg1_3)
		end
		task.wait(0.5)
		SetupAnimations_upvr_result1:Play()
		if not arg1.Parent then
		else
		end
		if not SafeMoveTo_upvr(class_Humanoid_4_upvr, tbl.Target) then
			if tbl_upvr[arg1] then
				if tbl_upvr[arg1].ActiveCharacters then
					tbl_upvr[arg1].ActiveCharacters[GetCharacterModel_result1] = nil
				end
			end
			SetupAnimations_upvr_result1:Stop()
			SetupAnimations_upvr_result2_2:Stop()
			GetCharacterModel_result1:Destroy()
			return
		end
		if not arg1.Parent then
		else
		end
		if not SafeMoveTo_upvr(class_Humanoid_4_upvr, tbl.End) then
			if tbl_upvr[arg1] then
				if tbl_upvr[arg1].ActiveCharacters then
					tbl_upvr[arg1].ActiveCharacters[GetCharacterModel_result1] = nil
				end
			end
			SetupAnimations_upvr_result1:Stop()
			SetupAnimations_upvr_result2_2:Stop()
			GetCharacterModel_result1:Destroy()
			return
		end
		SetupAnimations_upvr_result1:Stop()
		SetupAnimations_upvr_result2_2:Stop()
		ReturnCharacterToCache_upvr(arg1, arg2, GetCharacterModel_result1)
	end
end
Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 309
	--[[ Upvalues[1]:
		[1]: ClearPlayerCache_upvr (readonly)
	]]
	ClearPlayerCache_upvr(arg1)
end)
return module