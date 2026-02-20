-- Name: Serg_AutomaticList
-- Path: game:GetService("ReplicatedStorage").Utilities.Serg_AutomaticList
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5753112000002147 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:10
-- Luau version 6, Types version 3
-- Time taken: 0.005297 seconds

local tbl_upvr = {}
local module_upvr = {}
module_upvr.__index = module_upvr
local Trove_upvr = require(game:GetService("ReplicatedStorage").Packages.Trove)
function module_upvr.new(arg1, arg2, arg3) -- Line 16
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: Trove_upvr (readonly)
		[3]: tbl_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._Trove = Trove_upvr.new()
	setmetatable_result1.ListUi = arg1
	local var5
	if not var5 then
		var5 = arg1.Name
	end
	setmetatable_result1.ListName = var5
	if arg3 then
		var5 = true
	else
		var5 = false
	end
	setmetatable_result1.IgnoreSizeChanges = var5
	var5 = arg3 or 4
	setmetatable_result1.RowAmount = var5
	var5 = tbl_upvr
	var5[setmetatable_result1.ListName] = setmetatable_result1
	return setmetatable_result1
end
function module_upvr.Update(arg1) -- Line 32
	local var14 = arg1.ListUi.Size.X.Scale / arg1.RowAmount
	local children = arg1.ListUi:GetChildren()
	local var19
	for _, v in pairs(children) do
		if v:IsA("Frame") and v.Visible then
			var19 += 1
		end
	end
	for _, v_2 in pairs(children) do
		if v_2:IsA("Frame") then
			v_2.Size = UDim2.new(var14, 0, var14, 0)
		end
	end
	arg1.ListUi.Size = UDim2.new(arg1.ListUi.Size.X.Scale, 0, (math.ceil(var19 / arg1.RowAmount)) * (var14 * 0.975), 0)
end
function module_upvr.Shrink(arg1) -- Line 60
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	for _, v_3 in pairs(tbl_upvr) do
		if not v_3.IgnoreSizeChanges and v_3.RowAmount ~= 6 then
			v_3.RowAmount = 6
			v_3:Update()
		end
	end
end
function module_upvr.Expand(arg1) -- Line 72
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	for _, v_4 in pairs(tbl_upvr) do
		if not v_4.IgnoreSizeChanges and v_4.RowAmount ~= 4 then
			v_4.RowAmount = 4
			v_4:Update()
		end
	end
end
function module_upvr.GetList(arg1, arg2) -- Line 84
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return tbl_upvr[arg2]
end
function module_upvr.Destroy(arg1) -- Line 88
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr[arg1.ListName] = nil
	arg1._Trove:Destroy()
	setmetatable(arg1, nil)
end
return module_upvr