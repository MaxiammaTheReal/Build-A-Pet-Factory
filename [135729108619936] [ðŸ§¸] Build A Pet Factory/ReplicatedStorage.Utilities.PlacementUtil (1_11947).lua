-- Name: PlacementUtil
-- Path: game:GetService("ReplicatedStorage").Utilities.PlacementUtil
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5626938999994309 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:37
-- Luau version 6, Types version 3
-- Time taken: 0.016522 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Placement_upvr = require(script.Placement)
local module_upvr = {}
local function _(arg1, arg2, arg3) -- Line 27, Named "VisualizeCheckedGrids"
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var8 = arg3
	if not var8 then
		var8 = Color3.fromRGB(255, 255, 255)
	end
	for i = 0, arg2 - 1 do
		local Part = Instance.new("Part")
		Part.Size = Vector3.new(6, 6, 6)
		Part.Position = module_upvr.GridToWorld(Vector3.new(arg1.X, arg1.Y + i, arg1.Z))
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.Transparency = 0.7
		Part.Color = var8
		Part.Material = Enum.Material.SmoothPlastic
		Part.Parent = workspace
		game:GetService("Debris"):AddItem(Part, 1)
		local _
	end
end
local var11_upvr = game:GetService("RunService"):IsServer() or false
local Plots_upvr = workspace:WaitForChild("Plots")
function module_upvr.GetPlotFolder(arg1) -- Line 49
	--[[ Upvalues[2]:
		[1]: var11_upvr (readonly)
		[2]: Plots_upvr (readonly)
	]]
	local PlotName = arg1:GetAttribute("PlotName")
	if not PlotName then return end
	if var11_upvr then
		return Plots_upvr:FindFirstChild(PlotName)
	end
	return Plots_upvr:WaitForChild(PlotName)
end
function module_upvr.WorldToGrid(arg1) -- Line 60
	return Vector3.new(math.floor(arg1.X / 6), math.floor(arg1.Y / 6), math.floor(arg1.Z / 6))
end
function module_upvr.GridToWorld(arg1) -- Line 68
	return Vector3.new(arg1.X * 6 + 3, arg1.Y * 6 + 3, arg1.Z * 6 + 3)
end
function module_upvr.GridToNormalizedGrid(arg1, arg2) -- Line 77
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_PointToObjectSpace_result1 = arg2.CFrame:PointToObjectSpace(module_upvr.GridToWorld(arg1))
	return Vector3.new(math.floor(any_PointToObjectSpace_result1.X / 6), math.floor(any_PointToObjectSpace_result1.Y / 6), math.floor(any_PointToObjectSpace_result1.Z / 6))
end
function module_upvr.NormalizedGridToGrid(arg1, arg2) -- Line 88
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.WorldToGrid(arg2.CFrame:PointToWorldSpace(Vector3.new(arg1.X * 6 + 3, arg1.Y * 6 + 3, arg1.Z * 6 + 3)))
end
function module_upvr.GetInOutGrids(arg1) -- Line 98
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module_2 = {
		In = {};
		Out = {};
	}
	local _
	if not arg1 then
		return module_2
	end
	local children, NONE, NONE_2 = arg1:GetChildren()
	for _, v in children, NONE, NONE_2 do
		if v:IsA("Attachment") then
			if v:GetAttribute("ValidDirection") then
				table.insert(module_2.Out, module_upvr.WorldToGrid(v.WorldPosition))
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				table.insert(module_2.In, module_upvr.WorldToGrid(v.WorldPosition))
			end
		end
	end
	NONE_2 = nil
	for _, v_2 in module_2.Out, NONE_2 do
		table.insert({}, string.format("%d,%d,%d", math.floor(v_2.X), math.floor(v_2.Y), math.floor(v_2.Z)))
		local var45
	end
	NONE_2 = module_2.In
	for i_4, v_3 in NONE_2 do
		table.insert({}, string.format("%d,%d,%d", math.floor(v_3.X), math.floor(v_3.Y), math.floor(v_3.Z)))
		local var47
	end
	NONE_2 = nil
	if 0 < #var45 then
		i_4 = ','
		NONE_2 = table.concat(var45, i_4)
		if 0 < #var47 then
			i_4 = table.concat
			v_3 = var47
			i_4 = i_4(v_3, ',')
			NONE_2 = NONE_2..';'..i_4
			-- KONSTANTWARNING: GOTO [159] #116
		end
	elseif 0 < #var47 then
		i_4 = var47
		v_3 = ','
		NONE_2 = ';'..table.concat(i_4, v_3)
	else
		NONE_2 = nil
	end
	return module_2, NONE_2
