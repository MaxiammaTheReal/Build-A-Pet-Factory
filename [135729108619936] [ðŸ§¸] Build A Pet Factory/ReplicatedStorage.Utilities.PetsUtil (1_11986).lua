-- Name: PetsUtil
-- Path: game:GetService("ReplicatedStorage").Utilities.PetsUtil
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5405592999995861 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:13
-- Luau version 6, Types version 3
-- Time taken: 0.001841 seconds

return {
	GetTotalEquipSlots = function(arg1, arg2) -- Line 3, Named "GetTotalEquipSlots"
		local var2
		if arg2.Data.OwnedPetEquips.Robux.PetEquip_Tier1 then
			var2 += 1
		end
		if arg2.Data.OwnedPetEquips.Robux.PetEquip_Tier2 then
			var2 += 1
		end
		if arg2.Data.OwnedPetEquips.Gems.PetEquip_Gems1 then
			var2 += 1
		end
		if arg2.Data.OwnedPetEquips.Gems.PetEquip_Gems2 then
			var2 += 1
		end
		return var2
	end;
	GetTotalEquippedPets = function(arg1, arg2, arg3) -- Line 25, Named "GetTotalEquippedPets"
		if arg3 then
			for _, v in pairs(arg2.Data.EquippedPets) do
				if v == arg3 then
				end
			end
			return 0 + 1
		end
		return #arg2.Data.EquippedPets
	end;
}