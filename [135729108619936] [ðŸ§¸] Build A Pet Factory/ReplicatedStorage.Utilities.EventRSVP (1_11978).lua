-- Name: EventRSVP
-- Path: game:GetService("ReplicatedStorage").Utilities.EventRSVP
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5702158999993117 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:06
-- Luau version 6, Types version 3
-- Time taken: 0.018833 seconds

local module_3 = {}
local tbl_upvr_2 = {
	ActionText = "Notify me about the event";
	ObjectText = "Event Board";
	MaxActivationDistance = 12;
	HoldDuration = 0;
	KeyboardKeyCode = Enum.KeyCode.E;
}
local SocialService_upvr = game:GetService("SocialService")
local TimerFormat_upvr = require(game:GetService("ReplicatedStorage").Utilities.TimerFormat)
function module_3.Setup(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 20
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: SocialService_upvr (readonly)
		[3]: TimerFormat_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 54 start (CF ANALYSIS FAILED)
	if not arg3:IsA("BasePart") then
		warn("EventRSVPModule:Setup - parentPart must be a BasePart!")
	else
		local var91 = arg5
		if not var91 then
			var91 = tbl_upvr_2
		end
		local ProximityPrompt_upvr_2 = Instance.new("ProximityPrompt")
		ProximityPrompt_upvr_2.Name = "RSVPNotifyPrompt"
		local ActionText_2 = var91.ActionText
		if not ActionText_2 then
			ActionText_2 = tbl_upvr_2.ActionText
		end
		ProximityPrompt_upvr_2.ActionText = ActionText_2
		ActionText_2 = var91.ObjectText
		local var94 = ActionText_2
		if not var94 then
			var94 = tbl_upvr_2.ObjectText
		end
		ProximityPrompt_upvr_2.ObjectText = var94
		var94 = var91.MaxActivationDistance
		local var95 = var94
		if not var95 then
			var95 = tbl_upvr_2.MaxActivationDistance
		end
		ProximityPrompt_upvr_2.MaxActivationDistance = var95
		var95 = var91.HoldDuration
		local var96 = var95
		if not var96 then
			var96 = tbl_upvr_2.HoldDuration
		end
		ProximityPrompt_upvr_2.HoldDuration = var96
		ProximityPrompt_upvr_2.RequiresLineOfSight = false
		ProximityPrompt_upvr_2.Parent = arg3
		for _, v in pairs(arg2:GetDescendants()) do
			if v:IsA("Part") then
				v.Transparency = 0
			elseif v:IsA("SurfaceGui") or v:IsA("BillboardGui") then
				v.Enabled = true
			end
		end
		local pcall_result1_4, pcall_result2_upvr_2 = pcall(function() -- Line 45
			--[[ Upvalues[2]:
				[1]: SocialService_upvr (copied, readonly)
				[2]: arg4 (readonly)
			]]
			return SocialService_upvr:GetEventRsvpStatusAsync(arg4)
		end)
		local var103_upvw
		local function _() -- Line 51, Named "DisablePrompt"
			--[[ Upvalues[3]:
				[1]: ProximityPrompt_upvr_2 (readonly)
				[2]: var103_upvw (read and write)
				[3]: arg2 (readonly)
			]]
			ProximityPrompt_upvr_2.Enabled = false
			if var103_upvw then
				var103_upvw:Disconnect()
				var103_upvw = nil
			end
			local BillboardGuiPart_6 = arg2:FindFirstChild("BillboardGuiPart")
			if BillboardGuiPart_6 then
				local class_BillboardGui_7 = BillboardGuiPart_6:FindFirstChildWhichIsA("BillboardGui")
				if class_BillboardGui_7 then
					class_BillboardGui_7.Enabled = false
				end
			end
		end
		local function _() -- Line 68, Named "GetSaturdaySixPM_CET"
			local os_date_result1_2 = os.date("!*t", os.time() + 3600)
			local wday = os_date_result1_2.wday
			local var108
			if wday == 7 then
				if 18 <= os_date_result1_2.hour then
					var108 = 7
				else
					var108 = 0
				end
			elseif wday < 7 then
				var108 = 7 - wday
			end
			return os.time({
				year = os_date_result1_2.year;
				month = os_date_result1_2.month;
				day = os_date_result1_2.day + var108;
				hour = 18;
				min = 0;
				sec = 0;
				isdst = false;
			}) - 3600
		end
		local function GetNextFridaySixPM_CET_upvr() -- Line 99, Named "GetNextFridaySixPM_CET"
			local os_date_result1_3 = os.date("!*t", os.time() + 3600)
			local wday_4 = os_date_result1_3.wday
			local var112
			if wday_4 == 6 then
				if 18 <= os_date_result1_3.hour then
					var112 = 7
				else
					var112 = 0
				end
			elseif wday_4 < 6 then
				var112 = 6 - wday_4
			else
				var112 = 6
			end
			return os.time({
				year = os_date_result1_3.year;
				month = os_date_result1_3.month;
				day = os_date_result1_3.day + var112;
				hour = 18;
				min = 0;
				sec = 0;
				isdst = false;
			}) - 3600
		end
		local function _(arg1_3) -- Line 136, Named "UpdateCountdown"
			--[[ Upvalues[2]:
				[1]: GetNextFridaySixPM_CET_upvr (readonly)
				[2]: TimerFormat_upvr (copied, readonly)
			]]
			if arg1_3 then
				arg1_3.Text = TimerFormat_upvr(GetNextFridaySixPM_CET_upvr() - os.time(), true)
			end
		end
		if pcall_result1_4 then
			if pcall_result2_upvr_2 == Enum.RsvpStatus.Going then
				ProximityPrompt_upvr_2.Enabled = false
				if var103_upvw then
					var103_upvw:Disconnect()
					var103_upvw = nil
				end
				local BillboardGuiPart_3 = arg2:FindFirstChild("BillboardGuiPart")
				if BillboardGuiPart_3 then
					local class_BillboardGui_6 = BillboardGuiPart_3:FindFirstChildWhichIsA("BillboardGui")
					if class_BillboardGui_6 then
						class_BillboardGui_6.Enabled = false
						-- KONSTANTWARNING: GOTO [149] #114
					end
					-- KONSTANTWARNING: GOTO [149] #114
				end
			else
				var103_upvw = ProximityPrompt_upvr_2.Triggered:Connect(function() -- Line 188
					--[[ Upvalues[7]:
						[1]: SocialService_upvr (copied, readonly)
						[2]: arg4 (readonly)
						[3]: ProximityPrompt_upvr_2 (readonly)
						[4]: var103_upvw (read and write)
						[5]: arg2 (readonly)
						[6]: arg6 (readonly)
						[7]: pcall_result2_upvr_2 (readonly)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					local pcall_result1, _ = pcall(function() -- Line 189
						--[[ Upvalues[2]:
							[1]: SocialService_upvr (copied, readonly)
							[2]: arg4 (copied, readonly)
						]]
						return SocialService_upvr:PromptRsvpToEventAsync(arg4)
					end)
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [11] 9. Error Block 14 start (CF ANALYSIS FAILED)
					ProximityPrompt_upvr_2.Enabled = false
					if var103_upvw then
						var103_upvw:Disconnect()
						var103_upvw = nil
					end
					local BillboardGuiPart_2 = arg2:FindFirstChild("BillboardGuiPart")
					if BillboardGuiPart_2 then
						local class_BillboardGui_3 = BillboardGuiPart_2:FindFirstChildWhichIsA("BillboardGui")
						if class_BillboardGui_3 then
							class_BillboardGui_3.Enabled = false
						end
					end
					arg6()
					do
						return
					end
					-- KONSTANTERROR: [11] 9. Error Block 14 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [40] 33. Error Block 9 start (CF ANALYSIS FAILED)
					warn("Error prompting RSVP: "..tostring(pcall_result2_upvr_2))
					-- KONSTANTERROR: [40] 33. Error Block 9 end (CF ANALYSIS FAILED)
				end)
			end
		end
		-- KONSTANTERROR: [0] 1. Error Block 54 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [149] 114. Error Block 31 start (CF ANALYSIS FAILED)
		;(function() -- Line 147, Named "StartCountdown"
			--[[ Upvalues[3]:
				[1]: arg2 (readonly)
				[2]: GetNextFridaySixPM_CET_upvr (readonly)
				[3]: TimerFormat_upvr (copied, readonly)
			]]
			local Main_2 = arg2:FindFirstChild("Main")
			if not Main_2 then
			else
				local tbl_upvr_3 = {}
				for _, v_2 in pairs(Main_2:GetChildren()) do
					if v_2:IsA("SurfaceGui") then
						local Countdown = v_2:FindFirstChild("Countdown")
						if Countdown then
							local Timer_2 = Countdown:FindFirstChild("Timer")
							if Timer_2 and Timer_2:IsA("TextLabel") then
								table.insert(tbl_upvr_3, Timer_2)
							end
						end
					end
				end
				if #tbl_upvr_3 == 0 then return end
				for _, v_3 in ipairs(tbl_upvr_3) do
					if v_3 then
						v_3.Text = TimerFormat_upvr(GetNextFridaySixPM_CET_upvr() - os.time(), true)
					end
				end
				task.spawn(function() -- Line 171
					--[[ Upvalues[3]:
						[1]: tbl_upvr_3 (readonly)
						[2]: GetNextFridaySixPM_CET_upvr (copied, readonly)
						[3]: TimerFormat_upvr (copied, readonly)
					]]
					while true do
						for _, v_4 in ipairs(tbl_upvr_3) do
							if v_4 and v_4.Parent and v_4 then
								v_4.Text = TimerFormat_upvr(GetNextFridaySixPM_CET_upvr() - os.time(), true)
							end
						end
						task.wait(1)
					end
				end)
			end
		end)()
		-- KONSTANTERROR: [149] 114. Error Block 31 end (CF ANALYSIS FAILED)
	end
end
return module_3