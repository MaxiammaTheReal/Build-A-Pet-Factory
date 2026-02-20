-- Name: GetMultiplier
-- Path: game:GetService("ReplicatedStorage").Utilities.GetMultiplier
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5570685999991838 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:11
-- Luau version 6, Types version 3
-- Time taken: 0.011412 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RebirthMath_upvr = require(ReplicatedStorage.Utilities.RebirthMath)
local GetPetNameInfo_upvr = require(ReplicatedStorage.Utilities.GetPetNameInfo)
local PetsConfig_upvr = require(ReplicatedStorage.Configs.PetsConfig)
local EggsConfig_upvr = require(ReplicatedStorage.Configs.EggsConfig)
local function _(arg1) -- Line 12, Named "GetPetMultiplier"
	--[[ Upvalues[3]:
		[1]: GetPetNameInfo_upvr (readonly)
		[2]: PetsConfig_upvr (readonly)
		[3]: EggsConfig_upvr (readonly)
	]]
	local GetPetNameInfo_upvr_result1, GetPetNameInfo_upvr_result2_2 = GetPetNameInfo_upvr(arg1)
	local var8 = PetsConfig_upvr[GetPetNameInfo_upvr_result2_2]
	if not var8 then return end
	local var9 = EggsConfig_upvr[GetPetNameInfo_upvr_result1.." Egg"]
	if not var9 then return end
	return var8.PetMultiplier * var9.EvolvePetMultiplier
end
return {
	Cash = function(arg1, arg2) -- Line 25
		--[[ Upvalues[4]:
			[1]: RebirthMath_upvr (readonly)
			[2]: GetPetNameInfo_upvr (readonly)
			[3]: PetsConfig_upvr (readonly)
			[4]: EggsConfig_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var38 = 1
		if not arg2 then
			local FriendsBoost_2 = arg1.Data.FriendsBoost
			if FriendsBoost_2 and 0 < FriendsBoost_2 then
				var38 *= 1 + FriendsBoost_2 / 100
			end
		end
		local any_GetCashMultiplier_result1 = RebirthMath_upvr:GetCashMultiplier(arg1.Data.Rebirths - 1)
		if any_GetCashMultiplier_result1 then
			var38 *= any_GetCashMultiplier_result1
		end
		if table.find(arg1.Data.Gamepasses, "x2CashGamepass") then
			var38 *= 2
		end
		if not arg2 then
			if 1 <= arg1.Data.ProductTimers.x3Cash then
				var38 *= 3
			end
			if 1 <= arg1.Data.RewardBoosts.CashMultiplier then
				var38 *= 2
			end
		end
		for _, v in pairs(arg1.Data.EquippedPets) do
			local var3_result1, GetPetNameInfo_upvr_result2_3 = GetPetNameInfo_upvr(v)
			local var46 = PetsConfig_upvr[GetPetNameInfo_upvr_result2_3]
			local var47
			if not var46 then
				var47 = nil
			else
				local var48 = EggsConfig_upvr[var3_result1.." Egg"]
				if not var48 then
					var47 = nil
				else
					var47 = var46.PetMultiplier * var48.EvolvePetMultiplier
				end
			end
			local var49 = (1) + ((var47 or 1) - 1)
		end
		if 1 < var49 and var49 < 300 then
			var38 *= var49
		end
		return var38
	end;
	Luck = function(arg1, arg2) -- Line 71
		--[[ Upvalues[1]:
			[1]: RebirthMath_upvr (readonly)
		]]
		local var56
		if not arg2 then
			if arg1.Data.Settings.DisableYourLuck then
				return var56
			end
		end
		local len_2 = #arg1.Data.Index
		if 0 < len_2 then
			var56 += len_2 / 100
		end
		if not arg2 then
			local FriendsBoost = arg1.Data.FriendsBoost
			if FriendsBoost and 0 < FriendsBoost then
				var56 += FriendsBoost / 100
			end
		end
		local any_GetLuckMultiplier_result1 = RebirthMath_upvr:GetLuckMultiplier(arg1.Data.Rebirths - 1)
		if any_GetLuckMultiplier_result1 then
			var56 *= any_GetLuckMultiplier_result1
		end
		if table.find(arg1.Data.Gamepasses, "x2LuckGamepass") then
			var56 *= 2
		end
		if not arg2 then
			if 1 <= arg1.Data.ProductTimers.x10Luck then
				var56 *= 10
			end
			if 1 <= arg1.Data.RewardBoosts.LuckMultiplier then
				var56 *= 2
			end
		end
		return var56
	end;
	Gems = function(arg1, arg2) -- Line 114
		local var61
		if table.find(arg1.Data.Gamepasses, "x2GemsGamepass") then
			var61 *= 2
		end
		if not arg2 then
			if 1 <= arg1.Data.ProductTimers.x3Gems then
				var61 *= 3
			end
			if 1 <= arg1.Data.RewardBoosts.GemsMultiplier then
				var61 *= 2
			end
		end
		return var61
	end;
}