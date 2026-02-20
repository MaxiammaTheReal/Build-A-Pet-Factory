-- Name: EggsConfig
-- Path: game:GetService("ReplicatedStorage").Configs.EggsConfig
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5379287999985536 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:09
-- Luau version 6, Types version 3
-- Time taken: 0.000725 seconds

return {
	["Normal Egg"] = {
		EvolveType = "Normal";
		EvolvePetMultiplier = 1;
		Cost = 500;
		RequiredRebirths = 5;
	};
	["Golden Egg"] = {
		EvolveType = "Golden";
		EvolvePetMultiplier = 1.5;
		Cost = 2500;
		RequiredRebirths = 15;
	};
	["Rainbow Egg"] = {
		EvolveType = "Rainbow";
		EvolvePetMultiplier = 2;
		Cost = 10000;
		RequiredRebirths = 25;
	};
}