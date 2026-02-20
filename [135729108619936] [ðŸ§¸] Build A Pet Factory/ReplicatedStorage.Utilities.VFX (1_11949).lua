-- Name: VFX
-- Path: game:GetService("ReplicatedStorage").Utilities.VFX
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.6584918999997171 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:39
-- Luau version 6, Types version 3
-- Time taken: 0.002800 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_upvr = {}
local any_GetScale_result1_upvr = script.PetPackage:GetScale()
local function GetPackage_upvr() -- Line 19, Named "GetPackage"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: any_GetScale_result1_upvr (readonly)
	]]
	for i, v in ipairs(tbl_upvr) do
		if not v.Parent then
			v:ScaleTo(any_GetScale_result1_upvr)
			return v
		end
	end
	if #tbl_upvr < 16 then
		local clone = script.PetPackage:Clone()
		i = clone
		table.insert(tbl_upvr, i)
		return clone
	end
	return nil
end
local tbl_upvr_2 = {}
local Temporary_upvr = workspace.Temporary
local BezierCurve_upvr = require(ReplicatedStorage.Utilities.BezierCurve)
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
function tbl_upvr_2.FlyingPackages(arg1) -- Line 40
	--[[ Upvalues[4]:
		[1]: GetPackage_upvr (readonly)
		[2]: Temporary_upvr (readonly)
		[3]: BezierCurve_upvr (readonly)
		[4]: PlaySound_upvr (readonly)
	]]
	local StartPosition_upvr = arg1.StartPosition
	local GoalPosition_upvr = arg1.GoalPosition
	local minimum_upvr = math.min(arg1.Amount, 16)
	local var19_upvr = StartPosition_upvr + (GoalPosition_upvr - StartPosition_upvr).Unit * 3 + Vector3.new(0, 12, 0)
	task.spawn(function() -- Line 46
		--[[ Upvalues[8]:
			[1]: minimum_upvr (readonly)
			[2]: GetPackage_upvr (copied, readonly)
			[3]: StartPosition_upvr (readonly)
			[4]: Temporary_upvr (copied, readonly)
			[5]: BezierCurve_upvr (copied, readonly)
			[6]: var19_upvr (readonly)
			[7]: GoalPosition_upvr (readonly)
			[8]: PlaySound_upvr (copied, readonly)
		]]
		for i_2 = 1, minimum_upvr do
			local GetPackage_result1_upvr = GetPackage_upvr()
			if GetPackage_result1_upvr then
				GetPackage_result1_upvr:SetPrimaryPartCFrame(CFrame.new(StartPosition_upvr))
				GetPackage_result1_upvr.Parent = Temporary_upvr.Packages
				local any_new_result1_upvr = BezierCurve_upvr.new(GetPackage_result1_upvr, 0.6, {StartPosition_upvr, var19_upvr, GoalPosition_upvr}, "OutQuad", {
					RotationCount = 1;
					ModelScale = 0.1;
				})
				any_new_result1_upvr:Play()
				PlaySound_upvr("Package", 1 + i_2 * 0.025, GetPackage_result1_upvr)
				any_new_result1_upvr.Completed.Event:Connect(function() -- Line 70
					--[[ Upvalues[2]:
						[1]: GetPackage_result1_upvr (readonly)
						[2]: any_new_result1_upvr (readonly)
					]]
					GetPackage_result1_upvr.Parent = nil
					any_new_result1_upvr:Destroy()
				end)
				task.wait(0.1)
			end
		end
	end)
end
return function(arg1, ...) -- Line 83
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local var27 = tbl_upvr_2[arg1]
	if var27 then
		var27(...)
	end
end