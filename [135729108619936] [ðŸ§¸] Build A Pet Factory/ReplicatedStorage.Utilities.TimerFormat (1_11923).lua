-- Name: TimerFormat
-- Path: game:GetService("ReplicatedStorage").Utilities.TimerFormat
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5539530999994895 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:15
-- Luau version 6, Types version 3
-- Time taken: 0.004377 seconds

local function FormatCompact_upvr(arg1) -- Line 1, Named "FormatCompact"
	if arg1 <= 0 then
		return "0s"
	end
	local floored_2 = math.floor(arg1 / 86400)
	local floored = math.floor(arg1 % 86400 / 3600)
	local floored_6 = math.floor(arg1 % 3600 / 60)
	local module = {}
	if 0 < floored_2 then
		table.insert(module, floored_2..'d')
	end
	if 0 < floored or 0 < floored_2 then
		table.insert(module, floored..'h')
	end
	if 0 < floored_6 or 0 < floored or 0 < floored_2 then
		table.insert(module, floored_6..'m')
	end
	table.insert(module, math.floor(arg1 % 60)..'s')
	return table.concat(module, ' ')
end
local function SuperAbbreviated_upvr(arg1) -- Line 31, Named "SuperAbbreviated"
	local floored_3 = math.floor(arg1 / 86400)
	local floored_7 = math.floor(arg1 % 86400 / 3600)
	local floored_8 = math.floor(arg1 % 3600 / 60)
	local floored_4 = math.floor(arg1 % 60)
	if 365 <= floored_3 then
		return string.format("%dy", math.floor(floored_3 / 365))
	end
	if 1 <= floored_3 then
		return string.format("%dd %dh", floored_3, floored_7)
	end
	if 1 <= floored_7 then
		return string.format("%dh %dm", floored_7, floored_8)
	end
	if 1 <= floored_8 then
		return string.format("%dm %ds", floored_8, floored_4)
	end
	return string.format("%ds", floored_4)
end
return function(arg1, arg2, arg3, arg4) -- Line 52
	--[[ Upvalues[2]:
		[1]: SuperAbbreviated_upvr (readonly)
		[2]: FormatCompact_upvr (readonly)
	]]
	if arg1 <= 0 then
		return '0'
	end
	if arg4 then
		return SuperAbbreviated_upvr(arg1)
	end
	if arg2 then
		return FormatCompact_upvr(arg1)
	end
	local floored_11 = math.floor(arg1 / 86400)
	local var11 = arg1 % 86400
	local floored_10 = math.floor(var11 / 3600)
	local var13 = var11 % 3600
	local floored_9 = math.floor(var13 / 60)
	if arg3 then
		local var15 = arg1 % 60
		if 0 < floored_11 then
			return string.format("%d:%02d:%02d:%05.2f", floored_11, floored_10, floored_9, var15)
		end
		if 0 < floored_10 then
			return string.format("%d:%02d:%05.2f", floored_10, floored_9, var15)
		end
		if 0 < floored_9 then
			return string.format("%d:%05.2f", floored_9, var15)
		end
		return string.format("%.2f", var15)
	end
	local floored_5 = math.floor(var13 % 60)
	if 0 < floored_11 then
		return string.format("%d:%02d:%02d:%02d", floored_11, floored_10, floored_9, floored_5)
	end
	if 0 < floored_10 then
		return string.format("%d:%02d:%02d", floored_10, floored_9, floored_5)
	end
	if 0 < floored_9 then
		return string.format("%d:%02d", floored_9, floored_5)
	end
	return tostring(floored_5)
end