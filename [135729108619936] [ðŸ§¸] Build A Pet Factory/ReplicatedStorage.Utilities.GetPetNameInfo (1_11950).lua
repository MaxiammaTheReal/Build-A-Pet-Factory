-- Name: GetPetNameInfo
-- Path: game:GetService("ReplicatedStorage").Utilities.GetPetNameInfo
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5368739999994432 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:40
-- Luau version 6, Types version 3
-- Time taken: 0.000476 seconds

return function(arg1) -- Line 1
	local string_split_result1 = string.split(arg1, ' ')
	return string_split_result1[1], table.concat(string_split_result1, ' ', 2)
end