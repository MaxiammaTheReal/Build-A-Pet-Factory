-- Name: KnitServer
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_knit@1.5.1.knit.KnitServer
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5600577000004705 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:38
-- Luau version 6, Types version 3
-- Time taken: 0.006514 seconds

local tbl_upvr = {
	Middleware = nil;
}
local module_2 = {
	Util = script.Parent.Parent;
}
local newproxy_result1_upvr = newproxy(true)
getmetatable(newproxy_result1_upvr).__tostring = function() -- Line 123
	return "SIGNAL_MARKER"
end
local newproxy_result1_upvr_2 = newproxy(true)
getmetatable(newproxy_result1_upvr_2).__tostring = function() -- Line 128
	return "PROPERTY_MARKER"
end
local Folder_upvr = Instance.new("Folder")
Folder_upvr.Name = "Services"
local Promise_upvr = require(module_2.Util.Promise)
local module_3_upvr = {}
local var10_upvw = false
local var11_upvw = false
local BindableEvent_upvr = Instance.new("BindableEvent")
local function _(arg1) -- Line 144, Named "DoesServiceExist"
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	local var13 = module_3_upvr
	if var13[arg1] == nil then
		var13 = false
	else
		var13 = true
	end
	return var13
end
local ServerComm_upvr = require(module_2.Util.Comm).ServerComm
function module_2.CreateService(arg1) -- Line 178
	--[[ Upvalues[3]:
		[1]: module_3_upvr (readonly)
		[2]: ServerComm_upvr (readonly)
		[3]: Folder_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 34 start (CF ANALYSIS FAILED)
	local var15
	if type(arg1) ~= "table" then
		var15 = false
	else
		var15 = true
	end
	assert(var15, `Service must be a table; got {type(arg1)}`)
	if type(arg1.Name) ~= "string" then
		var15 = false
		-- KONSTANTWARNING: GOTO [34] #26
	end
	-- KONSTANTERROR: [0] 1. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 25. Error Block 38 start (CF ANALYSIS FAILED)
	var15 = true
	assert(var15, `Service.Name must be a string; got {type(arg1.Name)}`)
	if 0 >= #arg1.Name then
		var15 = false
		-- KONSTANTWARNING: GOTO [58] #43
	end
	-- KONSTANTERROR: [33] 25. Error Block 38 end (CF ANALYSIS FAILED)
end
function module_2.AddServices(arg1) -- Line 203
	for _, v in arg1:GetChildren() do
		if v:IsA("ModuleScript") then
			table.insert({}, require(v))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_2.AddServicesDeep(arg1) -- Line 217
	for _, v_2 in arg1:GetDescendants() do
		if v_2:IsA("ModuleScript") then
			table.insert({}, require(v_2))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_2.GetService(arg1) -- Line 231
	--[[ Upvalues[2]:
		[1]: var10_upvw (read and write)
		[2]: module_3_upvr (readonly)
	]]
	local var26 = var10_upvw
	assert(var26, "Cannot call GetService until Knit has been started")
	if type(arg1) ~= "string" then
		var26 = false
	else
		var26 = true
	end
	assert(var26, `ServiceName must be a string; got {type(arg1)}`)
	return assert(module_3_upvr[arg1], `Could not find service "{arg1}"`)
end
function module_2.CreateSignal() -- Line 261
	--[[ Upvalues[1]:
		[1]: newproxy_result1_upvr (readonly)
	]]
	return newproxy_result1_upvr
end
function module_2.CreateProperty(arg1) -- Line 294
	--[[ Upvalues[1]:
		[1]: newproxy_result1_upvr_2 (readonly)
	]]
	local module = {newproxy_result1_upvr_2}
	module[2] = arg1
	return module
end
local var28_upvw
function module_2.Start(arg1) -- Line 332
	--[[ Upvalues[10]:
		[1]: var10_upvw (read and write)
		[2]: Promise_upvr (readonly)
		[3]: var28_upvw (read and write)
		[4]: tbl_upvr (readonly)
		[5]: module_3_upvr (readonly)
		[6]: newproxy_result1_upvr (readonly)
		[7]: newproxy_result1_upvr_2 (readonly)
		[8]: var11_upvw (read and write)
		[9]: BindableEvent_upvr (readonly)
		[10]: Folder_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return Promise_upvr.reject("Knit already started")
	end
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 3 start (CF ANALYSIS FAILED)
	var10_upvw = true
	-- KONSTANTERROR: [8] 8. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_2.OnStart() -- Line 422
	--[[ Upvalues[3]:
		[1]: var11_upvw (read and write)
		[2]: Promise_upvr (readonly)
		[3]: BindableEvent_upvr (readonly)
	]]
	if var11_upvw then
		return Promise_upvr.resolve()
	end
	return Promise_upvr.fromEvent(BindableEvent_upvr.Event)
end
return module_2