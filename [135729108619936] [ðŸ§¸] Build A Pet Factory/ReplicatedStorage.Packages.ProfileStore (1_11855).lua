-- Name: ProfileStore
-- Path: game:GetService("ReplicatedStorage").Packages.ProfileStore
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.9954913999990822 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:12
-- Luau version 6, Types version 3
-- Time taken: 0.088363 seconds

local var1_upvw = 300
local var2_upvw = 10
local var3_upvw = 5
local var4_upvw = 40
local var5_upvw = 630
local var6_upvw = 120
local var7_upvw = 5
local var8_upvw = 120
local var9_upvw = 120
local var10_upvw = 1000
local var11_upvw
local function AcquireRunnerThreadAndCallEventHandler_upvr(arg1, ...) -- Line 199, Named "AcquireRunnerThreadAndCallEventHandler"
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = nil
	arg1(...)
	var11_upvw = var11_upvw
end
local function RunEventHandlerInFreeThread_upvr(...) -- Line 207, Named "RunEventHandlerInFreeThread"
	--[[ Upvalues[1]:
		[1]: AcquireRunnerThreadAndCallEventHandler_upvr (readonly)
	]]
	AcquireRunnerThreadAndCallEventHandler_upvr(...)
	while true do
		AcquireRunnerThreadAndCallEventHandler_upvr(coroutine.yield())
	end
end
local tbl_23_upvr = {}
tbl_23_upvr.__index = tbl_23_upvr
local tbl_6_upvr = {}
tbl_6_upvr.__index = tbl_6_upvr
function tbl_23_upvr.Disconnect(arg1) -- Line 220
	local var14
	if arg1.is_connected == false then
	else
		local signal = arg1.signal
		var14 = false
		arg1.is_connected = var14
		var14 = signal.listener_count
		var14 -= 1
		signal.listener_count = var14
		var14 = signal.head
		if var14 == arg1 then
			var14 = arg1.next
			signal.head = var14
			return
		end
		var14 = signal.head
		while var14 ~= nil and var14.next ~= arg1 do
			var14 = var14.next
		end
		if var14 ~= nil then
			var14.next = arg1.next
		end
	end
end
local function New() -- Line 244
	--[[ Upvalues[1]:
		[1]: tbl_6_upvr (readonly)
	]]
	local module_3 = {
		head = nil;
		listener_count = 0;
	}
	setmetatable(module_3, tbl_6_upvr)
	return module_3
end
tbl_6_upvr.New = New
function tbl_6_upvr.Connect(arg1, arg2) -- Line 256
	--[[ Upvalues[1]:
		[1]: tbl_23_upvr (readonly)
	]]
	if type(arg2) ~= "function" then
		error(`[{script.Name}]: "listener" must be a function; Received {typeof(arg2)}`)
	end
	local module_4 = {}
	module_4.listener = arg2
	module_4.signal = arg1
	module_4.next = arg1.head
	module_4.is_connected = true
	setmetatable(module_4, tbl_23_upvr)
	arg1.head = module_4
	arg1.listener_count += 1
	return module_4
end
function tbl_6_upvr.GetListenerCount(arg1) -- Line 277
	return arg1.listener_count
end
function tbl_6_upvr.Fire(arg1, ...) -- Line 281
	--[[ Upvalues[2]:
		[1]: var11_upvw (read and write)
		[2]: RunEventHandlerInFreeThread_upvr (readonly)
	]]
	local head = arg1.head
	while head ~= nil do
		if head.is_connected == true then
			if not var11_upvw then
				var11_upvw = coroutine.create(RunEventHandlerInFreeThread_upvr)
			end
			task.spawn(var11_upvw, head.listener, ...)
		end
	end
end
function tbl_6_upvr.Wait(arg1) -- Line 294
	local var20_upvw
	local current_thread_upvr = coroutine.running()
	var20_upvw = arg1:Connect(function(...) -- Line 297
		--[[ Upvalues[2]:
			[1]: var20_upvw (read and write)
			[2]: current_thread_upvr (readonly)
		]]
		var20_upvw:Disconnect()
		task.spawn(current_thread_upvr, ...)
	end)
	return coroutine.yield()
