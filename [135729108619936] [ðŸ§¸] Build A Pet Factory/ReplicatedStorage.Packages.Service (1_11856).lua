-- Name: Service
-- Path: game:GetService("ReplicatedStorage").Packages.Service
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5500958000011451 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:13
-- Luau version 6, Types version 3
-- Time taken: 0.002319 seconds

local module = {}
local tbl_upvr = {}
local var3_upvw = false
function module.RegisterModule(arg1, arg2, arg3) -- Line 7
	--[[ Upvalues[2]:
		[1]: var3_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	assert(not var3_upvw, "Cannot register modules after initialization")
	tbl_upvr[arg2] = arg3
	return arg3
end
function module.Get(arg1, arg2) -- Line 15
	--[[ Upvalues[2]:
		[1]: var3_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	assert(var3_upvw, "Must initialize before getting modules")
	local var4 = tbl_upvr[arg2]
	assert(var4, `Module '{arg2}' not found`)
	return var4
end
function module.Start(arg1) -- Line 25
	--[[ Upvalues[2]:
		[1]: var3_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	if var3_upvw then
	else
		for _, v in pairs(tbl_upvr) do
			if v.Initialize then
				v:Initialize()
			end
		end
		var3_upvw = true
		print("✅ All modules initialized. Starting modules...")
		for _, v_2 in pairs(tbl_upvr) do
			if v_2.Start then
				v_2:Start()
			end
		end
		print("✅ All modules started successfully!")
	end
end
return module