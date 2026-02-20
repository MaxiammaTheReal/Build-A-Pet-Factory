-- Name: Store
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.Store
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5663573000001634 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:46
-- Luau version 6, Types version 3
-- Time taken: 0.007626 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local CodesConfig_upvr = require(ReplicatedStorage.Configs.CodesConfig)
local Events_upvr = ReplicatedStorage.Events
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local TweenService_upvr = game:GetService("TweenService")
local function SetupShop_upvr() -- Line 20, Named "SetupShop"
	--[[ Upvalues[9]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: Serg_Button_upvr (readonly)
		[4]: ClientSignals_upvr (readonly)
		[5]: CodesConfig_upvr (readonly)
		[6]: Events_upvr (readonly)
		[7]: ClientData_upvr (readonly)
		[8]: TimerFormat_upvr (readonly)
		[9]: TweenService_upvr (readonly)
	]]
	local function _(arg1) -- Line 21, Named "OnGamepassBought"
		--[[ Upvalues[1]:
			[1]: var2_upvw (copied, read and write)
		]]
		local SOME_3 = var2_upvw.Menus.Shop.List.Gamepasses:FindFirstChild(arg1)
		if not SOME_3 then
		else
			SOME_3.Owned.Visible = true
			SOME_3.Buy.Visible = false
		end
	end
	for _, v in pairs(var3_upvw.Data.Gamepasses) do
		local SOME = var2_upvw.Menus.Shop.List.Gamepasses:FindFirstChild(v)
		if not SOME then
		else
			SOME.Owned.Visible = true
			SOME.Buy.Visible = false
		end
	end
	local tbl = {
		Frame = var2_upvw.Menus.Shop.List.Codes.Claim;
	}
	local tbl_2 = {}
	local TextBox_upvr = var2_upvw.Menus.Shop.List.Codes.TextHolder.Main.TextBox
	function tbl_2.Click() -- Line 38
		--[[ Upvalues[4]:
			[1]: TextBox_upvr (readonly)
			[2]: ClientSignals_upvr (copied, readonly)
			[3]: CodesConfig_upvr (copied, readonly)
			[4]: Events_upvr (copied, readonly)
		]]
		local Text = TextBox_upvr.Text
		if Text == "" then
			ClientSignals_upvr.Notification:Fire({
				Message = "Enter code first!";
				IsWarning = true;
			})
		else
			local string_lower_result1 = string.lower(Text)
			if not CodesConfig_upvr[string_lower_result1] then
				ClientSignals_upvr.Notification:Fire({
					Message = "Couldn't find code!";
					IsWarning = true;
				})
				TextBox_upvr.Text = ""
				return
			end
			Events_upvr.RedeemCode:FireServer(string_lower_result1)
		end
	end
	tbl.Callbacks = tbl_2
	tbl.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl)
	local tbl_upvr = {
		StarterPack = {
			Timer = 600;
			TextLabels = {
				[var2_upvw.Menus.StarterPack.OfferHeadline] = "OFFER ENDS: %s";
				[var2_upvw.RightButtons.StarterPack.Main.OfferHeadline] = "";
			};
		};
		ProPack = {
			Timer = 1500;
			TextLabels = {
				[var2_upvw.Menus.ProPack.OfferHeadline] = "OFFER ENDS: %s";
				[var2_upvw.RightButtons.ProPack.Main.OfferHeadline] = "";
			};
		};
	}
	local function UpdatePacks_upvr(arg1) -- Line 88, Named "UpdatePacks"
		--[[ Upvalues[6]:
			[1]: tbl_upvr (readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: ClientData_upvr (copied, readonly)
			[4]: ClientSignals_upvr (copied, readonly)
			[5]: TimerFormat_upvr (copied, readonly)
			[6]: TweenService_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local pairs_result1, pairs_result2_2, pairs_result3 = pairs(tbl_upvr)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [119] 90. Error Block 19 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [119] 90. Error Block 19 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 32 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.6]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.7]
		if nil < nil then
			if nil then
			end
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.8]
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.4]
			if nil == nil then
				-- KONSTANTWARNING: GOTO [119] #90
			end
		else
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.9]
			for _, v_2 in nil do
				if v_2 == "" then
				else
				end
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.13]
				local function INLINED() -- Internal function, doesn't exist in bytecode
					-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [119.14]
					return nil
				end
				if not nil or not INLINED() then
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if nil then
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
			end
		end
		-- KONSTANTERROR: [5] 5. Error Block 32 end (CF ANALYSIS FAILED)
	end
	UpdatePacks_upvr(var3_upvw.Data.TimePlayed)
	var3_upvw:OnSet({"TimePlayed"}, function(arg1, arg2) -- Line 126
		--[[ Upvalues[1]:
			[1]: UpdatePacks_upvr (readonly)
		]]
		UpdatePacks_upvr(arg1)
	end)
	var3_upvw:OnChange(function(arg1, arg2, arg3, arg4) -- Line 130
		--[[ Upvalues[1]:
			[1]: var2_upvw (copied, read and write)
		]]
		if arg1 == "TableInsert" and arg2[1] == "Gamepasses" then
			local SOME_2 = var2_upvw.Menus.Shop.List.Gamepasses:FindFirstChild(arg3)
			if not SOME_2 then return end
			SOME_2.Owned.Visible = true
			SOME_2.Buy.Visible = false
		end
	end)
end
local var43_upvw
return function(arg1, arg2, arg3) -- Line 139
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var43_upvw (read and write)
		[4]: SetupShop_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var43_upvw = arg3
	SetupShop_upvr()
end