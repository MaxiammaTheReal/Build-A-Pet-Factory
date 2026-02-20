-- Name: FloatAnimation
-- Path: game:GetService("ReplicatedStorage").Utilities.FloatAnimation
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5669529999995575 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:16
-- Luau version 6, Types version 3
-- Time taken: 0.004324 seconds

local module = {}
local tbl_upvw = {}
local var3_upvw
local var4_upvw = Vector3.new(0, 0, 0)
local function _(arg1) -- Line 7, Named "GetObjectCFrame"
	if arg1:IsA("Model") then
		return arg1:GetPivot()
	end
	return arg1.CFrame
end
local function _(arg1, arg2) -- Line 15, Named "SetNewObjectCFrame"
	if arg1:IsA("Model") then
		arg1:PivotTo(arg2)
	else
		arg1.CFrame = arg2
	end
end
local function updateAnimations_upvr() -- Line 23, Named "updateAnimations"
	--[[ Upvalues[3]:
		[1]: tbl_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: var3_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local pairs_result1, pairs_result2, pairs_result3_2 = pairs(tbl_upvw)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [149] 112. Error Block 20 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [149] 112. Error Block 20 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 35 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [149.6]
	if not nil then
		-- KONSTANTWARNING: GOTO [149] #112
	end
	-- KONSTANTERROR: [10] 8. Error Block 35 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
function module.Start(arg1, arg2, arg3, arg4, arg5) -- Line 63
	--[[ Upvalues[4]:
		[1]: tbl_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: RunService_upvr (readonly)
		[4]: updateAnimations_upvr (readonly)
	]]
	local var9 = arg3
	if not var9 then
		if arg2:IsA("Model") then
			var9 = arg2:GetPivot()
		else
			var9 = arg2.CFrame
		end
	end
	local var10 = var9
	if arg2:IsA("Model") then
		arg2:PivotTo(var10)
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		arg2.CFrame = var10
	end
	local tbl = {
		originalCFrame = var10;
		startTime = workspace:GetServerTimeNow();
		offset = math.random() * math.pi * 2;
		height = 0.4;
		speed = 1;
	}
	tbl.toggleRadius = arg4
	tbl.animationMultiplier = arg5
	tbl_upvw[arg2] = tbl
	if not var3_upvw then
		var3_upvw = RunService_upvr.RenderStepped:Connect(updateAnimations_upvr)
	end
end
function module.Stop(arg1, arg2) -- Line 82
	--[[ Upvalues[1]:
		[1]: tbl_upvw (read and write)
	]]
	if tbl_upvw[arg2] then
		if arg2:IsA("Model") then
			arg2:PivotTo(tbl_upvw[arg2].originalCFrame)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			arg2.CFrame = tbl_upvw[arg2].originalCFrame
		end
		tbl_upvw[arg2] = nil
	end
end
function module.StopAll(arg1) -- Line 89
	--[[ Upvalues[1]:
		[1]: tbl_upvw (read and write)
	]]
	for i, v in pairs(tbl_upvw) do
		if i:IsA("Model") then
			i:PivotTo(v.originalCFrame)
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			i.CFrame = v.originalCFrame
		end
	end
	tbl_upvw = {}
end
function module.UpdatePlayerPosition(arg1, arg2) -- Line 97
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	var4_upvw = arg2
end
return module