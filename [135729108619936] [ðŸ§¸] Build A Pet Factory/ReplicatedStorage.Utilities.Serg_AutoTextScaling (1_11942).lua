-- Name: Serg_AutoTextScaling
-- Path: game:GetService("ReplicatedStorage").Utilities.Serg_AutoTextScaling
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.554374999999709 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:32
-- Luau version 6, Types version 3
-- Time taken: 0.001136 seconds

local module = {}
local function _(arg1, arg2) -- Line 8, Named "UpdateTextSize"
	arg1.Size = UDim2.new(string.len(arg1.Text) * (arg2 or 0.05), 0, arg1.Size.Y.Scale, 0)
end
function module.Update(arg1, arg2) -- Line 15
	arg1.Size = UDim2.new(string.len(arg1.Text) * (arg2 or 0.05), 0, arg1.Size.Y.Scale, 0)
end
return module