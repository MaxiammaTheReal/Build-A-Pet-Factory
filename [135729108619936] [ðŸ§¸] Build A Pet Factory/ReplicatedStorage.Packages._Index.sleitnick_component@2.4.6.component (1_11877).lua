-- Name: component
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_component@2.4.6.component
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.6918832999999722 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:33
-- Luau version 6, Types version 3
-- Time taken: 0.016993 seconds

local RunService_upvr = game:GetService("RunService")
local Symbol = require(script.Parent.Symbol)
local tbl_upvr_2 = {workspace, game:GetService("Players")}
local var2_result1_upvr = Symbol("Ancestors")
local var2_result1_upvr_4 = Symbol("InstancesToComponents")
local var2_result1_upvr_5 = Symbol("LockConstruct")
local Symbol_result1_upvr_2 = Symbol("Components")
local Symbol_result1_upvr = Symbol("Trove")
local var2_result1_upvr_6 = Symbol("Extensions")
local var2_result1_upvr_2 = Symbol("ActiveExtensions")
local var2_result1_upvr_3 = Symbol("Started")
local var12_upvw = 0
local function _() -- Line 192, Named "NextRenderName"
	--[[ Upvalues[1]:
		[1]: var12_upvw (read and write)
	]]
	var12_upvw += 1
	return "ComponentRender"..tostring(var12_upvw)
end
local function InvokeExtensionFn_upvr(arg1, arg2) -- Line 197, Named "InvokeExtensionFn"
	--[[ Upvalues[1]:
		[1]: var2_result1_upvr_2 (readonly)
	]]
	for _, v in ipairs(arg1[var2_result1_upvr_2]) do
		local var18 = v[arg2]
		if type(var18) == "function" then
			var18(arg1)
		end
	end
end
local function ShouldConstruct_upvr(arg1) -- Line 206, Named "ShouldConstruct"
	--[[ Upvalues[1]:
		[1]: var2_result1_upvr_2 (readonly)
	]]
	for _, v_2 in ipairs(arg1[var2_result1_upvr_2]) do
		local ShouldConstruct = v_2.ShouldConstruct
		if type(ShouldConstruct) == "function" and not ShouldConstruct(arg1) then
			return false
		end
	end
	return true
