-- Name: ClientComm
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_comm@0.3.1.comm.Client.ClientComm
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5595481000000291 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:21
-- Luau version 6, Types version 3
-- Time taken: 0.004125 seconds

local Parent_upvr = require(script.Parent)
local module_upvr = {}
module_upvr.__index = module_upvr
local Util_upvr = require(script.Parent.Parent.Util)
function module_upvr.new(arg1, arg2, arg3) -- Line 46
	--[[ Upvalues[2]:
		[1]: Util_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local var4 = not Util_upvr.IsServer
	assert(var4, "ClientComm must be constructed from the client")
	local var5
	if typeof(arg1) ~= "Instance" then
		var4 = false
	else
		var4 = true
	end
	var5 = assert
	var5(var4, "Parent must be of type Instance")
	var5 = Util_upvr.DefaultCommFolderName
	if arg3 then
		var5 = arg3
	end
	local var6 = var5
	local SOME = arg1:WaitForChild(var6, Util_upvr.WaitForChildTimeout)
	if SOME == nil then
		var6 = false
	else
		var6 = true
	end
	assert(var6, "Could not find namespace for ClientComm in parent: "..var5)
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._instancesFolder = SOME
	setmetatable_result1._usePromise = arg2
	return setmetatable_result1
end
function module_upvr.GetFunction(arg1, arg2, arg3, arg4) -- Line 95
	--[[ Upvalues[1]:
		[1]: Parent_upvr (readonly)
	]]
	return Parent_upvr.GetFunction(arg1._instancesFolder, arg2, arg1._usePromise, arg3, arg4)
end
function module_upvr.GetSignal(arg1, arg2, arg3, arg4) -- Line 123
	--[[ Upvalues[1]:
		[1]: Parent_upvr (readonly)
	]]
	return Parent_upvr.GetSignal(arg1._instancesFolder, arg2, arg3, arg4)
end
function module_upvr.GetProperty(arg1, arg2, arg3, arg4) -- Line 165
	--[[ Upvalues[1]:
		[1]: Parent_upvr (readonly)
	]]
	return Parent_upvr.GetProperty(arg1._instancesFolder, arg2, arg3, arg4)
end
function module_upvr.BuildObject(arg1, arg2, arg3) -- Line 192
	local RF = arg1._instancesFolder:FindFirstChild("RF")
	local RE = arg1._instancesFolder:FindFirstChild("RE")
	local RP = arg1._instancesFolder:FindFirstChild("RP")
	if RF then
		for _, v in ipairs(RF:GetChildren()) do
			if v:IsA("RemoteFunction") then
				local any_GetFunction_result1_upvr = arg1:GetFunction(v.Name, arg2, arg3)
				;({})[v.Name] = function(arg1_2, ...) -- Line 203
					--[[ Upvalues[1]:
						[1]: any_GetFunction_result1_upvr (readonly)
					]]
					return any_GetFunction_result1_upvr(...)
				end
			end
		end
	end
	if RE then
		for _, v_2 in ipairs(RE:GetChildren()) do
			any_GetFunction_result1_upvr = v_2:IsA("RemoteEvent")
			if any_GetFunction_result1_upvr then
				any_GetFunction_result1_upvr = v_2.Name
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				;({})[any_GetFunction_result1_upvr] = arg1:GetSignal(v_2.Name, arg2, arg3)
			end
		end
	end
	if RP then
		for _, v_3 in ipairs(RP:GetChildren()) do
			any_GetFunction_result1_upvr = v_3:IsA("RemoteEvent")
			if any_GetFunction_result1_upvr then
				any_GetFunction_result1_upvr = v_3.Name
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				;({})[any_GetFunction_result1_upvr] = arg1:GetProperty(v_3.Name, arg2, arg3)
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_upvr.Destroy(arg1) -- Line 230
end
return module_upvr