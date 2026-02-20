-- Name: BezierCurve
-- Path: game:GetService("ReplicatedStorage").Utilities.BezierCurve
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5544404000011127 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:35
-- Luau version 6, Types version 3
-- Time taken: 0.007668 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local function _(arg1, arg2, arg3, arg4) -- Line 7, Named "QuadraticBezier"
	local var2 = 1 - arg1
	return var2 * var2 * arg2 + 2 * var2 * arg1 * arg3 + arg1 * arg1 * arg4
end
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 12, Named "CubicBezier"
	local var3 = 1 - arg1
	return var3 * var3 * var3 * arg2 + 3 * var3 * var3 * arg1 * arg3 + 3 * var3 * arg1 * arg1 * arg4 + arg1 * arg1 * arg1 * arg5
end
local tbl_upvr = {
	Linear = function(arg1) -- Line 18, Named "Linear"
		return arg1
	end;
	InQuad = function(arg1) -- Line 19, Named "InQuad"
		return arg1 * arg1
	end;
	OutQuad = function(arg1) -- Line 20, Named "OutQuad"
		return arg1 * (2 - arg1)
	end;
	InOutQuad = function(arg1) -- Line 21, Named "InOutQuad"
		local var5
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var5 = 2 * arg1 * arg1
			return var5
		end
		if arg1 >= 0.5 or not INLINED() then
			var5 = -1 + (4 - 2 * arg1) * arg1
		end
		return var5
	end;
	InCubic = function(arg1) -- Line 22, Named "InCubic"
		return arg1 * arg1 * arg1
	end;
	OutCubic = function(arg1) -- Line 23, Named "OutCubic"
		return (arg1 - 1) * (arg1 - 1) * (arg1 - 1) + 1
	end;
	InOutCubic = function(arg1) -- Line 24, Named "InOutCubic"
		local var6
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var6 = 4 * arg1 * arg1 * arg1
			return var6
		end
		if arg1 >= 0.5 or not INLINED_2() then
			var6 = (arg1 - 1) * (2 * arg1 - 2) * (2 * arg1 - 2) + 1
		end
		return var6
	end;
}
function module_upvr.new(arg1, arg2, arg3, arg4, arg5) -- Line 27
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.Instance = arg1
	setmetatable_result1.Duration = arg2
	setmetatable_result1.ControlPoints = arg3
	setmetatable_result1.EasingStyle = arg4 or "Linear"
	setmetatable_result1.ElapsedTime = 0
	setmetatable_result1.IsPlaying = false
	setmetatable_result1.Connection = nil
	setmetatable_result1.Completed = Instance.new("BindableEvent")
	setmetatable_result1.IsModel = arg1:IsA("Model")
	if setmetatable_result1.IsModel then
		if not arg1.PrimaryPart then
			warn("Model does not have a PrimaryPart set. Using GetPivot() as fallback.")
		end
		setmetatable_result1.InitialCFrame = arg1:GetPivot()
	else
		setmetatable_result1.InitialCFrame = arg1.CFrame
	end
	local var8 = arg5
	if not var8 then
		var8 = {}
	end
	local var9 = var8
	setmetatable_result1.RotationCount = var9.RotationCount
	setmetatable_result1.ModelScale = var9.ModelScale
	if setmetatable_result1.RotationCount then
		setmetatable_result1.InitialRotation = setmetatable_result1.InitialCFrame - setmetatable_result1.InitialCFrame.Position
		setmetatable_result1.SpinAxis = Vector3.new(math.random(-100, 100) / 100, math.random(-100, 100) / 100, math.random(-100, 100) / 100).Unit
		setmetatable_result1.SpinSpeed = setmetatable_result1.RotationCount / setmetatable_result1.Duration
	end
	if setmetatable_result1.ModelScale and setmetatable_result1.IsModel then
		setmetatable_result1.InitialScale = arg1:GetScale()
		setmetatable_result1.TargetScale = math.clamp(setmetatable_result1.ModelScale, 0.1, 1)
	end
	return setmetatable_result1
end
local RunService_upvr = game:GetService("RunService")
function module_upvr.Play(arg1) -- Line 75
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: RunService_upvr (readonly)
	]]
	if arg1.IsPlaying then
	else
		arg1.IsPlaying = true
		arg1.ElapsedTime = 0
		local var11_upvr = tbl_upvr[arg1.EasingStyle]
		if not var11_upvr then
			var11_upvr = tbl_upvr.Linear
		end
		local len_upvr = #arg1.ControlPoints
		arg1.Connection = RunService_upvr.Heartbeat:Connect(function(arg1_2) -- Line 84
			--[[ Upvalues[3]:
				[1]: arg1 (readonly)
				[2]: len_upvr (readonly)
				[3]: var11_upvr (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			arg1.ElapsedTime += arg1_2
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [15] 11. Error Block 32 start (CF ANALYSIS FAILED)
			if arg1.IsModel then
				arg1.Instance:PivotTo(arg1.InitialCFrame - arg1.InitialCFrame.Position + arg1.ControlPoints[len_upvr])
				if arg1.ModelScale then
					arg1.Instance:ScaleTo(arg1.TargetScale)
					-- KONSTANTWARNING: GOTO [65] #47
				end
			else
				arg1.Instance.Position = arg1.ControlPoints[len_upvr]
			end
			-- KONSTANTERROR: [15] 11. Error Block 32 end (CF ANALYSIS FAILED)
		end)
	end
end
function module_upvr.Stop(arg1) -- Line 144
	arg1.IsPlaying = false
	if arg1.Connection then
		arg1.Connection:Disconnect()
		arg1.Connection = nil
	end
end
function module_upvr.Pause(arg1) -- Line 152
	arg1.IsPlaying = false
	if arg1.Connection then
		arg1.Connection:Disconnect()
		arg1.Connection = nil
	end
end
function module_upvr.Resume(arg1) -- Line 160
	if not arg1.IsPlaying and arg1.ElapsedTime < arg1.Duration then
		arg1:Play()
	end
end
function module_upvr.Destroy(arg1) -- Line 166
	arg1:Stop()
	arg1.Completed:Destroy()
end
return module_upvr