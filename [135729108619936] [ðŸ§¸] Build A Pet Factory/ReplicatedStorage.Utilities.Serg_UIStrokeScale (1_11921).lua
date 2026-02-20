-- Name: Serg_UIStrokeScale
-- Path: game:GetService("ReplicatedStorage").Utilities.Serg_UIStrokeScale
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.547076200000447 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:13
-- Luau version 6, Types version 3
-- Time taken: 0.010576 seconds

local vector2_upvr = Vector2.new(1920, 1080)
local Device_upvr = require(game:GetService("ReplicatedStorage").Utilities.Device)
local tbl_upvr_2 = {}
local tbl_upvr = {}
local tbl_upvr_3 = {}
local var6_upvw = false
local CurrentCamera_upvr = workspace.CurrentCamera
local var8_upvw
local var9_upvw
local Magnitude_upvr = vector2_upvr.Magnitude
local function ResizeStrokes_upvr(arg1) -- Line 46, Named "ResizeStrokes"
	--[[ Upvalues[9]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: vector2_upvr (readonly)
		[3]: Device_upvr (readonly)
		[4]: var8_upvw (read and write)
		[5]: var9_upvw (read and write)
		[6]: Magnitude_upvr (readonly)
		[7]: tbl_upvr_2 (readonly)
		[8]: tbl_upvr (readonly)
		[9]: tbl_upvr_3 (readonly)
	]]
	local ViewportSize = CurrentCamera_upvr.ViewportSize
	local Magnitude = Vector2.new(math.min(ViewportSize.X, vector2_upvr.X), ViewportSize.Y).Magnitude
	local var25
	if Device_upvr.CurrentDevice ~= "Mobile" then
		var25 = false
	else
		var25 = true
	end
	if not arg1 and var8_upvw == Magnitude and var9_upvw == var25 then
	else
		var8_upvw = Magnitude
		var9_upvw = var25
		for _, v_7 in pairs(tbl_upvr_2) do
			if v_7.Stroke and v_7.Stroke.Parent then
				v_7.Stroke.Thickness = math.clamp((v_7.BaseThickness) * (Magnitude / Magnitude_upvr * 1.05), 1, v_7.BaseThickness * 2)
			end
		end
		for _, v_8 in pairs(tbl_upvr) do
			if v_8.Frame and v_8.Frame.Parent then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				v_8.Frame.ScrollBarThickness = math.clamp((v_8.BaseThickness) * (Magnitude / Magnitude_upvr * 1.05), 1, v_8.BaseThickness * 2)
			end
		end
		for _, v_9 in pairs(tbl_upvr_3) do
			if v_9.SurfaceGui and v_9.SurfaceGui.Parent then
				if var25 then
					v_9.SurfaceGui.PixelsPerStud = v_9.MobilePixelsPerStud
				else
					v_9.SurfaceGui.PixelsPerStud = v_9.PCPixelsPerStud
				end
			end
		end
	end
end
local function ScheduleUpdate_upvr() -- Line 90, Named "ScheduleUpdate"
	--[[ Upvalues[2]:
		[1]: var6_upvw (read and write)
		[2]: ResizeStrokes_upvr (readonly)
	]]
	if var6_upvw then
	else
		var6_upvw = true
		task.delay(0.5, function() -- Line 95
			--[[ Upvalues[2]:
				[1]: ResizeStrokes_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
			]]
			ResizeStrokes_upvr()
			var6_upvw = false
		end)
	end
