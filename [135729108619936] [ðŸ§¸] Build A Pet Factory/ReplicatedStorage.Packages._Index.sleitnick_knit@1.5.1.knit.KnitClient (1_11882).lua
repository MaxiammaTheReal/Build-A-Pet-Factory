-- Name: KnitClient
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_knit@1.5.1.knit.KnitClient
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5596546000015223 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:37
-- Luau version 6, Types version 3
-- Time taken: 0.011940 seconds

local tbl_upvr = {
	ServicePromises = true;
	Middleware = nil;
	PerServiceMiddleware = {};
}
local var2_upvw
local module = {
	Player = game:GetService("Players").LocalPlayer;
	Util = script.Parent.Parent;
}
local Promise_upvr = require(module.Util.Promise)
local ClientComm_upvr = require(module.Util.Comm).ClientComm
local tbl_upvr_2 = {}
local tbl_upvr_3 = {}
local var8_upvw
local var9_upvw = false
local var10_upvw = false
local BindableEvent_upvr = Instance.new("BindableEvent")
local function _(arg1) -- Line 127, Named "DoesControllerExist"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local var12 = tbl_upvr_2
	if var12[arg1] == nil then
		var12 = false
	else
		var12 = true
	end
	return var12
end
local function _() -- Line 132, Named "GetServicesFolder"
	--[[ Upvalues[1]:
		[1]: var8_upvw (read and write)
	]]
	if not var8_upvw then
		var8_upvw = script.Parent:WaitForChild("Services")
	end
	return var8_upvw
end
local function _(arg1) -- Line 139, Named "GetMiddlewareForService"
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	local var13
	if var2_upvw.Middleware ~= nil then
		var13 = var2_upvw.Middleware
	else
		var13 = {}
	end
	local var14 = var2_upvw.PerServiceMiddleware[arg1]
	if var14 ~= nil then
		return var14
	end
	return var13
end
local function _(arg1) -- Line 145, Named "BuildService"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: var2_upvw (read and write)
		[3]: ClientComm_upvr (readonly)
		[4]: tbl_upvr_3 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var15
	if not var8_upvw then
		var15 = script
		var8_upvw = var15.Parent:WaitForChild("Services")
	end
	if var2_upvw.Middleware ~= nil then
		var15 = var2_upvw.Middleware
	else
		var15 = {}
	end
	local var16 = var2_upvw.PerServiceMiddleware[arg1]
	if var16 ~= nil then
		local _ = var16
	else
	end
	var15 = ClientComm_upvr.new(var8_upvw, var2_upvw.ServicePromises, arg1)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local any_BuildObject_result1_2 = var15:BuildObject(var15.Inbound, var15.Outbound)
	tbl_upvr_3[arg1] = any_BuildObject_result1_2
	return any_BuildObject_result1_2
end
function module.CreateController(arg1) -- Line 175
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var19
	if type(arg1) ~= "table" then
		var19 = false
	else
		var19 = true
	end
	assert(var19, `Controller must be a table; got {type(arg1)}`)
	if type(arg1.Name) ~= "string" then
		var19 = false
		-- KONSTANTWARNING: GOTO [34] #26
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 25. Error Block 29 start (CF ANALYSIS FAILED)
	var19 = true
	assert(var19, `Controller.Name must be a string; got {type(arg1.Name)}`)
	if 0 >= #arg1.Name then
		var19 = false
		-- KONSTANTWARNING: GOTO [58] #43
	end
	-- KONSTANTERROR: [33] 25. Error Block 29 end (CF ANALYSIS FAILED)
end
function module.AddControllers(arg1) -- Line 192
	for _, v in arg1:GetChildren() do
		if v:IsA("ModuleScript") then
			table.insert({}, require(v))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module.AddControllersDeep(arg1) -- Line 206
	for _, v_2 in arg1:GetDescendants() do
		if v_2:IsA("ModuleScript") then
			table.insert({}, require(v_2))
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module.GetService(arg1) -- Line 269
	--[[ Upvalues[5]:
		[1]: tbl_upvr_3 (readonly)
		[2]: var9_upvw (read and write)
		[3]: var8_upvw (read and write)
		[4]: var2_upvw (read and write)
		[5]: ClientComm_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var30 = tbl_upvr_3[arg1]
	local var31
	if var30 then
		return var30
	end
	local var32 = var9_upvw
	assert(var32, "Cannot call GetService until Knit has been started")
	var31 = arg1
	if type(var31) ~= "string" then
		var32 = false
	else
		var32 = true
	end
	var31 = `ServiceName must be a string; got {type(arg1)}`
	assert(var32, var31)
	if not var8_upvw then
		var31 = script
		var8_upvw = var31.Parent:WaitForChild("Services")
	end
	if var2_upvw.Middleware ~= nil then
		var31 = var2_upvw.Middleware
	else
		var31 = {}
	end
	local var33 = var2_upvw.PerServiceMiddleware[arg1]
	if var33 ~= nil then
		local _ = var33
	else
	end
	var31 = ClientComm_upvr.new(var8_upvw, var2_upvw.ServicePromises, arg1)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local any_BuildObject_result1 = var31:BuildObject(var31.Inbound, var31.Outbound)
	tbl_upvr_3[arg1] = any_BuildObject_result1
	return any_BuildObject_result1
end
function module.GetController(arg1) -- Line 283
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: var9_upvw (read and write)
	]]
	local var36 = tbl_upvr_2[arg1]
	if var36 then
		return var36
	end
	local var37 = var9_upvw
	assert(var37, "Cannot call GetController until Knit has been started")
	if type(arg1) ~= "string" then
		var37 = false
	else
		var37 = true
	end
	assert(var37, `ControllerName must be a string; got {type(arg1)}`)
	error(`Could not find controller "{arg1}". Check to verify a controller with this name exists.`, 2)
end
function module.Start(arg1) -- Line 310
	--[[ Upvalues[7]:
		[1]: var9_upvw (read and write)
		[2]: Promise_upvr (readonly)
		[3]: var2_upvw (read and write)
		[4]: tbl_upvr (readonly)
		[5]: tbl_upvr_2 (readonly)
		[6]: var10_upvw (read and write)
		[7]: BindableEvent_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return Promise_upvr.reject("Knit already started")
	end
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 3 start (CF ANALYSIS FAILED)
	var9_upvw = true
	-- KONSTANTERROR: [8] 8. Error Block 3 end (CF ANALYSIS FAILED)
end
function module.OnStart() -- Line 382
	--[[ Upvalues[3]:
		[1]: var10_upvw (read and write)
		[2]: Promise_upvr (readonly)
		[3]: BindableEvent_upvr (readonly)
	]]
	if var10_upvw then
		return Promise_upvr.resolve()
	end
	return Promise_upvr.fromEvent(BindableEvent_upvr.Event)
end
return module