end
local function GetActiveExtensions_upvr(arg1, arg2) -- Line 219, Named "GetActiveExtensions"
	local var32
	for _, v_3 in ipairs(arg2) do
		local ShouldExtend = v_3.ShouldExtend
		local var34 = true
		if type(ShouldExtend) == "function" then
			var34 = not not ShouldExtend(arg1)
		end
		if var34 then
			table.insert(table.create(#arg2), v_3)
		else
		end
	end
	if nil then
		return arg2
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return table.create(#arg2)
end
local module_upvr = {}
module_upvr.__index = module_upvr
local Trove_upvr = require(script.Parent.Trove)
local Signal_upvr = require(script.Parent.Signal)
function module_upvr.new(arg1) -- Line 298
	--[[ Upvalues[11]:
		[1]: var2_result1_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: var2_result1_upvr_4 (readonly)
		[4]: Symbol_result1_upvr_2 (readonly)
		[5]: var2_result1_upvr_5 (readonly)
		[6]: Symbol_result1_upvr (readonly)
		[7]: Trove_upvr (readonly)
		[8]: var2_result1_upvr_6 (readonly)
		[9]: var2_result1_upvr_3 (readonly)
		[10]: Signal_upvr (readonly)
		[11]: module_upvr (readonly)
	]]
	local module = {}
	module.__index = module
	function module.__tostring() -- Line 301
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return "Component<"..arg1.Tag..'>'
	end
	local Ancestors = arg1.Ancestors
	if not Ancestors then
		Ancestors = tbl_upvr_2
	end
	module[var2_result1_upvr] = Ancestors
	module[var2_result1_upvr_4] = {}
	module[Symbol_result1_upvr_2] = {}
	module[var2_result1_upvr_5] = {}
	module[Symbol_result1_upvr] = Trove_upvr.new()
	local Extensions = arg1.Extensions
	if not Extensions then
		Extensions = {}
	end
	module[var2_result1_upvr_6] = Extensions
	module[var2_result1_upvr_3] = false
	module.Tag = arg1.Tag
	module.Started = module[Symbol_result1_upvr]:Construct(Signal_upvr)
	module.Stopped = module[Symbol_result1_upvr]:Construct(Signal_upvr)
	setmetatable(module, module_upvr)
	module:_setup()
	return module
end
function module_upvr._instantiate(arg1, arg2) -- Line 319
	--[[ Upvalues[5]:
		[1]: var2_result1_upvr_2 (readonly)
		[2]: GetActiveExtensions_upvr (readonly)
		[3]: var2_result1_upvr_6 (readonly)
		[4]: ShouldConstruct_upvr (readonly)
		[5]: InvokeExtensionFn_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, arg1)
	setmetatable_result1.Instance = arg2
	setmetatable_result1[var2_result1_upvr_2] = GetActiveExtensions_upvr(setmetatable_result1, arg1[var2_result1_upvr_6])
	if not ShouldConstruct_upvr(setmetatable_result1) then
		return nil
	end
	InvokeExtensionFn_upvr(setmetatable_result1, "Constructing")
	if type(setmetatable_result1.Construct) == "function" then
		setmetatable_result1:Construct()
	end
	InvokeExtensionFn_upvr(setmetatable_result1, "Constructed")
	return setmetatable_result1
end
local any_IsServer_result1_upvr = RunService_upvr:IsServer()
local CollectionService_upvr = game:GetService("CollectionService")
function module_upvr._setup(arg1) -- Line 334
	--[[ Upvalues[11]:
		[1]: InvokeExtensionFn_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: any_IsServer_result1_upvr (readonly)
		[4]: var12_upvw (read and write)
		[5]: var2_result1_upvr_3 (readonly)
		[6]: var2_result1_upvr_5 (readonly)
		[7]: var2_result1_upvr_4 (readonly)
		[8]: Symbol_result1_upvr_2 (readonly)
		[9]: var2_result1_upvr (readonly)
		[10]: Symbol_result1_upvr (readonly)
		[11]: CollectionService_upvr (readonly)
	]]
	local tbl_upvr = {}
	local function StartComponent_upvr(arg1_2) -- Line 337, Named "StartComponent"
		--[[ Upvalues[6]:
			[1]: InvokeExtensionFn_upvr (copied, readonly)
			[2]: RunService_upvr (copied, readonly)
			[3]: any_IsServer_result1_upvr (copied, readonly)
			[4]: var12_upvw (copied, read and write)
			[5]: var2_result1_upvr_3 (copied, readonly)
			[6]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 30 start (CF ANALYSIS FAILED)
		InvokeExtensionFn_upvr(arg1_2, "Starting")
		arg1_2:Start()
		local var50 = InvokeExtensionFn_upvr
		var50(arg1_2, "Started")
		local var51
		if typeof(arg1_2.HeartbeatUpdate) ~= "function" then
			var50 = false
		else
			var50 = true
		end
		var51 = typeof(arg1_2.SteppedUpdate)
		if var51 ~= "function" then
			-- KONSTANTWARNING: GOTO [31] #25
		end
		-- KONSTANTERROR: [0] 1. Error Block 30 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [30] 24. Error Block 37 start (CF ANALYSIS FAILED)
		if typeof(arg1_2.RenderSteppedUpdate) ~= "function" then
			var51 = false
		else
			var51 = true
		end
		if var50 then
			arg1_2._heartbeatUpdate = RunService_upvr.Heartbeat:Connect(function(arg1_3) -- Line 345
				--[[ Upvalues[1]:
					[1]: arg1_2 (readonly)
				]]
				arg1_2:HeartbeatUpdate(arg1_3)
			end)
		end
		if true then
			arg1_2._steppedUpdate = RunService_upvr.Stepped:Connect(function(arg1_4, arg2) -- Line 350
				--[[ Upvalues[1]:
					[1]: arg1_2 (readonly)
				]]
				arg1_2:SteppedUpdate(arg2)
			end)
		end
		if var51 and not any_IsServer_result1_upvr then
			if arg1_2.RenderPriority then
				var12_upvw += 1
				arg1_2._renderName = "ComponentRender"..tostring(var12_upvw)
				RunService_upvr:BindToRenderStep(arg1_2._renderName, arg1_2.RenderPriority, function(arg1_5) -- Line 357
					--[[ Upvalues[1]:
						[1]: arg1_2 (readonly)
					]]
					arg1_2:RenderSteppedUpdate(arg1_5)
				end)
			else
				arg1_2._renderSteppedUpdate = RunService_upvr.RenderStepped:Connect(function(arg1_6) -- Line 361
					--[[ Upvalues[1]:
						[1]: arg1_2 (readonly)
					]]
					arg1_2:RenderSteppedUpdate(arg1_6)
				end)
			end
		end
		arg1_2[var2_result1_upvr_3] = true
		arg1.Started:Fire(arg1_2)
		-- KONSTANTERROR: [30] 24. Error Block 37 end (CF ANALYSIS FAILED)
	end
	local function StopComponent_upvr(arg1_7) -- Line 370, Named "StopComponent"
		--[[ Upvalues[3]:
			[1]: RunService_upvr (copied, readonly)
			[2]: InvokeExtensionFn_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		if arg1_7._heartbeatUpdate then
			arg1_7._heartbeatUpdate:Disconnect()
		end
		if arg1_7._steppedUpdate then
			arg1_7._steppedUpdate:Disconnect()
		end
		if arg1_7._renderSteppedUpdate then
			arg1_7._renderSteppedUpdate:Disconnect()
		elseif arg1_7._renderName then
			RunService_upvr:UnbindFromRenderStep(arg1_7._renderName)
		end
		InvokeExtensionFn_upvr(arg1_7, "Stopping")
		arg1_7:Stop()
		InvokeExtensionFn_upvr(arg1_7, "Stopped")
		arg1.Stopped:Fire(arg1_7)
	end
	local function _(arg1_8, arg2) -- Line 388, Named "SafeConstruct"
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var2_result1_upvr_5 (copied, readonly)
		]]
		if arg1[var2_result1_upvr_5][arg1_8] ~= arg2 then
			return nil
		end
		if arg1[var2_result1_upvr_5][arg1_8] ~= arg2 then
			return nil
		end
		return arg1:_instantiate(arg1_8)
	end
	local function _(arg1_9) -- Line 399, Named "TryConstructComponent"
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: var2_result1_upvr_4 (copied, readonly)
			[3]: var2_result1_upvr_5 (copied, readonly)
			[4]: Symbol_result1_upvr_2 (copied, readonly)
			[5]: StartComponent_upvr (readonly)
		]]
		if arg1[var2_result1_upvr_4][arg1_9] then
		else
			local var56_upvw = (arg1[var2_result1_upvr_5][arg1_9] or 0) + 1
			arg1[var2_result1_upvr_5][arg1_9] = var56_upvw
			task.defer(function() -- Line 406
				--[[ Upvalues[7]:
					[1]: arg1_9 (readonly)
					[2]: var56_upvw (read and write)
					[3]: arg1 (copied, readonly)
					[4]: var2_result1_upvr_5 (copied, readonly)
					[5]: var2_result1_upvr_4 (copied, readonly)
					[6]: Symbol_result1_upvr_2 (copied, readonly)
					[7]: StartComponent_upvr (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 14 start (CF ANALYSIS FAILED)
				local var58 = arg1_9
				local var59 = var56_upvw
				local var60_upvr
				if arg1[var2_result1_upvr_5][var58] ~= var59 then
					var60_upvr = nil
					-- KONSTANTWARNING: GOTO [24] #22
				end
				-- KONSTANTERROR: [0] 1. Error Block 14 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [10] 10. Error Block 15 start (CF ANALYSIS FAILED)
				if arg1[var2_result1_upvr_5][var58] ~= var59 then
					var60_upvr = nil
				else
					var60_upvr = arg1:_instantiate(var58)
				end
				if not var60_upvr then
				else
					arg1[var2_result1_upvr_4][arg1_9] = var60_upvr
					table.insert(arg1[Symbol_result1_upvr_2], var60_upvr)
					task.defer(function() -- Line 413
						--[[ Upvalues[5]:
							[1]: arg1 (copied, readonly)
							[2]: var2_result1_upvr_4 (copied, readonly)
							[3]: arg1_9 (copied, readonly)
							[4]: var60_upvr (readonly)
							[5]: StartComponent_upvr (copied, readonly)
						]]
						if arg1[var2_result1_upvr_4][arg1_9] == var60_upvr then
							StartComponent_upvr(var60_upvr)
						end
					end)
					-- KONSTANTERROR: [10] 10. Error Block 15 end (CF ANALYSIS FAILED)
				end
			end)
		end
	end
	local function TryDeconstructComponent_upvr(arg1_10) -- Line 421, Named "TryDeconstructComponent"
		--[[ Upvalues[6]:
			[1]: arg1 (readonly)
			[2]: var2_result1_upvr_4 (copied, readonly)
			[3]: var2_result1_upvr_5 (copied, readonly)
			[4]: Symbol_result1_upvr_2 (copied, readonly)
			[5]: var2_result1_upvr_3 (copied, readonly)
			[6]: StopComponent_upvr (readonly)
		]]
		local var62 = arg1[var2_result1_upvr_4][arg1_10]
		if not var62 then
		else
			arg1[var2_result1_upvr_4][arg1_10] = nil
			arg1[var2_result1_upvr_5][arg1_10] = nil
			local var63 = arg1[Symbol_result1_upvr_2]
			local table_find_result1 = table.find(var63, var62)
			if table_find_result1 then
				local len = #var63
				var63[table_find_result1] = var63[len]
				var63[len] = nil
			end
			if var62[var2_result1_upvr_3] then
				task.spawn(StopComponent_upvr, var62)
			end
		end
	end
	local function StartWatchingInstance_upvr(arg1_11) -- Line 440, Named "StartWatchingInstance"
		--[[ Upvalues[9]:
			[1]: tbl_upvr (readonly)
			[2]: arg1 (readonly)
			[3]: var2_result1_upvr (copied, readonly)
			[4]: Symbol_result1_upvr (copied, readonly)
			[5]: var2_result1_upvr_4 (copied, readonly)
			[6]: var2_result1_upvr_5 (copied, readonly)
			[7]: Symbol_result1_upvr_2 (copied, readonly)
			[8]: StartComponent_upvr (readonly)
			[9]: TryDeconstructComponent_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 15 start (CF ANALYSIS FAILED)
		if tbl_upvr[arg1_11] then return end
		local function _() -- Line 444, Named "IsInAncestorList"
			--[[ Upvalues[3]:
				[1]: arg1 (copied, readonly)
				[2]: var2_result1_upvr (copied, readonly)
				[3]: arg1_11 (readonly)
			]]
			for _, v_4 in ipairs(arg1[var2_result1_upvr]) do
				if arg1_11:IsDescendantOf(v_4) then
					return true
				end
			end
			return false
		end
		tbl_upvr[arg1_11] = arg1[Symbol_result1_upvr]:Connect(arg1_11.AncestryChanged, function(arg1_12, arg2) -- Line 452
			--[[ Upvalues[8]:
				[1]: arg1 (copied, readonly)
				[2]: var2_result1_upvr (copied, readonly)
				[3]: arg1_11 (readonly)
				[4]: var2_result1_upvr_4 (copied, readonly)
				[5]: var2_result1_upvr_5 (copied, readonly)
				[6]: Symbol_result1_upvr_2 (copied, readonly)
				[7]: StartComponent_upvr (copied, readonly)
				[8]: TryDeconstructComponent_upvr (copied, readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [18] 16. Error Block 16 start (CF ANALYSIS FAILED)
			if false then
				local var72_upvr = arg1_11
				if arg1[var2_result1_upvr_4][var72_upvr] then
				else
					local var73_upvw = (arg1[var2_result1_upvr_5][var72_upvr] or 0) + 1
					arg1[var2_result1_upvr_5][var72_upvr] = var73_upvw
					task.defer(function() -- Line 406
						--[[ Upvalues[7]:
							[1]: var72_upvr (readonly)
							[2]: var73_upvw (read and write)
							[3]: arg1 (copied, readonly)
							[4]: var2_result1_upvr_5 (copied, readonly)
							[5]: var2_result1_upvr_4 (copied, readonly)
							[6]: Symbol_result1_upvr_2 (copied, readonly)
							[7]: StartComponent_upvr (copied, readonly)
						]]
						-- KONSTANTERROR: [0] 1. Error Block 14 start (CF ANALYSIS FAILED)
						local var75 = var72_upvr
						local var76 = var73_upvw
						local var77_upvr
						if arg1[var2_result1_upvr_5][var75] ~= var76 then
							var77_upvr = nil
							-- KONSTANTWARNING: GOTO [24] #22
						end
						-- KONSTANTERROR: [0] 1. Error Block 14 end (CF ANALYSIS FAILED)
						-- KONSTANTERROR: [10] 10. Error Block 15 start (CF ANALYSIS FAILED)
						if arg1[var2_result1_upvr_5][var75] ~= var76 then
							var77_upvr = nil
						else
							var77_upvr = arg1:_instantiate(var75)
						end
						if not var77_upvr then
						else
							arg1[var2_result1_upvr_4][var72_upvr] = var77_upvr
							table.insert(arg1[Symbol_result1_upvr_2], var77_upvr)
							task.defer(function() -- Line 413
								--[[ Upvalues[5]:
									[1]: arg1 (copied, readonly)
									[2]: var2_result1_upvr_4 (copied, readonly)
									[3]: var72_upvr (copied, readonly)
									[4]: var77_upvr (readonly)
									[5]: StartComponent_upvr (copied, readonly)
								]]
								if arg1[var2_result1_upvr_4][var72_upvr] == var77_upvr then
									StartComponent_upvr(var77_upvr)
								end
							end)
							-- KONSTANTERROR: [10] 10. Error Block 15 end (CF ANALYSIS FAILED)
						end
					end)
				end
			end
			-- KONSTANTERROR: [18] 16. Error Block 16 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [50] 47. Error Block 11 start (CF ANALYSIS FAILED)
			var72_upvr = TryDeconstructComponent_upvr
			var72_upvr(arg1_11)
			-- KONSTANTERROR: [50] 47. Error Block 11 end (CF ANALYSIS FAILED)
		end)
		local ipairs_result1_3, ipairs_result2_2, ipairs_result3_4 = ipairs(arg1[var2_result1_upvr])
		-- KONSTANTERROR: [0] 1. Error Block 15 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [41] 38. Error Block 6 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [41] 38. Error Block 6 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [34] 32. Error Block 19 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [41.9]
		if nil then
			-- KONSTANTWARNING: GOTO [44] #40
		end
		-- KONSTANTERROR: [34] 32. Error Block 19 end (CF ANALYSIS FAILED)
	end
	local function InstanceTagged(arg1_13) -- Line 465
		--[[ Upvalues[1]:
			[1]: StartWatchingInstance_upvr (readonly)
		]]
		StartWatchingInstance_upvr(arg1_13)
	end
	arg1[Symbol_result1_upvr]:Connect(CollectionService_upvr:GetInstanceAddedSignal(arg1.Tag), InstanceTagged)
	arg1[Symbol_result1_upvr]:Connect(CollectionService_upvr:GetInstanceRemovedSignal(arg1.Tag), function(arg1_14) -- Line 469, Named "InstanceUntagged"
		--[[ Upvalues[2]:
			[1]: tbl_upvr (readonly)
			[2]: TryDeconstructComponent_upvr (readonly)
		]]
		local var83 = tbl_upvr[arg1_14]
		if var83 then
			var83:Disconnect()
			tbl_upvr[arg1_14] = nil
		end
		TryDeconstructComponent_upvr(arg1_14)
	end)
	for _, v_5 in ipairs(CollectionService_upvr:GetTagged(arg1.Tag)) do
		task.defer(InstanceTagged, v_5)
	end
end
function module_upvr.GetAll(arg1) -- Line 506
	--[[ Upvalues[1]:
		[1]: Symbol_result1_upvr_2 (readonly)
	]]
	return arg1[Symbol_result1_upvr_2]
end
function module_upvr.FromInstance(arg1, arg2) -- Line 523
	--[[ Upvalues[1]:
		[1]: var2_result1_upvr_4 (readonly)
	]]
	return arg1[var2_result1_upvr_4][arg2]
end
local Promise_upvr = require(script.Parent.Promise)
function module_upvr.WaitForInstance(arg1, arg2, arg3) -- Line 546
	--[[ Upvalues[1]:
		[1]: Promise_upvr (readonly)
	]]
	local any_FromInstance_result1_upvw = arg1:FromInstance(arg2)
	if any_FromInstance_result1_upvw then
		return Promise_upvr.resolve(any_FromInstance_result1_upvw)
	end
	local function var91(arg1_15) -- Line 551
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: any_FromInstance_result1_upvw (read and write)
		]]
		local var90
		if arg1_15.Instance ~= arg2 then
			var90 = false
		else
			var90 = true
		end
		if var90 then
			any_FromInstance_result1_upvw = arg1_15
		end
		return var90
	end
	function var91() -- Line 558
		--[[ Upvalues[1]:
			[1]: any_FromInstance_result1_upvw (read and write)
		]]
		return any_FromInstance_result1_upvw
	end
	local var92 = var91
	if type(arg3) == "number" then
		var92 = arg3
	else
		var92 = 60
	end
	return Promise_upvr.fromEvent(arg1.Started, var91):andThen(var92):timeout(var92)
end
function module_upvr.Construct(arg1) -- Line 578
end
function module_upvr.Start(arg1) -- Line 595
end
function module_upvr.Stop(arg1) -- Line 615
end
function module_upvr.GetComponent(arg1, arg2) -- Line 634
	--[[ Upvalues[1]:
		[1]: var2_result1_upvr_4 (readonly)
	]]
	return arg2[var2_result1_upvr_4][arg1.Instance]
end
function module_upvr.Destroy(arg1) -- Line 719
	--[[ Upvalues[1]:
		[1]: Symbol_result1_upvr (readonly)
	]]
	arg1[Symbol_result1_upvr]:Destroy()
end
return module_upvr