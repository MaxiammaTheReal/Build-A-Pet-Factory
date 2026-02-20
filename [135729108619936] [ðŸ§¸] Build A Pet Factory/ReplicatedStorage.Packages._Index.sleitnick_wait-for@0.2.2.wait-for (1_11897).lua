-- Name: wait-for
-- Path: game:GetService("ReplicatedStorage").Packages._Index['sleitnick_wait-for@0'].2.2['wait-for']
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5587270999985776 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:50
-- Luau version 6, Types version 3
-- Time taken: 0.007973 seconds

local Promise_upvr = require(script.Parent.Promise)
local module_2_upvr = {
	Error = {
		Unparented = "Unparented";
		ParentChanged = "ParentChanged";
	};
}
local function PromiseWatchAncestry_upvr(arg1, arg2) -- Line 40, Named "PromiseWatchAncestry"
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	local module = {}
	module[1] = arg2
	module[2] = Promise_upvr.fromEvent(arg1.AncestryChanged, function(arg1_2, arg2_2) -- Line 43
		if arg2_2 ~= nil then
		else
		end
		return true
	end):andThen(function() -- Line 45
		--[[ Upvalues[2]:
			[1]: Promise_upvr (copied, readonly)
			[2]: module_2_upvr (copied, readonly)
		]]
		return Promise_upvr.reject(module_2_upvr.Error.Unparented)
	end)
	return Promise_upvr.race(module)
end
function module_2_upvr.Child(arg1, arg2, arg3) -- Line 61
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: PromiseWatchAncestry_upvr (readonly)
	]]
	local SOME_2 = arg1:FindFirstChild(arg2)
	if SOME_2 then
		return Promise_upvr.resolve(SOME_2)
	end
	return PromiseWatchAncestry_upvr(arg1, Promise_upvr.fromEvent(arg1.ChildAdded, function(arg1_3) -- Line 68
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		local var9
		if arg1_3.Name ~= arg2 then
			var9 = false
		else
			var9 = true
		end
		return var9
	end):timeout(arg3 or 60))
end
function module_2_upvr.Children(arg1, arg2, arg3) -- Line 92
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: Promise_upvr (readonly)
	]]
	local table_create_result1_2 = table.create(#arg2)
	for i, v in ipairs(arg2) do
		table_create_result1_2[i] = module_2_upvr.Child(arg1, v, arg3)
	end
	return Promise_upvr.all(table_create_result1_2):andThen(function(arg1_4) -- Line 97
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: Promise_upvr (copied, readonly)
			[3]: module_2_upvr (copied, readonly)
		]]
		for _, v_2 in ipairs(arg1_4) do
			if v_2.Parent ~= arg1 then
				return Promise_upvr.reject(module_2_upvr.Error.ParentChanged)
			end
		end
		return arg1_4
	end)
end
function module_2_upvr.Descendant(arg1, arg2, arg3) -- Line 120
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: PromiseWatchAncestry_upvr (readonly)
	]]
	local SOME = arg1:FindFirstChild(arg2, true)
	if SOME then
		return Promise_upvr.resolve(SOME)
	end
	return PromiseWatchAncestry_upvr(arg1, Promise_upvr.fromEvent(arg1.DescendantAdded, function(arg1_5) -- Line 127
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		local var26
		if arg1_5.Name ~= arg2 then
			var26 = false
		else
			var26 = true
		end
		return var26
	end):timeout(arg3 or 60))
end
function module_2_upvr.Descendants(arg1, arg2, arg3) -- Line 151
	--[[ Upvalues[2]:
		[1]: module_2_upvr (readonly)
		[2]: Promise_upvr (readonly)
	]]
	local table_create_result1 = table.create(#arg2)
	for i_3, v_3 in ipairs(arg2) do
		table_create_result1[i_3] = module_2_upvr.Descendant(arg1, v_3, arg3)
	end
	return Promise_upvr.all(table_create_result1):andThen(function(arg1_6) -- Line 156
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: Promise_upvr (copied, readonly)
			[3]: module_2_upvr (copied, readonly)
		]]
		for _, v_4 in ipairs(arg1_6) do
			if not v_4:IsDescendantOf(arg1) then
				return Promise_upvr.reject(module_2_upvr.Error.ParentChanged)
			end
		end
		return arg1_6
	end)
end
function module_2_upvr.PrimaryPart(arg1, arg2) -- Line 177
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: PromiseWatchAncestry_upvr (readonly)
	]]
	local PrimaryPart_2_upvw = arg1.PrimaryPart
	if PrimaryPart_2_upvw then
		return Promise_upvr.resolve(PrimaryPart_2_upvw)
	end
	return PromiseWatchAncestry_upvr(arg1, Promise_upvr.fromEvent(arg1:GetPropertyChangedSignal("PrimaryPart"), function() -- Line 184
		--[[ Upvalues[2]:
			[1]: PrimaryPart_2_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		local PrimaryPart_3 = arg1.PrimaryPart
		PrimaryPart_2_upvw = PrimaryPart_3
		if PrimaryPart_2_upvw == nil then
			PrimaryPart_3 = false
		else
			PrimaryPart_3 = true
		end
		return PrimaryPart_3
	end):andThen(function() -- Line 188
		--[[ Upvalues[1]:
			[1]: PrimaryPart_2_upvw (read and write)
		]]
		return PrimaryPart_2_upvw
	end):timeout(arg2 or 60))
end
function module_2_upvr.ObjectValue(arg1, arg2) -- Line 205
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: PromiseWatchAncestry_upvr (readonly)
	]]
	local Value_upvw = arg1.Value
	if Value_upvw then
		return Promise_upvr.resolve(Value_upvw)
	end
	return PromiseWatchAncestry_upvr(arg1, Promise_upvr.fromEvent(arg1.Changed, function(arg1_7) -- Line 212
		--[[ Upvalues[1]:
			[1]: Value_upvw (read and write)
		]]
		Value_upvw = arg1_7
		local var47
		if Value_upvw == nil then
			var47 = false
		else
			var47 = true
		end
		return var47
	end):andThen(function() -- Line 216
		--[[ Upvalues[1]:
			[1]: Value_upvw (read and write)
		]]
		return Value_upvw
	end):timeout(arg2 or 60))
end
local RunService_upvr = game:GetService("RunService")
function module_2_upvr.Custom(arg1, arg2) -- Line 235
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	local arg1_result1_2 = arg1()
	if arg1_result1_2 ~= nil then
		return Promise_upvr.resolve(arg1_result1_2)
	end
	return Promise_upvr.new(function(arg1_8, arg2_3, arg3) -- Line 240
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: RunService_upvr (copied, readonly)
		]]
		local var52_upvw
		var52_upvw = RunService_upvr.Heartbeat:Connect(function() -- Line 245, Named "Update"
			--[[ Upvalues[3]:
				[1]: arg1 (copied, readonly)
				[2]: var52_upvw (read and write)
				[3]: arg1_8 (readonly)
			]]
			local arg1_result1 = arg1()
			if arg1_result1 ~= nil then
				var52_upvw:Disconnect()
				arg1_8(arg1_result1)
			end
		end)
		arg3(function() -- Line 242, Named "OnDone"
			--[[ Upvalues[1]:
				[1]: var52_upvw (read and write)
			]]
			var52_upvw:Disconnect()
		end)
	end):timeout(arg2 or 60)
end
return module_2_upvr