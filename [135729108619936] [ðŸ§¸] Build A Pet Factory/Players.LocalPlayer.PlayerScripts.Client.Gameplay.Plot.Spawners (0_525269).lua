-- Name: Spawners
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Plot.Spawners
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5666065000004892 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:30
-- Luau version 6, Types version 3
-- Time taken: 0.026252 seconds

local TweenService_upvr = game:GetService("TweenService")
local var2_upvw
local tbl_upvr_2 = {}
local tbl_upvr = {}
local tbl_3 = {
	StrokeColor = Color3.fromRGB(52, 52, 52);
	TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(193, 193, 193))});
	BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 86, 86)), ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 93, 93))});
}
local PlayerUtil_upvr = require(game:GetService("ReplicatedStorage").Utilities.PlayerUtil)
local function DisableBillboardGui_upvr(arg1) -- Line 38, Named "DisableBillboardGui"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if not tbl_upvr[arg1] then
	else
		local Connections = tbl_upvr[arg1].Connections
		if Connections then
			for _, v_4 in pairs(Connections) do
				v_4:Disconnect()
				v_4 = nil
			end
		end
		tbl_upvr[arg1].Part:Destroy()
		tbl_upvr[arg1] = nil
	end
end
local function UpdateBillboardTimerGui_upvr(arg1, arg2, arg3, arg4) -- Line 54, Named "UpdateBillboardTimerGui"
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local var15
	if arg4 then
		TweenService_upvr:Create(arg1.Timer.Bar.UIGradient, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Offset = Vector2.new(-0.5 + arg2 / arg3, 0);
		}):Play()
	else
		var15 = arg1.Timer.Bar
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		var15.UIGradient.Offset = Vector2.new(-0.5 + arg2 / arg3, 0)
	end
	var15 = arg1.Timer
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var15 = arg2..'s'
		return var15
	end
	if 0 >= arg2 or not INLINED() then
		var15 = "Spawning"
	end
	var15.Timer.Text = var15
