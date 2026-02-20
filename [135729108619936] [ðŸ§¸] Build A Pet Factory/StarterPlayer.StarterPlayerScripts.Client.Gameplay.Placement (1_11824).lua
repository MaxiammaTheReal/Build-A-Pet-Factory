-- Name: Placement
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Gameplay.Placement
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2596785000005184 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:28
-- Luau version 6, Types version 3
-- Time taken: 0.058373 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService_upvr = game:GetService("RunService")
local UserInputService_upvr = game:GetService("UserInputService")
local TweenService_upvr = game:GetService("TweenService")
local ContextActionService_upvr = game:GetService("ContextActionService")
local var6_upvw
local var7_upvw
local var8_upvw
local var9_upvw
local var10_upvw
local var11_upvw
local Temporary_upvr = workspace.Temporary
local Events_upvr = ReplicatedStorage.Events
local Device_upvr = require(ReplicatedStorage.Utilities.Device)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local PlacementUtil_upvr = require(ReplicatedStorage.Utilities.PlacementUtil)
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local udim2_upvr = UDim2.new(0.5, 0, 0.35, 0)
local var20_upvw
local var21_upvw
local var22_upvw = false
local var23_upvw = false
local tbl_upvr_3 = {
	Active = false;
	Model = nil;
	MobilePlacementOption = "Tap";
	GoalCFrame = nil;
	CurrentCFrame = nil;
	CurrentPosition = nil;
	LastBaseGrid = nil;
	CurrentTilt = CFrame.new();
	GoalTilt = CFrame.new();
	CurrentRotation = 0;
	GoalRotation = 270;
	OccupiedGrids = {};
	ValidGridPosition = false;
	Connection = nil;
}
local tbl_upvr = {
	Active = false;
	Connection = nil;
	HighlightedModel = nil;
	TouchStartModel = nil;
}
local function _(arg1, arg2) -- Line 82, Named "VisualizeGrid"
	--[[ Upvalues[2]:
		[1]: PlacementUtil_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
	]]
	for i = 0, arg2 - 1 do
		local Part = Instance.new("Part")
		Part.Size = Vector3.new(6, 6, 6)
		Part.Position = PlacementUtil_upvr.GridToWorld(Vector3.new(arg1.X, arg1.Y + i, arg1.Z))
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.Transparency = 0.8
		local var29
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var29 = Color3.fromRGB(255, 0, 0)
			return var29
		end
		if not tbl_upvr_3.OccupiedGrids[PlacementUtil_upvr.GetGridKey(arg1.X, arg1.Y + i, arg1.Z)] or not INLINED() then
			var29 = Color3.fromRGB(0, 255, 0)
		end
		Part.Color = var29
		var29 = workspace
		Part.Parent = var29
		var29 = game:GetService("Debris"):AddItem
		var29(Part, 0.33)
	end
end
local function IsGridFree_upvr(arg1, arg2) -- Line 100, Named "IsGridFree"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: PlacementUtil_upvr (readonly)
	]]
	for i_2 = 0, arg2 - 1 do
		if tbl_upvr_3.OccupiedGrids[PlacementUtil_upvr.GetGridKey(arg1.X, arg1.Y + i_2, arg1.Z)] then
			return false
		end
	end
	return true
end
local function OccupyGridState_upvr(arg1, arg2) -- Line 111, Named "OccupyGridState"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: PlacementUtil_upvr (readonly)
	]]
	if not arg1 then
	else
		local BaseGrid = arg1:GetAttribute("BaseGrid")
		if not BaseGrid then return end
		local GridHeight = arg1:GetAttribute("GridHeight")
		if not GridHeight then return end
		if BaseGrid == tbl_upvr_3.LastBaseGrid then
			tbl_upvr_3.LastBaseGrid = nil
		end
		for i_12 = 0, GridHeight - 1 do
			if arg2 then
				tbl_upvr_3.OccupiedGrids[PlacementUtil_upvr.GetGridKey(BaseGrid.X, BaseGrid.Y + i_12, BaseGrid.Z)] = true
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_upvr_3.OccupiedGrids[PlacementUtil_upvr.GetGridKey(BaseGrid.X, BaseGrid.Y + i_12, BaseGrid.Z)] = nil
			end
		end
	end
end
local function _(arg1, arg2) -- Line 134, Named "NormalizeRotationDifference"
	local var34 = arg1 - arg2
	if 180 < var34 then
		var34 -= 360
		return var34
	end
	if var34 < -180 then
		var34 += 360
	end
	return var34
end
local var35_upvw
local function ToggleMobileActionButtons_upvr(arg1) -- Line 150, Named "ToggleMobileActionButtons"
	--[[ Upvalues[5]:
		[1]: Device_upvr (readonly)
		[2]: var35_upvw (read and write)
		[3]: TweenService_upvr (readonly)
		[4]: var6_upvw (read and write)
		[5]: tbl_upvr_3 (readonly)
	]]
	if arg1 then
		if Device_upvr.CurrentDevice ~= "Mobile" then return end
		if not var35_upvw then
			var35_upvw = TweenService_upvr:Create(var6_upvw.MobilePlacementButtons.UIScale, TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				Scale = 1.06;
			})
		end
		if var35_upvw.PlaybackState ~= Enum.PlaybackState.Playing then
			var35_upvw:Play()
		end
	end
	var6_upvw.MobilePlacementButtons.Visible = arg1
	local var37
	if arg1 and tbl_upvr_3.MobilePlacementOption == "Cursor" then
		var37 = true
	else
		var37 = false
	end
	var6_upvw.MobilePlacementDot.Visible = var37
	var37 = var6_upvw
	var37 = not arg1
	var37.RightButtons.Visible = var37
	var37 = var6_upvw
	var37.MobilePlacementOptions.Visible = arg1
end
local function _(arg1) -- Line 173, Named "ToggleMobilePickupButton"
	--[[ Upvalues[3]:
		[1]: Device_upvr (readonly)
		[2]: var6_upvw (read and write)
		[3]: tbl_upvr_3 (readonly)
	]]
	if arg1 and Device_upvr.CurrentDevice ~= "Mobile" then
	else
		var6_upvw.Inventory.Pickup.Visible = arg1
		local var38
		if arg1 and tbl_upvr_3.MobilePlacementOption == "Cursor" then
			var38 = true
		else
			var38 = false
		end
		var6_upvw.MobilePlacementDot.Visible = var38
		var38 = var6_upvw
		var38.MobilePlacementOptions.Visible = arg1
	end
end
local function _(arg1, arg2) -- Line 183, Named "TogglePlacementInstructions"
	--[[ Upvalues[2]:
		[1]: Device_upvr (readonly)
		[2]: var6_upvw (read and write)
	]]
	local CurrentDevice = Device_upvr.CurrentDevice
	for _, v in pairs(var6_upvw.Inventory.Instructions:GetChildren()) do
		if arg1 then
			if arg2 == "PLACE" and v.Name == CurrentDevice or arg2 == "PICKUP" and v.Name == CurrentDevice.."Pickup" then
				-- KONSTANTWARNING: GOTO [34] #24
			end
		end
		v.Visible = false
	end
