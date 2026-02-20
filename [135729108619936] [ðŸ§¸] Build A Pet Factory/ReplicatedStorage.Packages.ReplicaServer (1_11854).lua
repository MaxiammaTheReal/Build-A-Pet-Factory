-- Name: ReplicaServer
-- Path: game:GetService("ReplicatedStorage").Packages.ReplicaServer
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.9675174999993033 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:10
-- Luau version 6, Types version 3
-- Time taken: 0.061030 seconds

local ReplicaShared = game.ReplicatedStorage.Packages.ReplicaShared
local Remote = require(ReplicaShared.Remote)
local Signal_upvr = require(ReplicaShared.Signal)
local tbl_13_upvr = {}
local Players_upvr = game:GetService("Players")
local tbl_10_upvr = {}
local tbl_7_upvr = {}
local tbl_11_upvr = {}
local tbl_upvr_3 = {}
local tbl_14_upvr = {}
local any_New_result1_upvr_4 = Remote.New("ReplicaRequestData")
local any_New_result1_upvr_6 = Remote.New("ReplicaSignal")
local any_New_result1_upvr_7 = Remote.New("ReplicaCreate")
local any_New_result1_upvr_2 = Remote.New("ReplicaDestroy")
local any_New_result1_upvr_3 = Remote.New("ReplicaSignalUnreliable", true)
local var18_upvw = false
local tbl_5_upvr = {}
local NumberValue_upvr = Instance.new("NumberValue")
NumberValue_upvr.Name = "ReplicaBind"
game:GetService("CollectionService"):AddTag(NumberValue_upvr, "REPLICA")
local function IterateGroup_upvr(arg1, arg2) -- Line 142, Named "IterateGroup"
	--[[ Upvalues[1]:
		[1]: IterateGroup_upvr (readonly)
	]]
	arg2(arg1)
	for i in pairs(arg1.Children) do
		IterateGroup_upvr(i, arg2)
	end
