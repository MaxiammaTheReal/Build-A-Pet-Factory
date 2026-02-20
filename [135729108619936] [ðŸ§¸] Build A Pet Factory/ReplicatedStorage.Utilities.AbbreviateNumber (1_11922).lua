-- Name: AbbreviateNumber
-- Path: game:GetService("ReplicatedStorage").Utilities.AbbreviateNumber
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5453705999989324 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:14
-- Luau version 6, Types version 3
-- Time taken: 0.005362 seconds

local module_upvr = {"", 'K', 'M', 'B', 'T', "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Ud", "Dd", "Td", "Qad", "Qid", "Sxd", "Spd", "Ocd", "Nod", "Vg"}
return function(arg1, arg2) -- Line 3
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if arg1 == nil then
		return '0'
	end
	if arg1 >= 0 then
	else
	end
	local absolute = math.abs(arg1)
	if arg2 then
		local var16
		if absolute < 1000000000 then
			var16 = absolute + 0.5
			local floored = math.floor(var16)
			var16 = floored
			local tostring_result1_2 = tostring(var16)
			var16 = ""
			local len = #tostring_result1_2
			for i = 1, len do
				var16 = var16..tostring_result1_2:sub(i, i)
				if (len - i) % 3 == 0 and i ~= len then
					var16 = var16..','
				end
			end
			if true then
				var16 = '-'..var16
			end
			return var16
		end
	end
	local const_number_2 = 1
	while 1000 <= floored and const_number_2 < #module_upvr do
		local var21 = const_number_2 + 1
	end
	if 1 < var21 then
		if string.format("%.1f", math.floor(floored / 1000 * 10) / 10):sub(-2) == ".0" then
			-- KONSTANTWARNING: GOTO [108] #90
		end
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if true then
	end
	return '-'..tostring(math.floor(math.floor(floored / 1000 * 10) / 10 + 0.5))..module_upvr[var21]
end