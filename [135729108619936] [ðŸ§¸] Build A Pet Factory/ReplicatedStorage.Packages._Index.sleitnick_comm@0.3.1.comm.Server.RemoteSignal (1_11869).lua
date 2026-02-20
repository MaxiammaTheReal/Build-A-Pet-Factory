-- Name: RemoteSignal
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_comm@0.3.1.comm.Server.RemoteSignal
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5512018000008538 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:26
-- Luau version 6, Types version 3
-- Time taken: 0.005147 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local Signal_upvr = require(script.Parent.Parent.Parent.Signal)
function module_upvr.new(arg1, arg2, arg3, arg4) -- Line 25
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Signal_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr)
	setmetatable_result1_upvr._re = Instance.new("RemoteEvent")
	setmetatable_result1_upvr._re.Name = arg2
	setmetatable_result1_upvr._re.Parent = arg1
	if arg4 and 0 < #arg4 then
		setmetatable_result1_upvr._hasOutbound = true
		setmetatable_result1_upvr._outbound = arg4
	else
		setmetatable_result1_upvr._hasOutbound = false
	end
	if arg3 and 0 < #arg3 then
		setmetatable_result1_upvr._directConnect = false
		setmetatable_result1_upvr._signal = Signal_upvr.new()
		setmetatable_result1_upvr._re.OnServerEvent:Connect(function(arg1_2, ...) -- Line 44
			--[[ Upvalues[2]:
				[1]: arg3 (readonly)
				[2]: setmetatable_result1_upvr (readonly)
			]]
			local packed_3 = table.pack(...)
			for _, v in ipairs(arg3) do
				if not table.pack(v(arg1_2, packed_3))[1] then return end
				packed_3.n = #packed_3
			end
			setmetatable_result1_upvr._signal:Fire(arg1_2, table.unpack(packed_3, 1, packed_3.n))
		end)
		return setmetatable_result1_upvr
	end
	setmetatable_result1_upvr._directConnect = true
	return setmetatable_result1_upvr
end
function module_upvr.Connect(arg1, arg2) -- Line 68
	if arg1._directConnect then
		return arg1._re.OnServerEvent:Connect(arg2)
	end
	return arg1._signal:Connect(arg2)
end
function module_upvr._processOutboundMiddleware(arg1, arg2, ...) -- Line 76
	if not arg1._hasOutbound then
		return ...
	end
	local packed_2 = table.pack(...)
	for _, v_2 in ipairs(arg1._outbound) do
		local packed = table.pack(v_2(arg2, packed_2))
		if not packed[1] then
			return table.unpack(packed, 2, packed.n)
		end
		packed_2.n = #packed_2
	end
	return table.unpack(packed_2, 1, packed_2.n)
end
function module_upvr.Fire(arg1, arg2, ...) -- Line 101
	arg1._re:FireClient(arg2, arg1:_processOutboundMiddleware(arg2, ...))
end
function module_upvr.FireAll(arg1, ...) -- Line 114
	arg1._re:FireAllClients(arg1:_processOutboundMiddleware(nil, ...))
end
function module_upvr.FireExcept(arg1, arg2, ...) -- Line 129
	arg1:FireFilter(function(arg1_3) -- Line 130
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		local var19
		if arg1_3 == arg2 then
			var19 = false
		else
			var19 = true
		end
		return var19
	end, ...)
end
local Players_upvr = game:GetService("Players")
function module_upvr.FireFilter(arg1, arg2, ...) -- Line 159
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	for _, v_3 in ipairs(Players_upvr:GetPlayers()) do
		if arg2(v_3, ...) then
			arg1._re:FireClient(v_3, arg1:_processOutboundMiddleware(nil, ...))
		end
	end
end
function module_upvr.FireFor(arg1, arg2, ...) -- Line 183
	for _, v_4 in ipairs(arg2) do
		arg1._re:FireClient(v_4, arg1:_processOutboundMiddleware(nil, ...))
	end
end
function module_upvr.Destroy(arg1) -- Line 192
	arg1._re:Destroy()
	if arg1._signal then
		arg1._signal:Destroy()
	end
end
return module_upvr