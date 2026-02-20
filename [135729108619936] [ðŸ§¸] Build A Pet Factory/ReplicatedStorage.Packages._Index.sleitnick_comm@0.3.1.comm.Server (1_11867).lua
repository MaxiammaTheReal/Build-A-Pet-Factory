-- Name: Server
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_comm@0.3.1.comm.Server
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5503206000012142 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:24
-- Luau version 6, Types version 3
-- Time taken: 0.006220 seconds

local Util_upvr = require(script.Parent.Util)
local module_upvr = {
	BindFunction = function(arg1, arg2, arg3, arg4, arg5) -- Line 37, Named "BindFunction"
		--[[ Upvalues[1]:
			[1]: Util_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
		assert(Util_upvr.IsServer, "BindFunction must be called from the server")
		local RemoteFunction = Instance.new("RemoteFunction")
		RemoteFunction.Name = arg2
		local var4 = false
		if type(arg4) == "table" then
			if 0 >= #arg4 then
				var4 = false
			else
				var4 = true
			end
		end
		local var5 = false
		if type(arg5) == "table" then
			if 0 >= #arg5 then
				var5 = false
			else
				var5 = true
			end
		end
		local function ProcessOutbound_upvr(arg1_2, ...) -- Line 50, Named "ProcessOutbound"
			--[[ Upvalues[1]:
				[1]: arg5 (readonly)
			]]
			local packed_3 = table.pack(...)
			for _, v in ipairs(arg5) do
				local packed_5 = table.pack(v(arg1_2, packed_3))
				if not packed_5[1] then
					return table.unpack(packed_5, 2, packed_5.n)
				end
				packed_3.n = #packed_3
			end
			return table.unpack(packed_3, 1, packed_3.n)
		end
		if var4 and var5 then
			local function OnServerInvoke(arg1_3, ...) -- Line 62
				--[[ Upvalues[3]:
					[1]: arg4 (readonly)
					[2]: ProcessOutbound_upvr (readonly)
					[3]: arg3 (readonly)
				]]
				local packed = table.pack(...)
				for _, v_2 in ipairs(arg4) do
					local packed_6 = table.pack(v_2(arg1_3, packed))
					if not packed_6[1] then
						return table.unpack(packed_6, 2, packed_6.n)
					end
					packed.n = #packed
				end
				return ProcessOutbound_upvr(arg1_3, arg3(arg1_3, table.unpack(packed, 1, packed.n)))
			end
			RemoteFunction.OnServerInvoke = OnServerInvoke
			-- KONSTANTWARNING: GOTO [80] #64
		end
		-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [64] 51. Error Block 25 start (CF ANALYSIS FAILED)
		if var4 then
			function RemoteFunction.OnServerInvoke(arg1_4, ...) -- Line 75
				--[[ Upvalues[2]:
					[1]: arg4 (readonly)
					[2]: arg3 (readonly)
				]]
				local packed_2 = table.pack(...)
				for _, v_3 in ipairs(arg4) do
					local packed_4 = table.pack(v_3(arg1_4, packed_2))
					if not packed_4[1] then
						return table.unpack(packed_4, 2, packed_4.n)
					end
					packed_2.n = #packed_2
				end
				return arg3(arg1_4, table.unpack(packed_2, 1, packed_2.n))
			end
			-- KONSTANTWARNING: GOTO [80] #64
		end
		-- KONSTANTERROR: [64] 51. Error Block 25 end (CF ANALYSIS FAILED)
	end;
}
function module_upvr.WrapMethod(arg1, arg2, arg3, arg4, arg5) -- Line 99
	--[[ Upvalues[2]:
		[1]: Util_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local var27 = "WrapMethod must be called from the server"
	assert(Util_upvr.IsServer, var27)
	local var28_upvr = arg2[arg3]
	if type(var28_upvr) ~= "function" then
		var27 = false
	else
		var27 = true
	end
	assert(var27, "Value at index "..arg3.." must be a function; got "..type(var28_upvr))
	return module_upvr.BindFunction(arg1, arg3, function(...) -- Line 109
		--[[ Upvalues[2]:
			[1]: var28_upvr (readonly)
			[2]: arg2 (readonly)
		]]
		return var28_upvr(arg2, ...)
	end, arg4, arg5)
end
local RemoteSignal_upvr = require(script.RemoteSignal)
function module_upvr.CreateSignal(arg1, arg2, arg3, arg4) -- Line 114
	--[[ Upvalues[2]:
		[1]: Util_upvr (readonly)
		[2]: RemoteSignal_upvr (readonly)
	]]
	assert(Util_upvr.IsServer, "CreateSignal must be called from the server")
	return RemoteSignal_upvr.new(Util_upvr.GetCommSubFolder(arg1, "RE"):Expect("Failed to get Comm RE folder"), arg2, arg3, arg4)
end
local RemoteProperty_upvr = require(script.RemoteProperty)
function module_upvr.CreateProperty(arg1, arg2, arg3, arg4, arg5) -- Line 126
	--[[ Upvalues[2]:
		[1]: Util_upvr (readonly)
		[2]: RemoteProperty_upvr (readonly)
	]]
	assert(Util_upvr.IsServer, "CreateProperty must be called from the server")
	return RemoteProperty_upvr.new(Util_upvr.GetCommSubFolder(arg1, "RP"):Expect("Failed to get Comm RP folder"), arg2, arg3, arg4, arg5)
end
return module_upvr