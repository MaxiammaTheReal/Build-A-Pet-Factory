-- Name: PlaySound
-- Path: game:GetService("ReplicatedStorage").Utilities.PlaySound
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.54263279999941 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:15
-- Luau version 6, Types version 3
-- Time taken: 0.001204 seconds

local tbl_upvr = {}
for _, v in pairs(script:GetChildren()) do
	tbl_upvr[tostring(v)] = v
end
return function(arg1, arg2, arg3) -- Line 11
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var10 = tbl_upvr[arg1]
	if not var10 then
	else
		local clone = var10:Clone()
		if arg2 then
			clone.PlaybackSpeed = arg2
		end
		if arg3 then
			clone.Parent = arg3
		else
			clone.Parent = workspace
		end
		clone:Destroy()
	end
end