end
local tbl_upvr_2 = {}
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local function LoadWriteLib_upvr(arg1) -- Line 149, Named "LoadWriteLib"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_2 (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var43 = tbl_upvr_2[arg1]
	if var43 ~= nil then
		return var43
	end
	if typeof(arg1) ~= "Instance" or arg1:IsA("ModuleScript") ~= true then
		error(`[{script.Name}]: "WriteLib" is not a ModuleScript`)
	elseif arg1:IsDescendantOf(ReplicatedStorage_upvr) == false then
		error(`[{script.Name}]: "WriteLib" module must be a descendant of ReplicatedStorage`)
	end
	local arg1 = require(arg1)
	if type(arg1) ~= "table" then
		error(`[{script.Name}]: A "WriteLib" ModuleScript must return a table`)
	end
	local tbl_12 = {}
	for i_2, v in pairs(arg1) do
		if type(i_2) ~= "string" then
			error(`[{script.Name}]: "WriteLib" table keys must be strings`)
		elseif type(v) ~= "function" then
			error(`[{script.Name}]: "WriteLib" table values must be functions`)
		end
		table.insert(tbl_12, {i_2, v})
	end
	table.sort(tbl_12, function(arg1_2, arg2) -- Line 180
		local var51
		if arg1_2[1] >= arg2[1] then
			var51 = false
		else
			var51 = true
		end
		return var51
	end)
	local tbl_2 = {}
	for i_3, v_2 in ipairs(tbl_12) do
		local tbl_9 = {
			Id = i_3;
			fn = v_2[2];
		}
		tbl_2[v_2[1]] = tbl_9
		tbl_2[i_3] = tbl_9
		local var57
	end
	tbl_upvr_2[arg1] = var57
	return var57
end
function GenerateCreation(arg1) -- Line 198
	--[[ Upvalues[1]:
		[1]: IterateGroup_upvr (readonly)
	]]
	local tbl_4_upvr = {}
	local tbl_6_upvr = {}
	local function var62(arg1_3) -- Line 201
		--[[ Upvalues[2]:
			[1]: tbl_6_upvr (readonly)
			[2]: tbl_4_upvr (readonly)
		]]
		local self_creation = arg1_3.self_creation
		local var64
		if arg1_3.Parent == nil then
			var64 = 0
		else
			var64 = arg1_3.Parent.Id
		end
		self_creation[4] = var64
		var64 = tbl_6_upvr
		var64[tostring(arg1_3.Id)] = self_creation
		var64 = tbl_6_upvr
		arg1_3.creation = var64
		var64 = tbl_4_upvr
		arg1_3.replication = var64
	end
	local self_creation_4 = arg1.self_creation
	local var66
	if arg1.Parent == nil then
		var66 = 0
	else
		var66 = arg1.Parent.Id
	end
	self_creation_4[4] = var66
	var66 = tostring(arg1.Id)
	tbl_6_upvr[var66] = self_creation_4
	arg1.creation = tbl_6_upvr
	arg1.replication = tbl_4_upvr
	var66 = arg1.Children
	for i_4 in pairs(var66) do
		IterateGroup_upvr(i_4, var62)
	end
end
local module_upvr = {
	ReadyPlayers = tbl_10_upvr;
	NewReadyPlayer = Signal_upvr.New();
	RemovingReadyPlayer = Signal_upvr.New();
}
module_upvr.__index = module_upvr
local tbl_3_upvr = {}
tbl_3_upvr.__index = tbl_3_upvr
local tbl_15_upvr = {}
tbl_15_upvr.__index = tbl_15_upvr
local tbl_upvr = {}
function module_upvr.Token(arg1) -- Line 256
	--[[ Upvalues[3]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: tbl_5_upvr (readonly)
	]]
	if type(arg1) ~= "string" then
		error(`[{script.Name}]: name must be a string`)
	end
	if tbl_upvr[arg1] == true then
		error(`[{script.Name}]: Token "{arg1}" duplicate`)
	end
	tbl_upvr[arg1] = true
	local tbl = {}
	tbl.Name = arg1
	local setmetatable_result1 = setmetatable(tbl, tbl_3_upvr)
	tbl_5_upvr[setmetatable_result1] = true
	return setmetatable_result1
end
local var76_upvw = 0
local Maid_upvr = require(ReplicaShared.Maid)
function module_upvr.New(arg1) -- Line 278
	--[[ Upvalues[8]:
		[1]: tbl_5_upvr (readonly)
		[2]: LoadWriteLib_upvr (readonly)
		[3]: var76_upvw (read and write)
		[4]: Signal_upvr (readonly)
		[5]: Maid_upvr (readonly)
		[6]: tbl_13_upvr (readonly)
		[7]: module_upvr (readonly)
		[8]: tbl_7_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Token_2 = arg1.Token
	local var79
	if not var79 then
		var79 = {}
	end
	local Data_4 = arg1.Data
	if not Data_4 then
		Data_4 = {}
	end
	if tbl_5_upvr[Token_2] == nil then
		error(`[{script.Name}]: "Token" is not valid ({tostring(Token_2)})`)
	elseif type(var79) ~= "table" then
		error(`[{script.Name}]: "Tags" is not a table`)
	elseif type(Data_4) ~= "table" then
		error(`[{script.Name}]: "Data" is not a table`)
	elseif var79.Bind ~= nil then
		error(`[{script.Name}]: "Tags.Bind" key is reserved`)
	end
	if arg1.WriteLib ~= nil then
	end
	var76_upvw += 1
	local setmetatable_result1_2 = setmetatable({
		Tags = var79;
		Data = Data_4;
		Id = var76_upvw;
		Token = Token_2.Name;
		Parent = nil;
		Children = {};
		BoundInstance = nil;
		OnServerEvent = Signal_upvr.New();
		Maid = Maid_upvr.New(tbl_13_upvr);
		self_creation = {Token_2.Name, var79, Data_4, 0, arg1.WriteLib};
		creation = nil;
		replication = nil;
		write_lib = LoadWriteLib_upvr(arg1.WriteLib);
		write_lib_module = arg1.WriteLib;
		bind_value = nil;
	}, module_upvr)
	tbl_7_upvr[var76_upvw] = setmetatable_result1_2
	return setmetatable_result1_2
end
function module_upvr.FromId(arg1) -- Line 328
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	return tbl_7_upvr[arg1]
end
function module_upvr.Test() -- Line 332
	--[[ Upvalues[4]:
		[1]: tbl_7_upvr (readonly)
		[2]: tbl_11_upvr (readonly)
		[3]: tbl_upvr_3 (readonly)
		[4]: tbl_14_upvr (readonly)
	]]
	return {
		Replicas = tbl_7_upvr;
		TopReplicas = tbl_11_upvr;
		ReplicationAllReplicas = tbl_upvr_3;
		SelectiveSubscriptions = tbl_14_upvr;
	}
end
local any_New_result1_upvr_12 = Remote.New("ReplicaSet")
function module_upvr.Set(arg1, arg2, arg3) -- Line 341
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_12 (readonly)
	]]
	local Data_5 = arg1.Data
	for i_5 = 1, #arg2 - 1 do
		Data_5 = Data_5[arg2[i_5]]
	end
	Data_5[arg2[#arg2]] = arg3
	if var18_upvw == false and arg1.replication ~= nil then
		i_5 = arg1.replication
		if i_5.ALL == true then
			i_5 = tbl_10_upvr
			local pairs_result1_23, pairs_result2, pairs_result3_7 = pairs(i_5)
			for i_6 in pairs_result1_23, pairs_result2, pairs_result3_7 do
				any_New_result1_upvr_12:FireClient(i_6, arg1.Id, arg2, arg3)
			end
			return
		end
		pairs_result2 = arg1.replication
		for i_7 in pairs(pairs_result2) do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			any_New_result1_upvr_12:FireClient(i_7, arg1.Id, arg2, arg3)
		end
	end
end
local any_New_result1_upvr_11 = Remote.New("ReplicaSetValues")
function module_upvr.SetValues(arg1, arg2, arg3) -- Line 370
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_11 (readonly)
	]]
	local Data_3 = arg1.Data
	for _, v_3 in ipairs(arg2) do
		Data_3 = Data_3[v_3]
	end
	for i_9, v_4 in pairs(arg3) do
		Data_3[i_9] = v_4
	end
	if var18_upvw == false and arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_10 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_11:FireClient(i_10, arg1.Id, arg2, arg3)
			end
			return
		end
		for i_11 in pairs(arg1.replication) do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			any_New_result1_upvr_11:FireClient(i_11, arg1.Id, arg2, arg3)
		end
	end
end
local any_New_result1_upvr_10 = Remote.New("ReplicaTableInsert")
function module_upvr.TableInsert(arg1, arg2, arg3, arg4) -- Line 401
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_10 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Data_2 = arg1.Data
	for i_12, v_5 in ipairs(arg2) do
		Data_2 = Data_2[v_5]
	end
	if arg4 ~= nil then
		i_12 = arg3
		table.insert(Data_2, arg4, i_12)
	else
		table.insert(Data_2, arg3)
	end
	if var18_upvw == false and arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_13 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_10:FireClient(i_13, arg1.Id, arg2, arg3, arg4)
			end
		else
			for i_14 in pairs(arg1.replication) do
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				any_New_result1_upvr_10:FireClient(i_14, arg1.Id, arg2, arg3, arg4)
			end
		end
	end
	if not arg4 then
	end
	return #Data_2
end
local any_New_result1_upvr_5 = Remote.New("ReplicaTableRemove")
function module_upvr.TableRemove(arg1, arg2, arg3) -- Line 436
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_5 (readonly)
	]]
	local Data = arg1.Data
	for i_15, v_6 in ipairs(arg2) do
		Data = Data[v_6]
	end
	if var18_upvw == false and arg1.replication ~= nil then
		i_15 = arg1.replication
		if i_15.ALL == true then
			i_15 = tbl_10_upvr
			local pairs_result1_18, pairs_result2_20, pairs_result3_3 = pairs(i_15)
			for i_16 in pairs_result1_18, pairs_result2_20, pairs_result3_3 do
				any_New_result1_upvr_5:FireClient(i_16, arg1.Id, arg2, arg3)
			end
			return table.remove(Data, arg3)
		end
		pairs_result2_20 = arg1.replication
		for i_17 in pairs(pairs_result2_20) do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			any_New_result1_upvr_5:FireClient(i_17, arg1.Id, arg2, arg3)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return table.remove(Data, arg3)