end
local table_freeze_result1_upvw = table.freeze({
	New = tbl_6_upvr.New;
})
local tbl_8_upvr = {}
local tbl_4_upvr = {}
local tbl_3_upvr = {}
local DataStoreService_upvr = game:GetService("DataStoreService")
local MessagingService_upvr = game:GetService("MessagingService")
local RunService = game:GetService("RunService")
local PlaceId_upvr = game.PlaceId
local JobId_upvr = game.JobId
local var32_upvw = 1
local os_clock_result1_upvw = os.clock()
local var34_upvw = 0
local var35_upvw = 0
local any_IsStudio_result1_upvr = RunService:IsStudio()
local var37_upvw = "NotReady"
local tbl_19_upvr = {}
local tbl_9_upvr = {}
local var40_upvw = false
local any_New_result1_2_upvr = table_freeze_result1_upvw.New()
local any_New_result1_upvr = table_freeze_result1_upvw.New()
local tbl_7_upvr = {}
local function WaitInUpdateQueue_upvr(arg1) -- Line 353, Named "WaitInUpdateQueue"
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	local var44 = false
	if tbl_7_upvr[arg1] == nil then
		var44 = true
		tbl_7_upvr[arg1] = {}
	end
	local var45_upvr = tbl_7_upvr[arg1]
	if var44 == false then
		table.insert(var45_upvr, coroutine.running())
		coroutine.yield()
	end
	return function() -- Line 369
		--[[ Upvalues[3]:
			[1]: var45_upvr (readonly)
			[2]: tbl_7_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		local popped = table.remove(var45_upvr, 1)
		if popped ~= nil then
			coroutine.resume(popped)
		else
			tbl_7_upvr[arg1] = nil
		end
	end
end
local function _(arg1, arg2, arg3) -- Line 380, Named "SessionToken"
	--[[ Upvalues[1]:
		[1]: var37_upvw (read and write)
	]]
	local var48 = "L_"
	if arg3 == true then
		var48 = "U_"
	elseif var37_upvw ~= "Access" then
		var48 = "M_"
	end
	return var48..arg1..'\x00'..arg2
end
local function DeepCopyTable_upvr(arg1) -- Line 396, Named "DeepCopyTable"
	--[[ Upvalues[1]:
		[1]: DeepCopyTable_upvr (readonly)
	]]
	for i, v in pairs(arg1) do
		if type(v) == "table" then
			({})[i] = DeepCopyTable_upvr(v)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			;({})[i] = v
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
local function ReconcileTable_upvr(arg1, arg2) -- Line 408, Named "ReconcileTable"
	--[[ Upvalues[2]:
		[1]: DeepCopyTable_upvr (readonly)
		[2]: ReconcileTable_upvr (readonly)
	]]
	for i_2, v_2 in pairs(arg2) do
		if type(i_2) == "string" then
			if arg1[i_2] == nil then
				if type(v_2) == "table" then
					arg1[i_2] = DeepCopyTable_upvr(v_2)
				else
					arg1[i_2] = v_2
				end
			elseif type(arg1[i_2]) == "table" and type(v_2) == "table" then
				ReconcileTable_upvr(arg1[i_2], v_2)
			end
		end
	end
end
local function _(arg1, arg2, arg3) -- Line 424, Named "RegisterError"
	--[[ Upvalues[2]:
		[1]: tbl_3_upvr (readonly)
		[2]: any_New_result1_2_upvr (readonly)
	]]
	warn(`[{script.Name}]: DataStore API error (STORE:{arg2}; KEY:{arg3}) - {tostring(arg1)}`)
	table.insert(tbl_3_upvr, os.clock())
	any_New_result1_2_upvr:Fire(tostring(arg1), arg2, arg3)
end
local function _(arg1, arg2) -- Line 430, Named "RegisterOverwrite"
	--[[ Upvalues[1]:
		[1]: any_New_result1_upvr (readonly)
	]]
	warn(`[{script.Name}]: Invalid profile was overwritten (STORE:{arg1}; KEY:{arg2})`)
	any_New_result1_upvr:Fire(arg1, arg2)
end
local function NewMockDataStoreKeyInfo_upvr(arg1) -- Line 435, Named "NewMockDataStoreKeyInfo"
	--[[ Upvalues[1]:
		[1]: DeepCopyTable_upvr (readonly)
	]]
	local tostring_result1 = tostring(arg1.VersionId or 0)
	local MetaData_upvr = arg1.MetaData
	if not MetaData_upvr then
		MetaData_upvr = {}
	end
	local UserIds_upvr = arg1.UserIds
	if not UserIds_upvr then
		UserIds_upvr = {}
	end
	return {
		CreatedTime = arg1.CreatedTime;
		UpdatedTime = arg1.UpdatedTime;
		Version = string.rep('0', 16)..'.'..string.rep('0', 10 - string.len(tostring_result1))..tostring_result1..'.'..string.rep('0', 16)..'.'.."01";
		GetMetadata = function() -- Line 448, Named "GetMetadata"
			--[[ Upvalues[2]:
				[1]: DeepCopyTable_upvr (copied, readonly)
				[2]: MetaData_upvr (readonly)
			]]
			return DeepCopyTable_upvr(MetaData_upvr)
		end;
		GetUserIds = function() -- Line 452, Named "GetUserIds"
			--[[ Upvalues[2]:
				[1]: DeepCopyTable_upvr (copied, readonly)
				[2]: UserIds_upvr (readonly)
			]]
			return DeepCopyTable_upvr(UserIds_upvr)
		end;
	}
end
local function MockUpdateAsync_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 459, Named "MockUpdateAsync"
	--[[ Upvalues[2]:
		[1]: NewMockDataStoreKeyInfo_upvr (readonly)
		[2]: DeepCopyTable_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var72 = arg1[arg2]
	if var72 == nil then
		var72 = {}
		arg1[arg2] = var72
	end
	local floored = math.floor(os.time() * 1000)
	local var74 = var72[arg3]
	local var75 = false
	if var74 == nil then
		var75 = true
		if arg5 ~= true then
			var74 = {
				Data = nil;
				CreatedTime = floored;
				UpdatedTime = floored;
				VersionId = 0;
				UserIds = {};
				MetaData = {};
			}
			var72[arg3] = var74
		end
	end
	if var75 ~= false or not NewMockDataStoreKeyInfo_upvr(var74) then
	end
	if var74 then
	end
	local arg4_result1, arg4_result2, arg4_result3 = arg4(var74.Data, nil)
	if arg4_result1 == nil then
		do
			return nil
		end
		local var80
	end
	if var74 ~= nil and arg5 ~= true then
		var80 = arg4_result1
		var74.Data = DeepCopyTable_upvr(var80)
		var80 = arg4_result2
		if not var80 then
			var80 = {}
		end
		var74.UserIds = DeepCopyTable_upvr(var80)
		if not arg4_result3 then
		end
		var74.MetaData = DeepCopyTable_upvr({})
		var74.VersionId += 1
		var74.UpdatedTime = floored
	end
	if var74 == nil or not NewMockDataStoreKeyInfo_upvr(var74) then
	end
	return DeepCopyTable_upvr(arg4_result1), nil
end
local function UpdateAsync_upvr(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 507, Named "UpdateAsync"
	--[[ Upvalues[8]:
		[1]: WaitInUpdateQueue_upvr (readonly)
		[2]: var37_upvw (read and write)
		[3]: MockUpdateAsync_upvr (readonly)
		[4]: tbl_9_upvr (readonly)
		[5]: tbl_19_upvr (readonly)
		[6]: any_New_result1_upvr (readonly)
		[7]: tbl_3_upvr (readonly)
		[8]: any_New_result1_2_upvr (readonly)
	]]
	local var99_upvw
	local var100_upvw
	local var101 = "L_"
	if arg4 == true then
		var101 = "U_"
	elseif var37_upvw ~= "Access" then
		var101 = "M_"
	end
	local pcall_result1_5, pcall_result2 = pcall(function() -- Line 520
		--[[ Upvalues[12]:
			[1]: arg3 (readonly)
			[2]: arg4 (readonly)
			[3]: var99_upvw (read and write)
			[4]: var100_upvw (read and write)
			[5]: MockUpdateAsync_upvr (copied, readonly)
			[6]: tbl_9_upvr (copied, readonly)
			[7]: arg1 (readonly)
			[8]: arg2 (readonly)
			[9]: arg5 (readonly)
			[10]: var37_upvw (copied, read and write)
			[11]: tbl_19_upvr (copied, readonly)
			[12]: arg6 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
		local MockUpdateAsync_upvr_result1, MockUpdateAsync_upvr_result2_2 = MockUpdateAsync_upvr(tbl_9_upvr, arg1.Name, arg2, function(arg1_3) -- Line 521
			--[[ Upvalues[1]:
				[1]: arg3 (copied, readonly)
			]]
			local var104 = false
			local var105 = false
			local tbl_17 = {0, {}}
			local var107
			if var107 == nil then
				var104 = true
			elseif type(var107) ~= "table" then
				var104 = true
				var105 = true
			elseif type(var107.Data) == "table" and type(var107.MetaData) == "table" and type(var107.GlobalUpdates) == "table" then
				var107.WasOverwritten = false
				tbl_17 = var107.GlobalUpdates
				if arg3.ExistingProfileHandle ~= nil then
					arg3.ExistingProfileHandle(var107)
					-- KONSTANTWARNING: GOTO [89] #61
				end
			elseif var107.Data == nil and var107.MetaData == nil and type(var107.GlobalUpdates) == "table" then
				var107.WasOverwritten = false
				tbl_17 = var107.GlobalUpdates or tbl_17
				var104 = true
			else
				var104 = true
				var105 = true
			end
			if var104 == true then
				var107 = {
					GlobalUpdates = tbl_17;
				}
				if arg3.MissingProfileHandle ~= nil then
					arg3.MissingProfileHandle(var107)
				end
			end
			if arg3.EditProfile ~= nil then
				arg3.EditProfile(var107)
			end
			if var105 == true then
				var107.WasOverwritten = true
			end
			return var107, var107.UserIds, var107.RobloxMetaData
		end, arg5)
		var99_upvw = MockUpdateAsync_upvr_result1
		var100_upvw = MockUpdateAsync_upvr_result2_2
		task.wait()
		do
			return
		end
		-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 18. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 18. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	WaitInUpdateQueue_upvr(var101..arg1.Name..'\x00'..arg2)()
	if pcall_result1_5 == true then
		if type(var99_upvw) == "table" then
			if var99_upvw.WasOverwritten == true and arg5 ~= true then
				local Name_3 = arg1.Name
				warn(`[{script.Name}]: Invalid profile was overwritten (STORE:{Name_3}; KEY:{arg2})`)
				any_New_result1_upvr:Fire(Name_3, arg2)
			end
			return var99_upvw, var100_upvw
		end
	end
	local var114 = pcall_result2 or "Undefined error"
	local Name = arg1.Name
	warn(`[{script.Name}]: DataStore API error (STORE:{Name}; KEY:{arg2}) - {tostring(var114)}`)
	table.insert(tbl_3_upvr, os.clock())
	any_New_result1_2_upvr:Fire(tostring(var114), Name, arg2)
	return nil
end
local function _(arg1) -- Line 658, Named "IsThisSession"
	--[[ Upvalues[2]:
		[1]: PlaceId_upvr (readonly)
		[2]: JobId_upvr (readonly)
	]]
	local var116 = false
	if arg1[1] == PlaceId_upvr then
		if arg1[2] ~= JobId_upvr then
			var116 = false
		else
			var116 = true
		end
	end
	return var116
end
local function _() -- Line 662, Named "ReadMockFlag"
	--[[ Upvalues[1]:
		[1]: var40_upvw (read and write)
	]]
	var40_upvw = false
	return var40_upvw
end
local function _(arg1) -- Line 668, Named "WaitForStoreReady"
	while arg1.is_ready == false do
		task.wait()
	end
end
local function _(arg1) -- Line 674, Named "AddProfileToAutoSave"
	--[[ Upvalues[4]:
		[1]: tbl_8_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var32_upvw (read and write)
		[4]: os_clock_result1_upvw (read and write)
	]]
	tbl_8_upvr[arg1.session_token] = arg1
	table.insert(tbl_4_upvr, var32_upvw, arg1)
	if 1 < #tbl_4_upvr then
		var32_upvw += 1
	elseif #tbl_4_upvr == 1 then
		os_clock_result1_upvw = os.clock()
	end
end
local function _(arg1) -- Line 691, Named "RemoveProfileFromAutoSave"
	--[[ Upvalues[3]:
		[1]: tbl_8_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var32_upvw (read and write)
	]]
	tbl_8_upvr[arg1.session_token] = nil
	local table_find_result1_3 = table.find(tbl_4_upvr, arg1)
	if table_find_result1_3 ~= nil then
		table.remove(tbl_4_upvr, table_find_result1_3)
		if table_find_result1_3 < var32_upvw then
			var32_upvw -= 1
		end
		if tbl_4_upvr[var32_upvw] == nil then
			var32_upvw = 1
		end
	end
end
local function SaveProfileAsync_upvr(arg1, arg2, arg3, arg4) -- Line 709, Named "SaveProfileAsync"
	--[[ Upvalues[9]:
		[1]: tbl_8_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var32_upvw (read and write)
		[4]: var35_upvw (read and write)
		[5]: UpdateAsync_upvr (readonly)
		[6]: PlaceId_upvr (readonly)
		[7]: JobId_upvr (readonly)
		[8]: SaveProfileAsync_upvr (readonly)
		[9]: DeepCopyTable_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 123 start (CF ANALYSIS FAILED)
	if type(arg1.Data) ~= "table" then
		error(`[{script.Name}]: Developer code likely set "Profile.Data" to a non-table value! (STORE:{arg1.ProfileStore.Name}; KEY:{arg1.Key})`)
	end
	arg1.OnSave:Fire()
	if arg2 == true then
		arg1.OnLastSave:Fire(arg4 or "Manual")
	end
	if arg2 == true and arg3 ~= true then
		if arg1.roblox_message_subscription ~= nil then
			arg1.roblox_message_subscription:Disconnect()
		end
		tbl_8_upvr[arg1.session_token] = nil
		local table_find_result1_4 = table.find(tbl_4_upvr, arg1)
		if table_find_result1_4 ~= nil then
			table.remove(tbl_4_upvr, table_find_result1_4)
			if table_find_result1_4 < var32_upvw then
				var32_upvw -= 1
			end
			if tbl_4_upvr[var32_upvw] == nil then
				var32_upvw = 1
			end
		end
		arg1.OnSessionEnd:Fire()
	end
	var35_upvw += 1
	-- KONSTANTERROR: [0] 1. Error Block 123 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [387] 276. Error Block 88 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [387] 276. Error Block 88 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [92] 64. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [92] 64. Error Block 16 end (CF ANALYSIS FAILED)
end
local tbl_13_upvr = {}
tbl_13_upvr.__index = tbl_13_upvr
local function New(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 1033
	--[[ Upvalues[3]:
		[1]: DeepCopyTable_upvr (readonly)
		[2]: table_freeze_result1_upvw (read and write)
		[3]: tbl_13_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var128
	if not arg1.Data then
		local tbl = {}
	end
	var128 = arg1.MetaData
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var128 = arg1.MetaData
		return var128.ActiveSession
	end
	if not var128 or not INLINED() then
		local var130
	end
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var128 = arg1.GlobalUpdates[2]
		return var128
	end
	if not arg1.GlobalUpdates or not INLINED_2() then
		var128 = {}
	end
	for _, v_3 in ipairs(var128) do
		({})[v_3[1]] = true
		local var134
	end
	local module_5 = {
		Data = tbl;
		LastSavedData = DeepCopyTable_upvr(tbl);
	}
	if not arg1.MetaData or not arg1.MetaData.ProfileCreateTime then
	end
	module_5.FirstSessionTime = 0
	if not arg1.MetaData or not arg1.MetaData.SessionLoadCount then
	end
	module_5.SessionLoadCount = 0
	if var130 then
		local tbl_16 = {
			PlaceId = var130[1];
			JobId = var130[2];
		}
	end
	module_5.Session = tbl_16
	tbl_16 = arg1.RobloxMetaData
	local var137 = tbl_16
	if not var137 then
		var137 = {}
	end
	module_5.RobloxMetaData = var137
	var137 = arg1.UserIds
	local var138 = var137
	if not var138 then
		var138 = {}
	end
	module_5.UserIds = var138
	module_5.KeyInfo = arg2
	module_5.OnAfterSave = table_freeze_result1_upvw.New()
	module_5.OnSave = table_freeze_result1_upvw.New()
	module_5.OnLastSave = table_freeze_result1_upvw.New()
	module_5.OnSessionEnd = table_freeze_result1_upvw.New()
	module_5.ProfileStore = arg3
	module_5.Key = arg4
	module_5.load_timestamp = os.clock()
	module_5.is_mock = arg5
	module_5.session_token = arg6 or ""
	if not arg1.MetaData or not arg1.MetaData.SessionLoadCount then
	end
	module_5.load_index = 0
	module_5.locked_global_updates = {}
	module_5.received_global_updates = var134
	module_5.message_handlers = {}
	module_5.global_updates = var128
	setmetatable(module_5, tbl_13_upvr)
	return module_5
end
tbl_13_upvr.New = New
function tbl_13_upvr.IsActive(arg1) -- Line 1082
	--[[ Upvalues[1]:
		[1]: tbl_8_upvr (readonly)
	]]
	local var139
	if tbl_8_upvr[arg1.session_token] ~= arg1 then
		var139 = false
	else
		var139 = true
	end
	return var139
end
function tbl_13_upvr.Reconcile(arg1) -- Line 1086
	--[[ Upvalues[1]:
		[1]: ReconcileTable_upvr (readonly)
	]]
	ReconcileTable_upvr(arg1.Data, arg1.ProfileStore.template)
end
function tbl_13_upvr.EndSession(arg1) -- Line 1090
	--[[ Upvalues[1]:
		[1]: SaveProfileAsync_upvr (readonly)
	]]
	if arg1:IsActive() == true then
		task.spawn(SaveProfileAsync_upvr, arg1, true, nil, "Manual")
	end
end
function tbl_13_upvr.AddUserId(arg1, arg2) -- Line 1096
	--[[ Upvalues[1]:
		[1]: var37_upvw (read and write)
	]]
	if type(arg2) ~= "number" or arg2 % 1 ~= 0 then
		warn(`[{script.Name}]: Invalid UserId argument for :AddUserId() ({tostring(arg2)}); Traceback:\n`..debug.traceback())
	else
		if arg2 < 0 and arg1.is_mock ~= true and var37_upvw == "Access" then return end
		if table.find(arg1.UserIds, arg2) == nil then
			table.insert(arg1.UserIds, arg2)
		end
	end
end
function tbl_13_upvr.RemoveUserId(arg1, arg2) -- Line 1113
	if type(arg2) ~= "number" or arg2 % 1 ~= 0 then
		warn(`[{script.Name}]: Invalid UserId argument for :RemoveUserId() ({tostring(arg2)}); Traceback:\n`..debug.traceback())
	else
		local table_find_result1 = table.find(arg1.UserIds, arg2)
		if table_find_result1 ~= nil then
			table.remove(arg1.UserIds, table_find_result1)
		end
	end
end
function tbl_13_upvr.SetAsync(arg1) -- Line 1128
	--[[ Upvalues[1]:
		[1]: SaveProfileAsync_upvr (readonly)
	]]
	if arg1.view_mode ~= true then
		error(`[{script.Name}]: :SetAsync() can only be used in view mode`)
	end
	SaveProfileAsync_upvr(arg1, nil, true)
end
function tbl_13_upvr.MessageHandler(arg1, arg2) -- Line 1138
	--[[ Upvalues[1]:
		[1]: DeepCopyTable_upvr (readonly)
	]]
	if type(arg2) ~= "function" then
		error(`[{script.Name}]: fn argument is not a function`)
	end
	if arg1.view_mode ~= true and arg1:IsActive() ~= true then
	else
		local locked_global_updates_upvr = arg1.locked_global_updates
		table.insert(arg1.message_handlers, arg2)
		for _, v_4 in ipairs(arg1.global_updates) do
			local _1_upvr = v_4[1]
			if locked_global_updates_upvr[_1_upvr] ~= true then
				task.spawn(arg2, DeepCopyTable_upvr(v_4[#v_4]), function() -- Line 1158
					--[[ Upvalues[2]:
						[1]: locked_global_updates_upvr (readonly)
						[2]: _1_upvr (readonly)
					]]
					locked_global_updates_upvr[_1_upvr] = true
				end)
			end
		end
	end
end
function tbl_13_upvr.Save(arg1) -- Line 1172
	--[[ Upvalues[5]:
		[1]: tbl_8_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var32_upvw (read and write)
		[4]: os_clock_result1_upvw (read and write)
		[5]: SaveProfileAsync_upvr (readonly)
	]]
	if arg1.view_mode == true then
		error(`[{script.Name}]: Can't save profile in view mode; Should you be calling :SetAsync() instead?`)
	end
	if arg1:IsActive() == false then
		warn(`[{script.Name}]: Attempted saving an inactive profile (STORE:{arg1.ProfileStore.Name}; KEY:{arg1.Key});`.." Traceback:\n"..debug.traceback())
	else
		tbl_8_upvr[arg1.session_token] = nil
		local table_find_result1_2 = table.find(tbl_4_upvr, arg1)
		if table_find_result1_2 ~= nil then
			table.remove(tbl_4_upvr, table_find_result1_2)
			if table_find_result1_2 < var32_upvw then
				var32_upvw -= 1
			end
			if tbl_4_upvr[var32_upvw] == nil then
				var32_upvw = 1
			end
		end
		tbl_8_upvr[arg1.session_token] = arg1
		table.insert(tbl_4_upvr, var32_upvw, arg1)
		if 1 < #tbl_4_upvr then
			var32_upvw += 1
		elseif #tbl_4_upvr == 1 then
			os_clock_result1_upvw = os.clock()
		end
		task.spawn(SaveProfileAsync_upvr, arg1)
	end
end
local module_2_upvr = {
	IsClosing = false;
	IsCriticalState = false;
	OnError = any_New_result1_2_upvr;
	OnOverwrite = any_New_result1_upvr;
	OnCriticalToggle = table_freeze_result1_upvw.New();
	DataStoreState = "NotReady";
}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.SetConstant(arg1, arg2) -- Line 1205
	--[[ Upvalues[10]:
		[1]: var1_upvw (read and write)
		[2]: var2_upvw (read and write)
		[3]: var3_upvw (read and write)
		[4]: var4_upvw (read and write)
		[5]: var5_upvw (read and write)
		[6]: var6_upvw (read and write)
		[7]: var7_upvw (read and write)
		[8]: var8_upvw (read and write)
		[9]: var9_upvw (read and write)
		[10]: var10_upvw (read and write)
	]]
	if type(arg2) ~= "number" then
		error(`[{script.Name}]: Invalid value type`)
	end
	if arg1 == "AUTO_SAVE_PERIOD" then
		var1_upvw = arg2
	else
		if arg1 == "LOAD_REPEAT_PERIOD" then
			var2_upvw = arg2
			return
		end
		if arg1 == "FIRST_LOAD_REPEAT" then
			var3_upvw = arg2
			return
		end
		if arg1 == "SESSION_STEAL" then
			var4_upvw = arg2
			return
		end
		if arg1 == "ASSUME_DEAD" then
			var5_upvw = arg2
			return
		end
		if arg1 == "START_SESSION_TIMEOUT" then
			var6_upvw = arg2
			return
		end
		if arg1 == "CRITICAL_STATE_ERROR_COUNT" then
			var7_upvw = arg2
			return
		end
		if arg1 == "CRITICAL_STATE_ERROR_EXPIRE" then
			var8_upvw = arg2
			return
		end
		if arg1 == "CRITICAL_STATE_EXPIRE" then
			var9_upvw = arg2
			return
		end
		if arg1 == "MAX_MESSAGE_QUEUE" then
			var10_upvw = arg2
			return
		end
		error(`[{script.Name}]: Invalid constant name was provided`)
	end
end
function module_2_upvr.Test() -- Line 1237
	--[[ Upvalues[7]:
		[1]: tbl_8_upvr (readonly)
		[2]: tbl_4_upvr (readonly)
		[3]: var34_upvw (read and write)
		[4]: var35_upvw (read and write)
		[5]: tbl_19_upvr (readonly)
		[6]: tbl_9_upvr (readonly)
		[7]: tbl_7_upvr (readonly)
	]]
	return {
		ActiveSessionCheck = tbl_8_upvr;
		AutoSaveList = tbl_4_upvr;
		ActiveProfileLoadJobs = var34_upvw;
		ActiveProfileSaveJobs = var35_upvw;
		MockStore = tbl_19_upvr;
		UserMockStore = tbl_9_upvr;
		UpdateQueue = tbl_7_upvr;
	}
end
local function New(arg1, arg2) -- Line 1249
	--[[ Upvalues[4]:
		[1]: var40_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: var37_upvw (read and write)
		[4]: DataStoreService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 30 start (CF ANALYSIS FAILED)
	local var152 = arg2
	if not var152 then
		var152 = {}
	end
	local var153 = var152
	if type(arg1) ~= "string" then
		error(`[{script.Name}]: Invalid or missing "store_name"`)
		-- KONSTANTWARNING: GOTO [65] #47
	end
	-- KONSTANTERROR: [0] 1. Error Block 30 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 19. Error Block 31 start (CF ANALYSIS FAILED)
	if string.len(arg1) == 0 then
		error(`[{script.Name}]: store_name cannot be an empty string`)
	elseif 50 < string.len(arg1) then
		error(`[{script.Name}]: store_name is too long`)
	end
	if type(var153) ~= "table" then
		error(`[{script.Name}]: Invalid template argument`)
	end
	local var154_upvw
	local tbl_2 = {}
	local tbl_15 = {}
	tbl_15.Name = arg1
	local function StartSessionAsync(arg1_4, arg2_2) -- Line 1272
		--[[ Upvalues[2]:
			[1]: var40_upvw (copied, read and write)
			[2]: var154_upvw (read and write)
		]]
		var40_upvw = true
		return var154_upvw:StartSessionAsync(arg2_2)
	end
	tbl_15.StartSessionAsync = StartSessionAsync
	local function MessageAsync(arg1_5, arg2_3, arg3) -- Line 1276
		--[[ Upvalues[2]:
			[1]: var40_upvw (copied, read and write)
			[2]: var154_upvw (read and write)
		]]
		var40_upvw = true
		return var154_upvw:MessageAsync(arg2_3, arg3)
	end
	tbl_15.MessageAsync = MessageAsync
	local function GetAsync(arg1_6, arg2_4, arg3) -- Line 1280
		--[[ Upvalues[2]:
			[1]: var40_upvw (copied, read and write)
			[2]: var154_upvw (read and write)
		]]
		var40_upvw = true
		return var154_upvw:GetAsync(arg2_4, arg3)
	end
	tbl_15.GetAsync = GetAsync
	local function VersionQuery(arg1_7, arg2_5, arg3, arg4, arg5) -- Line 1284
		--[[ Upvalues[2]:
			[1]: var40_upvw (copied, read and write)
			[2]: var154_upvw (read and write)
		]]
		var40_upvw = true
		return var154_upvw:VersionQuery(arg2_5, arg3, arg4, arg5)
	end
	tbl_15.VersionQuery = VersionQuery
	local function RemoveAsync(arg1_8, arg2_6) -- Line 1288
		--[[ Upvalues[2]:
			[1]: var40_upvw (copied, read and write)
			[2]: var154_upvw (read and write)
		]]
		var40_upvw = true
		return var154_upvw:RemoveAsync(arg2_6)
	end
	tbl_15.RemoveAsync = RemoveAsync
	tbl_2.Mock = tbl_15
	tbl_2.Name = arg1
	tbl_2.template = var153
	tbl_2.data_store = nil
	tbl_2.load_jobs = {}
	tbl_2.mock_load_jobs = {}
	tbl_2.is_ready = true
	var154_upvw = tbl_2
	local var157_upvw = var154_upvw
	setmetatable(var157_upvw, module_2_upvr)
	local DataStoreOptions_upvr = Instance.new("DataStoreOptions")
	DataStoreOptions_upvr:SetExperimentalFeatures({
		v2 = true;
	})
	if var37_upvw == "NotReady" then
		var157_upvw.is_ready = false
		task.spawn(function() -- Line 1314
			--[[ Upvalues[5]:
				[1]: var37_upvw (copied, read and write)
				[2]: var157_upvw (read and write)
				[3]: DataStoreService_upvr (copied, readonly)
				[4]: arg1 (readonly)
				[5]: DataStoreOptions_upvr (readonly)
			]]
			repeat
				task.wait()
			until var37_upvw ~= "NotReady"
			if var37_upvw == "Access" then
				var157_upvw.data_store = DataStoreService_upvr:GetDataStore(arg1, nil, DataStoreOptions_upvr)
			end
			var157_upvw.is_ready = true
		end)
	elseif var37_upvw == "Access" then
		var157_upvw.data_store = DataStoreService_upvr:GetDataStore(arg1, nil, DataStoreOptions_upvr)
	end
	do
		return var157_upvw
	end
	-- KONSTANTERROR: [25] 19. Error Block 31 end (CF ANALYSIS FAILED)
end
module_2_upvr.New = New
local function RobloxMessageSubscription_upvr(arg1, arg2) -- Line 1336, Named "RobloxMessageSubscription"
	--[[ Upvalues[2]:
		[1]: MessagingService_upvr (readonly)
		[2]: SaveProfileAsync_upvr (readonly)
	]]
	local var162_upvw = 0
	local function var161(arg1_9) -- Line 1340
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: var162_upvw (read and write)
			[3]: SaveProfileAsync_upvr (copied, readonly)
		]]
		if type(arg1_9.Data) == "table" and arg1_9.Data.LoadCount == arg1.SessionLoadCount and 6 < os.clock() - var162_upvw then
			var162_upvw = os.clock()
			if arg1:IsActive() == true then
				if arg1_9.Data.EndSession == true then
					SaveProfileAsync_upvr(arg1, true, false, "External")
					return
				end
				arg1:Save()
			end
		end
	end
	if arg1:IsActive() == true then
		arg1.roblox_message_subscription = MessagingService_upvr:SubscribeAsync("PS_"..arg2, var161)
	else
		MessagingService_upvr:SubscribeAsync("PS_"..arg2, var161):Disconnect()
	end
end
local const_number_2_upvw = 0
local HttpService_upvr = game:GetService("HttpService")
function module_2_upvr.StartSessionAsync(arg1, arg2, arg3) -- Line 1364
	--[[ Upvalues[23]:
		[1]: var40_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: var37_upvw (read and write)
		[4]: tbl_8_upvr (readonly)
		[5]: var34_upvw (read and write)
		[6]: const_number_2_upvw (read and write)
		[7]: HttpService_upvr (readonly)
		[8]: UpdateAsync_upvr (readonly)
		[9]: PlaceId_upvr (readonly)
		[10]: JobId_upvr (readonly)
		[11]: var5_upvw (read and write)
		[12]: DeepCopyTable_upvr (readonly)
		[13]: tbl_13_upvr (readonly)
		[14]: tbl_4_upvr (readonly)
		[15]: var32_upvw (read and write)
		[16]: os_clock_result1_upvw (read and write)
		[17]: RobloxMessageSubscription_upvr (readonly)
		[18]: SaveProfileAsync_upvr (readonly)
		[19]: var4_upvw (read and write)
		[20]: var2_upvw (read and write)
		[21]: MessagingService_upvr (readonly)
		[22]: var3_upvw (read and write)
		[23]: var6_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 242 start (CF ANALYSIS FAILED)
	var40_upvw = false
	if type(arg2) ~= "string" then
		error(`[{script.Name}]: profile_key must be a string`)
		-- KONSTANTWARNING: GOTO [64] #47
	end
	-- KONSTANTERROR: [0] 1. Error Block 242 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 19. Error Block 243 start (CF ANALYSIS FAILED)
	if string.len(arg2) == 0 then
		error(`[{script.Name}]: Invalid profile_key`)
	elseif 50 < string.len(arg2) then
		error(`[{script.Name}]: profile_key is too long`)
		local cancel_condition
	end
	if arg3 ~= nil and type(arg3) ~= "table" then
		cancel_condition = `[{script.Name}]: Invalid params`
		error(cancel_condition)
	end
	local var166 = arg3
	if not var166 then
		var166 = {}
	end
	local var167_upvw = var166
	if module_2_upvr.IsClosing == true then
		return nil
	end
	while arg1.is_ready == false do
		task.wait()
	end
	cancel_condition = "L_"
	if var40_upvw == true then
		cancel_condition = "U_"
	elseif var37_upvw ~= "Access" then
		cancel_condition = "M_"
	end
	cancel_condition = cancel_condition..arg1.Name..'\x00'..arg2
	cancel_condition = tbl_8_upvr
	if cancel_condition[cancel_condition] ~= nil then
		cancel_condition = `[{script.Name}]: Profile (STORE:{arg1.Name}; KEY:{arg2}) is already loaded in this session`
		error(cancel_condition)
	end
	cancel_condition = var34_upvw
	var34_upvw = cancel_condition + 1
	local var168_upvw = false
	function cancel_condition() -- Line 1398
		--[[ Upvalues[2]:
			[1]: var168_upvw (read and write)
			[2]: var167_upvw (read and write)
		]]
		if var168_upvw == false then
			local Cancel = var167_upvw.Cancel
			if Cancel ~= nil then
				if var167_upvw.Cancel() ~= true then
					Cancel = false
				else
					Cancel = true
				end
				var168_upvw = Cancel
			end
			return var168_upvw
		end
		return true
	end
	if var167_upvw.Steal ~= true then
	else
	end
	-- KONSTANTERROR: [24] 19. Error Block 243 end (CF ANALYSIS FAILED)
end
function module_2_upvr.MessageAsync(arg1, arg2, arg3) -- Line 1633
	--[[ Upvalues[7]:
		[1]: var40_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: UpdateAsync_upvr (readonly)
		[4]: var10_upvw (read and write)
		[5]: var37_upvw (read and write)
		[6]: tbl_8_upvr (readonly)
		[7]: MessagingService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 59 start (CF ANALYSIS FAILED)
	var40_upvw = false
	local var170 = var40_upvw
	if type(arg2) ~= "string" then
		error(`[{script.Name}]: profile_key must be a string`)
		-- KONSTANTWARNING: GOTO [64] #47
	end
	-- KONSTANTERROR: [0] 1. Error Block 59 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 19. Error Block 61 start (CF ANALYSIS FAILED)
	if string.len(arg2) == 0 then
		error(`[{script.Name}]: Invalid profile_key`)
	elseif 50 < string.len(arg2) then
		error(`[{script.Name}]: profile_key is too long`)
	end
	if type(arg3) ~= "table" then
		error(`[{script.Name}]: message must be a table`)
	end
	if module_2_upvr.IsClosing == true then
		return false
	end
	while arg1.is_ready == false do
		task.wait()
	end
	while module_2_upvr.IsClosing == false do
		local tbl_21 = {
			ExistingProfileHandle = nil;
			MissingProfileHandle = nil;
			EditProfile = function(arg1_10) -- Line 1667, Named "EditProfile"
				--[[ Upvalues[2]:
					[1]: arg3 (readonly)
					[2]: var10_upvw (copied, read and write)
				]]
				local GlobalUpdates = arg1_10.GlobalUpdates
				local _2 = GlobalUpdates[2]
				GlobalUpdates[1] += 1
				local tbl_20 = {GlobalUpdates[1]}
				tbl_20[2] = arg3
				table.insert(_2, tbl_20)
				while var10_upvw < #_2 do
					table.remove(_2, 1)
				end
			end;
		}
		local UpdateAsync_result1 = UpdateAsync_upvr(arg1, arg2, tbl_21, var170)
		if UpdateAsync_result1 ~= nil then
			tbl_21 = "L_"
			local var177 = tbl_21
			if var170 == true then
				var177 = "U_"
			elseif var37_upvw ~= "Access" then
				var177 = "M_"
			end
			local var178 = tbl_8_upvr[var177..arg1.Name..'\x00'..arg2]
			local var179
			if var178 ~= nil then
				var179 = var178:Save
				var179()
			else
				var179 = UpdateAsync_result1.MetaData
				if not var179 then
					var179 = {}
				end
				local ActiveSession = var179.ActiveSession
				if type(ActiveSession) == "table" and type(ActiveSession[3]) == "string" then
					task.spawn(MessagingService_upvr.PublishAsync, MessagingService_upvr, "PS_"..ActiveSession[3], {
						LoadCount = var179.SessionLoadCount or 0;
					})
				end
			end
			return true
		end
		task.wait(1)
	end
	do
		return false
	end
	-- KONSTANTERROR: [24] 19. Error Block 61 end (CF ANALYSIS FAILED)
end
function module_2_upvr.GetAsync(arg1, arg2, arg3) -- Line 1731
	--[[ Upvalues[6]:
		[1]: var40_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: var37_upvw (read and write)
		[4]: UpdateAsync_upvr (readonly)
		[5]: DeepCopyTable_upvr (readonly)
		[6]: tbl_13_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	var40_upvw = false
	local var182 = var40_upvw
	if type(arg2) ~= "string" then
		error(`[{script.Name}]: profile_key must be a string`)
		-- KONSTANTWARNING: GOTO [64] #47
	end
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 19. Error Block 52 start (CF ANALYSIS FAILED)
	if string.len(arg2) == 0 then
		error(`[{script.Name}]: Invalid profile_key`)
	elseif 50 < string.len(arg2) then
		error(`[{script.Name}]: profile_key is too long`)
	end
	if module_2_upvr.IsClosing == true then
		return nil
	end
	while arg1.is_ready == false do
		task.wait()
	end
	if arg3 ~= nil and (var182 or var37_upvw ~= "Access") then
		return nil
	end
	while module_2_upvr.IsClosing == false do
		local UpdateAsync_upvr_result1, UpdateAsync_result2 = UpdateAsync_upvr(arg1, arg2, {
			ExistingProfileHandle = nil;
			MissingProfileHandle = function(arg1_11) -- Line 1764, Named "MissingProfileHandle"
				--[[ Upvalues[2]:
					[1]: DeepCopyTable_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				arg1_11.Data = DeepCopyTable_upvr(arg1.template)
				arg1_11.MetaData = {
					ProfileCreateTime = os.time();
					SessionLoadCount = 0;
					ActiveSession = nil;
					ForceLoadSession = nil;
					MetaTags = {};
				}
			end;
			EditProfile = nil;
		}, var182, true, arg3)
		if UpdateAsync_upvr_result1 ~= nil then
			if UpdateAsync_result2 == nil then
				return nil
			end
			local any_New_result1 = tbl_13_upvr.New(UpdateAsync_upvr_result1, UpdateAsync_result2, arg1, arg2, var182)
			any_New_result1.view_mode = true
			return any_New_result1
		end
		task.wait(1)
	end
	do
		return nil
	end
	-- KONSTANTERROR: [24] 19. Error Block 52 end (CF ANALYSIS FAILED)
end
function module_2_upvr.RemoveAsync(arg1, arg2) -- Line 1809
	--[[ Upvalues[6]:
		[1]: var40_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: WaitInUpdateQueue_upvr (readonly)
		[4]: var37_upvw (read and write)
		[5]: tbl_9_upvr (readonly)
		[6]: tbl_19_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	var40_upvw = false
	local var194 = var40_upvw
	local var195
	if type(arg2) ~= "string" or string.len(arg2) == 0 then
		var195 = script.Name
		error(`[{var195}]: Invalid profile_key`)
	end
	if module_2_upvr.IsClosing == true then
		return false
	end
	while arg1.is_ready == false do
		task.wait()
	end
	var195 = "L_"
	if var194 == true then
		var195 = "U_"
	elseif var37_upvw ~= "Access" then
		var195 = "M_"
	end
	var195 = var195..arg1.Name..'\x00'..arg2
	if var194 == true then
		var195 = arg1.Name
		local var196 = tbl_9_upvr[var195]
		if var196 ~= nil then
			var196[arg2] = nil
			var195 = var196
			if next(var195) == nil then
				var195 = arg1.Name
				tbl_9_upvr[var195] = nil
			end
		end
		task.wait()
	elseif var37_upvw ~= "Access" then
		var195 = arg1.Name
		local var197 = tbl_19_upvr[var195]
		if var197 ~= nil then
			var197[arg2] = nil
			var195 = var197
			if next(var195) == nil then
				var195 = arg1.Name
				tbl_19_upvr[var195] = nil
			end
		end
		task.wait()
	else
	end
	WaitInUpdateQueue_upvr(var195)()
	return pcall(function() -- Line 1857
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1.data_store:RemoveAsync(arg2)
	end)
end
local tbl_14_upvr = {}
tbl_14_upvr.__index = tbl_14_upvr
function tbl_14_upvr.New(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 1872
	--[[ Upvalues[1]:
		[1]: tbl_14_upvr (readonly)
	]]
	local module = {}
	module.profile_store = arg1
	module.profile_key = arg2
	module.sort_direction = arg3
	module.min_date = arg4
	module.max_date = arg5
	module.query_pages = nil
	module.query_index = 0
	module.query_failure = false
	module.is_query_yielded = false
	module.query_queue = {}
	module.is_mock = arg6
	setmetatable(module, tbl_14_upvr)
	return module
end
function MoveVersionQueryQueue(arg1) -- Line 1896
	repeat
		if 0 >= #arg1.query_queue then break end
		task.spawn(table.remove(arg1.query_queue, 1))
	until arg1.is_query_yielded == true
end
local var201_upvw = false
local var202_upvw = false
function tbl_14_upvr.NextAsync(arg1) -- Line 1913
	--[[ Upvalues[5]:
		[1]: var201_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: var37_upvw (read and write)
		[4]: any_IsStudio_result1_upvr (readonly)
		[5]: var202_upvw (read and write)
	]]
	local var203
	if var201_upvw ~= true then
		var203 = false
	else
		var203 = true
	end
	var201_upvw = false
	while arg1.profile_store.is_ready == false do
		task.wait()
	end
	if module_2_upvr.IsClosing == true then
		return nil
	end
	if arg1.is_mock == true or var37_upvw ~= "Access" then
		if any_IsStudio_result1_upvr == true and var202_upvw == false then
			var202_upvw = true
			warn(`[{script.Name}]: :VersionQuery() is not supported in mock mode!`)
		end
		return nil
	end
	local var204_upvw
	local var205_upvw = false
	local function query_job() -- Line 1935
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: var205_upvw (read and write)
			[3]: var201_upvw (copied, read and write)
			[4]: var204_upvw (read and write)
		]]
		if arg1.query_failure == true then
			var205_upvw = true
		else
			if arg1.query_pages == nil then
				arg1.is_query_yielded = true
				task.spawn(function() -- Line 1948
					--[[ Upvalues[4]:
						[1]: var201_upvw (copied, read and write)
						[2]: var204_upvw (copied, read and write)
						[3]: arg1 (copied, readonly)
						[4]: var205_upvw (copied, read and write)
					]]
					var201_upvw = true
					var204_upvw = arg1:NextAsync()
					var205_upvw = true
				end)
				local pcall_result1_3, pcall_result2_3 = pcall(function() -- Line 1954
					--[[ Upvalues[1]:
						[1]: arg1 (copied, readonly)
					]]
					arg1.query_pages = arg1.profile_store.data_store:ListVersionsAsync(arg1.profile_key, arg1.sort_direction, arg1.min_date, arg1.max_date)
					arg1.query_index = 0
				end)
				if pcall_result1_3 == false or arg1.query_pages == nil then
					warn(`[{script.Name}]: Version query fail - {tostring(pcall_result2_3)}`)
					arg1.query_failure = true
				end
				arg1.is_query_yielded = false
				MoveVersionQueryQueue(arg1)
				return
			end
			local var210 = arg1.query_pages:GetCurrentPage()[arg1.query_index + 1]
			if arg1.query_pages.IsFinished == true then
				if var210 == nil then
					var205_upvw = true
					return
				end
			end
			if var210 == nil then
				arg1.is_query_yielded = true
				task.spawn(function() -- Line 1992
					--[[ Upvalues[4]:
						[1]: var201_upvw (copied, read and write)
						[2]: var204_upvw (copied, read and write)
						[3]: arg1 (copied, readonly)
						[4]: var205_upvw (copied, read and write)
					]]
					var201_upvw = true
					var204_upvw = arg1:NextAsync()
					var205_upvw = true
				end)
				local pcall_result1_2, _ = pcall(function() -- Line 1998
					--[[ Upvalues[1]:
						[1]: arg1 (copied, readonly)
					]]
					arg1.query_pages:AdvanceToNextPageAsync()
					arg1.query_index = 0
				end)
				if pcall_result1_2 == false or #arg1.query_pages:GetCurrentPage() == 0 then
					arg1.query_failure = true
				end
				arg1.is_query_yielded = false
				MoveVersionQueryQueue(arg1)
				return
			end
			local var215 = arg1
			var215.query_index += 1
			var204_upvw = arg1.profile_store:GetAsync(arg1.profile_key, var210.Version)
			var205_upvw = true
		end
	end
	if arg1.is_query_yielded == false then
		query_job()
	elseif var203 == true then
		table.insert(arg1.query_queue, 1, query_job)
	else
		table.insert(arg1.query_queue, query_job)
	end
	while var205_upvw == false do
		task.wait()
	end
	return var204_upvw
end
function module_2_upvr.VersionQuery(arg1, arg2, arg3, arg4, arg5) -- Line 2040
	--[[ Upvalues[2]:
		[1]: var40_upvw (read and write)
		[2]: tbl_14_upvr (readonly)
	]]
	var40_upvw = false
	if type(arg2) ~= "string" or string.len(arg2) == 0 then
		error(`[{script.Name}]: Invalid profile_key`)
		local var218
	end
	local function INLINED_7() -- Internal function, doesn't exist in bytecode
		var218 = typeof(arg3)
		return var218 ~= "EnumItem"
	end
	local function INLINED_8() -- Internal function, doesn't exist in bytecode
		var218 = arg3.EnumType
		return var218 ~= Enum.SortDirection
	end
	if arg3 ~= nil and (INLINED_7() or INLINED_8()) then
		var218 = error
		var218(`[{script.Name}]: Invalid sort_direction ({tostring(arg3)})`)
	end
	if arg4 ~= nil then
		var218 = typeof(arg4)
		if var218 ~= "DateTime" then
			var218 = typeof(arg4)
			if var218 ~= "number" then
				var218 = error
				var218(`[{script.Name}]: Invalid min_date ({tostring(arg4)})`)
			end
		end
	end
	if arg5 ~= nil then
		var218 = typeof(arg5)
		if var218 ~= "DateTime" then
			var218 = typeof(arg5)
			if var218 ~= "number" then
				var218 = error
				var218(`[{script.Name}]: Invalid max_date ({tostring(arg5)})`)
			end
		end
	end
	local function INLINED_9() -- Internal function, doesn't exist in bytecode
		var218 = arg4.UnixTimestampMillis
		return var218
	end
	if typeof(arg4) ~= "DateTime" or not INLINED_9() then
		var218 = arg4
	end
	local function INLINED_10() -- Internal function, doesn't exist in bytecode
		var218 = arg5.UnixTimestampMillis
		return var218
	end
	if typeof(arg5) ~= "DateTime" or not INLINED_10() then
		var218 = arg5
	end
	var218 = tbl_14_upvr.New(arg1, arg2, arg3, var218, var218, var40_upvw)
	return var218
end
if any_IsStudio_result1_upvr == true then
	task.spawn(function() -- Line 2074
		--[[ Upvalues[3]:
			[1]: DataStoreService_upvr (readonly)
			[2]: var37_upvw (read and write)
			[3]: module_2_upvr (readonly)
		]]
		local pcall_result1, pcall_result2_2 = pcall(function() -- Line 2078
			--[[ Upvalues[1]:
				[1]: DataStoreService_upvr (copied, readonly)
			]]
			DataStoreService_upvr:GetDataStore("____PS"):SetAsync("____PS", os.time())
		end)
		local var223 = false
		if pcall_result1 == false then
			if string.find(pcall_result2_2, "ConnectFail", 1, true) == nil then
				var223 = false
			else
				var223 = true
			end
		end
		if var223 == true then
			warn(`[{script.Name}]: No internet access - check your network connection`)
			local var224
		end
		if pcall_result1 == false and (string.find(pcall_result2_2, "403", 1, true) ~= nil or string.find(pcall_result2_2, "must publish", 1, true) ~= nil or var223 == true) then
			if var223 == true then
				var224 = "NoInternet"
			else
				var224 = "NoAccess"
			end
			print(`[{script.Name}]: Roblox API services unavailable - data will not be saved`)
		else
			var224 = "Access"
			print(`[{script.Name}]: Roblox API services available - data will be saved`)
		end
		var37_upvw = var224
		module_2_upvr.DataStoreState = var224
	end)
else
	var37_upvw = "Access"
	module_2_upvr.DataStoreState = "Access"
end
local var226_upvw = 0
RunService.Heartbeat:Connect(function() -- Line 2115
	--[[ Upvalues[11]:
		[1]: tbl_4_upvr (readonly)
		[2]: var1_upvw (read and write)
		[3]: os_clock_result1_upvw (read and write)
		[4]: var32_upvw (read and write)
		[5]: SaveProfileAsync_upvr (readonly)
		[6]: module_2_upvr (readonly)
		[7]: tbl_3_upvr (readonly)
		[8]: var7_upvw (read and write)
		[9]: var226_upvw (read and write)
		[10]: var9_upvw (read and write)
		[11]: var8_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local const_number = 0
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [11.2]
	-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [69] 59. Error Block 52 start (CF ANALYSIS FAILED)
	if module_2_upvr.IsCriticalState == false then
		if var7_upvw <= #tbl_3_upvr then
			module_2_upvr.IsCriticalState = true
			module_2_upvr.OnCriticalToggle:Fire(true)
			var226_upvw = os.clock()
			warn(`[{script.Name}]: Entered critical state`)
			-- KONSTANTWARNING: GOTO [148] #116
		end
	elseif var7_upvw <= #tbl_3_upvr then
		var226_upvw = os.clock()
	elseif var9_upvw < os.clock() - var226_upvw then
		module_2_upvr.IsCriticalState = false
		module_2_upvr.OnCriticalToggle:Fire(false)
		warn(`[{script.Name}]: Critical state ended`)
	end
	-- KONSTANTERROR: [69] 59. Error Block 52 end (CF ANALYSIS FAILED)
end)
task.spawn(function() -- Line 2191
	--[[ Upvalues[6]:
		[1]: var37_upvw (read and write)
		[2]: module_2_upvr (readonly)
		[3]: tbl_4_upvr (readonly)
		[4]: SaveProfileAsync_upvr (readonly)
		[5]: var34_upvw (read and write)
		[6]: var35_upvw (read and write)
	]]
	while var37_upvw == "NotReady" do
		task.wait()
	end
	if var37_upvw ~= "Access" then
		game:BindToClose(function() -- Line 2199
			--[[ Upvalues[1]:
				[1]: module_2_upvr (copied, readonly)
			]]
			module_2_upvr.IsClosing = true
			task.wait()
		end)
	else
		game:BindToClose(function() -- Line 2208
			--[[ Upvalues[5]:
				[1]: module_2_upvr (copied, readonly)
				[2]: tbl_4_upvr (copied, readonly)
				[3]: SaveProfileAsync_upvr (copied, readonly)
				[4]: var34_upvw (copied, read and write)
				[5]: var35_upvw (copied, read and write)
			]]
			module_2_upvr.IsClosing = true
			local tbl_10 = {}
			local var243_upvw
			for i_5, v_5 in ipairs(tbl_4_upvr) do
				tbl_10[i_5] = v_5
			end
			for _, v_6_upvr in ipairs(tbl_10) do
				if v_6_upvr:IsActive() == true then
					var243_upvw += 1
					task.spawn(function() -- Line 2225
						--[[ Upvalues[3]:
							[1]: SaveProfileAsync_upvr (copied, readonly)
							[2]: v_6_upvr (readonly)
							[3]: var243_upvw (read and write)
						]]
						SaveProfileAsync_upvr(v_6_upvr, true, nil, "Shutdown")
						var243_upvw -= 1
					end)
				end
			end
			while not (0 < var243_upvw or 0 < var34_upvw or 0 >= var35_upvw) do
				task.wait()
			end
		end)
	end
end)
return module_2_upvr