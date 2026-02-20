-- Name: Placement
-- Path: game:GetService("ReplicatedStorage").Utilities.PlacementUtil.Placement
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.7998500000012427 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:38
-- Luau version 6, Types version 3
-- Time taken: 0.026945 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AnalyticsService_upvr = game:GetService("AnalyticsService")
local Players_upvr = game:GetService("Players")
local Replication_upvr = workspace.Replication
local tbl_4_upvr = {}
local tbl_7_upvr = {}
local tbl_3_upvr = {}
local CollectorDataByGrid_upvr = require(ReplicatedStorage.Utilities.CollectorDataByGrid)
local Service_upvr = require(ReplicatedStorage.Packages.Service)
local RNGPatterns_upvr = require(ReplicatedStorage.Configs.RNGPatterns)
local GetMultiplier_upvr = require(ReplicatedStorage.Utilities.GetMultiplier)
local module = {}
local function _(arg1) -- Line 44, Named "GridToString"
	return string.format("%d,%d,%d", math.floor(arg1.X), math.floor(arg1.Y), math.floor(arg1.Z))
end
local function _(arg1, arg2, arg3) -- Line 48, Named "CreateDebugVisualization"
end
local function _(arg1) -- Line 75, Named "GetPlayerSpawnerMultiplier"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local any_GetPlayerByUserId_result1_5 = Players_upvr:GetPlayerByUserId(arg1)
	local var14
	if not any_GetPlayerByUserId_result1_5 then
		var14 = 1
		return var14
	end
	var14 = 1
	local var15 = any_GetPlayerByUserId_result1_5:GetAttribute("SpawnersPlaced") or 0
	if 50 <= var15 then
		var14 *= 2
	end
	if 100 <= var15 then
		var14 *= 2
	end
	return var14
end
local function CreateReplicationFolder_upvr(arg1, arg2) -- Line 92, Named "CreateReplicationFolder"
	local Folder = Instance.new("Folder")
	Folder.Name = arg2 or ""
	for i, v in pairs(arg1) do
		Folder:SetAttribute(i, v)
	end
	return Folder
