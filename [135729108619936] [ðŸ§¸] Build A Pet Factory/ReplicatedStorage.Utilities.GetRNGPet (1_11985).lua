-- Name: GetRNGPet
-- Path: game:GetService("ReplicatedStorage").Utilities.GetRNGPet
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5531849000017246 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:12
-- Luau version 6, Types version 3
-- Time taken: 0.004775 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RarityWeights_upvr = require(ReplicatedStorage.Configs.RarityWeights)
local random_state_upvr = Random.new()
local tbl_upvr_2 = {"Basic", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret", "HyperSecret"}
local var13_upvw = 0
for _, v in pairs(RarityWeights_upvr) do
	var13_upvw += v
end
local tbl_upvr = {}
for i_2, v_2 in pairs(require(ReplicatedStorage.Configs.PetsConfig)) do
	local var21 = tbl_upvr[v_2.Rarity]
	if not var21 then
		var21 = {}
	end
	tbl_upvr[v_2.Rarity] = var21
	table.insert(tbl_upvr[v_2.Rarity], {
		Name = i_2;
		Weight = v_2.Weight;
		PetValue = v_2.PetValue;
		Icon = v_2.Icon;
	})
end
local function _(arg1, arg2) -- Line 39, Named "ApplyLuck"
	return 1 - math.pow(1 - arg1, arg2)
end
local function RollRarity_upvr(arg1) -- Line 43, Named "RollRarity"
	--[[ Upvalues[4]:
		[1]: tbl_upvr_2 (readonly)
		[2]: RarityWeights_upvr (readonly)
		[3]: var13_upvw (read and write)
		[4]: random_state_upvr (readonly)
	]]
	for i_3 = #tbl_upvr_2, 1, -1 do
		local var24 = tbl_upvr_2[i_3]
		if random_state_upvr:NextNumber() < 1 - math.pow(1 - RarityWeights_upvr[var24] / var13_upvw, math.max(arg1 or 1, 1)) then
			return var24
		end
	end
	return "Basic"
end
local function RollPetFromRarity_upvr(arg1) -- Line 59, Named "RollPetFromRarity"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: random_state_upvr (readonly)
	]]
	local var33 = tbl_upvr[arg1]
	local var34
	if not var33 then
		var34 = nil
		return var34
	end
	var34 = 0
	for _, v_3 in ipairs(var33) do
		var34 += v_3.Weight
	end
	for _, v_4 in ipairs(var33) do
		if random_state_upvr:NextNumber(0, var34) <= 0 + v_4.Weight then
			return v_4
		end
	end
end
local EvolveTypeConfig_upvr = require(ReplicatedStorage.Configs.EvolveTypeConfig)
local function RollEvolve_upvr() -- Line 81, Named "RollEvolve"
	--[[ Upvalues[2]:
		[1]: EvolveTypeConfig_upvr (readonly)
		[2]: random_state_upvr (readonly)
	]]
	local var50 = 0
	for _, v_5 in pairs(EvolveTypeConfig_upvr) do
		var50 += v_5.Weight
	end
	for i_7, v_6 in pairs(EvolveTypeConfig_upvr) do
		if random_state_upvr:NextNumber(0, var50) <= 0 + v_6.Weight then
			return i_7, v_6.PetValueMultiplier
		end
	end
	return "Normal", 1
end
return function(arg1, arg2, arg3) -- Line 100, Named "RollPet"
	--[[ Upvalues[3]:
		[1]: RollRarity_upvr (readonly)
		[2]: RollPetFromRarity_upvr (readonly)
		[3]: RollEvolve_upvr (readonly)
	]]
	local RollRarity_result1 = RollRarity_upvr(arg1)
	local RollPetFromRarity_result1 = RollPetFromRarity_upvr(RollRarity_result1)
	if not RollPetFromRarity_result1 then
		return "Normal Dog", 100, RollRarity_result1
	end
	local RollEvolve_upvr_result1, RollEvolve_upvr_result2 = RollEvolve_upvr()
	return (arg3 or RollEvolve_upvr_result1)..' '..RollPetFromRarity_result1.Name, math.round(RollPetFromRarity_result1.PetValue * RollEvolve_upvr_result2 * (arg2 or 1)), RollRarity_result1
end