-- Name: PerformanceMode
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.PerformanceMode
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5502503000006982 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:47
-- Luau version 6, Types version 3
-- Time taken: 0.003903 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local function _(arg1) -- Line 16, Named "GetSpawnerMultiplier"
	local var6
	if 50 <= arg1 then
		var6 *= 2
	end
	if 100 <= arg1 then
		var6 *= 2
	end
	return var6
end
local const_number_upvw = 1
local function UpdatePerformanceMode_upvr() -- Line 30, Named "UpdatePerformanceMode"
	--[[ Upvalues[5]:
		[1]: var3_upvw (read and write)
		[2]: const_number_upvw (read and write)
		[3]: var2_upvw (read and write)
		[4]: ClientData_upvr (readonly)
		[5]: ClientSignals_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var8 = var3_upvw:GetAttribute("SpawnersPlaced") or 0
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 10. Error Block 3 end (CF ANALYSIS FAILED)
end
local var10_upvw
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
return function(arg1, arg2, arg3) -- Line 57
	--[[ Upvalues[7]:
		[1]: var2_upvw (read and write)
		[2]: var10_upvw (read and write)
		[3]: var3_upvw (read and write)
		[4]: Serg_Button_upvr (readonly)
		[5]: ClientData_upvr (readonly)
		[6]: ClientSignals_upvr (readonly)
		[7]: UpdatePerformanceMode_upvr (readonly)
	]]
	var2_upvw = arg1
	var10_upvw = arg2
	var3_upvw = arg3
	Serg_Button_upvr.New({
		Frame = var2_upvw.Menus.PerformanceMode.Okay;
		Callbacks = {
			Click = function() -- Line 65, Named "Click"
				--[[ Upvalues[2]:
					[1]: ClientData_upvr (copied, readonly)
					[2]: ClientSignals_upvr (copied, readonly)
				]]
				if ClientData_upvr.CurrentMenu == "PerformanceMode" then
					ClientSignals_upvr.ToggleMenu:Fire("PerformanceMode")
				end
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
	arg3:GetAttributeChangedSignal("SpawnersPlaced"):Connect(UpdatePerformanceMode_upvr)
end