end
local ItemConfig_upvr = require(ReplicatedStorage.Configs.ItemConfig)
local Assets_upvr = ReplicatedStorage:WaitForChild("Assets")
local CollectionService_upvr = game:GetService("CollectionService")
function module_upvr.PlaceModelFromPlacementData(arg1, arg2, arg3, arg4) -- Line 155
	--[[ Upvalues[5]:
		[1]: ItemConfig_upvr (readonly)
		[2]: Assets_upvr (readonly)
		[3]: module_upvr (readonly)
		[4]: CollectionService_upvr (readonly)
		[5]: Placement_upvr (readonly)
	]]
	local var51 = ItemConfig_upvr[arg2.ModelName]
	local var52
	if not var51 then return end
	local SOME = Assets_upvr.Placements:FindFirstChild(arg2.ModelName)
	if not SOME then return end
	local GridHeight = SOME:GetAttribute("GridHeight")
	if not GridHeight then return end
	local any_NormalizedGridToGrid_result1 = module_upvr.NormalizedGridToGrid(arg2.NormalizedGrid, arg3)
	local any_GridToWorld_result1 = module_upvr.GridToWorld(any_NormalizedGridToGrid_result1)
	local _, any_ToOrientation_result2, _ = arg3.CFrame:ToOrientation()
	var52 = any_GridToWorld_result1.Y - 3 + GridHeight * 6 / 2
	var52 = any_ToOrientation_result2 + arg2.NormalizedRotation
	local clone = SOME:Clone()
	var52 = "ArrowAttachments"
	local SOME_2 = clone:FindFirstChild(var52)
	local TargetAttachment = clone:FindFirstChild("TargetAttachment")
	var52 = clone:SetAttribute
	var52("BaseGrid", any_NormalizedGridToGrid_result1)
	var52 = arg2.Id
	clone.Name = var52
	var52 = clone:PivotTo
	var52(CFrame.new(Vector3.new(any_GridToWorld_result1.X, var52, any_GridToWorld_result1.Z)) * CFrame.Angles(0, var52, 0))
	var52 = TargetAttachment
	if var52 then
		var52 = TargetAttachment.WorldCFrame
	end
	local any_GetInOutGrids_result1, any_GetInOutGrids_result2 = module_upvr.GetInOutGrids(SOME_2)
	if SOME_2 and any_GetInOutGrids_result1 and any_GetInOutGrids_result2 then
		if var51.Type == "Upgrader" then
			clone:SetAttribute("UpgradeMultiplier", var51.ValueMultiplier or 1)
		end
		clone:SetAttribute("TargetCFrame", var52)
		clone:SetAttribute("Speed", var51.Speed or nil)
		clone:SetAttribute("IO", any_GetInOutGrids_result2)
		if var51.Type == "Conveyor Splitter" then
			clone:SetAttribute("TwoPathsRequired", true)
		end
		CollectionService_upvr:AddTag(clone, "ConveyorType")
	end
	Placement_upvr.new({
		OwnerUserId = arg1.UserId;
		PlacementPosition = any_GridToWorld_result1;
		PlacementGrid = any_NormalizedGridToGrid_result1;
		GridHeight = GridHeight;
		TargetCFrame = var52;
		InOutGrids = any_GetInOutGrids_result1;
		ItemInfo = var51;
		Model = clone;
	}, arg4)
	if TargetAttachment then
		TargetAttachment:Destroy()
	end
	if SOME_2 then
		clone.ArrowAttachments:Destroy()
	end
	clone.HitBox.SelectionBox:Destroy()
	return clone
end
function module_upvr.GetGridKey(arg1, arg2, arg3) -- Line 242
	return string.format("%d_%d_%d", arg1, arg2, arg3)
end
function module_upvr.GetPlacementOccupyingGridKeys(arg1, arg2, arg3) -- Line 247
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local module = {}
	for i_5 = 0, arg2 - 1 do
		local vector3 = Vector3.new(arg1.X, arg1.Y + i_5, arg1.Z)
		table.insert(module, module_upvr.GetGridKey(vector3.X, vector3.Y, vector3.Z))
	end
	return module
end
function module_upvr.IsWithinPlatformBounds(arg1, arg2, arg3) -- Line 270
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Position_2 = arg1.Position
	local Size_3 = arg1.Size
	local X_3 = arg3.X
	local Z = arg3.Z
	local var85 = false
	if math.floor((Position_2.X - Size_3.X / 2 + 3) / 6) <= X_3 then
		var85 = false
		if X_3 <= math.floor((Position_2.X + Size_3.X / 2 - 3) / 6) then
			var85 = false
			if math.floor((Position_2.Z - Size_3.Z / 2 + 3) / 6) <= Z then
				if Z > math.floor((Position_2.Z + Size_3.Z / 2 - 3) / 6) then
					var85 = false
				else
					var85 = true
				end
			end
		end
	end
	if 1 <= arg3.Y then
		if (arg3.Y) + (arg2 - 1) > 25 then
		else
		end
	end
	return var85 and true
end
function module_upvr.ResetPlayerCollectors(arg1) -- Line 298
	--[[ Upvalues[1]:
		[1]: Placement_upvr (readonly)
	]]
	Placement_upvr:ResetPlayerCollectors(arg1)
end
return module_upvr