end
local function ToggleHazardStripes_upvr(arg1, arg2) -- Line 194, Named "ToggleHazardStripes"
	--[[ Upvalues[1]:
		[1]: var10_upvw (read and write)
	]]
	local var57
	if var57 then
		var57 = ColorSequence.new(arg2)
	end
	for _, v_2 in pairs(var10_upvw.Interactables.HazardStripes.Beams:GetChildren()) do
		if v_2.Enabled ~= arg1 then
			v_2.Enabled = arg1
			if var57 then
				v_2.Color = var57
			end
		end
	end
end
local function CreateScaleTween_upvr(arg1) -- Line 212, Named "CreateScaleTween"
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local NumberValue_upvr = Instance.new("NumberValue")
	NumberValue_upvr.Value = 1
	NumberValue_upvr.Changed:Connect(function() -- Line 216
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: NumberValue_upvr (readonly)
		]]
		if arg1 and arg1.Parent then
			arg1:ScaleTo(NumberValue_upvr.Value)
		end
	end)
	local any_Create_result1 = TweenService_upvr:Create(NumberValue_upvr, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
		Value = 1.15;
	})
	any_Create_result1.Completed:Connect(function() -- Line 228
		--[[ Upvalues[1]:
			[1]: NumberValue_upvr (readonly)
		]]
		NumberValue_upvr:Destroy()
	end)
	any_Create_result1:Play()
end
local function UpdateDirectionalArrows_upvr(arg1) -- Line 235, Named "UpdateDirectionalArrows"
	local var70 = math.sin(os.clock() * 1.25 * math.pi * 2) * 0.4
	for _, v_3 in ipairs(arg1) do
		local WorldCFrame = v_3.attachment.WorldCFrame
		v_3.arrow:PivotTo(WorldCFrame + WorldCFrame.LookVector * var70)
	end
end
local function PrepareModelForPlacement_upvr(arg1) -- Line 245, Named "PrepareModelForPlacement"
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: RunService_upvr (readonly)
		[3]: UpdateDirectionalArrows_upvr (readonly)
	]]
	for _, v_4 in pairs(arg1:GetDescendants()) do
		if v_4:IsA("Part") or v_4:IsA("UnionOperation") or v_4:IsA("TrussPart") then
			v_4.CanCollide = false
			v_4.CanQuery = false
			v_4.CanTouch = false
		end
	end
	local tbl_upvr_4 = {}
	local ArrowAttachments = arg1:FindFirstChild("ArrowAttachments")
	if ArrowAttachments then
		for _, v_5 in pairs(ArrowAttachments:GetChildren()) do
			local var95
			if v_5:IsA("Attachment") then
				var95 = v_5:GetAttribute("ValidDirection")
				local var96 = var95 or false
				local function INLINED_2() -- Internal function, doesn't exist in bytecode
					var95 = Color3.fromRGB(40, 202, 0)
					return var95
				end
				if not var96 or not INLINED_2() then
					var95 = Color3.fromRGB(197, 89, 0)
				end
				local clone_2 = script.Arrow:Clone()
				local Highlight = Instance.new("Highlight")
				Highlight.FillTransparency = 1
				Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
				if not var96 then
					Highlight.FillTransparency = 1
					Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
				else
					Highlight.FillColor = var95
					Highlight.FillTransparency = 0.5
				end
				Highlight.Adornee = clone_2
				Highlight.Parent = clone_2
				for _, v_6 in pairs(clone_2:GetChildren()) do
					if v_6:IsA("Part") then
						v_6.Color = var95
					end
				end
				clone_2:PivotTo(v_5.WorldCFrame)
				clone_2.Parent = arg1
				table.insert(tbl_upvr_4, {
					arrow = clone_2;
					attachment = v_5;
				})
			end
		end
	end
	if tbl_upvr_3.ArrowAnimConnection then
		tbl_upvr_3.ArrowAnimConnection:Disconnect()
		tbl_upvr_3.ArrowAnimConnection = nil
	end
	if 1 <= #tbl_upvr_4 then
		tbl_upvr_3.ArrowAnimConnection = RunService_upvr.RenderStepped:Connect(function() -- Line 306
			--[[ Upvalues[2]:
				[1]: UpdateDirectionalArrows_upvr (copied, readonly)
				[2]: tbl_upvr_4 (readonly)
			]]
			UpdateDirectionalArrows_upvr(tbl_upvr_4)
		end)
	end
end
local function GetCursorRaycastInfo_upvr() -- Line 316, Named "GetCursorRaycastInfo"
	--[[ Upvalues[2]:
		[1]: var11_upvw (read and write)
		[2]: udim2_upvr (readonly)
	]]
	local ViewportSize = var11_upvw.ViewportSize
	local any_ViewportPointToRay_result1 = var11_upvw:ViewportPointToRay(ViewportSize.X * udim2_upvr.X.Scale + udim2_upvr.X.Offset, ViewportSize.Y * udim2_upvr.Y.Scale + udim2_upvr.Y.Offset)
	return any_ViewportPointToRay_result1.Origin, any_ViewportPointToRay_result1.Direction * 999
