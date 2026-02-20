-- Name: Pets
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Plot.Pets
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.8465023999997356 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:32
-- Luau version 6, Types version 3
-- Time taken: 0.031387 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris_upvr = game:GetService("Debris")
local Players_upvr = game:GetService("Players")
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local Camera_upvr = workspace.Camera
local Position_3_upvw = Camera_upvr.CFrame.Position
local DisableOthersPets_upvw = LocalPlayer_upvr:GetAttribute("DisableOthersPets")
local DisableYourPets_upvw = LocalPlayer_upvr:GetAttribute("DisableYourPets")
local DisableUpgraderPopups_upvw = LocalPlayer_upvr:GetAttribute("DisableUpgraderPopups")
LocalPlayer_upvr:GetAttributeChangedSignal("DisableOthersPets"):Connect(function() -- Line 22
	--[[ Upvalues[2]:
		[1]: DisableOthersPets_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	DisableOthersPets_upvw = LocalPlayer_upvr:GetAttribute("DisableOthersPets")
end)
LocalPlayer_upvr:GetAttributeChangedSignal("DisableYourPets"):Connect(function() -- Line 26
	--[[ Upvalues[2]:
		[1]: DisableYourPets_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	DisableYourPets_upvw = LocalPlayer_upvr:GetAttribute("DisableYourPets")
end)
LocalPlayer_upvr:GetAttributeChangedSignal("DisableUpgraderPopups"):Connect(function() -- Line 30
	--[[ Upvalues[2]:
		[1]: DisableUpgraderPopups_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	DisableUpgraderPopups_upvw = LocalPlayer_upvr:GetAttribute("DisableUpgraderPopups")
end)
local tbl_8_upvr = {
	CLOSE = 95;
	MEDIUM = 175;
	FAR = 240;
	VERY_FAR = 350;
}
local tbl_10_upvr = {
	[tbl_8_upvr.CLOSE] = (1/60);
	[tbl_8_upvr.MEDIUM] = 0.05;
	[tbl_8_upvr.FAR] = 0.08333333333333333;
	[tbl_8_upvr.VERY_FAR] = 0.1;
	FALLBACK = 0.1;
}
local cframe_upvr_2 = CFrame.Angles(0, (-math.pi/2), 0)
local tbl_5_upvr = {}
local tbl_6_upvr = {}
local tbl_2_upvr = {}
local tbl_4_upvr = {}
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local RNGPatterns_upvr = require(ReplicatedStorage.Configs.RNGPatterns)
local module = {}
local function GridToId_upvr(arg1) -- Line 68, Named "GridToId"
	if not arg1 then
		return nil
	end
	return string.format("%d,%d,%d", arg1.X, arg1.Y, arg1.Z)
end
local CollectionService_upvr = game:GetService("CollectionService")
local function SetupConveyors_upvr() -- Line 75, Named "SetupConveyors"
	--[[ Upvalues[3]:
		[1]: GridToId_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
	]]
	local function UnwrapInputsOutputs_upvr(arg1) -- Line 76, Named "UnwrapInputsOutputs"
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if not arg1 or arg1 == "" then
			return {
				In = {};
				Out = {};
			}
		end
		local any_match_result1, _ = arg1:match("^(.-);(.*)$")
		if not any_match_result1 then
			any_match_result1 = arg1
		end
		local function extractCoords(arg1_2) -- Line 85
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			if arg1_2 == "" then
				return {}
			end
			for i in arg1_2:gmatch("[^,]+,[^,]+,[^,]+") do
				table.insert({}, i)
				local var37
			end
			return var37
		end
		return {
			Out = extractCoords(any_match_result1);
			In = extractCoords("");
		}
	end
	local function GetAllOccupiedGrids_upvr(arg1, arg2) -- Line 96, Named "GetAllOccupiedGrids"
		--[[ Upvalues[1]:
			[1]: GridToId_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		if arg2 <= 1 then
			return {GridToId_upvr(arg1)}
		end
		for i_2 = 0, arg2 - 1 do
			table.insert({}, GridToId_upvr(Vector3.new(arg1.X, arg1.Y + i_2, arg1.Z)))
			local var45
		end
		return var45
	end
	local function AddOrRemoveConveyorModel_upvr(arg1, arg2) -- Line 105, Named "AddOrRemoveConveyorModel"
		--[[ Upvalues[3]:
			[1]: GetAllOccupiedGrids_upvr (readonly)
			[2]: UnwrapInputsOutputs_upvr (readonly)
			[3]: tbl_5_upvr (copied, readonly)
		]]
		local BaseGrid = arg1:GetAttribute("BaseGrid")
		if not BaseGrid then
		else
			local GetAllOccupiedGrids_upvr_result1 = GetAllOccupiedGrids_upvr(BaseGrid, arg1:GetAttribute("GridHeight") or 1)
			local var56
			if arg2 then
				local TargetCFrame_2 = arg1:GetAttribute("TargetCFrame")
				local UnwrapInputsOutputs_upvr_result1 = UnwrapInputsOutputs_upvr(arg1:GetAttribute("IO"))
				if not TargetCFrame_2 or not UnwrapInputsOutputs_upvr_result1 then
				else
					local tbl_3 = {
						TargetCFrame = TargetCFrame_2;
					}
					var56 = arg1:GetAttribute("Speed") or 10
					tbl_3.Speed = var56
					tbl_3.IO = UnwrapInputsOutputs_upvr_result1
					var56 = arg1:GetAttribute("TwoPathsRequired")
					tbl_3.TwoPathsRequired = var56
					local function INLINED() -- Internal function, doesn't exist in bytecode
						var56 = GetAllOccupiedGrids_upvr_result1
						return var56
					end
					if 1 >= #GetAllOccupiedGrids_upvr_result1 or not INLINED() then
						var56 = nil
					end
					tbl_3.OccupyingGrids = var56
					var56 = arg1:GetAttribute("UpgradeMultiplier") or nil
					tbl_3.UpgradeMultiplier = var56
					var56 = GetAllOccupiedGrids_upvr_result1
					for _, v_7 in var56 do
						tbl_5_upvr[v_7] = tbl_3
						local _
					end
				end
			end
			for _, v_6 in GetAllOccupiedGrids_upvr_result1 do
				tbl_5_upvr[v_6] = nil
			end
		end
	end
	CollectionService_upvr:GetInstanceAddedSignal("ConveyorType"):Connect(function(arg1) -- Line 138
		--[[ Upvalues[1]:
			[1]: AddOrRemoveConveyorModel_upvr (readonly)
		]]
		AddOrRemoveConveyorModel_upvr(arg1, true)
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("ConveyorType"):Connect(function(arg1) -- Line 142
		--[[ Upvalues[2]:
			[1]: GetAllOccupiedGrids_upvr (readonly)
			[2]: tbl_5_upvr (copied, readonly)
		]]
		local BaseGrid_2 = arg1:GetAttribute("BaseGrid")
		if not BaseGrid_2 then
		else
			for _, var64 in GetAllOccupiedGrids_upvr(BaseGrid_2, arg1:GetAttribute("GridHeight") or 1), nil do
				tbl_5_upvr[var64] = nil
			end
		end
	end)
	for i_3, v in ipairs(CollectionService_upvr:GetTagged("ConveyorType")) do
		if v and v.Parent then
			AddOrRemoveConveyorModel_upvr(v, true)
		else
		end
		if i_3 % 15 == 0 then
			task.wait(0.05)
		end
	end
end
local function _(arg1, arg2) -- Line 162, Named "DirectionsMatch"
	local var69 = false
	if math.round(arg1.X) == math.round(arg2.X) then
		if math.round(arg1.Z) ~= math.round(arg2.Z) then
			var69 = false
		else
			var69 = true
		end
	end
	return var69
end
local cframe_upvr = CFrame.new(0, 0, 3)
local function CalculateTravelPath_upvr(arg1, arg2, arg3, arg4) -- Line 171, Named "CalculateTravelPath"
	--[[ Upvalues[1]:
		[1]: cframe_upvr (readonly)
	]]
	local Position_4 = arg1.Position
	local Position = arg2.Position
	local var73 = arg4.Speed or 8
	if arg4.TwoPathsRequired then
		local tbl_9 = {}
		local tbl_11 = {
			TravelTime = (Position - Position_4).Magnitude / var73;
			Position = Position;
		}
		tbl_9[1] = tbl_11
		return tbl_9
	end
	tbl_9 = arg3.TwoPathsRequired
	local var76 = tbl_9
	if not var76 then
		local LookVector = arg1.LookVector
		local LookVector_2 = arg2.LookVector
		tbl_11 = false
		local var79 = tbl_11
		if math.round(LookVector.X) == math.round(LookVector_2.X) then
			if math.round(LookVector.Z) ~= math.round(LookVector_2.Z) then
				var79 = false
			else
				var79 = true
			end
		end
		var76 = not var79
	end
	if var76 then
		local Position_2 = (arg2 * cframe_upvr).Position
		return {{
			TravelTime = (Position_2 - Position_4).Magnitude / var73;
			Position = Position_2;
		}, {
			TravelTime = (Position - Position_2).Magnitude / var73;
			Position = Position;
		}}
	end
	return {{
		TravelTime = (Position - Position_4).Magnitude / var73;
		Position = Position;
	}}
end
local function IsValidConnection_upvr(arg1, arg2) -- Line 194, Named "IsValidConnection"
	for _, v_2 in arg1 do
		for _, v_3 in arg2 do
			if v_2 == v_3 then
				return true
			end
		end
	end
	return false
end
local function _(arg1, arg2) -- Line 204, Named "SelectRandomOutputGrid"
	--[[ Upvalues[1]:
		[1]: RNGPatterns_upvr (readonly)
	]]
	local len = #arg1
	if len == 1 then
		return arg1[1]
	end
	if len == 2 then
		local var91 = (arg2.RNGCounter or 0) + 1
		arg2.RNGCounter = var91
		local var92 = RNGPatterns_upvr[arg2.RNGPattern or 1]
		if var92 then
			return arg1[var92[(var91 - 1) % #var92 + 1]]
		end
		return arg1[1]
	end
	return arg1[1]
end
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true)
local TweenInfo_new_result1_upvr_2 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local TweenInfo_new_result1_upvr_3 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local function UpdatePetValue_upvr(arg1, arg2, arg3, arg4) -- Line 231, Named "UpdatePetValue"
	--[[ Upvalues[7]:
		[1]: AbbreviateNumber_upvr (readonly)
		[2]: Position_3_upvw (read and write)
		[3]: TweenService_upvr (readonly)
		[4]: TweenInfo_new_result1_upvr (readonly)
		[5]: TweenInfo_new_result1_upvr_2 (readonly)
		[6]: TweenInfo_new_result1_upvr_3 (readonly)
		[7]: Debris_upvr (readonly)
	]]
	if not arg1 or not arg1.Parent then
	else
		arg1.Cash.Text = '$'..AbbreviateNumber_upvr(arg2, true)
		if arg4 and arg4.Parent and (arg4.Position - Position_3_upvw).Magnitude <= arg1.MaxDistance then
			local clone_3_upvr = script.AddedPetValue:Clone()
			clone_3_upvr.Text = '$'..AbbreviateNumber_upvr(arg3)
			TweenService_upvr:Create(clone_3_upvr, TweenInfo_new_result1_upvr, {
				Size = UDim2.new(0.9, 0, 0.325, 0);
			}):Play()
			clone_3_upvr.Parent = arg1
			local UIStroke_upvr = clone_3_upvr.UIStroke
			task.delay(0.3, function() -- Line 250
				--[[ Upvalues[6]:
					[1]: clone_3_upvr (readonly)
					[2]: TweenService_upvr (copied, readonly)
					[3]: TweenInfo_new_result1_upvr_2 (copied, readonly)
					[4]: UIStroke_upvr (readonly)
					[5]: TweenInfo_new_result1_upvr_3 (copied, readonly)
					[6]: Debris_upvr (copied, readonly)
				]]
				if clone_3_upvr and clone_3_upvr.Parent then
					TweenService_upvr:Create(clone_3_upvr, TweenInfo_new_result1_upvr_2, {
						Position = UDim2.new(0.5, 0, clone_3_upvr.Size.Y.Scale, 0);
						Size = UDim2.new(0, 0, 0, 0);
						Rotation = math.random(-360, 360);
						TextTransparency = 1;
					}):Play()
					TweenService_upvr:Create(UIStroke_upvr, TweenInfo_new_result1_upvr_3, {
						Transparency = 1;
					}):Play()
					Debris_upvr:AddItem(clone_3_upvr, 0.5)
				end
			end)
		end
	end
end
local function GetNextPetDestination_upvr(arg1, arg2) -- Line 270, Named "GetNextPetDestination"
	--[[ Upvalues[7]:
		[1]: tbl_5_upvr (readonly)
		[2]: RNGPatterns_upvr (readonly)
		[3]: IsValidConnection_upvr (readonly)
		[4]: DisableUpgraderPopups_upvw (read and write)
		[5]: AbbreviateNumber_upvr (readonly)
		[6]: UpdatePetValue_upvr (readonly)
		[7]: CalculateTravelPath_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 49 start (CF ANALYSIS FAILED)
	local var103 = tbl_5_upvr[arg1]
	local var104
	if not var103 then return end
	local Out = var103.IO.Out
	local len_2 = #Out
	if len_2 == 1 then
		var104 = Out[1]
		-- KONSTANTWARNING: GOTO [37] #31
	end
	-- KONSTANTERROR: [0] 1. Error Block 49 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 11. Error Block 50 start (CF ANALYSIS FAILED)
	if len_2 == 2 then
		local var107 = (arg2.RNGCounter or 0) + 1
		arg2.RNGCounter = var107
		local var108 = RNGPatterns_upvr[arg2.RNGPattern or 1]
		if var108 then
			var104 = Out[var108[(var107 - 1) % #var108 + 1]]
		else
			var104 = Out[1]
		end
	else
		var104 = Out[1]
	end
	if not var104 then return end
	local var109 = tbl_5_upvr[var104]
	if not var109 then return end
	local OccupyingGrids = var103.OccupyingGrids
	if not OccupyingGrids then
		OccupyingGrids = {}
		OccupyingGrids[1] = arg1
	end
	if not IsValidConnection_upvr(var109.IO.In, OccupyingGrids) then return end
	local TargetCFrame_3 = var109.TargetCFrame
	local TargetCFrame = var103.TargetCFrame
	if not TargetCFrame_3 or not TargetCFrame then return end
	if var109.UpgradeMultiplier and arg2.BillboardGui then
		local var113 = arg2.OriginalValue * var109.UpgradeMultiplier - arg2.OriginalValue
		local var114 = arg2.CurrentValue + var113
		if DisableUpgraderPopups_upvw then
			arg2.BillboardGui.Cash.Text = '$'..AbbreviateNumber_upvr(var114, true)
		else
			UpdatePetValue_upvr(arg2.BillboardGui, var114, var113, arg2.Pet)
		end
		arg2.CurrentValue = var114
	end
	do
		return var104, TargetCFrame.Position, CalculateTravelPath_upvr(TargetCFrame, TargetCFrame_3, var103, var109)
	end
	-- KONSTANTERROR: [13] 11. Error Block 50 end (CF ANALYSIS FAILED)
end
local PlayerUtil_upvr = require(ReplicatedStorage.Utilities.PlayerUtil)
local PlacementUtil_upvr = require(ReplicatedStorage.Utilities.PlacementUtil)
local function StartDistanceChecker_upvr() -- Line 306, Named "StartDistanceChecker"
	--[[ Upvalues[9]:
		[1]: Position_3_upvw (read and write)
		[2]: Camera_upvr (readonly)
		[3]: PlayerUtil_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
		[5]: tbl_4_upvr (readonly)
		[6]: tbl_10_upvr (readonly)
		[7]: Players_upvr (readonly)
		[8]: PlacementUtil_upvr (readonly)
		[9]: tbl_8_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 42 start (CF ANALYSIS FAILED)
	task.spawn(function() -- Line 307
		--[[ Upvalues[2]:
			[1]: Position_3_upvw (copied, read and write)
			[2]: Camera_upvr (copied, readonly)
		]]
		while task.wait(0.1) do
			Position_3_upvw = Camera_upvr.CFrame.Position
		end
	end)
	task.wait(1)
	if not PlayerUtil_upvr:GetPosition(LocalPlayer_upvr.Character) then
		local tbl = {
			interval = tbl_10_upvr.FALLBACK;
			accumulator = 0;
		}
		tbl_4_upvr[LocalPlayer_upvr] = tbl
		-- KONSTANTWARNING: GOTO [6] #6
	end
	-- KONSTANTERROR: [0] 1. Error Block 42 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 25. Error Block 35 start (CF ANALYSIS FAILED)
	for _, _ in tbl_4_upvr, LocalPlayer_upvr, tbl do
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.6]
		if not nil then
		else
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.7]
			if not nil then
			else
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.8]
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.65666]
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.10]
				local function INLINED_2() -- Internal function, doesn't exist in bytecode
					-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [147.9]
					return nil
				end
				local function INLINED_3() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
					return nil > nil
				end
				local function INLINED_4() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					return nil
				end
				local function INLINED_5() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
					return nil > nil
				end
				local function INLINED_6() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					return nil
				end
				local function INLINED_7() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
					return nil > nil
				end
				local function INLINED_8() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					return nil
				end
				if nil > nil or not INLINED_2() or INLINED_3() or not INLINED_4() or INLINED_5() or not INLINED_6() or INLINED_7() or not INLINED_8() then
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	end
	-- KONSTANTERROR: [31] 25. Error Block 35 end (CF ANALYSIS FAILED)
end
local Effects_upvr = workspace.Temporary.Effects
local function DestroyPet_upvr(arg1, arg2) -- Line 348, Named "DestroyPet"
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: tbl_10_upvr (readonly)
		[4]: tbl_8_upvr (readonly)
		[5]: Effects_upvr (readonly)
		[6]: Debris_upvr (readonly)
	]]
	if not arg1 or not arg1.Parent then
	else
		if arg2 == LocalPlayer_upvr then
			local var132 = tbl_4_upvr[arg2]
			if var132 and var132.interval == tbl_10_upvr[tbl_8_upvr.CLOSE] then
				local Attachment = Instance.new("Attachment")
				local clone = script.Sparks:Clone()
				Attachment.WorldPosition = arg1.Position
				clone.Parent = Attachment
				Attachment.Parent = Effects_upvr
				clone:Emit(10)
				Debris_upvr:AddItem(Attachment, 0.8)
			end
		end
		arg1:Destroy()
	end
end
local table_create_result1_upvr = table.create(2000)
local function UpdatePetMovements_upvr(arg1) -- Line 369, Named "UpdatePetMovements"
	--[[ Upvalues[8]:
		[1]: table_create_result1_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
		[4]: tbl_10_upvr (readonly)
		[5]: tbl_8_upvr (readonly)
		[6]: cframe_upvr_2 (readonly)
		[7]: GetNextPetDestination_upvr (readonly)
		[8]: DestroyPet_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	table.clear(table_create_result1_upvr)
	local pairs_result1, pairs_result2, pairs_result3 = pairs(tbl_2_upvr)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [242] 171. Error Block 46 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [242] 171. Error Block 46 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [242.8]
	-- KONSTANTERROR: [15] 12. Error Block 2 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 480, Named "GetPlayerFromPetFolder"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local UserId_2 = arg1:GetAttribute("UserId")
	local var140 = UserId_2
	if var140 then
		var140 = Players_upvr:GetPlayerByUserId(UserId_2)
	end
	return var140
end
local CreatePet_upvr = require(script.CreatePet)
local Pets_upvr_2 = workspace.Temporary.Pets
local function AddPet_upvr(arg1) -- Line 485, Named "AddPet"
	--[[ Upvalues[11]:
		[1]: Players_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: DisableYourPets_upvw (read and write)
		[4]: DisableOthersPets_upvw (read and write)
		[5]: CreatePet_upvr (readonly)
		[6]: AbbreviateNumber_upvr (readonly)
		[7]: GetNextPetDestination_upvr (readonly)
		[8]: tbl_6_upvr (readonly)
		[9]: tbl_2_upvr (readonly)
		[10]: Pets_upvr_2 (readonly)
		[11]: cframe_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tostring_result1 = tostring(arg1)
	local UserId = arg1:GetAttribute("UserId")
	local var145 = UserId
	if var145 then
		var145 = Players_upvr:GetPlayerByUserId(UserId)
	end
	if not var145 then
	else
		if var145 ~= LocalPlayer_upvr then
			local _ = false
			-- KONSTANTWARNING: Skipped task `defvar` above
		else
		end
		if true then
			if DisableYourPets_upvw then
				do
					return
				end
				-- KONSTANTWARNING: GOTO [32] #29
			end
		elseif DisableOthersPets_upvw then
			return
		end
		local PetName = arg1:GetAttribute("PetName")
		local StartingGrid = arg1:GetAttribute("StartingGrid")
		if not StartingGrid then
			local _
		else
		end
		if not PetName or not string.format("%d,%d,%d", StartingGrid.X, StartingGrid.Y, StartingGrid.Z) then return end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local CreatePet_upvr_result1, CreatePet_upvr_result2, CreatePet_upvr_result3 = CreatePet_upvr(PetName, true)
		if not CreatePet_upvr_result1 or not CreatePet_upvr_result2 then return end
		local var153 = arg1:GetAttribute("OriginalPetValue") or 0
		local tbl_7 = {
			NumberId = tonumber(tostring_result1);
			OriginalValue = var153;
			CurrentValue = var153;
			BillboardGui = CreatePet_upvr_result3;
			RNGPattern = arg1:GetAttribute("RNGPattern") or 1 or 1;
		}
		if CreatePet_upvr_result3 then
			CreatePet_upvr_result3.Cash.Text = '$'..AbbreviateNumber_upvr(tbl_7.OriginalValue, true)
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local GetNextPetDestination_result1, GetNextPetDestination_result2, GetNextPetDestination_result3 = GetNextPetDestination_upvr(string.format("%d,%d,%d", StartingGrid.X, StartingGrid.Y, StartingGrid.Z), tbl_7)
		if not GetNextPetDestination_result1 then
			CreatePet_upvr_result1:Destroy()
			return
		end
		tbl_7.Pet = CreatePet_upvr_result1
		tbl_7.PetHeightOffset = CreatePet_upvr_result2
		tbl_7.CurrentGrid = GetNextPetDestination_result1
		tbl_7.PathIndex = 1
		tbl_7.PathSegments = GetNextPetDestination_result3
		local StartTime = arg1:GetAttribute("StartTime")
		if not StartTime then
			StartTime = workspace:GetServerTimeNow()
		end
		tbl_7.StartTime = StartTime
		tbl_7.StartPosition = GetNextPetDestination_result2
		tbl_7.CurrentRotation = CFrame.new()
		tbl_7.Active = true
		tbl_7.Player = var145
		tbl_6_upvr[tostring_result1] = {
			Player = var145;
			Pet = CreatePet_upvr_result1;
			NumberId = tbl_7.NumberId;
		}
		local var160 = tbl_2_upvr[var145]
		if not var160 then
			var160 = {}
			tbl_2_upvr[var145] = var160
		end
		table.insert(var160, tbl_7)
		CreatePet_upvr_result1.Parent = Pets_upvr_2
		local Unit = (GetNextPetDestination_result3[1].Position - GetNextPetDestination_result2).Unit
		if 0.01 >= Unit.Magnitude or not Unit then
		end
		local cframe_looking_at = CFrame.lookAt(GetNextPetDestination_result2, GetNextPetDestination_result2 + Vector3.new(0, 0, -1))
		CreatePet_upvr_result1.CFrame = cframe_looking_at * cframe_upvr_2 * CFrame.new(0, CreatePet_upvr_result2, 0)
		tbl_7.CurrentRotation = cframe_looking_at * cframe_upvr_2
	end
end
local function RemovePet_upvr(arg1) -- Line 571, Named "RemovePet"
	--[[ Upvalues[3]:
		[1]: tbl_6_upvr (readonly)
		[2]: DestroyPet_upvr (readonly)
		[3]: tbl_2_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var163 = tbl_6_upvr[tostring(arg1)]
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [8] 8. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 9. Error Block 3 start (CF ANALYSIS FAILED)
	DestroyPet_upvr(var163.Pet, var163.Player)
	-- KONSTANTERROR: [9] 9. Error Block 3 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
local Pets_upvr = workspace.Replication.Pets
local function SetupPets_upvr() -- Line 598, Named "SetupPets"
	--[[ Upvalues[9]:
		[1]: StartDistanceChecker_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: tbl_10_upvr (readonly)
		[4]: Players_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: UpdatePetMovements_upvr (readonly)
		[7]: Pets_upvr (readonly)
		[8]: AddPet_upvr (readonly)
		[9]: RemovePet_upvr (readonly)
	]]
	task.spawn(StartDistanceChecker_upvr)
	for _, v_5 in Players_upvr:GetPlayers() do
		tbl_4_upvr[v_5] = {
			interval = tbl_10_upvr.FALLBACK;
			accumulator = 0;
		}
	end
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 601, Named "OnPlayerAdded"
		--[[ Upvalues[2]:
			[1]: tbl_4_upvr (copied, readonly)
			[2]: tbl_10_upvr (copied, readonly)
		]]
		tbl_4_upvr[arg1] = {
			interval = tbl_10_upvr.FALLBACK;
			accumulator = 0;
		}
	end)
	Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 605, Named "OnPlayerRemoving"
		--[[ Upvalues[1]:
			[1]: tbl_4_upvr (copied, readonly)
		]]
		tbl_4_upvr[arg1] = nil
	end)
	RunService_upvr.RenderStepped:Connect(UpdatePetMovements_upvr)
	Pets_upvr.ChildAdded:Connect(AddPet_upvr)
	Pets_upvr.ChildRemoved:Connect(RemovePet_upvr)
end
function module.Load() -- Line 622
	--[[ Upvalues[2]:
		[1]: SetupConveyors_upvr (readonly)
		[2]: SetupPets_upvr (readonly)
	]]
	SetupConveyors_upvr()
	SetupPets_upvr()
end
return module