end
local module = {}
local CollectionService_upvr = game:GetService("CollectionService")
function module.Init() -- Line 105
	--[[ Upvalues[9]:
		[1]: CollectionService_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_upvr_3 (readonly)
		[5]: var6_upvw (read and write)
		[6]: ResizeStrokes_upvr (readonly)
		[7]: CurrentCamera_upvr (readonly)
		[8]: Device_upvr (readonly)
		[9]: ScheduleUpdate_upvr (readonly)
	]]
	for _, v in pairs(CollectionService_upvr:GetTagged("AutoScaleStroke")) do
		if v:IsA("UIStroke") then
			local OriginalThickness_2 = v:GetAttribute("OriginalThickness")
			if not OriginalThickness_2 then
				OriginalThickness_2 = v.Thickness
			end
			table.insert(tbl_upvr_2, {
				Stroke = v;
				BaseThickness = OriginalThickness_2;
			})
		end
	end
	for _, v_2 in pairs(CollectionService_upvr:GetTagged("ScrollingFrame")) do
		if v_2:IsA("ScrollingFrame") then
			local OriginalScrollBarThickness = v_2:GetAttribute("OriginalScrollBarThickness")
			if not OriginalScrollBarThickness then
				OriginalScrollBarThickness = v_2.ScrollBarThickness
			end
			table.insert(tbl_upvr, {
				Frame = v_2;
				BaseThickness = OriginalScrollBarThickness;
			})
		end
	end
	for _, v_3 in pairs(CollectionService_upvr:GetTagged("AutoPixelSurfaceGui")) do
		if v_3:IsA("SurfaceGui") then
			table.insert(tbl_upvr_3, {
				SurfaceGui = v_3;
				MobilePixelsPerStud = v_3:GetAttribute("MobilePixelsPerStud") or 30;
				PCPixelsPerStud = v_3:GetAttribute("PCPixelsPerStud") or 80;
			})
		end
	end
	CollectionService_upvr:GetInstanceAddedSignal("AutoScaleStroke"):Connect(function(arg1) -- Line 143
		--[[ Upvalues[3]:
			[1]: tbl_upvr_2 (copied, readonly)
			[2]: var6_upvw (copied, read and write)
			[3]: ResizeStrokes_upvr (copied, readonly)
		]]
		if arg1:IsA("UIStroke") then
			local OriginalThickness = arg1:GetAttribute("OriginalThickness")
			if not OriginalThickness then
				OriginalThickness = arg1.Thickness
			end
			local tbl_3 = {}
			tbl_3.Stroke = arg1
			tbl_3.BaseThickness = OriginalThickness
			table.insert(tbl_upvr_2, tbl_3)
			if var6_upvw then return end
			var6_upvw = true
			task.delay(0.5, function() -- Line 95
				--[[ Upvalues[2]:
					[1]: ResizeStrokes_upvr (copied, readonly)
					[2]: var6_upvw (copied, read and write)
				]]
				ResizeStrokes_upvr()
				var6_upvw = false
			end)
		end
	end)
	CollectionService_upvr:GetInstanceAddedSignal("ScrollingFrame"):Connect(function(arg1) -- Line 155
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: var6_upvw (copied, read and write)
			[3]: ResizeStrokes_upvr (copied, readonly)
		]]
		if arg1:IsA("ScrollingFrame") then
			local OriginalScrollBarThickness_2 = arg1:GetAttribute("OriginalScrollBarThickness")
			if not OriginalScrollBarThickness_2 then
				OriginalScrollBarThickness_2 = arg1.ScrollBarThickness
			end
			local tbl_2 = {}
			tbl_2.Frame = arg1
			tbl_2.BaseThickness = OriginalScrollBarThickness_2
			table.insert(tbl_upvr, tbl_2)
			if var6_upvw then return end
			var6_upvw = true
			task.delay(0.5, function() -- Line 95
				--[[ Upvalues[2]:
					[1]: ResizeStrokes_upvr (copied, readonly)
					[2]: var6_upvw (copied, read and write)
				]]
				ResizeStrokes_upvr()
				var6_upvw = false
			end)
		end
	end)
	CollectionService_upvr:GetInstanceAddedSignal("AutoPixelSurfaceGui"):Connect(function(arg1) -- Line 167
		--[[ Upvalues[3]:
			[1]: tbl_upvr_3 (copied, readonly)
			[2]: var6_upvw (copied, read and write)
			[3]: ResizeStrokes_upvr (copied, readonly)
		]]
		if arg1:IsA("SurfaceGui") then
			local tbl = {}
			tbl.SurfaceGui = arg1
			tbl.MobilePixelsPerStud = arg1:GetAttribute("MobilePixelsPerStud") or 30
			tbl.PCPixelsPerStud = arg1:GetAttribute("PCPixelsPerStud") or 80
			table.insert(tbl_upvr_3, tbl)
			if var6_upvw then return end
			var6_upvw = true
			task.delay(0.5, function() -- Line 95
				--[[ Upvalues[2]:
					[1]: ResizeStrokes_upvr (copied, readonly)
					[2]: var6_upvw (copied, read and write)
				]]
				ResizeStrokes_upvr()
				var6_upvw = false
			end)
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("AutoScaleStroke"):Connect(function(arg1) -- Line 182
		--[[ Upvalues[1]:
			[1]: tbl_upvr_2 (copied, readonly)
		]]
		for i_4, v_4 in ipairs(tbl_upvr_2) do
			if v_4.Stroke == arg1 then
				table.remove(tbl_upvr_2, i_4)
				return
			end
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("ScrollingFrame"):Connect(function(arg1) -- Line 192
		--[[ Upvalues[1]:
			[1]: tbl_upvr (copied, readonly)
		]]
		for i_5, v_5 in ipairs(tbl_upvr) do
			if v_5.Frame == arg1 then
				table.remove(tbl_upvr, i_5)
				return
			end
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("AutoPixelSurfaceGui"):Connect(function(arg1) -- Line 202
		--[[ Upvalues[1]:
			[1]: tbl_upvr_3 (copied, readonly)
		]]
		for i_6, v_6 in ipairs(tbl_upvr_3) do
			if v_6.SurfaceGui == arg1 then
				table.remove(tbl_upvr_3, i_6)
				return
			end
		end
	end)
	CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 212
		--[[ Upvalues[2]:
			[1]: var6_upvw (copied, read and write)
			[2]: ResizeStrokes_upvr (copied, readonly)
		]]
		if var6_upvw then
		else
			var6_upvw = true
			task.delay(0.5, function() -- Line 95
				--[[ Upvalues[2]:
					[1]: ResizeStrokes_upvr (copied, readonly)
					[2]: var6_upvw (copied, read and write)
				]]
				ResizeStrokes_upvr()
				var6_upvw = false
			end)
		end
	end)
	Device_upvr.ChangedSignal:Connect(ScheduleUpdate_upvr)
	ResizeStrokes_upvr(true)
end
function module.ManualUpdate() -- Line 221
	--[[ Upvalues[1]:
		[1]: ResizeStrokes_upvr (readonly)
	]]
	ResizeStrokes_upvr(true)
end
return module