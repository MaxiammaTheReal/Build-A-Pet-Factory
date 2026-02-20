-- Name: RainbowInstances
-- Path: game:GetService("ReplicatedStorage").Utilities.RainbowInstances
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5509631000004447 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:09
-- Luau version 6, Types version 3
-- Time taken: 0.010189 seconds

local CollectionService_upvr = game:GetService("CollectionService")
local RunService_upvr = game:GetService("RunService")
return function() -- Line 5, Named "Setup"
	--[[ Upvalues[2]:
		[1]: CollectionService_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	local tbl_upvr = {}
	local tbl_upvr_2 = {}
	local tbl_upvr_3 = {}
	local function _(arg1) -- Line 16, Named "isValid"
		local var14 = arg1
		if var14 then
			if arg1.Parent == nil then
				var14 = false
			else
				var14 = true
			end
		end
		return var14
	end
	local function isRainbowInstance_upvr(arg1) -- Line 20, Named "isRainbowInstance"
		local children_2 = arg1:IsA("BasePart")
		if not children_2 then
			children_2 = arg1:IsA("TextLabel")
			if not children_2 then
				children_2 = arg1:IsA("TextButton")
				if not children_2 then
					children_2 = arg1:IsA("TextBox")
					if not children_2 then
						children_2 = arg1:IsA("UIStroke")
					end
				end
			end
		end
		return children_2
	end
	local function _(arg1, arg2) -- Line 28, Named "removeFromTable"
		local table_find_result1_4 = table.find(arg1, arg2)
		if table_find_result1_4 then
			table.remove(arg1, table_find_result1_4)
		end
	end
	for _, v in ipairs(CollectionService_upvr:GetTagged("RainbowPet")) do
		if v:IsA("MeshPart") then
			table.insert(tbl_upvr, v)
		end
	end
	for _, v_2 in ipairs(CollectionService_upvr:GetTagged("RainbowInstance")) do
		if isRainbowInstance_upvr(v_2) then
			table.insert(tbl_upvr_2, v_2)
		end
	end
	for _, v_3 in ipairs(CollectionService_upvr:GetTagged("RainbowLight")) do
		if isRainbowInstance_upvr(v_3) then
			table.insert(tbl_upvr_2, v_3)
		end
	end
	for _, v_4 in ipairs(CollectionService_upvr:GetTagged("RainbowDark")) do
		if isRainbowInstance_upvr(v_4) then
			table.insert(tbl_upvr_3, v_4)
		end
	end
	CollectionService_upvr:GetInstanceAddedSignal("RainbowPet"):Connect(function(arg1) -- Line 61
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		if arg1:IsA("MeshPart") then
			table.insert(tbl_upvr, arg1)
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("RainbowPet"):Connect(function(arg1) -- Line 67
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		local var34 = tbl_upvr
		local table_find_result1 = table.find(var34, arg1)
		if table_find_result1 then
			table.remove(var34, table_find_result1)
		end
	end)
	CollectionService_upvr:GetInstanceAddedSignal("RainbowInstance"):Connect(function(arg1) -- Line 71
		--[[ Upvalues[2]:
			[1]: isRainbowInstance_upvr (readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		if isRainbowInstance_upvr(arg1) then
			table.insert(tbl_upvr_2, arg1)
		end
	end)
	CollectionService_upvr:GetInstanceAddedSignal("RainbowLight"):Connect(function(arg1) -- Line 77
		--[[ Upvalues[2]:
			[1]: isRainbowInstance_upvr (readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		if isRainbowInstance_upvr(arg1) then
			table.insert(tbl_upvr_2, arg1)
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("RainbowLight"):Connect(function(arg1) -- Line 83
		--[[ Upvalues[1]:
			[1]: tbl_upvr_2 (readonly)
		]]
		local var39 = tbl_upvr_2
		local table_find_result1_3 = table.find(var39, arg1)
		if table_find_result1_3 then
			table.remove(var39, table_find_result1_3)
		end
	end)
	CollectionService_upvr:GetInstanceAddedSignal("RainbowDark"):Connect(function(arg1) -- Line 87
		--[[ Upvalues[2]:
			[1]: isRainbowInstance_upvr (readonly)
			[2]: tbl_upvr_3 (readonly)
		]]
		if isRainbowInstance_upvr(arg1) then
			table.insert(tbl_upvr_3, arg1)
		end
	end)
	CollectionService_upvr:GetInstanceRemovedSignal("RainbowDark"):Connect(function(arg1) -- Line 93
		--[[ Upvalues[1]:
			[1]: tbl_upvr_3 (readonly)
		]]
		local var43 = tbl_upvr_3
		local table_find_result1_2 = table.find(var43, arg1)
		if table_find_result1_2 then
			table.remove(var43, table_find_result1_2)
		end
	end)
	local function applyColor_upvr(arg1, arg2) -- Line 97, Named "applyColor"
		for i_5 = #arg1, 1, -1 do
			local var47 = arg1[i_5]
			local var48 = var47
			if var48 then
				if var47.Parent == nil then
					var48 = false
				else
					var48 = true
				end
			end
			if not var48 then
				table.remove(arg1, i_5)
			elseif var47:IsA("BasePart") or var47:IsA("UIStroke") then
				var47.Color = arg2
			else
				var47.TextColor3 = arg2
			end
		end
	end
	local var50_upvw = 0
	RunService_upvr.RenderStepped:Connect(function(arg1) -- Line 110
		--[[ Upvalues[5]:
			[1]: var50_upvw (read and write)
			[2]: tbl_upvr (readonly)
			[3]: applyColor_upvr (readonly)
			[4]: tbl_upvr_2 (readonly)
			[5]: tbl_upvr_3 (readonly)
		]]
		var50_upvw = (var50_upvw + 0.25 * arg1) % 1
		for i_6 = #tbl_upvr, 1, -1 do
			local var53 = tbl_upvr[i_6]
			local var54 = var53
			if var54 then
				if var53.Parent == nil then
					var54 = false
				else
					var54 = true
				end
			end
			if not var54 then
				table.remove(tbl_upvr, i_6)
			else
				var53.Color = Color3.fromHSV(var50_upvw, 1, 1)
			end
		end
		applyColor_upvr(tbl_upvr_2, Color3.fromHSV(var50_upvw, 0.75, 1))
		applyColor_upvr(tbl_upvr_3, Color3.fromHSV(var50_upvw, 1, 1))
	end)
end