end
local any_New_result1_upvr_13 = Remote.New("ReplicaWrite")
function module_upvr.Write(arg1, arg2, ...) -- Line 467
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_13 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var180 = arg1.write_lib[arg2]
	if var18_upvw == true then
		return var180.fn(arg1, ...)
	end
	var18_upvw = true
	local packed = table.pack(pcall(var180.fn, arg1, ...))
	var18_upvw = false
	if packed[1] ~= true then
		error(`[{script.Name}]: (WriteLib) `..tostring(packed[2]))
	end
	table.remove(packed, 1)
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_18 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_13:FireClient(i_18, arg1.Id, var180.Id, ...)
				local var185
			end
		else
			for i_19 in pairs(arg1.replication) do
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				any_New_result1_upvr_13:FireClient(i_19, var185, var180.Id, ...)
				local _
			end
		end
	end
	return table.unpack(packed)
end
function module_upvr.FireClient(arg1, arg2, ...) -- Line 508
	--[[ Upvalues[2]:
		[1]: tbl_10_upvr (readonly)
		[2]: any_New_result1_upvr_6 (readonly)
	]]
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true and tbl_10_upvr[arg2] == true or arg1.replication[arg2] ~= nil then
			any_New_result1_upvr_6:FireClient(arg2, arg1.Id, ...)
		end
	end