end
local function GetRaycastOriginAndDirection_upvr() -- Line 326, Named "GetRaycastOriginAndDirection"
	--[[ Upvalues[5]:
		[1]: Device_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: var8_upvw (read and write)
		[4]: GetCursorRaycastInfo_upvr (readonly)
		[5]: var9_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [64] 45. Error Block 11 start (CF ANALYSIS FAILED)
	do
		return GetCursorRaycastInfo_upvr()
	end
	do
		return nil, nil
	end
	-- KONSTANTERROR: [64] 45. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [68] 49. Error Block 23 start (CF ANALYSIS FAILED)
	if Device_upvr.CurrentDevice == "PC" then
		if not var9_upvw then
			return nil, nil
		end
		local UnitRay = var9_upvw.UnitRay
		return UnitRay.Origin, UnitRay.Direction * 999
	end
	if Device_upvr.CurrentDevice == "Console" then
		return GetCursorRaycastInfo_upvr()
	end
	-- KONSTANTERROR: [68] 49. Error Block 23 end (CF ANALYSIS FAILED)
end
local function CalculateSnappedPosition_upvr(arg1, arg2, arg3, arg4) -- Line 372, Named "CalculateSnappedPosition"
	return Vector3.new(math.floor(arg1.X / 6) * 6 + 3, math.clamp(math.floor(arg1.Y / 6 + 0.3) * 6 + arg2, arg3 + arg2, arg4), math.floor(arg1.Z / 6) * 6 + 3)
end
local function SnapToNearestValidGrid_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 384, Named "SnapToNearestValidGrid"
	local Position = arg3.Position
	local Size = arg3.Size
	return Vector3.new(math.clamp(math.floor(arg1.X / 6), math.floor((Position.X - Size.X / 2 + 3) / 6), math.floor((Position.X + Size.X / 2 - 3) / 6)) * 6 + 3, arg4 + arg2, math.clamp(math.floor(arg1.Z / 6), math.floor((Position.Z - Size.Z / 2 + 3) / 6), math.floor((Position.Z + Size.Z / 2 - 3) / 6)) * 6 + 3)
end
local function CalculateTiltFromMovement_upvr(arg1) -- Line 416, Named "CalculateTiltFromMovement"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	if not tbl_upvr_3.CurrentPosition then
	else
		local any_ToOrientation_result1, _, any_ToOrientation_result3 = tbl_upvr_3.GoalTilt:ToOrientation()
		tbl_upvr_3.GoalTilt = CFrame.Angles(math.clamp(any_ToOrientation_result1 - math.clamp(-(arg1.Z - tbl_upvr_3.CurrentPosition.Z) / 6, -1, 1) * 0.4363323129985824, -0.8726646259971648, 0.8726646259971648), 0, math.clamp(any_ToOrientation_result3 + math.clamp(-(arg1.X - tbl_upvr_3.CurrentPosition.X) / 6, -1, 1) * 0.4363323129985824, -0.8726646259971648, 0.8726646259971648))
	end
end
local function UpdateTilt_upvr(arg1, arg2) -- Line 435, Named "UpdateTilt"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	if not arg2 then
		tbl_upvr_3.GoalTilt = tbl_upvr_3.GoalTilt:Lerp(CFrame.new(), 1 - math.exp(-30 * arg1))
	end
	if arg2 then
	else
	end
	tbl_upvr_3.CurrentTilt = tbl_upvr_3.CurrentTilt:Lerp(tbl_upvr_3.GoalTilt, 1 - math.exp(-15 * arg1))
end
local function _(arg1) -- Line 450, Named "UpdateRotation"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	local var112 = tbl_upvr_3.GoalRotation - tbl_upvr_3.CurrentRotation
	if 180 < var112 then
		var112 -= 360
	elseif var112 < -180 then
		var112 += 360
	end
	tbl_upvr_3.CurrentRotation += var112 * (1 - math.exp(-20 * arg1))
	tbl_upvr_3.CurrentRotation %= 360
end
local function CreatePlacementUpdateLoop_upvr(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 462, Named "CreatePlacementUpdateLoop"
	--[[ Upvalues[9]:
		[1]: tbl_upvr_3 (readonly)
		[2]: RunService_upvr (readonly)
		[3]: GetRaycastOriginAndDirection_upvr (readonly)
		[4]: CalculateSnappedPosition_upvr (readonly)
		[5]: PlacementUtil_upvr (readonly)
		[6]: SnapToNearestValidGrid_upvr (readonly)
		[7]: CalculateTiltFromMovement_upvr (readonly)
		[8]: IsGridFree_upvr (readonly)
		[9]: UpdateTilt_upvr (readonly)
	]]
	local var113_upvr = arg3.Position.Y + arg3.Size.Y / 2
	local _, any_ToOrientation_result2_upvr, _ = arg3.CFrame:ToOrientation()
	local function UpdateModelCFrame_upvr() -- Line 468, Named "UpdateModelCFrame"
		--[[ Upvalues[3]:
			[1]: tbl_upvr_3 (copied, readonly)
			[2]: any_ToOrientation_result2_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		if tbl_upvr_3.CurrentCFrame then
			arg1:PivotTo(tbl_upvr_3.CurrentCFrame * tbl_upvr_3.CurrentTilt * CFrame.Angles(0, any_ToOrientation_result2_upvr, 0) * CFrame.Angles(0, math.rad(tbl_upvr_3.CurrentRotation), 0))
		end
	end
	local var118_upvr = var113_upvr + 150
	return RunService_upvr.RenderStepped:Connect(function(arg1_2) -- Line 476
		--[[ Upvalues[16]:
			[1]: GetRaycastOriginAndDirection_upvr (copied, readonly)
			[2]: arg6 (readonly)
			[3]: tbl_upvr_3 (copied, readonly)
			[4]: UpdateModelCFrame_upvr (readonly)
			[5]: CalculateSnappedPosition_upvr (copied, readonly)
			[6]: arg4 (readonly)
			[7]: var113_upvr (readonly)
			[8]: var118_upvr (readonly)
			[9]: PlacementUtil_upvr (copied, readonly)
			[10]: arg3 (readonly)
			[11]: arg5 (readonly)
			[12]: SnapToNearestValidGrid_upvr (copied, readonly)
			[13]: CalculateTiltFromMovement_upvr (copied, readonly)
			[14]: IsGridFree_upvr (copied, readonly)
			[15]: arg2 (readonly)
			[16]: UpdateTilt_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local GetRaycastOriginAndDirection_upvr_result1_2, GetRaycastOriginAndDirection_upvr_result2_2 = GetRaycastOriginAndDirection_upvr()
		local var121
		if not GetRaycastOriginAndDirection_upvr_result1_2 then
		else
			var121 = GetRaycastOriginAndDirection_upvr_result2_2
			local workspace_Raycast_result1_2 = workspace:Raycast(GetRaycastOriginAndDirection_upvr_result1_2, var121, arg6)
			if not workspace_Raycast_result1_2 then
				var121 = -30 * arg1_2
				var121 = tbl_upvr_3.GoalTilt:Lerp(CFrame.new(), 1 - math.exp(var121))
				tbl_upvr_3.GoalTilt = var121
				var121 = -15 * arg1_2
				var121 = tbl_upvr_3.CurrentTilt:Lerp(tbl_upvr_3.GoalTilt, 1 - math.exp(var121))
				tbl_upvr_3.CurrentTilt = var121
				UpdateModelCFrame_upvr()
				return
			end
			var121 = GetRaycastOriginAndDirection_upvr_result2_2.Unit * 0.5
			var121 = workspace_Raycast_result1_2.Position - var121
			local CalculateSnappedPosition_result1 = CalculateSnappedPosition_upvr(var121, arg4, var113_upvr, var118_upvr)
			var121 = PlacementUtil_upvr.WorldToGrid(Vector3.new(CalculateSnappedPosition_result1.X, CalculateSnappedPosition_result1.Y - arg4, CalculateSnappedPosition_result1.Z))
			if not PlacementUtil_upvr.IsWithinPlatformBounds(arg3, arg5, var121) then
				local SnapToNearestValidGrid_result1 = SnapToNearestValidGrid_upvr(CalculateSnappedPosition_result1, arg4, arg3, var113_upvr, var118_upvr)
				var121 = PlacementUtil_upvr.WorldToGrid(Vector3.new(SnapToNearestValidGrid_result1.X, SnapToNearestValidGrid_result1.Y - arg4, SnapToNearestValidGrid_result1.Z))
			end
			local var125 = not tbl_upvr_3.LastBaseGrid
			if not var125 then
				if var121 == tbl_upvr_3.LastBaseGrid then
					var125 = false
				else
					var125 = true
					local var126
				end
			end
			if var125 then
				tbl_upvr_3.LastBaseGrid = var121
				CalculateTiltFromMovement_upvr(SnapToNearestValidGrid_result1)
				var126 = SnapToNearestValidGrid_result1
				tbl_upvr_3.GoalCFrame = CFrame.new(var126)
				tbl_upvr_3.CurrentPosition = SnapToNearestValidGrid_result1
				local var127 = true
				if var127 then
					var127 = IsGridFree_upvr
					var126 = arg5
					var127 = var127(var121, var126)
				end
				local function INLINED_3() -- Internal function, doesn't exist in bytecode
					var126 = Color3.fromRGB(0, 255, 0)
					return var126
				end
				if not var127 or not INLINED_3() then
					var126 = Color3.fromRGB(255, 0, 0)
				end
				arg2.Color3 = var126
				if var127 then
					var126 = true
				else
					var126 = false
				end
				tbl_upvr_3.ValidGridPosition = var126
			end
			UpdateTilt_upvr(arg1_2, var125)
			if tbl_upvr_3.GoalCFrame then
				if not tbl_upvr_3.CurrentCFrame then
					tbl_upvr_3.CurrentCFrame = tbl_upvr_3.GoalCFrame
				end
				tbl_upvr_3.CurrentCFrame = tbl_upvr_3.CurrentCFrame:Lerp(tbl_upvr_3.GoalCFrame, 1 - math.exp(-20 * arg1_2))
			end
			local var128 = tbl_upvr_3.GoalRotation - tbl_upvr_3.CurrentRotation
			if 180 < var128 then
				var128 -= 360
			elseif var128 < -180 then
				var128 += 360
			end
			tbl_upvr_3.CurrentRotation += var128 * (1 - math.exp(-20 * arg1_2))
			tbl_upvr_3.CurrentRotation %= 360
			UpdateModelCFrame_upvr()
		end
	end)
end
local function GetHoveredPlacementModel_upvr() -- Line 534, Named "GetHoveredPlacementModel"
	--[[ Upvalues[4]:
		[1]: GetRaycastOriginAndDirection_upvr (readonly)
		[2]: Temporary_upvr (readonly)
		[3]: var8_upvw (read and write)
		[4]: var10_upvw (read and write)
	]]
	local GetRaycastOriginAndDirection_upvr_result1, GetRaycastOriginAndDirection_upvr_result2 = GetRaycastOriginAndDirection_upvr()
	if not GetRaycastOriginAndDirection_upvr_result1 then
		return nil
	end
	local RaycastParams_new_result1_2 = RaycastParams.new()
	RaycastParams_new_result1_2.FilterDescendantsInstances = {Temporary_upvr, var8_upvw.Character}
	RaycastParams_new_result1_2.FilterType = Enum.RaycastFilterType.Exclude
	local workspace_Raycast_result1 = workspace:Raycast(GetRaycastOriginAndDirection_upvr_result1, GetRaycastOriginAndDirection_upvr_result2, RaycastParams_new_result1_2)
	if not workspace_Raycast_result1 then
		return nil
	end
	local class_Model = workspace_Raycast_result1.Instance:FindFirstAncestorOfClass("Model")
	if class_Model and class_Model.Parent == var10_upvw.Placements then
		return class_Model
	end
	return nil
end
local function HighlightPlacementModel_upvr(arg1, arg2) -- Line 555, Named "HighlightPlacementModel"
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
local function _() -- Line 576, Named "CreatePickupUpdateLoop"
	--[[ Upvalues[4]:
		[1]: RunService_upvr (readonly)
		[2]: GetHoveredPlacementModel_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: HighlightPlacementModel_upvr (readonly)
	]]
	return RunService_upvr.RenderStepped:Connect(function() -- Line 577
		--[[ Upvalues[3]:
			[1]: GetHoveredPlacementModel_upvr (copied, readonly)
			[2]: tbl_upvr (copied, readonly)
			[3]: HighlightPlacementModel_upvr (copied, readonly)
		]]
		local GetHoveredPlacementModel_upvr_result1_2 = GetHoveredPlacementModel_upvr()
		if GetHoveredPlacementModel_upvr_result1_2 ~= tbl_upvr.HighlightedModel then
			if tbl_upvr.HighlightedModel then
				local HighlightedModel = tbl_upvr.HighlightedModel
				if not HighlightedModel then
				else
					local class_Highlight = HighlightedModel:FindFirstChildOfClass("Highlight")
					if class_Highlight then
						class_Highlight:Destroy()
					end
				end
			end
			if GetHoveredPlacementModel_upvr_result1_2 then
				HighlightPlacementModel_upvr(GetHoveredPlacementModel_upvr_result1_2, true)
			end
			tbl_upvr.HighlightedModel = GetHoveredPlacementModel_upvr_result1_2
		end
	end)
end
local tbl_upvr_2 = {}
local EnablePlacementMode_upvw
local DisablePlacementMode_upvw
function tbl_upvr_2.Place(arg1) -- Line 605
	--[[ Upvalues[7]:
		[1]: tbl_upvr_3 (readonly)
		[2]: ClientSignals_upvr (readonly)
		[3]: var7_upvw (read and write)
		[4]: Events_upvr (readonly)
		[5]: PlaySound_upvr (readonly)
		[6]: EnablePlacementMode_upvw (read and write)
		[7]: DisablePlacementMode_upvw (read and write)
	]]
	if not tbl_upvr_3.Active then
	else
		if not tbl_upvr_3.ValidGridPosition then
			ClientSignals_upvr.Notification:Fire({
				Message = "You can't place here!";
				IsWarning = true;
			})
			return
		end
		if tbl_upvr_3.Model and var7_upvw.Data.Inventory[tostring(tbl_upvr_3.Model)] then
			Events_upvr.PlacePlacement:FireServer(tbl_upvr_3.Model.Name, tbl_upvr_3.CurrentPosition, tbl_upvr_3.GoalRotation)
			PlaySound_upvr("ItemPlacement")
			EnablePlacementMode_upvw(tbl_upvr_3.Model.Name)
			return
		end
		DisablePlacementMode_upvw()
	end
end
function tbl_upvr_2.Rotate(arg1) -- Line 632
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	if not tbl_upvr_3.Active then
	else
		tbl_upvr_3.GoalRotation = (tbl_upvr_3.GoalRotation + 90) % 360
	end
end
function tbl_upvr_2.Cancel(arg1) -- Line 638
	--[[ Upvalues[1]:
		[1]: ClientSignals_upvr (readonly)
	]]
	ClientSignals_upvr.ResetInventoryItem:Fire()
end
function tbl_upvr_2.Pickup(arg1) -- Line 642
	--[[ Upvalues[5]:
		[1]: tbl_upvr (readonly)
		[2]: GetHoveredPlacementModel_upvr (readonly)
		[3]: Events_upvr (readonly)
		[4]: PlaySound_upvr (readonly)
		[5]: tbl_upvr_3 (readonly)
	]]
	if not tbl_upvr.Active then
	else
		local GetHoveredPlacementModel_upvr_result1 = GetHoveredPlacementModel_upvr()
		if not GetHoveredPlacementModel_upvr_result1 then return end
		Events_upvr.PickupPlacement:FireServer(tostring(GetHoveredPlacementModel_upvr_result1))
		PlaySound_upvr("ItemPlacement")
		if tbl_upvr_3.MobilePlacementOption == "Tap" then
			tbl_upvr_3.ValidTapRaycast = nil
		end
	end
end
local function UnbindInputKeys_upvr() -- Line 662, Named "UnbindInputKeys"
	--[[ Upvalues[7]:
		[1]: var20_upvw (read and write)
		[2]: var21_upvw (read and write)
		[3]: var22_upvw (read and write)
		[4]: ContextActionService_upvr (readonly)
		[5]: var23_upvw (read and write)
		[6]: Device_upvr (readonly)
		[7]: var6_upvw (read and write)
	]]
	if var20_upvw then
		var20_upvw:Disconnect()
		var20_upvw = nil
	end
	if var21_upvw then
		var21_upvw:Disconnect()
		var21_upvw = nil
	end
	if var22_upvw then
		ContextActionService_upvr:UnbindAction("ConsolePlace")
		ContextActionService_upvr:UnbindAction("ConsoleRotate")
		ContextActionService_upvr:UnbindAction("ConsoleCancel")
		var22_upvw = false
	end
	if var23_upvw then
		ContextActionService_upvr:UnbindAction("ConsolePickup")
		ContextActionService_upvr:UnbindAction("ConsolePickupCancel")
		var23_upvw = false
	end
	for _, v_7 in pairs(var6_upvw.Inventory.Instructions:GetChildren()) do
		v_7.Visible = false
	end
end
local function _() -- Line 690, Named "BindPCPlacementKeys"
	--[[ Upvalues[4]:
		[1]: var20_upvw (read and write)
		[2]: UserInputService_upvr (readonly)
		[3]: tbl_upvr_3 (readonly)
		[4]: tbl_upvr_2 (readonly)
	]]
	if var20_upvw then
		var20_upvw:Disconnect()
		var20_upvw = nil
	end
	var20_upvw = UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 696
		--[[ Upvalues[2]:
			[1]: tbl_upvr_3 (copied, readonly)
			[2]: tbl_upvr_2 (copied, readonly)
		]]
		if arg2 then
		else
			if not tbl_upvr_3.Active then return end
			if arg1.KeyCode == Enum.KeyCode.R then
				tbl_upvr_2.Rotate()
			end
			if arg1.KeyCode == Enum.KeyCode.Q then
				tbl_upvr_2.Cancel()
			end
			if arg1.UserInputType == Enum.UserInputType.MouseButton1 then
				tbl_upvr_2.Place()
			end
		end
	end)
end
local function _() -- Line 715, Named "BindPCPickupKeys"
	--[[ Upvalues[4]:
		[1]: var21_upvw (read and write)
		[2]: UserInputService_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_upvr_2 (readonly)
	]]
	if var21_upvw then
		var21_upvw:Disconnect()
		var21_upvw = nil
	end
	var21_upvw = UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 721
		--[[ Upvalues[2]:
			[1]: tbl_upvr (copied, readonly)
			[2]: tbl_upvr_2 (copied, readonly)
		]]
		if arg2 then
		else
			if not tbl_upvr.Active then return end
			if arg1.KeyCode == Enum.KeyCode.Q then
				tbl_upvr_2.Cancel()
			end
			if arg1.UserInputType == Enum.UserInputType.MouseButton1 then
				tbl_upvr_2.Pickup()
			end
		end
	end)
end
local function BindConsolePlacementKeys_upvr() -- Line 736, Named "BindConsolePlacementKeys"
	--[[ Upvalues[5]:
		[1]: var22_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
		[3]: ClientData_upvr (readonly)
		[4]: tbl_upvr_3 (readonly)
		[5]: tbl_upvr_2 (readonly)
	]]
	if var22_upvw then
	else
		var22_upvw = true
		ContextActionService_upvr:BindAction("ConsolePlace", function(arg1, arg2) -- Line 743
			--[[ Upvalues[3]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: tbl_upvr_3 (copied, readonly)
				[3]: tbl_upvr_2 (copied, readonly)
			]]
			if ClientData_upvr.DiscoverPopup then
				return Enum.ContextActionResult.Pass
			end
			if arg2 == Enum.UserInputState.Begin and tbl_upvr_3.Active then
				tbl_upvr_2.Place()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonA)
		ContextActionService_upvr:BindAction("ConsoleRotate", function(arg1, arg2) -- Line 760
			--[[ Upvalues[3]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: tbl_upvr_3 (copied, readonly)
				[3]: tbl_upvr_2 (copied, readonly)
			]]
			if ClientData_upvr.DiscoverPopup then
				return Enum.ContextActionResult.Pass
			end
			if arg2 == Enum.UserInputState.Begin and tbl_upvr_3.Active then
				tbl_upvr_2.Rotate()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonX)
		ContextActionService_upvr:BindAction("ConsoleCancel", function(arg1, arg2) -- Line 777
			--[[ Upvalues[3]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: tbl_upvr_3 (copied, readonly)
				[3]: tbl_upvr_2 (copied, readonly)
			]]
			if ClientData_upvr.DiscoverPopup then
				return Enum.ContextActionResult.Pass
			end
			if arg2 == Enum.UserInputState.Begin and tbl_upvr_3.Active then
				tbl_upvr_2.Cancel()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB)
	end
end
local function BindConsolePickupKeys_upvr() -- Line 792, Named "BindConsolePickupKeys"
	--[[ Upvalues[5]:
		[1]: var23_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
		[3]: ClientData_upvr (readonly)
		[4]: tbl_upvr (readonly)
		[5]: tbl_upvr_2 (readonly)
	]]
	if var23_upvw then
	else
		var23_upvw = true
		ContextActionService_upvr:BindAction("ConsolePickup", function(arg1, arg2) -- Line 799
			--[[ Upvalues[3]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: tbl_upvr (copied, readonly)
				[3]: tbl_upvr_2 (copied, readonly)
			]]
			if ClientData_upvr.DiscoverPopup then
				return Enum.ContextActionResult.Pass
			end
			if arg2 == Enum.UserInputState.Begin and tbl_upvr.Active then
				tbl_upvr_2.Pickup()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonA)
		ContextActionService_upvr:BindAction("ConsolePickupCancel", function(arg1, arg2) -- Line 816
			--[[ Upvalues[3]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: tbl_upvr (copied, readonly)
				[3]: tbl_upvr_2 (copied, readonly)
			]]
			if ClientData_upvr.DiscoverPopup then
				return Enum.ContextActionResult.Pass
			end
			if arg2 == Enum.UserInputState.Begin and tbl_upvr.Active then
				tbl_upvr_2.Cancel()
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB)
	end
end
local function _() -- Line 832, Named "BindMobilePickupTouch"
end
local function _(arg1) -- Line 836, Named "SetupDeviceInputs"
	--[[ Upvalues[11]:
		[1]: UnbindInputKeys_upvr (readonly)
		[2]: Device_upvr (readonly)
		[3]: var6_upvw (read and write)
		[4]: var20_upvw (read and write)
		[5]: UserInputService_upvr (readonly)
		[6]: tbl_upvr_3 (readonly)
		[7]: tbl_upvr_2 (readonly)
		[8]: var21_upvw (read and write)
		[9]: tbl_upvr (readonly)
		[10]: BindConsolePlacementKeys_upvr (readonly)
		[11]: BindConsolePickupKeys_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 43 start (CF ANALYSIS FAILED)
	UnbindInputKeys_upvr()
	local CurrentDevice_2 = Device_upvr.CurrentDevice
	local pairs_result1_9, pairs_result2_12, pairs_result3_4 = pairs(var6_upvw.Inventory.Instructions:GetChildren())
	local function INLINED_4() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [19.6]
		return nil.Name ~= CurrentDevice_2
	end
	if arg1 ~= "PLACE" or INLINED_4() then
		if arg1 == "PICKUP" then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil.Name == CurrentDevice_2.."Pickup" then
				-- KONSTANTERROR: [32] 22. Error Block 37 start (CF ANALYSIS FAILED)
				-- KONSTANTWARNING: GOTO [35] #25
				-- KONSTANTERROR: [32] 22. Error Block 37 end (CF ANALYSIS FAILED)
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		nil.Visible = false
		-- KONSTANTWARNING: GOTO [17] #13
	end
	-- KONSTANTERROR: [0] 1. Error Block 43 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 22. Error Block 37 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: GOTO [35] #25
	-- KONSTANTERROR: [32] 22. Error Block 37 end (CF ANALYSIS FAILED)
end
function DisablePlacementMode_upvw() -- Line 864, Named "DisablePlacementMode"
	--[[ Upvalues[4]:
		[1]: tbl_upvr_3 (readonly)
		[2]: var10_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: UnbindInputKeys_upvr (readonly)
	]]
	if not tbl_upvr_3.Active then
	else
		for _, v_10 in pairs(var10_upvw.Interactables.HazardStripes.Beams:GetChildren()) do
			if v_10.Enabled ~= false then
				v_10.Enabled = false
			end
		end
		var6_upvw.MobilePlacementButtons.Visible = false
		var6_upvw.MobilePlacementDot.Visible = false
		var6_upvw.RightButtons.Visible = true
		var6_upvw.MobilePlacementOptions.Visible = false
		UnbindInputKeys_upvr()
		if tbl_upvr_3.ArrowAnimConnection then
			tbl_upvr_3.ArrowAnimConnection:Disconnect()
			tbl_upvr_3.ArrowAnimConnection = nil
		end
		if tbl_upvr_3.Connection then
			tbl_upvr_3.Connection:Disconnect()
			tbl_upvr_3.Connection = nil
		end
		if tbl_upvr_3.Model then
			tbl_upvr_3.Model:Destroy()
			tbl_upvr_3.Model = nil
		end
		tbl_upvr_3.GoalCFrame = nil
		tbl_upvr_3.CurrentCFrame = nil
		tbl_upvr_3.CurrentPosition = nil
		tbl_upvr_3.LastBaseGrid = nil
		tbl_upvr_3.ValidGridPosition = nil
		tbl_upvr_3.ValidTapRaycast = nil
		tbl_upvr_3.Active = false
	end
end
local var160_upvw = DisablePlacementMode_upvw
local function DisablePickupMode_upvw() -- Line 897, Named "DisablePickupMode"
	--[[ Upvalues[5]:
		[1]: tbl_upvr (readonly)
		[2]: var10_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: UnbindInputKeys_upvr (readonly)
		[5]: tbl_upvr_3 (readonly)
	]]
	if not tbl_upvr.Active then
	else
		for i_14, v_11 in pairs(var10_upvw.Interactables.HazardStripes.Beams:GetChildren()) do
			if v_11.Enabled ~= false then
				v_11.Enabled = false
			end
		end
		var6_upvw.Inventory.Pickup.Visible = false
		var6_upvw.MobilePlacementDot.Visible = false
		var6_upvw.MobilePlacementOptions.Visible = false
		UnbindInputKeys_upvr()
		if tbl_upvr.Connection then
			tbl_upvr.Connection:Disconnect()
			tbl_upvr.Connection = nil
		end
		if tbl_upvr.HighlightedModel then
			local HighlightedModel_2 = tbl_upvr.HighlightedModel
			if not HighlightedModel_2 then
			else
				i_14 = "Highlight"
				local instance = HighlightedModel_2:FindFirstChildOfClass(i_14)
				if instance then
					instance:Destroy()
				end
			end
			tbl_upvr.HighlightedModel = nil
		end
		tbl_upvr_3.ValidTapRaycast = nil
		tbl_upvr.TouchStartModel = nil
		tbl_upvr.Active = false
	end
end
local Placements_upvr = ReplicatedStorage.Assets.Placements
function EnablePlacementMode_upvw(arg1) -- Line 921, Named "EnablePlacementMode"
	--[[ Upvalues[20]:
		[1]: tbl_upvr (readonly)
		[2]: DisablePickupMode_upvw (read and write)
		[3]: Placements_upvr (readonly)
		[4]: var160_upvw (read and write)
		[5]: PrepareModelForPlacement_upvr (readonly)
		[6]: tbl_upvr_3 (readonly)
		[7]: ToggleMobileActionButtons_upvr (readonly)
		[8]: ToggleHazardStripes_upvr (readonly)
		[9]: UnbindInputKeys_upvr (readonly)
		[10]: Device_upvr (readonly)
		[11]: var6_upvw (read and write)
		[12]: var20_upvw (read and write)
		[13]: UserInputService_upvr (readonly)
		[14]: tbl_upvr_2 (readonly)
		[15]: BindConsolePlacementKeys_upvr (readonly)
		[16]: Temporary_upvr (readonly)
		[17]: var8_upvw (read and write)
		[18]: CreateScaleTween_upvr (readonly)
		[19]: CreatePlacementUpdateLoop_upvr (readonly)
		[20]: var10_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 58 start (CF ANALYSIS FAILED)
	if tbl_upvr.Active then
		DisablePickupMode_upvw()
	end
	local SOME = Placements_upvr:FindFirstChild(arg1)
	if not SOME then
		var160_upvw()
	else
		local clone = SOME:Clone()
		PrepareModelForPlacement_upvr(clone)
		local HitBox = clone:FindFirstChild("HitBox")
		if not HitBox then return end
		local class_SelectionBox = HitBox:FindFirstChildOfClass("SelectionBox")
		if not class_SelectionBox then return end
		if tbl_upvr_3.Active then
			if tbl_upvr_3.Connection then
				tbl_upvr_3.Connection:Disconnect()
				tbl_upvr_3.Connection = nil
			end
			tbl_upvr_3.GoalCFrame = nil
			tbl_upvr_3.CurrentCFrame = nil
			tbl_upvr_3.CurrentPosition = nil
			tbl_upvr_3.LastBaseGrid = nil
			if tbl_upvr_3.Model then
				tbl_upvr_3.Model:Destroy()
				tbl_upvr_3.Model = nil
				-- KONSTANTWARNING: GOTO [174] #134
			end
		else
			tbl_upvr_3.CurrentRotation = tbl_upvr_3.GoalRotation
			tbl_upvr_3.ValidTapRaycast = nil
			ToggleMobileActionButtons_upvr(true)
			ToggleHazardStripes_upvr(true, Color3.fromRGB(255, 255, 255))
			UnbindInputKeys_upvr()
			for _, v_12 in pairs(var6_upvw.Inventory.Instructions:GetChildren()) do
				local var185
				if v_12.Name ~= Device_upvr.CurrentDevice then
					var185 = false
				else
				end
				v_12.Visible = var185
			end
			if Device_upvr.CurrentDevice == "PC" then
				if var20_upvw then
					var20_upvw:Disconnect()
					var20_upvw = nil
				end
				var20_upvw = UserInputService_upvr.InputBegan:Connect(function(arg1_3, arg2) -- Line 696
					--[[ Upvalues[2]:
						[1]: tbl_upvr_3 (copied, readonly)
						[2]: tbl_upvr_2 (copied, readonly)
					]]
					if arg2 then
					else
						if not tbl_upvr_3.Active then return end
						if arg1_3.KeyCode == Enum.KeyCode.R then
							tbl_upvr_2.Rotate()
						end
						if arg1_3.KeyCode == Enum.KeyCode.Q then
							tbl_upvr_2.Cancel()
						end
						if arg1_3.UserInputType == Enum.UserInputType.MouseButton1 then
							tbl_upvr_2.Place()
						end
					end
				end)
			elseif Device_upvr.CurrentDevice == "Mobile" then
			elseif Device_upvr.CurrentDevice == "Console" then
				BindConsolePlacementKeys_upvr()
			end
			tbl_upvr_3.Active = true
		end
		-- KONSTANTERROR: [0] 1. Error Block 58 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [174] 134. Error Block 34 start (CF ANALYSIS FAILED)
		local RaycastParams_new_result1 = RaycastParams.new()
		RaycastParams_new_result1.FilterDescendantsInstances = {Placements_upvr, Temporary_upvr, var8_upvw.Character}
		RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
		local var189 = clone:GetAttribute("GridHeight") or 1
		CreateScaleTween_upvr(clone)
		tbl_upvr_3.Connection = CreatePlacementUpdateLoop_upvr(clone, class_SelectionBox, var10_upvw.Platform, var189 * 6 / 2, var189, RaycastParams_new_result1)
		tbl_upvr_3.Model = clone
		tbl_upvr_3.Model.Parent = Temporary_upvr
		-- KONSTANTERROR: [174] 134. Error Block 34 end (CF ANALYSIS FAILED)
	end
end
local function EnablePickupMode_upvw() -- Line 991, Named "EnablePickupMode"
	--[[ Upvalues[14]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvr_3 (readonly)
		[3]: var160_upvw (read and write)
		[4]: ToggleHazardStripes_upvr (readonly)
		[5]: Device_upvr (readonly)
		[6]: var6_upvw (read and write)
		[7]: UnbindInputKeys_upvr (readonly)
		[8]: var21_upvw (read and write)
		[9]: UserInputService_upvr (readonly)
		[10]: tbl_upvr_2 (readonly)
		[11]: BindConsolePickupKeys_upvr (readonly)
		[12]: RunService_upvr (readonly)
		[13]: GetHoveredPlacementModel_upvr (readonly)
		[14]: HighlightPlacementModel_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 45 start (CF ANALYSIS FAILED)
	local var194
	if tbl_upvr.Active then
	else
		var194 = tbl_upvr_3
		if var194.Active then
			var160_upvw()
		end
		var194 = true
		ToggleHazardStripes_upvr(var194, Color3.fromRGB(255, 0, 0))
		var194 = Device_upvr
		if var194.CurrentDevice ~= "Mobile" then
			-- KONSTANTWARNING: GOTO [53] #40
		end
		-- KONSTANTERROR: [0] 1. Error Block 45 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [26] 22. Error Block 47 start (CF ANALYSIS FAILED)
		var194 = var6_upvw.Inventory
		var194 = true
		var194.Pickup.Visible = var194
		var194 = var6_upvw
		if tbl_upvr_3.MobilePlacementOption == "Cursor" then
			var194 = true
		else
			var194 = false
		end
		var194.MobilePlacementDot.Visible = var194
		var194 = var6_upvw
		var194 = true
		var194.MobilePlacementOptions.Visible = var194
		UnbindInputKeys_upvr()
		var194 = Device_upvr
		var194 = pairs(var6_upvw.Inventory.Instructions:GetChildren())
		local pairs_result1_8, pairs_result2_3, pairs_result3_10 = pairs(var6_upvw.Inventory.Instructions:GetChildren())
		for _, v_13 in pairs_result1_8, pairs_result2_3, pairs_result3_10 do
			local var198
			if v_13.Name == var194.CurrentDevice.."Pickup" then
				var198 = true
			else
				var198 = false
			end
			v_13.Visible = var198
		end
		pairs_result1_8 = Device_upvr
		if pairs_result1_8.CurrentDevice == "PC" then
			if var21_upvw then
				var21_upvw:Disconnect()
				var21_upvw = nil
			end
			pairs_result1_8 = UserInputService_upvr
			var21_upvw = pairs_result1_8.InputBegan:Connect(function(arg1, arg2) -- Line 721
				--[[ Upvalues[2]:
					[1]: tbl_upvr (copied, readonly)
					[2]: tbl_upvr_2 (copied, readonly)
				]]
				if arg2 then
				else
					if not tbl_upvr.Active then return end
					if arg1.KeyCode == Enum.KeyCode.Q then
						tbl_upvr_2.Cancel()
					end
					if arg1.UserInputType == Enum.UserInputType.MouseButton1 then
						tbl_upvr_2.Pickup()
					end
				end
			end)
		else
			pairs_result1_8 = Device_upvr
			if pairs_result1_8.CurrentDevice == "Mobile" then
			else
				pairs_result1_8 = Device_upvr
				if pairs_result1_8.CurrentDevice == "Console" then
					BindConsolePickupKeys_upvr()
				end
			end
		end
		pairs_result1_8 = RunService_upvr.RenderStepped
		pairs_result1_8 = pairs_result1_8:Connect(function() -- Line 577
			--[[ Upvalues[3]:
				[1]: GetHoveredPlacementModel_upvr (copied, readonly)
				[2]: tbl_upvr (copied, readonly)
				[3]: HighlightPlacementModel_upvr (copied, readonly)
			]]
			local GetHoveredPlacementModel_upvr_result1_3 = GetHoveredPlacementModel_upvr()
			if GetHoveredPlacementModel_upvr_result1_3 ~= tbl_upvr.HighlightedModel then
				if tbl_upvr.HighlightedModel then
					local HighlightedModel_3 = tbl_upvr.HighlightedModel
					if not HighlightedModel_3 then
					else
						local class_Highlight_2 = HighlightedModel_3:FindFirstChildOfClass("Highlight")
						if class_Highlight_2 then
							class_Highlight_2:Destroy()
						end
					end
				end
				if GetHoveredPlacementModel_upvr_result1_3 then
					HighlightPlacementModel_upvr(GetHoveredPlacementModel_upvr_result1_3, true)
				end
				tbl_upvr.HighlightedModel = GetHoveredPlacementModel_upvr_result1_3
			end
		end)
		tbl_upvr.Connection = pairs_result1_8
		pairs_result1_8 = true
		tbl_upvr.Active = pairs_result1_8
		-- KONSTANTERROR: [26] 22. Error Block 47 end (CF ANALYSIS FAILED)
	end
end
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local function SetupMobileInterface_upvr() -- Line 1010, Named "SetupMobileInterface"
	--[[ Upvalues[7]:
		[1]: tbl_upvr_2 (readonly)
		[2]: var6_upvw (read and write)
		[3]: Serg_Button_upvr (readonly)
		[4]: tbl_upvr_3 (readonly)
		[5]: var11_upvw (read and write)
		[6]: udim2_upvr (readonly)
		[7]: UserInputService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pairs_result1_7, pairs_result2_10, pairs_result3_6 = pairs(tbl_upvr_2)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 33. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 33. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 17 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [45.5]
	if not nil then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [45.3]
		if nil == "Pickup" then
			-- KONSTANTWARNING: GOTO [22] #17
		end
	else
	end
	-- KONSTANTERROR: [5] 5. Error Block 17 end (CF ANALYSIS FAILED)
end
local function LoadConsoleInputIntructionIcons_upvr() -- Line 1196, Named "LoadConsoleInputIntructionIcons"
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: var6_upvw (read and write)
	]]
	local any_GetImageForKeyCode_result1_2 = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonA)
	local any_GetImageForKeyCode_result1 = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonB)
	var6_upvw.Inventory.Instructions.Console.Place.Icon.Image = any_GetImageForKeyCode_result1_2
	var6_upvw.Inventory.Instructions.Console.Rotate.Icon.Image = UserInputService_upvr:GetImageForKeyCode(Enum.KeyCode.ButtonX)
	var6_upvw.Inventory.Instructions.Console.Cancel.Icon.Image = any_GetImageForKeyCode_result1
	var6_upvw.Inventory.Instructions.ConsolePickup.Pickup.Icon.Image = any_GetImageForKeyCode_result1_2
	var6_upvw.Inventory.Instructions.ConsolePickup.Cancel.Icon.Image = any_GetImageForKeyCode_result1
end
local function _(arg1) -- Line 1207, Named "ToggleConsoleUI"
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw.Inventory.Hotkeys.ConsoleLeft.Visible = arg1
	var6_upvw.Inventory.Hotkeys.ConsoleRight.Visible = arg1
end
local function OnDeviceChanged_upvr(arg1) -- Line 1212, Named "OnDeviceChanged"
	--[[ Upvalues[11]:
		[1]: tbl_upvr_3 (readonly)
		[2]: UnbindInputKeys_upvr (readonly)
		[3]: Device_upvr (readonly)
		[4]: var6_upvw (read and write)
		[5]: var20_upvw (read and write)
		[6]: UserInputService_upvr (readonly)
		[7]: tbl_upvr_2 (readonly)
		[8]: BindConsolePlacementKeys_upvr (readonly)
		[9]: tbl_upvr (readonly)
		[10]: var21_upvw (read and write)
		[11]: BindConsolePickupKeys_upvr (readonly)
	]]
	if tbl_upvr_3.Active then
		UnbindInputKeys_upvr()
		for i_10, v_8 in pairs(var6_upvw.Inventory.Instructions:GetChildren()) do
			if v_8.Name ~= Device_upvr.CurrentDevice then
			else
			end
			v_8.Visible = false
		end
		if Device_upvr.CurrentDevice == "PC" then
			if var20_upvw then
				var20_upvw:Disconnect()
				var20_upvw = nil
			end
			var20_upvw = UserInputService_upvr.InputBegan:Connect(function(arg1_4, arg2) -- Line 696
				--[[ Upvalues[2]:
					[1]: tbl_upvr_3 (copied, readonly)
					[2]: tbl_upvr_2 (copied, readonly)
				]]
				if arg2 then
				else
					if not tbl_upvr_3.Active then return end
					if arg1_4.KeyCode == Enum.KeyCode.R then
						tbl_upvr_2.Rotate()
					end
					if arg1_4.KeyCode == Enum.KeyCode.Q then
						tbl_upvr_2.Cancel()
					end
					if arg1_4.UserInputType == Enum.UserInputType.MouseButton1 then
						tbl_upvr_2.Place()
					end
				end
			end)
		elseif Device_upvr.CurrentDevice == "Mobile" then
		elseif Device_upvr.CurrentDevice == "Console" then
			BindConsolePlacementKeys_upvr()
			-- KONSTANTWARNING: GOTO [143] #106
		end
	elseif tbl_upvr.Active then
		UnbindInputKeys_upvr()
		i_10 = var6_upvw
		for _, v_14 in pairs(i_10.Inventory.Instructions:GetChildren()) do
			local var225
			if v_14.Name == Device_upvr.CurrentDevice.."Pickup" then
				var225 = true
			else
				var225 = false
			end
			v_14.Visible = var225
		end
		if Device_upvr.CurrentDevice == "PC" then
			if var21_upvw then
				var21_upvw:Disconnect()
				var21_upvw = nil
			end
			var21_upvw = UserInputService_upvr.InputBegan:Connect(function(arg1_5, arg2) -- Line 721
				--[[ Upvalues[2]:
					[1]: tbl_upvr (copied, readonly)
					[2]: tbl_upvr_2 (copied, readonly)
				]]
				if arg2 then
				else
					if not tbl_upvr.Active then return end
					if arg1_5.KeyCode == Enum.KeyCode.Q then
						tbl_upvr_2.Cancel()
					end
					if arg1_5.UserInputType == Enum.UserInputType.MouseButton1 then
						tbl_upvr_2.Pickup()
					end
				end
			end)
		elseif Device_upvr.CurrentDevice == "Mobile" then
		elseif Device_upvr.CurrentDevice == "Console" then
			BindConsolePickupKeys_upvr()
		end
	end
	if arg1 == "Console" then
		var6_upvw.Inventory.Hotkeys.ConsoleLeft.Visible = true
		var6_upvw.Inventory.Hotkeys.ConsoleRight.Visible = true
	else
		var6_upvw.Inventory.Hotkeys.ConsoleLeft.Visible = false
		var6_upvw.Inventory.Hotkeys.ConsoleRight.Visible = false
	end
end
return function(arg1, arg2, arg3) -- Line 1231
	--[[ Upvalues[17]:
		[1]: var6_upvw (read and write)
		[2]: var7_upvw (read and write)
		[3]: var8_upvw (read and write)
		[4]: var9_upvw (read and write)
		[5]: var11_upvw (read and write)
		[6]: var10_upvw (read and write)
		[7]: PlacementUtil_upvr (readonly)
		[8]: ClientSignals_upvr (readonly)
		[9]: DisablePickupMode_upvw (read and write)
		[10]: var160_upvw (read and write)
		[11]: EnablePlacementMode_upvw (read and write)
		[12]: EnablePickupMode_upvw (read and write)
		[13]: Device_upvr (readonly)
		[14]: OnDeviceChanged_upvr (readonly)
		[15]: SetupMobileInterface_upvr (readonly)
		[16]: LoadConsoleInputIntructionIcons_upvr (readonly)
		[17]: OccupyGridState_upvr (readonly)
	]]
	var6_upvw = arg1
	var7_upvw = arg2
	var8_upvw = arg3
	var9_upvw = arg3:GetMouse()
	var11_upvw = workspace.CurrentCamera
	var10_upvw = PlacementUtil_upvr.GetPlotFolder(arg3)
	ClientSignals_upvr.StopAnyMode:Connect(function() -- Line 1239
		--[[ Upvalues[2]:
			[1]: DisablePickupMode_upvw (copied, read and write)
			[2]: var160_upvw (copied, read and write)
		]]
		DisablePickupMode_upvw()
		var160_upvw()
	end)
	ClientSignals_upvr.PlaceMode:Connect(function(arg1_6) -- Line 1244
		--[[ Upvalues[1]:
			[1]: EnablePlacementMode_upvw (copied, read and write)
		]]
		EnablePlacementMode_upvw(arg1_6)
	end)
	ClientSignals_upvr.PickupMode:Connect(function() -- Line 1248
		--[[ Upvalues[1]:
			[1]: EnablePickupMode_upvw (copied, read and write)
		]]
		EnablePickupMode_upvw()
	end)
	Device_upvr.ChangedSignal:Connect(OnDeviceChanged_upvr)
	SetupMobileInterface_upvr()
	LoadConsoleInputIntructionIcons_upvr()
	local Placements = var10_upvw:WaitForChild("Placements")
	for i_11, v_9 in pairs(Placements:GetChildren()) do
		OccupyGridState_upvr(v_9, true)
	end
	Placements.ChildAdded:Connect(function(arg1_7) -- Line 1264
		--[[ Upvalues[1]:
			[1]: OccupyGridState_upvr (copied, readonly)
		]]
		OccupyGridState_upvr(arg1_7, true)
	end)
	Placements.ChildRemoved:Connect(function(arg1_8) -- Line 1268
		--[[ Upvalues[1]:
			[1]: OccupyGridState_upvr (copied, readonly)
		]]
		OccupyGridState_upvr(arg1_8, false)
	end)
	if Device_upvr.CurrentDevice == "Console" then
		i_11 = var6_upvw
		i_11.Inventory.Hotkeys.ConsoleLeft.Visible = true
		i_11 = var6_upvw
		i_11.Inventory.Hotkeys.ConsoleRight.Visible = true
	end
end