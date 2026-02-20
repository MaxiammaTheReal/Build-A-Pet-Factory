-- Name: Rebirth
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Interface.Rebirth
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2620501000001241 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:42
-- Luau version 6, Types version 3
-- Time taken: 0.009678 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local tbl_4_upvw = {}
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local RebirthMath_upvr = require(ReplicatedStorage.Utilities.RebirthMath)
local function _(arg1, arg2) -- Line 26, Named "cleanNumber"
	return string.format("%."..(arg2 or 2)..'f', arg1):gsub("%.?0+$", "")
end
local RebirthConfig_upvr = require(ReplicatedStorage.Configs.RebirthConfig)
local RarityGradients_upvr = require(ReplicatedStorage.Configs.RarityGradients)
local ItemConfig_upvr = require(ReplicatedStorage.Configs.ItemConfig)
local function UpdateRebirthMenu_upvr(arg1) -- Line 31, Named "UpdateRebirthMenu"
	--[[ Upvalues[7]:
		[1]: var2_upvw (read and write)
		[2]: RebirthConfig_upvr (readonly)
		[3]: RarityGradients_upvr (readonly)
		[4]: ItemConfig_upvr (readonly)
		[5]: tbl_4_upvw (read and write)
		[6]: RebirthMath_upvr (readonly)
		[7]: AbbreviateNumber_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var11 = "Rebirth "..arg1 + 1
	var2_upvw.Menus.Rebirth.RebirthName.Text = var11
	var2_upvw.LeftButtons.ButtonHolder.RebirthProgress.RebirthName.Text = var11
	local pairs_result1, pairs_result2, pairs_result3_2 = pairs(RebirthConfig_upvr.Rarity)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 25. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 25. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 22. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [36.8]
	-- KONSTANTERROR: [32] 22. Error Block 2 end (CF ANALYSIS FAILED)
end
local function UpdateProgressBar_upvr() -- Line 79, Named "UpdateProgressBar"
	--[[ Upvalues[4]:
		[1]: var3_upvw (read and write)
		[2]: RebirthMath_upvr (readonly)
		[3]: var2_upvw (read and write)
		[4]: AbbreviateNumber_upvr (readonly)
	]]
	local any_GetCost_result1 = RebirthMath_upvr:GetCost(var3_upvw.Data.Rebirths)
	if not any_GetCost_result1 then
	else
		local Cash = var3_upvw.Data.Cash
		local var17 = Cash / any_GetCost_result1
		local vector2 = Vector2.new(var17, 0)
		local minimum = math.min(math.floor(var17 * 100), 99)
		if any_GetCost_result1 <= Cash then
			minimum = 100
		end
		var2_upvw.Menus.Rebirth.CashRequirement.Amount.Text = '$'..AbbreviateNumber_upvr(Cash).." / $"..AbbreviateNumber_upvr(any_GetCost_result1)
		var2_upvw.Menus.Rebirth.CashRequirement.Bar.UIGradient.Offset = vector2
		var2_upvw.LeftButtons.ButtonHolder.RebirthProgress.BarBackground.Bar.UIGradient.Offset = vector2
		var2_upvw.LeftButtons.ButtonHolder.RebirthProgress.Percentage.Text = minimum..'%'
	end
end
local function _(arg1) -- Line 100, Named "UnlockGems"
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	local var20
	if 5 > arg1 then
		var20 = false
	else
		var20 = true
	end
	var2_upvw.LeftButtons.ButtonHolder.Gems.Visible = var20
	var2_upvw.LeftButtons.ButtonHolder.Pets.Visible = var20
	var2_upvw.LeftButtons.ButtonHolder.Home.Visible = var20
end
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Events_upvr = ReplicatedStorage.Events
local TweenService_upvr = game:GetService("TweenService")
local function SetupRebirthMenu_upvr() -- Line 108, Named "SetupRebirthMenu"
	--[[ Upvalues[8]:
		[1]: Serg_Button_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: Events_upvr (readonly)
		[4]: var3_upvw (read and write)
		[5]: TweenService_upvr (readonly)
		[6]: tbl_4_upvw (read and write)
		[7]: UpdateRebirthMenu_upvr (readonly)
		[8]: UpdateProgressBar_upvr (readonly)
	]]
	local tbl_2 = {
		Frame = var2_upvw.Menus.Rebirth.Rebirth;
	}
	local tbl = {}
	local function Click() -- Line 112
		--[[ Upvalues[1]:
			[1]: Events_upvr (copied, readonly)
		]]
		Events_upvr.Rebirth:FireServer()
	end
	tbl.Click = Click
	tbl_2.Callbacks = tbl
	tbl_2.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_2)
	local tbl_3 = {
		Frame = var2_upvw.Menus.Rebirth.Skip;
	}
	local tbl_5 = {}
	local function Click() -- Line 125
		--[[ Upvalues[1]:
			[1]: Events_upvr (copied, readonly)
		]]
		Events_upvr.ServerProductPrompt:FireServer("Rebirth")
	end
	tbl_5.Click = Click
	tbl_3.Callbacks = tbl_5
	tbl_3.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_3)
	for i, v in pairs(var2_upvw.Menus.Rebirth.Unlockables:GetChildren()) do
		if v:IsA("Frame") then
			Serg_Button_upvr.New({
				Frame = v;
				Callbacks = {
					Click = function() -- Line 141, Named "Click"
					end;
				};
				EnabledTweens = {
					Click = false;
					Hover = true;
				};
			})
		end
	end
	if not var3_upvw.Data.TutorialStep then
		i = var2_upvw
		i.LeftButtons.ButtonHolder.RebirthProgress.Visible = true
		var2_upvw.LeftButtons.ButtonHolder.Visible = true
		i = var2_upvw
		i = 0
		v = -1.55
		i.LeftButtons.ButtonHolder.RebirthProgress.Position = UDim2.new(0, i, v, 0)
	end
	task.spawn(function() -- Line 159
		--[[ Upvalues[3]:
			[1]: TweenService_upvr (copied, readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: tbl_4_upvw (copied, read and write)
		]]
		while task.wait(1) do
			local var42 = 0 + 1
			if #tbl_4_upvw < var42 then
				var42 = 1
			end
			local var43 = tbl_4_upvw[var42]
			if var43 then
				var2_upvw.Menus.Rebirth.Unlockables.Buildings.Main.Icon.Image = var43
				TweenService_upvr:Create(var2_upvw.Menus.Rebirth.Unlockables.Buildings.Main.Icon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true), {
					Size = UDim2.new(0.8, 0, 0.8, 0);
				}):Play()
			end
		end
	end)
	UpdateRebirthMenu_upvr(var3_upvw.Data.Rebirths)
	local Data_2 = var3_upvw.Data
	if 5 > Data_2.Rebirths then
		Data_2 = false
	else
		Data_2 = true
	end
	var2_upvw.LeftButtons.ButtonHolder.Gems.Visible = Data_2
	var2_upvw.LeftButtons.ButtonHolder.Pets.Visible = Data_2
	var2_upvw.LeftButtons.ButtonHolder.Home.Visible = Data_2
	UpdateProgressBar_upvr()
	var3_upvw:OnSet({"Rebirths"}, function(arg1, arg2) -- Line 188
		--[[ Upvalues[4]:
			[1]: var3_upvw (copied, read and write)
			[2]: var2_upvw (copied, read and write)
			[3]: UpdateRebirthMenu_upvr (copied, readonly)
			[4]: UpdateProgressBar_upvr (copied, readonly)
		]]
		local Data = var3_upvw.Data
		if 5 > Data.Rebirths then
			Data = false
		else
			Data = true
		end
		var2_upvw.LeftButtons.ButtonHolder.Gems.Visible = Data
		var2_upvw.LeftButtons.ButtonHolder.Pets.Visible = Data
		var2_upvw.LeftButtons.ButtonHolder.Home.Visible = Data
		UpdateRebirthMenu_upvr(arg1)
		UpdateProgressBar_upvr()
	end)
	var3_upvw:OnSet({"Cash"}, function(arg1, arg2) -- Line 194
		--[[ Upvalues[1]:
			[1]: UpdateProgressBar_upvr (copied, readonly)
		]]
		UpdateProgressBar_upvr(arg1)
	end)
end
local var51_upvw
return function(arg1, arg2, arg3) -- Line 199
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var51_upvw (read and write)
		[4]: SetupRebirthMenu_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var51_upvw = arg3
	SetupRebirthMenu_upvr()
end