-- Name: Gameplay
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5716785000004165 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:27
-- Luau version 6, Types version 3
-- Time taken: 0.000986 seconds

return {
	Initialize = function(arg1, arg2, arg3, arg4) -- Line 3, Named "Initialize"
		for _, v in pairs(script:GetChildren()) do
			if v:IsA("ModuleScript") then
				require(v)(arg2, arg3, arg4)
			end
		end
	end;
	Start = function(arg1) -- Line 13, Named "Start"
	end;
}