end
local BillboardGui_upvr = script.BillboardGui
local Temporary_upvr = workspace.Temporary
local function EnableBillboardGui_upvr(arg1, arg2) -- Line 68, Named "EnableBillboardGui"
	--[[ Upvalues[5]:
		[1]: tbl_upvr (readonly)
		[2]: BillboardGui_upvr (readonly)
		[3]: Temporary_upvr (readonly)
		[4]: TweenService_upvr (readonly)
		[5]: UpdateBillboardTimerGui_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var38
	if tbl_upvr[arg1] then
	else
		local Part_2 = Instance.new("Part")
		Part_2.Transparency = 1
		Part_2.CanCollide = false
		Part_2.CanQuery = false
		Part_2.CanTouch = false
		Part_2.Anchored = true
		Part_2.Position = arg2
		local clone_upvr_2 = BillboardGui_upvr:Clone()
		clone_upvr_2.Adornee = Part_2
		clone_upvr_2.Parent = Part_2
		Part_2.Parent = Temporary_upvr.BillboardGuis
		var38 = 0.16
		var38 = {}
		var38.Scale = 1.025
		TweenService_upvr:Create(clone_upvr_2.Timer.UIScale, TweenInfo.new(var38, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), var38):Play()
		var38 = 0.16
		var38 = {}
		var38.Scale = 0.95
		TweenService_upvr:Create(clone_upvr_2.Multipliers.UIScale, TweenInfo.new(var38, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), var38):Play()
		clone_upvr_2.Timer.Visible = true
		clone_upvr_2.Multipliers.Visible = true
		local SpawnInterval_upvw = arg1:GetAttribute("SpawnInterval")
		local function _(arg1_3) -- Line 98, Named "UpdateSpawnerMultiplier"
			--[[ Upvalues[3]:
				[1]: clone_upvr_2 (readonly)
				[2]: SpawnInterval_upvw (read and write)
				[3]: SpawnInterval_upvw (readonly)
			]]
			if arg1_3 and arg1_3 <= 1 then
				local var42
			end
			local var43 = 'x'
			local var44 = var43..(var42 or '?')
			if var42 then
				var43 = true
			else
				var43 = false
			end
			clone_upvr_2.Multipliers.GemsMultiplier.Multiplier.Text = var44
			clone_upvr_2.Multipliers.CashMultiplier.Multiplier.Text = var44
			clone_upvr_2.Multipliers.GemsMultiplier.Visible = var43
			clone_upvr_2.Multipliers.CashMultiplier.Visible = var43
			if not var42 or not (SpawnInterval_upvw * var42) then
			end
			SpawnInterval_upvw = SpawnInterval_upvw
		end
		local LuckMultiplier = arg1:GetAttribute("LuckMultiplier")
		local Multipliers = clone_upvr_2.Multipliers
		var38 = Multipliers.LuckMultiplier
		if 1 < LuckMultiplier then
			Multipliers = true
		else
			Multipliers = false
		end
		var38.Visible = Multipliers
		var38 = clone_upvr_2.Multipliers.LuckMultiplier.Multiplier
		var38.Text = 'x'..(LuckMultiplier or '?')
		var38 = arg1:GetAttribute("SpawnerMultiplier")
		if var38 then
			if var38 <= 1 then
				var38 = nil
			end
		end
		local var47 = 'x'
		local var48 = var47..(var38 or '?')
		if var38 then
			var47 = true
		else
			var47 = false
		end
		clone_upvr_2.Multipliers.GemsMultiplier.Multiplier.Text = var48
		clone_upvr_2.Multipliers.CashMultiplier.Multiplier.Text = var48
		clone_upvr_2.Multipliers.GemsMultiplier.Visible = var47
		clone_upvr_2.Multipliers.CashMultiplier.Visible = var47
		if not var38 or not (SpawnInterval_upvw * var38) then
		end
		local var49_upvw = SpawnInterval_upvw
		var38 = arg1:GetAttribute("TimeLeft")
		clone_upvr_2.Timer.Bar.UIGradient.Offset = Vector2.new(-0.5 + var38 / var49_upvw, 0)
		if 0 >= var38 or not var38..'s' then
		end
		clone_upvr_2.Timer.Timer.Text = "Spawning"
		var38 = tbl_upvr
		var38[arg1] = {
			Part = Part_2;
			BillboardGui = clone_upvr_2;
			Connections = {arg1:GetAttributeChangedSignal("TimeLeft"):Connect(function() -- Line 128
				--[[ Upvalues[4]:
					[1]: UpdateBillboardTimerGui_upvr (copied, readonly)
					[2]: clone_upvr_2 (readonly)
					[3]: arg1 (readonly)
					[4]: var49_upvw (read and write)
				]]
				UpdateBillboardTimerGui_upvr(clone_upvr_2, arg1:GetAttribute("TimeLeft"), var49_upvw, true)
			end), arg1:GetAttributeChangedSignal("SpawnerMultiplier"):Connect(function() -- Line 131
				--[[ Upvalues[4]:
					[1]: arg1 (readonly)
					[2]: clone_upvr_2 (readonly)
					[3]: var49_upvw (read and write)
					[4]: SpawnInterval_upvw (readonly)
				]]
				-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
				local var54
				if var54 and var54 <= 1 then
					var54 = nil
				end
				local var55 = 'x'
				local var56 = var55..(var54 or '?')
				if var54 then
					var55 = true
				else
					var55 = false
				end
				clone_upvr_2.Multipliers.GemsMultiplier.Multiplier.Text = var56
				clone_upvr_2.Multipliers.CashMultiplier.Multiplier.Text = var56
				clone_upvr_2.Multipliers.GemsMultiplier.Visible = var55
				clone_upvr_2.Multipliers.CashMultiplier.Visible = var55
				if not var54 or not (SpawnInterval_upvw * var54) then
				end
				var49_upvw = SpawnInterval_upvw
			end)};
		}
	end
end
local Spawners_upvr = workspace.Replication.Spawners
local function SetupFolders_upvr() -- Line 138, Named "SetupFolders"
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: tbl_upvr_2 (readonly)
		[3]: DisableBillboardGui_upvr (readonly)
		[4]: Spawners_upvr (readonly)
	]]
	local UserId_upvr = var2_upvw.UserId
	for _, v in pairs(Spawners_upvr:GetChildren()) do
		local UserId = v:GetAttribute("UserId")
		if not UserId then
		elseif UserId == UserId_upvr then
			tbl_upvr_2[v] = v:GetAttribute("Position")
		end
	end
	Spawners_upvr.ChildAdded:Connect(function(arg1) -- Line 141, Named "AddFolder"
		--[[ Upvalues[2]:
			[1]: UserId_upvr (readonly)
			[2]: tbl_upvr_2 (copied, readonly)
		]]
		local UserId_2 = arg1:GetAttribute("UserId")
		if not UserId_2 then
		elseif UserId_2 == UserId_upvr then
			tbl_upvr_2[arg1] = arg1:GetAttribute("Position")
		end
	end)
	Spawners_upvr.ChildRemoved:Connect(function(arg1) -- Line 150, Named "RemoveFolder"
		--[[ Upvalues[2]:
			[1]: DisableBillboardGui_upvr (copied, readonly)
			[2]: tbl_upvr_2 (copied, readonly)
		]]
		DisableBillboardGui_upvr(arg1)
		if tbl_upvr_2[arg1] then
			tbl_upvr_2[arg1] = nil
		end
	end)
