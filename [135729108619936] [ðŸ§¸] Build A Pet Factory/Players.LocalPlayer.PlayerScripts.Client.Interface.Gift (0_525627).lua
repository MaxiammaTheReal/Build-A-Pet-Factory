-- Name: Gift
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.Gift
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5499476999993931 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:44
-- Luau version 6, Types version 3
-- Time taken: 0.006310 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local GiftConfig_upvr = require(ReplicatedStorage.Configs.GiftConfig)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Events_upvr = ReplicatedStorage.Events
local function SetupGift_upvr() -- Line 20, Named "SetupGift"
	--[[ Upvalues[7]:
		[1]: GiftConfig_upvr (readonly)
		[2]: ClientSignals_upvr (readonly)
		[3]: var2_upvw (read and write)
		[4]: var3_upvw (read and write)
		[5]: TimerFormat_upvr (readonly)
		[6]: Serg_Button_upvr (readonly)
		[7]: Events_upvr (readonly)
	]]
	local function UpdateGiftTier(arg1, arg2) -- Line 21
		--[[ Upvalues[3]:
			[1]: GiftConfig_upvr (copied, readonly)
			[2]: ClientSignals_upvr (copied, readonly)
			[3]: var2_upvw (copied, read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var9 = GiftConfig_upvr[arg1]
		if not var9 then
		else
			local var10
			if arg1 and arg2 and arg2 <= arg1 and GiftConfig_upvr[arg2] then
				var10 = ClientSignals_upvr
				var10.Notification:Fire({
					Message = "Claimed Tier "..arg2.." gift!";
					IsWarning = false;
				})
				var10 = ClientSignals_upvr
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				var10.DisplayRewards:Fire(GiftConfig_upvr[arg2].Rewards, "Gift")
			end
			var10 = var2_upvw.Menus.Gift.CurrentGift
			var10.CurrentTier.Icon.Image = var9.Icon
			var10 = var2_upvw.Menus.Gift.CurrentGift
			var10 = "Tier "
			var10.CurrentTier.Tier.Text = var10..arg1
			var10 = arg1 + 1
			local var12 = GiftConfig_upvr[var10]
			var10 = var2_upvw.Menus.Gift.CurrentGift
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var10 = var12.Icon
				return var10
			end
			if not var12 or not INLINED() then
				var10 = var9.Icon
			end
			var10.NextTier.Image = var10
			var10 = var2_upvw.Menus.Gift.CurrentGift.NextTier
			if not var12 or not (arg1 + 1) then
			end
			var10 = "Tier "..arg1
			var10.Tier.Text = var10
			var10 = var2_upvw.LeftButtons.ButtonHolder.Gift.Main
			var10 = var9.Icon
			var10.Icon.Image = var10
		end
	end
	local function UpdateGiftTimer(arg1) -- Line 48
		--[[ Upvalues[4]:
			[1]: var2_upvw (copied, read and write)
			[2]: var3_upvw (copied, read and write)
			[3]: GiftConfig_upvr (copied, readonly)
			[4]: TimerFormat_upvr (copied, readonly)
		]]
		local var13
		if var13 <= 0 then
			var2_upvw.Menus.Gift.BarBackground.Timer.Text = "Ready"
			var2_upvw.LeftButtons.ButtonHolder.Gift.Main.Timer.Text = "Ready"
			var2_upvw.Menus.Gift.BarBackground.Bar.UIGradient.Offset = Vector2.new(1, 0)
		else
			local var14 = GiftConfig_upvr[var3_upvw.Data.CurrentGift.Tier]
			if not var14 then return end
			local var15 = var14.Cooldown - var13
			if var14.Cooldown < var13 then
				var13 = var14.Cooldown
			end
			var2_upvw.Menus.Gift.BarBackground.Timer.Text = TimerFormat_upvr(var15).." / "..TimerFormat_upvr(var14.Cooldown)
			var2_upvw.Menus.Gift.BarBackground.Bar.UIGradient.Offset = Vector2.new(var15 / var14.Cooldown, 0)
			var2_upvw.LeftButtons.ButtonHolder.Gift.Main.Timer.Text = TimerFormat_upvr(var13)
		end
	end
	UpdateGiftTimer(var3_upvw.Data.CurrentGift.Timer)
	UpdateGiftTier(var3_upvw.Data.CurrentGift.Tier)
	var3_upvw:OnSet({"CurrentGift", "Timer"}, UpdateGiftTimer)
	var3_upvw:OnSet({"CurrentGift", "Tier"}, UpdateGiftTier)
	Serg_Button_upvr.New({
		Frame = var2_upvw.Menus.Gift.Claim;
		Callbacks = {
			Click = function() -- Line 85, Named "Click"
				--[[ Upvalues[1]:
					[1]: Events_upvr (copied, readonly)
				]]
				Events_upvr.ClaimGift:FireServer()
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
end
local var22_upvw
return function(arg1, arg2, arg3) -- Line 96
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var22_upvw (read and write)
		[4]: SetupGift_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var22_upvw = arg3
	SetupGift_upvr()
end