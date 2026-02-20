-- Name: TimedEvents
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.TimedEvents
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5750930000012886 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:49
-- Luau version 6, Types version 3
-- Time taken: 0.009291 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local tbl_upvr = {}
local EvolveTypeConfig_upvr = require(ReplicatedStorage.Configs.EvolveTypeConfig)
local var5_upvw
local AnnouncementThemeConfig_upvr = require(ReplicatedStorage.Configs.AnnouncementThemeConfig)
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local function UpdateActiveEvent_upvr(arg1, arg2, arg3) -- Line 22, Named "UpdateActiveEvent"
	--[[ Upvalues[6]:
		[1]: EvolveTypeConfig_upvr (readonly)
		[2]: var5_upvw (read and write)
		[3]: AnnouncementThemeConfig_upvr (readonly)
		[4]: var2_upvw (read and write)
		[5]: tbl_upvr (readonly)
		[6]: TimerFormat_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var28
	if 1 > arg2 then
		var28 = false
	else
		var28 = true
	end
	local var29 = EvolveTypeConfig_upvr[arg1]
	if var28 then
		if var5_upvw ~= arg1 then
			var5_upvw = arg1
			if var29 then
				local var30 = AnnouncementThemeConfig_upvr[arg1 or "Default"]
				if var30 then
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Icon.WhiteIcon.UIGradient.Color = var30
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Icon.Percentage.Text = (arg3 or '?')..'%'
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Icon.Percentage.UIGradient.Color = var30
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Icon.Percentage.UIStroke.UIGradient.Color = var30
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Timer.UIGradient.Color = var30
					var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Timer.UIStroke.UIGradient.Color = var30
				end
			end
		end
	end
	if var29 then
		for _, v in pairs(tbl_upvr) do
			if v:IsA("ParticleEmitter") then
				if not v.Enabled and var28 then
					local PetColor = var29.ColorTheme.PetColor
					if not PetColor then
						PetColor = Color3.fromHSV(0, 0, 1)
					end
					v.Color = ColorSequence.new(PetColor)
				end
				v.Enabled = var28
			end
		end
	end
	if not var28 or not TimerFormat_upvr(arg2) then
	end
	var2_upvw.BottomLeft.RewardBoosts.TimedEvent.List.Timer.Text = ""
	var2_upvw.BottomLeft.RewardBoosts.TimedEvent.Visible = var28
end
local var36_upvw
local var37_upvw
local Events_upvr = ReplicatedStorage.Events
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local EventEffects_upvr = workspace:WaitForChild("Temporary"):WaitForChild("EventEffects")
return function(arg1, arg2, arg3) -- Line 63
	--[[ Upvalues[8]:
		[1]: var2_upvw (read and write)
		[2]: var36_upvw (read and write)
		[3]: var37_upvw (read and write)
		[4]: Events_upvr (readonly)
		[5]: UpdateActiveEvent_upvr (readonly)
		[6]: ClientSignals_upvr (readonly)
		[7]: EventEffects_upvr (readonly)
		[8]: tbl_upvr (readonly)
	]]
	var2_upvw = arg1
	var36_upvw = arg2
	var37_upvw = arg3
	Events_upvr.UpdateActiveEvent.OnClientEvent:Connect(UpdateActiveEvent_upvr)
	Events_upvr.GlobalEventStart.OnClientEvent:Connect(function(arg1_2, arg2_2) -- Line 70
		--[[ Upvalues[1]:
			[1]: ClientSignals_upvr (copied, readonly)
		]]
		ClientSignals_upvr.GlobalAnnouncementNotification:Fire("HAS STARTED!", string.upper(arg1_2.." EVENT"), arg1_2)
		task.wait(3.5)
		ClientSignals_upvr.GlobalAnnouncementNotification:Fire(arg2_2.."% CHANCE FOR "..arg1_2.." PETS!", string.upper(arg1_2.." EVENT"), arg1_2)
	end)
	Events_upvr.GlobalEventEnd.OnClientEvent:Connect(function(arg1_3) -- Line 78
		--[[ Upvalues[1]:
			[1]: ClientSignals_upvr (copied, readonly)
		]]
		ClientSignals_upvr.GlobalAnnouncementNotification:Fire("HAS ENDED!", string.upper(arg1_3.." EVENT"), arg1_3)
	end)
	Events_upvr.NotifyTimedEvent.OnClientEvent:Connect(function(arg1_4, arg2_3) -- Line 82
		--[[ Upvalues[1]:
			[1]: ClientSignals_upvr (copied, readonly)
		]]
		ClientSignals_upvr.GlobalAnnouncementNotification:Fire("STARTING IN "..arg2_3.." MINUTE(S)!", string.upper(arg1_4.." EVENT"), arg1_4)
	end)
	for _, v_2 in pairs(EventEffects_upvr:GetDescendants()) do
		if v_2:IsA("ParticleEmitter") then
			table.insert(tbl_upvr, v_2)
		end
	end
end