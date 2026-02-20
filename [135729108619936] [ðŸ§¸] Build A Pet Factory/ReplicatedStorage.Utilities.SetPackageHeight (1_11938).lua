-- Name: SetPackageHeight
-- Path: game:GetService("ReplicatedStorage").Utilities.SetPackageHeight
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5511095999991085 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:29
-- Luau version 6, Types version 3
-- Time taken: 0.001904 seconds

return function(arg1, arg2) -- Line 5
	arg2 += 2
	local var6 = arg2
	if 1000 < var6 then
		var6 = 1000
	end
	local Sides = arg1.Sides
	local Top = arg1.Top
	local PrimaryPart = arg1.Bottom.PrimaryPart
	local CFrame = PrimaryPart.CFrame
	for _, v in Sides:GetChildren() do
		if v:IsA("Part") then
			v.Size = Vector3.new(v.Size.X, var6, v.Size.Z)
		end
	end
	local any_ToObjectSpace_result1 = CFrame:ToObjectSpace(Sides:GetPivot())
	Sides:PivotTo(CFrame * CFrame.new(any_ToObjectSpace_result1.X, PrimaryPart.Position.Y + PrimaryPart.Size.Y / 2 + var6 / 2 - PrimaryPart.Position.Y, any_ToObjectSpace_result1.Z) * (any_ToObjectSpace_result1 - any_ToObjectSpace_result1.Position))
	Top:PivotTo(Top:GetPivot() + Vector3.new(0, var6 - Sides.PrimaryPart.Size.Y, 0))
end