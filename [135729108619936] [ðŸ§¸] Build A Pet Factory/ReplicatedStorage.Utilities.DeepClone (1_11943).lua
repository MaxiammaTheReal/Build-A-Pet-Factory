-- Name: DeepClone
-- Path: game:GetService("ReplicatedStorage").Utilities.DeepClone
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5589151999993192 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:33
-- Luau version 6, Types version 3
-- Time taken: 0.001107 seconds

local function deepClone_upvr(arg1) -- Line 1, Named "deepClone"
	--[[ Upvalues[1]:
		[1]: deepClone_upvr (readonly)
	]]
	if type(arg1) ~= "table" then
		return arg1
	end
	local table_create_result1 = table.create(#arg1)
	for i, v in pairs(arg1) do
		local var9
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var9 = deepClone_upvr(v)
			return var9
		end
		if type(v) ~= "table" or not INLINED() then
			var9 = v
		end
		table_create_result1[i] = var9
	end
	return table_create_result1
end
return deepClone_upvr