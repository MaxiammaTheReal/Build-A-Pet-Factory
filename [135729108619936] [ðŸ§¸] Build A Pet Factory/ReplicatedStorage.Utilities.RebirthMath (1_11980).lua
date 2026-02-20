-- Name: RebirthMath
-- Path: game:GetService("ReplicatedStorage").Utilities.RebirthMath
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5483473999993294 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:08
-- Luau version 6, Types version 3
-- Time taken: 0.002817 seconds

return {
	GetCost = function(arg1, arg2) -- Line 3, Named "GetCost"
		local var2 = arg2 + 1
		local tbl = {2000, 15000, 100000, 1000000}
		local var4
		if var2 <= #tbl then
			var4 = tbl[var2]
		else
			var4 = tbl[#tbl] * 2.4082246852806923 ^ (var2 - #tbl)
		end
		local var5 = 10 ^ math.floor(math.log10(var4))
		return math.floor(var4 / var5 * 4 + 0.5) / 4 * var5
	end;
	GetCashMultiplier = function(arg1, arg2) -- Line 25, Named "GetCashMultiplier"
		return 1 + (arg2 + 1) * 0.5
	end;
	GetLuckMultiplier = function(arg1, arg2) -- Line 29, Named "GetLuckMultiplier"
		return 1 + (arg2 + 1) * 0.2
	end;
	GetStartingCash = function(arg1, arg2) -- Line 33, Named "GetStartingCash"
		local var6 = arg2 + 1
		local tbl_2 = {1000, 5000, 10000, 25000, 50000, 100000, 250000, 500000, 1000000, 2500000, 5000000}
		local var8
		if var6 <= #tbl_2 then
			var8 = tbl_2[var6]
		else
			var8 = tbl_2[#tbl_2] * 1.5 ^ (var6 - #tbl_2)
		end
		local var9 = 10 ^ math.floor(math.log10(var8))
		return math.floor(var8 / var9 * 4 + 0.5) / 4 * var9
	end;
}