end
local function _() -- Line 166, Named "UpdateLoop"
	--[[ Upvalues[5]:
		[1]: PlayerUtil_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: tbl_upvr_2 (readonly)
		[4]: EnableBillboardGui_upvr (readonly)
		[5]: DisableBillboardGui_upvr (readonly)
	]]
	task.spawn(function() -- Line 167
		--[[ Upvalues[5]:
			[1]: PlayerUtil_upvr (copied, readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: tbl_upvr_2 (copied, readonly)
			[4]: EnableBillboardGui_upvr (copied, readonly)
			[5]: DisableBillboardGui_upvr (copied, readonly)
		]]
		while task.wait(0.2) do
			local any_GetPosition_result1_2 = PlayerUtil_upvr:GetPosition(var2_upvw.Character)
			if any_GetPosition_result1_2 then
				for i_2, v_2 in pairs(tbl_upvr_2) do
					if (v_2 - any_GetPosition_result1_2).Magnitude <= 22 then
						EnableBillboardGui_upvr(i_2, v_2)
					else
						DisableBillboardGui_upvr(i_2)
					end
				end
			end
		end
	end)
end
local var74_upvw
local var75_upvw
return function(arg1, arg2, arg3) -- Line 185
	--[[ Upvalues[8]:
		[1]: var74_upvw (read and write)
		[2]: var75_upvw (read and write)
		[3]: var2_upvw (read and write)
		[4]: SetupFolders_upvr (readonly)
		[5]: PlayerUtil_upvr (readonly)
		[6]: tbl_upvr_2 (readonly)
		[7]: EnableBillboardGui_upvr (readonly)
		[8]: DisableBillboardGui_upvr (readonly)
	]]
	var74_upvw = arg1
	var75_upvw = arg2
	var2_upvw = arg3
	SetupFolders_upvr()
	task.spawn(function() -- Line 167
		--[[ Upvalues[5]:
			[1]: PlayerUtil_upvr (copied, readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: tbl_upvr_2 (copied, readonly)
			[4]: EnableBillboardGui_upvr (copied, readonly)
			[5]: DisableBillboardGui_upvr (copied, readonly)
		]]
		while task.wait(0.2) do
			local any_GetPosition_result1 = PlayerUtil_upvr:GetPosition(var2_upvw.Character)
			if any_GetPosition_result1 then
				for i_3, v_3 in pairs(tbl_upvr_2) do
					if (v_3 - any_GetPosition_result1).Magnitude <= 22 then
						EnableBillboardGui_upvr(i_3, v_3)
					else
						DisableBillboardGui_upvr(i_3)
					end
				end
			end
		end
	end)
end