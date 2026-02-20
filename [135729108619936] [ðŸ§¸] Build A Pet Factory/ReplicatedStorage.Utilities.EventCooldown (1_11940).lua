-- Name: EventCooldown
-- Path: game:GetService("ReplicatedStorage").Utilities.EventCooldown
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5488884000005783 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:30
-- Luau version 6, Types version 3
-- Time taken: 0.001425 seconds

return {
	Players = {};
	Check = function(arg1, arg2, arg3, arg4) -- Line 5, Named "Check"
		-- KONSTANTERROR: [0] 1. Error Block 13 start (CF ANALYSIS FAILED)
		if not arg1.Players[arg2] then
			arg1.Players[arg2] = {}
		end
		local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
		local var3 = arg1.Players[arg2][arg3]
		if var3 then
			if arg4 <= workspace_GetServerTimeNow_result1 - var3 then
				arg1.Players[arg2][arg3] = workspace_GetServerTimeNow_result1
				do
					return true
				end
				-- KONSTANTWARNING: GOTO [35] #27
			end
		else
			arg1.Players[arg2][arg3] = workspace_GetServerTimeNow_result1
			return true
		end
		-- KONSTANTERROR: [0] 1. Error Block 13 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [35] 27. Error Block 8 start (CF ANALYSIS FAILED)
		do
			return false
		end
		-- KONSTANTERROR: [35] 27. Error Block 8 end (CF ANALYSIS FAILED)
	end;
}