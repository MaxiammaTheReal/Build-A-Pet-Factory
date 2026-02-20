-- Name: Serg_UIScale
-- Path: game:GetService("ReplicatedStorage").Utilities.Serg_UIScale
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5413520000001881 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:12
-- Luau version 6, Types version 3
-- Time taken: 0.004180 seconds

local CurrentCamera_upvr = workspace.CurrentCamera
local var2_upvw = 1
local tbl_3_upvr = {}
local function _(arg1) -- Line 23, Named "GetAlpha"
	return math.clamp((arg1 - 400) / 680, 0, 1)
end
local var4_upvw
local function ResizeUiScales_upvr(arg1) -- Line 28, Named "ResizeUiScales"
	--[[ Upvalues[4]:
		[1]: tbl_3_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: var2_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if #tbl_3_upvr <= 0 then
	else
		local clamped = math.clamp((CurrentCamera_upvr.ViewportSize.Y - 400) / 680, 0, 1)
		if not arg1 and var4_upvw == clamped then return end
		var4_upvw = clamped
		for _, v in pairs(tbl_3_upvr) do
			local MinScale = v.Settings.MinScale
			v.UIScale.Scale = (MinScale + (v.Settings.MaxScale - MinScale) * clamped) * var2_upvw
		end
	end
end
CurrentCamera_upvr:GetPropertyChangedSignal("ViewportSize"):Connect(ResizeUiScales_upvr)
return {
	Add = function(arg1, arg2) -- Line 50, Named "Add"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		local var21 = false
		if typeof(arg1) == "Instance" then
			var21 = arg1:IsA("UIScale")
		end
		assert(var21, "[Serg_UIScale.Add] Expected a UIScale Instance")
		var21 = false
		local var22 = var21
		if typeof(arg2) == "table" then
			var22 = false
			if type(arg2.MinScale) == "number" then
				if type(arg2.MaxScale) ~= "number" then
					var22 = false
				else
					var22 = true
				end
			end
		end
		assert(var22, "[Serg_UIScale.Add] Invalid ScaleSettings")
		local tbl = {}
		tbl.UIScale = arg1
		tbl.Settings = arg2
		table.insert(tbl_3_upvr, tbl)
	end;
	Init = function(arg1) -- Line 60, Named "Init"
		--[[ Upvalues[2]:
			[1]: var2_upvw (read and write)
			[2]: ResizeUiScales_upvr (readonly)
		]]
		if arg1 then
			var2_upvw = arg1
		end
		ResizeUiScales_upvr(true)
	end;
}