end
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local Serg_AutoTextScaling_upvr = require(ReplicatedStorage.Utilities.Serg_AutoTextScaling)
local function UpdateCollector_upvr(arg1) -- Line 103, Named "UpdateCollector"
	--[[ Upvalues[3]:
		[1]: CollectorDataByGrid_upvr (readonly)
		[2]: AbbreviateNumber_upvr (readonly)
		[3]: Serg_AutoTextScaling_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	local var26 = CollectorDataByGrid_upvr[arg1]
	local var27
	if not var26 then return end
	local BillboardGui = var26.BillboardGui
	if not BillboardGui or not BillboardGui.Parent then return end
	if var26.MaxPetsAmount > var26.CurrentPetsAmount then
		var27 = false
	else
		var27 = true
	end
	BillboardGui.Full.Visible = var27
	if 1 > var26.TotalGemsValue then
		var27 = false
		-- KONSTANTWARNING: GOTO [32] #23
	end
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 22. Error Block 39 start (CF ANALYSIS FAILED)
	var27 = true
	BillboardGui.Gems.Visible = var27
	var27 = BillboardGui.Gems
	var27 = AbbreviateNumber_upvr(var26.TotalGemsValue, true)
	var27.Amount.Text = var27
	var27 = 0
	if 1 <= var26.TotalGemsValue then
		-- KONSTANTWARNING: GOTO [54] #38
	end
	-- KONSTANTERROR: [31] 22. Error Block 39 end (CF ANALYSIS FAILED)
end
local function SetupCollector_upvr(arg1) -- Line 121, Named "SetupCollector"
	--[[ Upvalues[4]:
		[1]: CollectorDataByGrid_upvr (readonly)
		[2]: UpdateCollector_upvr (readonly)
		[3]: Service_upvr (readonly)
		[4]: AnalyticsService_upvr (readonly)
	]]
	local MaxPets = arg1.ItemInfo.MaxPets
	if not MaxPets then return end
	local Model = arg1.Model
	local PlacementGrid_upvr = arg1.PlacementGrid
	local OwnerUserId_upvr = arg1.OwnerUserId
	local ProximityPrompt = Instance.new("ProximityPrompt")
	local clone = script.Assets.CollectorBillboardGui:Clone()
	clone.Adornee = Model
	ProximityPrompt.RequiresLineOfSight = false
	ProximityPrompt.ActionText = "Collect"
	ProximityPrompt.ObjectText = "Add To Package"
	clone.Parent = ProximityPrompt
	ProximityPrompt.Parent = Model
	CollectorDataByGrid_upvr[PlacementGrid_upvr] = {
		BillboardGui = clone;
		CurrentPetsAmount = 0;
		MaxPetsAmount = MaxPets;
		TotalPetsValue = 0;
		TotalGemsValue = 0;
		OwnerUserId = OwnerUserId_upvr;
	}
	UpdateCollector_upvr(PlacementGrid_upvr)
	local PlacementPosition_upvr = arg1.PlacementPosition
	return ProximityPrompt.Triggered:Connect(function(arg1_2) -- Line 153
		--[[ Upvalues[7]:
			[1]: OwnerUserId_upvr (readonly)
			[2]: CollectorDataByGrid_upvr (copied, readonly)
			[3]: PlacementGrid_upvr (readonly)
			[4]: Service_upvr (copied, readonly)
			[5]: AnalyticsService_upvr (copied, readonly)
			[6]: PlacementPosition_upvr (readonly)
			[7]: UpdateCollector_upvr (copied, readonly)
		]]
		if arg1_2.UserId ~= OwnerUserId_upvr then
		else
			local var38 = CollectorDataByGrid_upvr[PlacementGrid_upvr]
			if not var38 then return end
			if var38.TotalPetsValue <= 0 then return end
			local any_GetReplica_result1_5 = Service_upvr:Get("DataService"):GetReplica(arg1_2)
			if not any_GetReplica_result1_5 then return end
			local TutorialStep_2 = any_GetReplica_result1_5.Data.TutorialStep
			if TutorialStep_2 and TutorialStep_2 == 4 then
				any_GetReplica_result1_5:Set({"TutorialStep"}, 5)
				AnalyticsService_upvr:LogOnboardingFunnelStepEvent(arg1_2, 4, "Collect packages from the Collector!")
			end
			Service_upvr:Get("PlotService"):AddCollectingValue(arg1_2, PlacementPosition_upvr, var38.TotalPetsValue, var38.CurrentPetsAmount)
			any_GetReplica_result1_5:Set({"Gems"}, any_GetReplica_result1_5.Data.Gems + var38.TotalGemsValue)
			var38.CurrentPetsAmount = 0
			var38.TotalPetsValue = 0
			var38.TotalGemsValue = 0
			UpdateCollector_upvr(PlacementGrid_upvr)
		end
	end)
end
local Events_upvr = ReplicatedStorage.Events
local function AddPetToIndex_upvr(arg1, arg2, arg3) -- Line 185, Named "AddPetToIndex"
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: Service_upvr (readonly)
		[3]: Events_upvr (readonly)
	]]
	local any_GetPlayerByUserId_result1_8 = Players_upvr:GetPlayerByUserId(arg1)
	if not any_GetPlayerByUserId_result1_8 then
	else
		local any_GetReplica_result1 = Service_upvr:Get("DataService"):GetReplica(any_GetPlayerByUserId_result1_8)
		if not any_GetReplica_result1 then return end
		if not table.find(any_GetReplica_result1.Data.Index, arg2) then
			any_GetReplica_result1:TableInsert({"Index"}, arg2)
			Events_upvr.NewPet:FireClient(any_GetPlayerByUserId_result1_8, arg2, arg3)
		end
	end