end
function module_upvr.FireAllClients(arg1, ...) -- Line 516
	--[[ Upvalues[2]:
		[1]: tbl_10_upvr (readonly)
		[2]: any_New_result1_upvr_6 (readonly)
	]]
	local Id_3 = arg1.Id
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_20 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_6:FireClient(i_20, Id_3, ...)
			end
			return
		end
		for i_21 in pairs(arg1.replication) do
			any_New_result1_upvr_6:FireClient(i_21, Id_3, ...)
		end
	end
end
function module_upvr.UFireClient(arg1, arg2, ...) -- Line 531
	--[[ Upvalues[2]:
		[1]: tbl_10_upvr (readonly)
		[2]: any_New_result1_upvr_3 (readonly)
	]]
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true and tbl_10_upvr[arg2] == true or arg1.replication[arg2] ~= nil then
			any_New_result1_upvr_3:FireClient(arg2, arg1.Id, ...)
		end
	end
end
function module_upvr.UFireAllClients(arg1, ...) -- Line 539
	--[[ Upvalues[2]:
		[1]: tbl_10_upvr (readonly)
		[2]: any_New_result1_upvr_3 (readonly)
	]]
	local Id = arg1.Id
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_22 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_3:FireClient(i_22, Id, ...)
			end
			return
		end
		for i_23 in pairs(arg1.replication) do
			any_New_result1_upvr_3:FireClient(i_23, Id, ...)
		end
	end
