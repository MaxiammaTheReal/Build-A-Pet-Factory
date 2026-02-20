-- Name: ClientRemoteSignal
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_comm@0.3.1.comm.Client.ClientRemoteSignal
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5466710999990028 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:23
-- Luau version 6, Types version 3
-- Time taken: 0.003245 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local Signal_upvr = require(script.Parent.Parent.Parent.Signal)
function module_upvr.new(arg1, arg2, arg3) -- Line 22
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Signal_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr)
	setmetatable_result1_upvr._re = arg1
	if arg3 and 0 < #arg3 then
		setmetatable_result1_upvr._hasOutbound = true
		setmetatable_result1_upvr._outbound = arg3
	else
		setmetatable_result1_upvr._hasOutbound = false
	end
	if arg2 and 0 < #arg2 then
		setmetatable_result1_upvr._directConnect = false
		setmetatable_result1_upvr._signal = Signal_upvr.new()
		setmetatable_result1_upvr._reConn = setmetatable_result1_upvr._re.OnClientEvent:Connect(function(...) -- Line 38
			--[[ Upvalues[2]:
				[1]: arg2 (readonly)
				[2]: setmetatable_result1_upvr (readonly)
			]]
			local packed_2 = table.pack(...)
			for _, v in ipairs(arg2) do
				if not table.pack(v(packed_2))[1] then return end
				packed_2.n = #packed_2
			end
			setmetatable_result1_upvr._signal:Fire(table.unpack(packed_2, 1, packed_2.n))
		end)
		return setmetatable_result1_upvr
	end
	setmetatable_result1_upvr._directConnect = true
	return setmetatable_result1_upvr
end
function module_upvr._processOutboundMiddleware(arg1, ...) -- Line 55
	local packed = table.pack(...)
	for _, v_2 in ipairs(arg1._outbound) do
		local packed_3 = table.pack(v_2(packed))
		if not packed_3[1] then
			return table.unpack(packed_3, 2, packed_3.n)
		end
		packed.n = #packed
	end
	return table.unpack(packed, 1, packed.n)
end
function module_upvr.Connect(arg1, arg2) -- Line 74
	if arg1._directConnect then
		return arg1._re.OnClientEvent:Connect(arg2)
	end
	return arg1._signal:Connect(arg2)
end
function module_upvr.Fire(arg1, ...) -- Line 90
	if arg1._hasOutbound then
		arg1._re:FireServer(arg1:_processOutboundMiddleware(...))
	else
		arg1._re:FireServer(...)
	end
end
function module_upvr.Destroy(arg1) -- Line 101
	if arg1._signal then
		arg1._signal:Destroy()
	end
end
return module_upvr