end
local function AddPetToCollectorByGrid_upvr(arg1, arg2, arg3, arg4) -- Line 199, Named "AddPetToCollectorByGrid"
	--[[ Upvalues[7]:
		[1]: CollectorDataByGrid_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: Service_upvr (readonly)
		[4]: AnalyticsService_upvr (readonly)
		[5]: GetMultiplier_upvr (readonly)
		[6]: UpdateCollector_upvr (readonly)
		[7]: AddPetToIndex_upvr (readonly)
	]]
	local var47 = CollectorDataByGrid_upvr[arg1]
	if not var47 then
	else
		local UserId = arg2:GetAttribute("UserId")
		if not UserId then return end
		local any_GetPlayerByUserId_result1 = Players_upvr:GetPlayerByUserId(UserId)
		if not any_GetPlayerByUserId_result1 then return end
		local any_GetReplica_result1_3 = Service_upvr:Get("DataService"):GetReplica(any_GetPlayerByUserId_result1)
		if not any_GetReplica_result1_3 then return end
		local TutorialStep = any_GetReplica_result1_3.Data.TutorialStep
		if TutorialStep and TutorialStep == 3 then
			any_GetReplica_result1_3:Set({"TutorialStep"}, 4)
			AnalyticsService_upvr:LogOnboardingFunnelStepEvent(any_GetPlayerByUserId_result1, 3, "Wait for the Pet to Spawn!")
		end
		local PetName = arg2:GetAttribute("PetName")
		if not PetName then return end
		local var54 = var47.CurrentPetsAmount + 1
		if var47.MaxPetsAmount < var54 then return end
		var47.CurrentPetsAmount = var54
		var47.TotalPetsValue += arg3
		if 5 <= any_GetReplica_result1_3.Data.Rebirths then
			var47.TotalGemsValue += arg4 * GetMultiplier_upvr.Gems(any_GetReplica_result1_3)
		end
		UpdateCollector_upvr(arg1)
		AddPetToIndex_upvr(UserId, PetName, arg3)
	end
end
local function _(arg1) -- Line 245, Named "GetPlayerLuckMultiplier"
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: Service_upvr (readonly)
		[3]: GetMultiplier_upvr (readonly)
	]]
	local any_GetPlayerByUserId_result1_2 = Players_upvr:GetPlayerByUserId(arg1)
	if not any_GetPlayerByUserId_result1_2 then return end
	local any_GetReplica_result1_2 = Service_upvr:Get("DataService"):GetReplica(any_GetPlayerByUserId_result1_2)
	if not any_GetReplica_result1_2 then return end
	return GetMultiplier_upvr.Luck(any_GetReplica_result1_2)
end
local function _(arg1) -- Line 255, Named "GetPlayerCashMultiplier"
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: Service_upvr (readonly)
		[3]: GetMultiplier_upvr (readonly)
	]]
	local any_GetPlayerByUserId_result1_7 = Players_upvr:GetPlayerByUserId(arg1)
	if not any_GetPlayerByUserId_result1_7 then return end
	local any_GetReplica_result1_4 = Service_upvr:Get("DataService"):GetReplica(any_GetPlayerByUserId_result1_7)
	if not any_GetReplica_result1_4 then return end
	return GetMultiplier_upvr.Cash(any_GetReplica_result1_4)
end
local function _(arg1, arg2, arg3) -- Line 265, Named "UpgradePetValue"
	local OriginalPetValue = arg2:GetAttribute("OriginalPetValue")
	if not OriginalPetValue then return end
	local ValueMultiplier = arg1.ItemInfo.ValueMultiplier
	if not ValueMultiplier then return end
	return (arg3) + (OriginalPetValue * ValueMultiplier - OriginalPetValue)
end
local function GetAllOccupiedGrids_upvr(arg1) -- Line 277, Named "GetAllOccupiedGrids"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if 1 < arg1.GridHeight then
		for i_2 = 0, arg1.GridHeight - 1 do
			table.insert({}, Vector3.new(arg1.PlacementGrid.X, arg1.PlacementGrid.Y + i_2, arg1.PlacementGrid.Z))
			local var66
		end
		return var66
	end
	return {arg1.PlacementGrid}
end
local function _(arg1, arg2) -- Line 296, Named "DirectionsMatch"
	local var68 = false
	if math.round(arg1.X) == math.round(arg2.X) then
		if math.round(arg1.Z) ~= math.round(arg2.Z) then
			var68 = false
		else
			var68 = true
		end
	end
	return var68
end
local cframe_upvr = CFrame.new(0, 0, 3)
local function CalculateTravelPath_upvr(arg1, arg2, arg3, arg4) -- Line 305, Named "CalculateTravelPath"
	--[[ Upvalues[1]:
		[1]: cframe_upvr (readonly)
	]]
	local Position = arg1.Position
	local Position_4 = arg2.Position
	local var72 = arg4.Speed or 10
	if arg4.Type == "Conveyor Splitter" then
		local tbl = {{
			TravelTime = (Position_4 - Position).Magnitude / var72;
			Position = Position_4;
		}}
		return tbl
	end
	tbl = true
	local var75 = tbl
	if arg3.Type ~= "Conveyor Splitter" then
		local LookVector = arg1.LookVector
		local LookVector_2 = arg2.LookVector
		local var78 = false
		if math.round(LookVector.X) == math.round(LookVector_2.X) then
			if math.round(LookVector.Z) ~= math.round(LookVector_2.Z) then
				var78 = false
			else
				var78 = true
			end
		end
		var75 = not var78
	end
	if var75 then
		local Position_2 = (arg2 * cframe_upvr).Position
		return {{
			TravelTime = (Position_2 - Position).Magnitude / var72;
			Position = Position_2;
		}, {
			TravelTime = (Position_4 - Position_2).Magnitude / var72;
			Position = Position_4;
		}}
	end
	return {{
		TravelTime = (Position_4 - Position).Magnitude / var72;
		Position = Position_4;
	}}
