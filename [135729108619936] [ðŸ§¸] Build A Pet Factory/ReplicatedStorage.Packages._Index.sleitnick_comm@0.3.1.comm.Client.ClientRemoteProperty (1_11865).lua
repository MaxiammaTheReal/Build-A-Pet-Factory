-- Name: ClientRemoteProperty
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_comm@0.3.1.comm.Client.ClientRemoteProperty
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5488199999999779 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:22
-- Luau version 6, Types version 3
-- Time taken: 0.003200 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local ClientRemoteSignal_upvr = require(script.Parent.ClientRemoteSignal)
local Signal_upvr = require(script.Parent.Parent.Parent.Signal)
function module_upvr.new(arg1, arg2, arg3) -- Line 32
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: ClientRemoteSignal_upvr (readonly)
		[3]: Signal_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr)
	setmetatable_result1_upvr._rs = ClientRemoteSignal_upvr.new(arg1, arg2, arg3)
	setmetatable_result1_upvr._ready = false
	setmetatable_result1_upvr._value = nil
	setmetatable_result1_upvr.Changed = Signal_upvr.new()
	setmetatable_result1_upvr._readyPromise = setmetatable_result1_upvr:OnReady():andThen(function() -- Line 42
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr._readyPromise = nil
		setmetatable_result1_upvr.Changed:Fire(setmetatable_result1_upvr._value)
		setmetatable_result1_upvr._changed = setmetatable_result1_upvr._rs:Connect(function(arg1_2) -- Line 45
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (copied, readonly)
			]]
			if arg1_2 == setmetatable_result1_upvr._value then
			else
				setmetatable_result1_upvr._value = arg1_2
				setmetatable_result1_upvr.Changed:Fire(arg1_2)
			end
		end)
	end)
	setmetatable_result1_upvr._rs:Fire()
	return setmetatable_result1_upvr
end
function module_upvr.Get(arg1) -- Line 65
	return arg1._value
end
local Promise_upvr = require(script.Parent.Parent.Parent.Promise)
function module_upvr.OnReady(arg1) -- Line 88
	--[[ Upvalues[1]:
		[1]: Promise_upvr (readonly)
	]]
	if arg1._ready then
		return Promise_upvr.resolve(arg1._value)
	end
	return Promise_upvr.fromEvent(arg1._rs, function(arg1_3) -- Line 92
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1._value = arg1_3
		arg1._ready = true
		return true
	end):andThen(function() -- Line 96
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1._value
	end)
end
function module_upvr.IsReady(arg1) -- Line 113
	return arg1._ready
end
function module_upvr.Observe(arg1, arg2) -- Line 138
	if arg1._ready then
		task.defer(arg2, arg1._value)
	end
	return arg1.Changed:Connect(arg2)
end
function module_upvr.Destroy(arg1) -- Line 148
	arg1._rs:Destroy()
	if arg1._readyPromise then
		arg1._readyPromise:cancel()
	end
	if arg1._changed then
		arg1._changed:Disconnect()
	end
	arg1.Changed:Destroy()
end
return module_upvr