-- Name: signal
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_signal@1.5.0.signal
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.6497761000009632 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:41
-- Luau version 6, Types version 3
-- Time taken: 0.009668 seconds

local var1_upvw
local function acquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 53, Named "acquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	var1_upvw = nil
	arg1(...)
	var1_upvw = var1_upvw
end
local function runEventHandlerInFreeThread_upvr(...) -- Line 64, Named "runEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: acquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	acquireRunnerThreadAndCallEventHandler_upvr(...)
	while true do
		acquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
local tbl_upvr_2 = {}
tbl_upvr_2.__index = tbl_upvr_2
local function new(arg1, arg2) -- Line 90
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local module_2 = {
		Connected = true;
	}
	module_2._signal = arg1
	module_2._fn = arg2
	module_2._next = false
	return setmetatable(module_2, tbl_upvr_2)
end
tbl_upvr_2.new = new
function tbl_upvr_2.Disconnect(arg1) -- Line 99
	local var4
	if not var4 then
	else
		var4 = false
		arg1.Connected = var4
		var4 = arg1._signal._handlerListHead
		if var4 == arg1 then
			var4 = arg1._signal
			var4._handlerListHead = arg1._next
			return
		end
		var4 = arg1._signal._handlerListHead
		while var4 and var4._next ~= arg1 do
			var4 = var4._next
		end
		if var4 then
			var4._next = arg1._next
		end
	end
end
tbl_upvr_2.Destroy = tbl_upvr_2.Disconnect
local tbl = {}
local function __index(arg1, arg2) -- Line 126
	error("Attempt to get Connection::%s (not a valid member)":format(tostring(arg2)), 2)
end
tbl.__index = __index
local function __newindex(arg1, arg2, arg3) -- Line 129
	error("Attempt to set Connection::%s (not a valid member)":format(tostring(arg2)), 2)
end
tbl.__newindex = __newindex
setmetatable(tbl_upvr_2, tbl)
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
function tbl_upvr.new() -- Line 165
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return setmetatable({
		_handlerListHead = false;
		_proxyHandler = nil;
	}, tbl_upvr)
end
function tbl_upvr.Wrap(arg1) -- Line 186
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var8
	if typeof(arg1) ~= "RBXScriptSignal" then
		var8 = false
	else
		var8 = true
	end
	assert(var8, "Argument #1 to Signal.Wrap must be a RBXScriptSignal; got "..typeof(arg1))
	var8 = tbl_upvr
	local any_new_result1_upvr = var8.new()
	var8 = arg1:Connect(function(...) -- Line 192
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:Fire(...)
	end)
	any_new_result1_upvr._proxyHandler = var8
	return any_new_result1_upvr
end
function tbl_upvr.Is(arg1) -- Line 204
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var11 = false
	if type(arg1) == "table" then
		if getmetatable(arg1) ~= tbl_upvr then
			var11 = false
		else
			var11 = true
		end
	end
	return var11
end
function tbl_upvr.Connect(arg1, arg2) -- Line 221
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local any_new_result1 = tbl_upvr_2.new(arg1, arg2)
	if arg1._handlerListHead then
		any_new_result1._next = arg1._handlerListHead
		arg1._handlerListHead = any_new_result1
		return any_new_result1
	end
	arg1._handlerListHead = any_new_result1
	return any_new_result1
end
function tbl_upvr.ConnectOnce(arg1, arg2) -- Line 237
	return arg1:Once(arg2)
end
function tbl_upvr.Once(arg1, arg2) -- Line 256
	local var14_upvw = false
	local var15_upvw
	var15_upvw = arg1:Connect(function(...) -- Line 259
		--[[ Upvalues[3]:
			[1]: var14_upvw (read and write)
			[2]: var15_upvw (read and write)
			[3]: arg2 (readonly)
		]]
		if var14_upvw then
		else
			var14_upvw = true
			var15_upvw:Disconnect()
			arg2(...)
		end
	end)
	return var15_upvw
end
function tbl_upvr.GetConnections(arg1) -- Line 270
	local module = {}
	local _handlerListHead = arg1._handlerListHead
	while _handlerListHead do
		table.insert(module, _handlerListHead)
	end
	return module
end
function tbl_upvr.DisconnectAll(arg1) -- Line 288
	local _handlerListHead_4 = arg1._handlerListHead
	while _handlerListHead_4 do
		_handlerListHead_4.Connected = false
	end
	arg1._handlerListHead = false
end
function tbl_upvr.Fire(arg1, ...) -- Line 312
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: runEventHandlerInFreeThread_upvr (readonly)
	]]
	local _handlerListHead_2 = arg1._handlerListHead
	while _handlerListHead_2 do
		if _handlerListHead_2.Connected then
			if not var1_upvw then
				var1_upvw = coroutine.create(runEventHandlerInFreeThread_upvr)
			end
			task.spawn(var1_upvw, _handlerListHead_2._fn, ...)
		end
	end
end
function tbl_upvr.FireDeferred(arg1, ...) -- Line 333
	local _handlerListHead_3 = arg1._handlerListHead
	while _handlerListHead_3 do
		task.defer(_handlerListHead_3._fn, ...)
	end
end
function tbl_upvr.Wait(arg1) -- Line 356
	local var22_upvw = false
	local var23_upvw
	local current_thread_upvr = coroutine.running()
	var23_upvw = arg1:Connect(function(...) -- Line 360
		--[[ Upvalues[3]:
			[1]: var22_upvw (read and write)
			[2]: var23_upvw (read and write)
			[3]: current_thread_upvr (readonly)
		]]
		if var22_upvw then
		else
			var22_upvw = true
			var23_upvw:Disconnect()
			task.spawn(current_thread_upvr, ...)
		end
	end)
	return coroutine.yield()
end
function tbl_upvr.Destroy(arg1) -- Line 383
	arg1:DisconnectAll()
	local rawget_result1 = rawget(arg1, "_proxyHandler")
	if rawget_result1 then
		rawget_result1:Disconnect()
	end
end
setmetatable(tbl_upvr, {
	__index = function(arg1, arg2) -- Line 393, Named "__index"
		error("Attempt to get Signal::%s (not a valid member)":format(tostring(arg2)), 2)
	end;
	__newindex = function(arg1, arg2, arg3) -- Line 396, Named "__newindex"
		error("Attempt to set Signal::%s (not a valid member)":format(tostring(arg2)), 2)
	end;
})
return {
	new = tbl_upvr.new;
	Wrap = tbl_upvr.Wrap;
	Is = tbl_upvr.Is;
}