end
local function IsValidConnection_upvr(arg1, arg2, arg3) -- Line 330, Named "IsValidConnection"
	if arg3 == "Pet Spawner" then
		return false
	end
	for _, v_2 in pairs(arg1) do
		for _, v_3 in pairs(arg2) do
			if v_2 == v_3 then
				return true
			end
		end
	end
	return false
end
local function SelectRandomOutputGrid_upvr(arg1, arg2) -- Line 346, Named "SelectRandomOutputGrid"
	--[[ Upvalues[1]:
		[1]: RNGPatterns_upvr (readonly)
	]]
	if #arg1 == 1 then
		return arg1[1]
	end
	local var95 = (arg2:GetAttribute("RNGCounter") or 0) + 1
	arg2:SetAttribute("RNGCounter", var95)
	local var96 = RNGPatterns_upvr[arg2:GetAttribute("RNGPattern") or 1]
	if var96 then
		return arg1[var96[(var95 - 1) % #var96 + 1]]
	end
	return arg1[1]
end
local function GetNextPetDestination_upvr(arg1, arg2, arg3, arg4) -- Line 366, Named "GetNextPetDestination"
	--[[ Upvalues[5]:
		[1]: tbl_4_upvr (readonly)
		[2]: SelectRandomOutputGrid_upvr (readonly)
		[3]: IsValidConnection_upvr (readonly)
		[4]: AddPetToCollectorByGrid_upvr (readonly)
		[5]: CalculateTravelPath_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var97 = tbl_4_upvr[arg1]
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 4. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return nil
	end
	-- KONSTANTERROR: [3] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 6. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 6. Error Block 3 end (CF ANALYSIS FAILED)
end
local function _(arg1, arg2) -- Line 425, Named "RemovePetFromGrid"
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	if tbl_7_upvr[arg2] then
		local table_find_result1 = table.find(tbl_7_upvr[arg2], arg1)
		if table_find_result1 then
			table.remove(tbl_7_upvr[arg2], table_find_result1)
		end
		if #tbl_7_upvr[arg2] == 0 then
			tbl_7_upvr[arg2] = nil
		end
	end
end
local function _(arg1, arg2) -- Line 438, Named "AddPetToGrid"
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	if not tbl_7_upvr[arg2] then
		tbl_7_upvr[arg2] = {}
	end
	table.insert(tbl_7_upvr[arg2], arg1)
end
local GetRNGPet_upvr = require(ReplicatedStorage.Utilities.GetRNGPet)
local const_number_upvw = 0
local function SpawnAndMovePet_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 446, Named "SpawnAndMovePet"
	--[[ Upvalues[11]:
		[1]: GetRNGPet_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: Service_upvr (readonly)
		[4]: GetMultiplier_upvr (readonly)
		[5]: const_number_upvw (read and write)
		[6]: RNGPatterns_upvr (readonly)
		[7]: CreateReplicationFolder_upvr (readonly)
		[8]: tbl_3_upvr (readonly)
		[9]: tbl_7_upvr (readonly)
		[10]: GetNextPetDestination_upvr (readonly)
		[11]: Replication_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
	local any_GetPlayerByUserId_result1_6 = Players_upvr:GetPlayerByUserId(arg1)
	if not any_GetPlayerByUserId_result1_6 then
		-- KONSTANTWARNING: GOTO [27] #24
	end
	-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 9. Error Block 20 start (CF ANALYSIS FAILED)
	if not Service_upvr:Get("DataService"):GetReplica(any_GetPlayerByUserId_result1_6) then
		-- KONSTANTWARNING: GOTO [27] #24
	end
	-- KONSTANTERROR: [9] 9. Error Block 20 end (CF ANALYSIS FAILED)
end
local function DestroyAllPetsAtGrid_upvr(arg1) -- Line 551, Named "DestroyAllPetsAtGrid"
	--[[ Upvalues[2]:
		[1]: tbl_7_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
	]]
	local var104 = tbl_7_upvr[arg1]
	if not var104 then
	else
		for _, v_8 in ipairs(table.clone(var104)) do
			if v_8 and v_8.Parent then
				local var108 = tbl_3_upvr[v_8]
				if var108 then
					task.cancel(var108)
					tbl_3_upvr[v_8] = nil
				end
				if tbl_7_upvr[arg1] then
					local table_find_result1_2 = table.find(tbl_7_upvr[arg1], v_8)
					if table_find_result1_2 then
						table.remove(tbl_7_upvr[arg1], table_find_result1_2)
					end
					if #tbl_7_upvr[arg1] == 0 then
						tbl_7_upvr[arg1] = nil
					end
				end
				v_8:Destroy()
			end
		end
		tbl_7_upvr[arg1] = nil
	end
end
local random_state_upvr = Random.new()
local function StartPetSpawner_upvr(arg1, arg2, arg3, arg4) -- Line 571, Named "StartPetSpawner"
	--[[ Upvalues[5]:
		[1]: Players_upvr (readonly)
		[2]: CreateReplicationFolder_upvr (readonly)
		[3]: random_state_upvr (readonly)
		[4]: Replication_upvr (readonly)
		[5]: SpawnAndMovePet_upvr (readonly)
	]]
	local LuckMultiplier_upvr = arg1.ItemInfo.LuckMultiplier
	local var112_upvw
	if not LuckMultiplier_upvr then return end
	local Position_3_upvr = arg1.TargetCFrame.Position
	var112_upvw = arg1.ItemInfo
	local SpawnInterval_upvr = var112_upvw.SpawnInterval
	if not SpawnInterval_upvr then return end
	local any_GetPlayerByUserId_result1_4 = Players_upvr:GetPlayerByUserId(arg3)
	local var116
	if not any_GetPlayerByUserId_result1_4 then
		var112_upvw = 1
	else
		var116 = 1
		local var117 = any_GetPlayerByUserId_result1_4:GetAttribute("SpawnersPlaced") or 0
		if 50 <= var117 then
			var116 *= 2
		end
		if 100 <= var117 then
			var116 *= 2
		end
		var112_upvw = var116
	end
	local tbl_6 = {
		Position = Position_3_upvr;
		LuckMultiplier = LuckMultiplier_upvr;
		SpawnerMultiplier = var112_upvw;
	}
	tbl_6.UserId = arg3
	tbl_6.SpawnInterval = SpawnInterval_upvr
	local rounded_upvw = math.round(SpawnInterval_upvr * var112_upvw)
	local any_Add_result1_upvr = arg2:Add(CreateReplicationFolder_upvr(tbl_6))
	local PlacementGrid_upvr_2 = arg1.PlacementGrid
	return task.spawn(function() -- Line 593
		--[[ Upvalues[13]:
			[1]: arg4 (readonly)
			[2]: random_state_upvr (copied, readonly)
			[3]: rounded_upvw (read and write)
			[4]: any_Add_result1_upvr (readonly)
			[5]: Replication_upvr (copied, readonly)
			[6]: arg3 (readonly)
			[7]: Players_upvr (copied, readonly)
			[8]: var112_upvw (read and write)
			[9]: SpawnInterval_upvr (readonly)
			[10]: SpawnAndMovePet_upvr (copied, readonly)
			[11]: PlacementGrid_upvr_2 (readonly)
			[12]: Position_3_upvr (readonly)
			[13]: LuckMultiplier_upvr (readonly)
		]]
		if arg4 then
			task.wait(random_state_upvr:NextNumber(0, rounded_upvw))
		end
		any_Add_result1_upvr.Parent = Replication_upvr.Spawners
		while true do
			for i_5 = rounded_upvw, 0, -1 do
				any_Add_result1_upvr:SetAttribute("TimeLeft", i_5)
				local wait = task.wait
				wait(1)
				if i_5 == 0 then
					local any_GetPlayerByUserId_result1_3 = Players_upvr:GetPlayerByUserId(arg3)
					local var127
					if not any_GetPlayerByUserId_result1_3 then
						wait = 1
					else
						var127 = 1
						local var128 = any_GetPlayerByUserId_result1_3:GetAttribute("SpawnersPlaced") or 0
						if 50 <= var128 then
							var127 *= 2
						end
						if 100 <= var128 then
							var127 *= 2
						end
						wait = var127
					end
					if var112_upvw ~= wait then
						var112_upvw = wait
						var127 = "SpawnerMultiplier"
						any_Add_result1_upvr:SetAttribute(var127, var112_upvw)
					end
					rounded_upvw = math.round(SpawnInterval_upvr * wait)
				end
			end
			SpawnAndMovePet_upvr(arg3, PlacementGrid_upvr_2, Position_3_upvr, LuckMultiplier_upvr, var112_upvw)
		end
	end)
end
local Trove_upvr = require(ReplicatedStorage.Packages.Trove)
function module.new(arg1, arg2) -- Line 626
	--[[ Upvalues[7]:
		[1]: Trove_upvr (readonly)
		[2]: GetAllOccupiedGrids_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
		[4]: DestroyAllPetsAtGrid_upvr (readonly)
		[5]: SetupCollector_upvr (readonly)
		[6]: StartPetSpawner_upvr (readonly)
		[7]: CollectorDataByGrid_upvr (readonly)
	]]
	local any_new_result1_upvr = Trove_upvr.new()
	local GetAllOccupiedGrids_upvr_result1_upvr = GetAllOccupiedGrids_upvr(arg1)
	arg1.OccupyingGrids = GetAllOccupiedGrids_upvr_result1_upvr
	local Type_2 = arg1.ItemInfo.Type
	for i_6, v_4 in pairs(GetAllOccupiedGrids_upvr_result1_upvr) do
		if tbl_4_upvr[v_4] then
			DestroyAllPetsAtGrid_upvr(v_4)
			if tbl_4_upvr[v_4].Model and tbl_4_upvr[v_4].Model.Parent then
				tbl_4_upvr[v_4].Model:Destroy()
			end
		end
		tbl_4_upvr[v_4] = arg1
	end
	if Type_2 == "Pet Collector" then
		i_6 = SetupCollector_upvr
		v_4 = arg1
		i_6 = i_6(v_4)
		any_new_result1_upvr:Add(i_6)
	elseif Type_2 == "Pet Spawner" then
		i_6 = StartPetSpawner_upvr
		v_4 = arg1
		i_6 = i_6(v_4, any_new_result1_upvr, arg1.OwnerUserId, arg2)
		table.insert({}, i_6)
	end
	local tbl_2_upvw = {}
	any_new_result1_upvr:Add(arg1.Model.Destroying:Connect(function() -- Line 656
		--[[ Upvalues[7]:
			[1]: GetAllOccupiedGrids_upvr_result1_upvr (readonly)
			[2]: DestroyAllPetsAtGrid_upvr (copied, readonly)
			[3]: tbl_4_upvr (copied, readonly)
			[4]: arg1 (readonly)
			[5]: CollectorDataByGrid_upvr (copied, readonly)
			[6]: tbl_2_upvw (read and write)
			[7]: any_new_result1_upvr (readonly)
		]]
		for _, v_5 in pairs(GetAllOccupiedGrids_upvr_result1_upvr) do
			DestroyAllPetsAtGrid_upvr(v_5)
			if tbl_4_upvr[v_5] == arg1 then
				tbl_4_upvr[v_5] = nil
				if CollectorDataByGrid_upvr[v_5] then
					CollectorDataByGrid_upvr[v_5] = nil
				end
			end
		end
		for _, v_6 in pairs(tbl_2_upvw) do
			if v_6 then
				task.cancel(v_6)
				v_6 = nil
			end
		end
		tbl_2_upvw = nil
		any_new_result1_upvr:Destroy()
	end))
end
function module.ResetPlayerCollectors(arg1, arg2) -- Line 682
	--[[ Upvalues[2]:
		[1]: CollectorDataByGrid_upvr (readonly)
		[2]: UpdateCollector_upvr (readonly)
	]]
	for i_9, v_7 in pairs(CollectorDataByGrid_upvr) do
		if v_7.OwnerUserId == arg2.UserId then
			CollectorDataByGrid_upvr[i_9].CurrentPetsAmount = 0
			CollectorDataByGrid_upvr[i_9].TotalPetsValue = 0
			UpdateCollector_upvr(i_9)
		end
	end
end
return module