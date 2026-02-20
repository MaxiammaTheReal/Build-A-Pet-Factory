-- Name: Rewards
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Interface.Rewards
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.26143799999954354 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:45
-- Luau version 6, Types version 3
-- Time taken: 0.011041 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local tbl_upvr = {"GoldenPetEvent", "RainbowPetEvent"}
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local ConfettiPopup_upvr = require(ReplicatedStorage.Utilities.ConfettiPopup)
local ItemConfig_upvr = require(ReplicatedStorage.Configs.ItemConfig)
local RarityGradients_upvr = require(ReplicatedStorage.Configs.RarityGradients)
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Events_upvr = ReplicatedStorage.Events
local Serg_AutoTextScaling_upvr = require(ReplicatedStorage.Utilities.Serg_AutoTextScaling)
local function SetupRewards_upvr() -- Line 25, Named "SetupRewards"
	--[[ Upvalues[14]:
		[1]: var2_upvw (read and write)
		[2]: TimerFormat_upvr (readonly)
		[3]: ClientData_upvr (readonly)
		[4]: ClientSignals_upvr (readonly)
		[5]: PlaySound_upvr (readonly)
		[6]: ConfettiPopup_upvr (readonly)
		[7]: ItemConfig_upvr (readonly)
		[8]: RarityGradients_upvr (readonly)
		[9]: var3_upvw (read and write)
		[10]: AbbreviateNumber_upvr (readonly)
		[11]: Serg_Button_upvr (readonly)
		[12]: Events_upvr (readonly)
		[13]: Serg_AutoTextScaling_upvr (readonly)
		[14]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 46 start (CF ANALYSIS FAILED)
	local function _(arg1, arg2) -- Line 26, Named "UpdateBoost"
		--[[ Upvalues[2]:
			[1]: var2_upvw (copied, read and write)
			[2]: TimerFormat_upvr (copied, readonly)
		]]
		local var24 = arg2 or 0
		local SOME_2 = var2_upvw.BottomLeft.RewardBoosts:FindFirstChild(arg1)
		if not SOME_2 then
		else
			local Timer = SOME_2.List.Timer
			Timer.Text = TimerFormat_upvr(var24)
			if 0 >= var24 then
				Timer = false
			else
				Timer = true
			end
			SOME_2.Visible = Timer
		end
	end
	local function CloseRewards_upvr(arg1) -- Line 36, Named "CloseRewards"
		--[[ Upvalues[3]:
			[1]: ClientData_upvr (copied, readonly)
			[2]: ClientSignals_upvr (copied, readonly)
			[3]: var2_upvw (copied, read and write)
		]]
		if arg1 and ClientData_upvr.CurrentMenu == "Rewards" then
			ClientSignals_upvr.ToggleMenu:Fire("Rewards")
		end
		for _, v in pairs(var2_upvw.Menus.Rewards.List:GetChildren()) do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end
	end
	local function _(arg1, arg2) -- Line 48, Named "DisplayRewards"
		--[[ Upvalues[8]:
			[1]: CloseRewards_upvr (readonly)
			[2]: PlaySound_upvr (copied, readonly)
			[3]: ConfettiPopup_upvr (copied, readonly)
			[4]: var2_upvw (copied, read and write)
			[5]: ItemConfig_upvr (copied, readonly)
			[6]: RarityGradients_upvr (copied, readonly)
			[7]: ClientData_upvr (copied, readonly)
			[8]: ClientSignals_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		CloseRewards_upvr()
		PlaySound_upvr("Victory")
		ConfettiPopup_upvr(var2_upvw)
		local pairs_result1_3, pairs_result2_2, pairs_result3 = pairs(arg1)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [106] 68. Error Block 11 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [106] 68. Error Block 11 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [13] 13. Error Block 20 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.7]
		if nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.5]
			if nil == "Building" then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.9]
				if nil then
					-- KONSTANTWARNING: GOTO [103] #66
				end
				-- KONSTANTWARNING: GOTO [106] #68
			end
			-- KONSTANTWARNING: GOTO [93] #60
		end
		-- KONSTANTERROR: [13] 13. Error Block 20 end (CF ANALYSIS FAILED)
	end
	local function _() -- Line 92, Named "SetupOfflineReward"
		--[[ Upvalues[8]:
			[1]: var3_upvw (copied, read and write)
			[2]: var2_upvw (copied, read and write)
			[3]: AbbreviateNumber_upvr (copied, readonly)
			[4]: Serg_Button_upvr (copied, readonly)
			[5]: Events_upvr (copied, readonly)
			[6]: Serg_AutoTextScaling_upvr (copied, readonly)
			[7]: ClientData_upvr (copied, readonly)
			[8]: ClientSignals_upvr (copied, readonly)
		]]
		local OfflineRewards = var3_upvw.Data.OfflineRewards
		if not OfflineRewards then
		else
			if OfflineRewards.Cash <= 0 or OfflineRewards.Gems <= 0 then return end
			var2_upvw.Menus.OfflineReward.Amounts.Cash.Amount.Text = AbbreviateNumber_upvr(OfflineRewards.Cash, true)
			var2_upvw.Menus.OfflineReward.Amounts.Gems.Amount.Text = AbbreviateNumber_upvr(OfflineRewards.Gems, true)
			local tbl_2 = {
				Frame = var2_upvw.Menus.OfflineReward.Buttons.Claim;
			}
			local tbl_3 = {}
			local function Click() -- Line 106
				--[[ Upvalues[1]:
					[1]: Events_upvr (copied, readonly)
				]]
				Events_upvr.ClaimOfflineReward:FireServer()
			end
			tbl_3.Click = Click
			tbl_2.Callbacks = tbl_3
			tbl_2.EnabledTweens = {
				Click = true;
				Hover = true;
			}
			Serg_Button_upvr.New(tbl_2)
			local tbl_4 = {
				Frame = var2_upvw.Menus.OfflineReward.Buttons.Triple;
			}
			local tbl = {}
			local function Click() -- Line 119
				--[[ Upvalues[1]:
					[1]: Events_upvr (copied, readonly)
				]]
				Events_upvr.ServerProductPrompt:FireServer("TripleOfflineRewards")
			end
			tbl.Click = Click
			tbl_4.Callbacks = tbl
			tbl_4.EnabledTweens = {
				Click = true;
				Hover = true;
			}
			Serg_Button_upvr.New(tbl_4)
			Serg_AutoTextScaling_upvr.Update(var2_upvw.Menus.OfflineReward.Amounts.Cash.Amount, 0.16)
			Serg_AutoTextScaling_upvr.Update(var2_upvw.Menus.OfflineReward.Amounts.Gems.Amount, 0.16)
			if ClientData_upvr.CurrentMenu ~= "OfflineReward" then
				ClientSignals_upvr.ToggleMenu:Fire("OfflineReward")
			end
			local var44_upvw
			var44_upvw = var3_upvw:OnSet({"OfflineRewards"}, function() -- Line 137
				--[[ Upvalues[3]:
					[1]: ClientData_upvr (copied, readonly)
					[2]: ClientSignals_upvr (copied, readonly)
					[3]: var44_upvw (read and write)
				]]
				if ClientData_upvr.CurrentMenu == "OfflineReward" then
					ClientSignals_upvr.ToggleMenu:Fire("OfflineReward")
				end
				var44_upvw:Disconnect()
				var44_upvw = nil
			end)
		end
	end
	Serg_Button_upvr.New({
		Frame = var2_upvw.Menus.Rewards.Ok;
		Callbacks = {
			Click = function() -- Line 150, Named "Click"
				--[[ Upvalues[4]:
					[1]: var2_upvw (copied, read and write)
					[2]: ClientData_upvr (copied, readonly)
					[3]: ClientSignals_upvr (copied, readonly)
					[4]: CloseRewards_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				local GoBackMenu = var2_upvw.Menus.Rewards.Ok:GetAttribute("GoBackMenu")
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [17] 12. Error Block 3 start (CF ANALYSIS FAILED)
				ClientSignals_upvr.ToggleMenu:Fire(GoBackMenu)
				do
					return
				end
				-- KONSTANTERROR: [17] 12. Error Block 3 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [25] 18. Error Block 4 start (CF ANALYSIS FAILED)
				CloseRewards_upvr(true)
				-- KONSTANTERROR: [25] 18. Error Block 4 end (CF ANALYSIS FAILED)
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
	local var52
	for _, v_2 in pairs(var2_upvw.Menus.Rewards.List:GetChildren()) do
		if v_2:IsA("Frame") then
			var52 = Serg_Button_upvr
			local New = var52.New
			var52 = {}
			var52.Frame = v_2
			var52.Callbacks = {}
			var52.EnabledTweens = {
				Click = false;
				Hover = true;
			}
			New(var52)
		end
	end
	local Data_upvr = var3_upvw.Data
	local pairs_result1_2, pairs_result2, pairs_result3_3 = pairs(Data_upvr.RewardBoosts)
	-- KONSTANTERROR: [0] 1. Error Block 46 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [121] 92. Error Block 55 start (CF ANALYSIS FAILED)
	var52.List.Timer.Text = TimerFormat_upvr(New)
	if 0 >= New then
	else
	end
	var52.Visible = true
	var3_upvw:OnSet({"RewardBoosts", Data_upvr}, function(arg1, arg2) -- Line 183
		--[[ Upvalues[3]:
			[1]: Data_upvr (readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: TimerFormat_upvr (copied, readonly)
		]]
		local var62 = arg1 or 0
		local SOME = var2_upvw.BottomLeft.RewardBoosts:FindFirstChild(Data_upvr)
		if not SOME then
		else
			local Timer_2 = SOME.List.Timer
			Timer_2.Text = TimerFormat_upvr(var62)
			if 0 >= var62 then
				Timer_2 = false
			else
				Timer_2 = true
			end
			SOME.Visible = Timer_2
		end
	end)
	-- KONSTANTERROR: [121] 92. Error Block 55 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [108] 82. Error Block 52 start (CF ANALYSIS FAILED)
	if not var52 then
		-- KONSTANTWARNING: GOTO [137] #103
	end
	-- KONSTANTERROR: [108] 82. Error Block 52 end (CF ANALYSIS FAILED)
end
local var66_upvw
return function(arg1, arg2, arg3) -- Line 210
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var66_upvw (read and write)
		[4]: SetupRewards_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var66_upvw = arg3
	SetupRewards_upvr()
end