end
local tbl_8_upvr = {}
local any_New_result1_upvr_8 = Remote.New("ReplicaParent")
function module_upvr.SetParent(arg1, arg2) -- Line 554
	--[[ Upvalues[9]:
		[1]: module_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: tbl_11_upvr (readonly)
		[4]: IterateGroup_upvr (readonly)
		[5]: tbl_8_upvr (readonly)
		[6]: tbl_10_upvr (readonly)
		[7]: any_New_result1_upvr_2 (readonly)
		[8]: any_New_result1_upvr_8 (readonly)
		[9]: any_New_result1_upvr_7 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg2) ~= "table" or getmetatable(arg2) ~= module_upvr then
		error(`[{script.Name}]: new_parent is not a Replica ({tostring(arg2)})`)
	elseif tbl_7_upvr[arg2.Id] == nil then
		error(`[{script.Name}]: Can't set destroyed Replica as parent`)
	end
	if tbl_11_upvr[arg1] ~= nil then
		error(`[{script.Name}]: Can't change parent for top level Replica`)
	end
	if arg1.BoundInstance ~= nil then
		error(`[{script.Name}]: Can't change parent for bound Replica`)
	end
	local var230 = arg2
	while var230 ~= nil do
		if var230.Parent == arg1 then
			error(`[{script.Name}]: Can't set descendant Replica as parent`)
		end
	end
	local Parent_upvr = arg1.Parent
	if Parent_upvr == arg2 then
	else
		arg1.Parent = arg2
		if Parent_upvr ~= nil then
			Parent_upvr.Children[arg1] = nil
		end
		arg2.Children[arg1] = true
		local function var232(arg1_4) -- Line 601
			--[[ Upvalues[2]:
				[1]: Parent_upvr (readonly)
				[2]: arg2 (readonly)
			]]
			local tostring_result1_3 = tostring(arg1_4.Id)
			if Parent_upvr ~= nil and Parent_upvr.creation ~= nil then
				Parent_upvr.creation[tostring_result1_3] = nil
			end
			if arg2.creation ~= nil then
				local self_creation_3 = arg1_4.self_creation
				self_creation_3[4] = arg1_4.Parent.Id
				arg2.creation[tostring_result1_3] = self_creation_3
			end
			arg1_4.creation = arg2.creation
			arg1_4.replication = arg2.replication
		end
		local tostring_result1_2 = tostring(arg1.Id)
		local var236
		if Parent_upvr ~= nil and Parent_upvr.creation ~= nil then
			var236 = nil
			Parent_upvr.creation[tostring_result1_2] = var236
		end
		if arg2.creation ~= nil then
			local self_creation_2 = arg1.self_creation
			var236 = arg1.Parent.Id
			self_creation_2[4] = var236
			var236 = arg2.creation
			var236[tostring_result1_2] = self_creation_2
		end
		arg1.creation = arg2.creation
		arg1.replication = arg2.replication
		local pairs_result1_21, pairs_result2_14, pairs_result3 = pairs(arg1.Children)
		for i_30 in pairs_result1_21, pairs_result2_14, pairs_result3 do
			IterateGroup_upvr(i_30, var232)
		end
		local creation_upvr = arg2.creation
		pairs_result3 = tbl_8_upvr
		if Parent_upvr ~= nil and Parent_upvr.replication ~= nil then
			if Parent_upvr.replication.ALL == true then
				pairs_result3 = tbl_10_upvr
			else
				pairs_result3 = Parent_upvr.replication
			end
		end
		local var242
		if arg2 ~= nil and arg2.replication ~= nil then
			if arg2.replication.ALL == true then
				var242 = tbl_10_upvr
			else
				var242 = arg2.replication
			end
		end
		if Parent_upvr ~= nil and Parent_upvr.replication ~= nil and arg2.replication ~= Parent_upvr.replication and var242 ~= tbl_10_upvr then
			for i_31 in pairs(pairs_result3) do
				if var242[i_31] == nil then
					any_New_result1_upvr_2:FireClient(i_31, arg1.Id)
				end
			end
		end
		if arg2.replication ~= nil then
			for i_32 in pairs(var242) do
				if pairs_result3[i_32] == true then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					any_New_result1_upvr_8:FireClient(i_32, arg1.Id, arg2.Id)
				else
					if nil == nil then
						local tbl_upvw = {}
						local tostring_result1 = tostring(arg1.Id)
						tbl_upvw[tostring_result1] = creation_upvr[tostring_result1]
						for i_33 in pairs(arg1.Children) do
							IterateGroup_upvr(i_33, function(arg1_5) -- Line 668
								--[[ Upvalues[2]:
									[1]: tbl_upvw (read and write)
									[2]: creation_upvr (readonly)
								]]
								local tostring_result1_4 = tostring(arg1_5.Id)
								tbl_upvw[tostring_result1_4] = creation_upvr[tostring_result1_4]
							end)
							local _
						end
					end
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					any_New_result1_upvr_7:FireClient(i_32, tbl_upvw, arg1.Id)
				end
			end
		end
	end
end
local any_New_result1_upvr_9 = Remote.New("ReplicaBind")
function module_upvr.BindToInstance(arg1, arg2) -- Line 682
	--[[ Upvalues[3]:
		[1]: NumberValue_upvr (readonly)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_9 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if typeof(arg2) ~= "Instance" then
		error(`[{script.Name}]: "instance" argument is not an Instance ({tostring(arg2)})`)
	end
	if arg1.Parent ~= nil then
		error(`[{script.Name}]: Can't bind Replica parented to another Replica`)
	end
	if arg1.BoundInstance ~= nil then
		error(`[{script.Name}]: Can't change Replica bind to another Instance`)
	end
	if arg2:IsA("Model") == true and (arg2.ModelStreamingMode == Enum.ModelStreamingMode.Default or arg2.ModelStreamingMode == Enum.ModelStreamingMode.Nonatomic) then
		warn(`[{script.Name}]: Bound Replica to a model that has inproper "ModelStreamingMode" setup; Traceback:\n`..debug.traceback())
	end
	local clone = NumberValue_upvr:Clone()
	clone.Value = arg1.Id
	arg1.Tags.Bind = true
	arg1.BoundInstance = arg2
	arg1.bind_value = clone
	clone.Parent = arg2
	if arg1.replication ~= nil then
		if arg1.replication.ALL == true then
			for i_24 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_9:FireClient(i_24, arg1.Id)
				local var270
			end
			return
		end
		for i_25 in pairs(arg1.replication) do
			any_New_result1_upvr_9:FireClient(i_25, var270)
			local _
		end
	end
end
function module_upvr.Replicate(arg1) -- Line 724
	--[[ Upvalues[5]:
		[1]: tbl_11_upvr (readonly)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_7 (readonly)
		[4]: tbl_14_upvr (readonly)
		[5]: tbl_upvr_3 (readonly)
	]]
	if arg1.Parent ~= nil then
		error(`[{script.Name}]: Can't selectively replicate Replica parented to another Replica`)
	end
	if arg1.creation == nil then
		GenerateCreation(arg1)
		tbl_11_upvr[arg1] = true
	elseif arg1.replication.ALL == true then
		return
	end
	local replication_4 = arg1.replication
	for i_26 in pairs(tbl_10_upvr) do
		if replication_4[i_26] == nil then
			any_New_result1_upvr_7:FireClient(i_26, arg1.creation)
		else
			tbl_14_upvr[i_26][arg1] = nil
		end
	end
	table.clear(replication_4)
	replication_4.ALL = true
	tbl_upvr_3[arg1] = true
end
function module_upvr.DontReplicate(arg1) -- Line 755
	--[[ Upvalues[4]:
		[1]: tbl_upvr_3 (readonly)
		[2]: tbl_10_upvr (readonly)
		[3]: any_New_result1_upvr_2 (readonly)
		[4]: tbl_14_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg1.Parent ~= nil then
		error(`[{script.Name}]: Can't selectively replicate Replica parented to another Replica`)
	end
	local replication_3 = arg1.replication
	if replication_3 == nil or next(replication_3) == nil then
	else
		tbl_upvr_3[arg1] = nil
		if replication_3.ALL == true then
			for i_34 in pairs(tbl_10_upvr) do
				any_New_result1_upvr_2:FireClient(i_34, arg1.Id)
				local var292
			end
		else
			for i_35 in pairs(replication_3) do
				any_New_result1_upvr_2:FireClient(i_35, var292)
				tbl_14_upvr[i_35][arg1] = nil
				local _
			end
		end
		table.clear(replication_3)
	end
end
function module_upvr.Subscribe(arg1, arg2) -- Line 786
	--[[ Upvalues[4]:
		[1]: tbl_11_upvr (readonly)
		[2]: tbl_10_upvr (readonly)
		[3]: tbl_14_upvr (readonly)
		[4]: any_New_result1_upvr_7 (readonly)
	]]
	if arg1.Parent ~= nil then
		error(`[{script.Name}]: Can't selectively replicate Replica parented to another Replica`)
	end
	if arg1.creation == nil then
		GenerateCreation(arg1)
		tbl_11_upvr[arg1] = true
	elseif arg1.replication.ALL == true then
		error(`[{script.Name}]: "Subscribe()" is locked after calling "Replicate()"`)
	end
	if tbl_10_upvr[arg2] == nil then
		warn(`[{script.Name}]: Called "Subscribe()" on a non-ready player; Traceback:\n`..debug.traceback())
	else
		local replication = arg1.replication
		if replication[arg2] ~= nil then return end
		replication[arg2] = true
		tbl_14_upvr[arg2][arg1] = true
		any_New_result1_upvr_7:FireClient(arg2, arg1.creation)
	end
end
function module_upvr.Unsubscribe(arg1, arg2) -- Line 817
	--[[ Upvalues[2]:
		[1]: tbl_14_upvr (readonly)
		[2]: any_New_result1_upvr_2 (readonly)
	]]
	if arg1.Parent ~= nil then
		error(`[{script.Name}]: Can't selectively replicate Replica parented to another Replica`)
	end
	local replication_2 = arg1.replication
	if replication_2 == nil then
	else
		if replication_2.ALL == true then
			error(`[{script.Name}]: "Unsubscribe()" is locked after calling "Replicate()"`)
		end
		if replication_2[arg2] ~= nil then
			replication_2[arg2] = nil
			tbl_14_upvr[arg2][arg1] = nil
			any_New_result1_upvr_2:FireClient(arg2, arg1.Id)
		end
	end
end
function module_upvr.Identify(arg1) -- Line 841
	local var306
	for i_27, v_7 in pairs(arg1.Tags) do
		local var307
		if true == true then
			var307 = ""
		else
			var307 = ';'
		end
		var306 = var306..`{var307}{tostring(i_27)}={tostring(v_7)}`
	end
	return `[Id:{arg1.Id};Token:{arg1.Token};Tags:{{var306}}]`
end
function module_upvr.IsActive(arg1) -- Line 851
	return arg1.Maid:IsActive()
end
local function DestroyReplica_upvr(arg1) -- Line 855, Named "DestroyReplica"
	--[[ Upvalues[4]:
		[1]: DestroyReplica_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: tbl_13_upvr (readonly)
		[4]: tbl_15_upvr (readonly)
	]]
	for i_28 in pairs(arg1.Children) do
		DestroyReplica_upvr(i_28)
	end
	local Id_4 = arg1.Id
	tbl_7_upvr[Id_4] = nil
	arg1.Maid:Unlock(tbl_13_upvr)
	arg1.Maid:Cleanup()
	if arg1.BoundInstance ~= nil then
		arg1.BoundInstance = nil
		arg1.bind_value:Destroy()
		arg1.bind_value = nil
	end
	if arg1.creation ~= nil then
		arg1.creation[tostring(Id_4)] = nil
	end
	setmetatable(arg1, tbl_15_upvr)
end
function module_upvr.Destroy(arg1) -- Line 881
	--[[ Upvalues[7]:
		[1]: tbl_7_upvr (readonly)
		[2]: tbl_11_upvr (readonly)
		[3]: tbl_10_upvr (readonly)
		[4]: any_New_result1_upvr_2 (readonly)
		[5]: tbl_14_upvr (readonly)
		[6]: tbl_upvr_3 (readonly)
		[7]: DestroyReplica_upvr (readonly)
	]]
	local Id_2 = arg1.Id
	local var318
	if var318 == nil then
	else
		if tbl_11_upvr[arg1] ~= true then
			var318 = false
		else
			var318 = true
		end
		if arg1.replication ~= nil then
			if arg1.replication.ALL == true then
				for i_36 in pairs(tbl_10_upvr) do
					any_New_result1_upvr_2:FireClient(i_36, Id_2)
				end
			else
				for i_37 in pairs(arg1.replication) do
					any_New_result1_upvr_2:FireClient(i_37, Id_2)
					if var318 == true then
						tbl_14_upvr[i_37][arg1] = nil
					end
				end
			end
		end
		tbl_11_upvr[arg1] = nil
		tbl_upvr_3[arg1] = nil
		if arg1.Parent ~= nil then
			arg1.Parent.Children[arg1] = nil
		end
		DestroyReplica_upvr(arg1)
	end
end
for i_29_upvr, v_8 in pairs(module_upvr) do
	if i_29_upvr ~= "__index" then
		if ({
			Identify = true;
			Destroy = true;
		})[i_29_upvr] == true then
			tbl_15_upvr[i_29_upvr] = v_8
		else
			tbl_15_upvr[i_29_upvr] = function(arg1) -- Line 937
				--[[ Upvalues[1]:
					[1]: i_29_upvr (readonly)
				]]
				error(`[{script.Name}]: Tried to call method "{i_29_upvr}" for a destroyed replica; {arg1:Identify()}`)
			end
		end
	end
end
any_New_result1_upvr_4.OnServerEvent:Connect(function(arg1) -- Line 948
	--[[ Upvalues[7]:
		[1]: tbl_10_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: tbl_upvr_3 (readonly)
		[4]: any_New_result1_upvr_7 (readonly)
		[5]: any_New_result1_upvr_4 (readonly)
		[6]: tbl_14_upvr (readonly)
		[7]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if tbl_10_upvr[arg1] ~= nil and arg1:IsDescendantOf(Players_upvr) == true then
	else
		for i_38 in pairs(tbl_upvr_3) do
			table.insert({}, i_38.creation)
			local var339
		end
		any_New_result1_upvr_7:FireClient(arg1, var339)
		any_New_result1_upvr_4:FireClient(arg1)
		tbl_10_upvr[arg1] = true
		tbl_14_upvr[arg1] = {}
		module_upvr.NewReadyPlayer:Fire(arg1)
	end
end)
local any_New_result1_upvr = require(ReplicaShared.RateLimit).New(120)
local function RemoteSignalHandle(arg1, arg2, ...) -- Line 976
	--[[ Upvalues[3]:
		[1]: tbl_10_upvr (readonly)
		[2]: any_New_result1_upvr (readonly)
		[3]: tbl_7_upvr (readonly)
	]]
	if tbl_10_upvr[arg1] == nil or any_New_result1_upvr:CheckRate(arg1) == false or type(arg2) ~= "number" then
	else
		local var341 = tbl_7_upvr[arg2]
		if var341 ~= nil and var341.replication ~= nil and (var341.replication.ALL == true or var341.replication[arg1] ~= nil) then
			var341.OnServerEvent:Fire(arg1, ...)
		end
	end
end
any_New_result1_upvr_6.OnServerEvent:Connect(RemoteSignalHandle)
any_New_result1_upvr_3.OnServerEvent:Connect(RemoteSignalHandle)
Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 999
	--[[ Upvalues[3]:
		[1]: tbl_10_upvr (readonly)
		[2]: tbl_14_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	if tbl_10_upvr[arg1] == nil then
	else
		for i_39 in pairs(tbl_14_upvr[arg1]) do
			i_39.replication[arg1] = nil
		end
		tbl_10_upvr[arg1] = nil
		tbl_14_upvr[arg1] = nil
		module_upvr.RemovingReadyPlayer:Fire(arg1)
	end
end)
return module_upvr