-- Name: PlayerUtil
-- Path: game:GetService("ReplicatedStorage").Utilities.PlayerUtil
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5575529000016104 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:36
-- Luau version 6, Types version 3
-- Time taken: 0.001458 seconds

return {
	GetSpawnYOffset = function(arg1, arg2, arg3) -- Line 3, Named "GetSpawnYOffset"
		local Y = arg2:GetExtentsSize().Y
		if arg3 then
			Y += arg3.Size.Y / 2
		end
		return Y
	end;
	GetPosition = function(arg1, arg2) -- Line 13, Named "GetPosition"
		if not arg2 then return end
		local HumanoidRootPart = arg2:FindFirstChild("HumanoidRootPart")
		if not HumanoidRootPart then return end
		return HumanoidRootPart.Position
	end;
}