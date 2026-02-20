-- Name: CreatePet
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Gameplay.Plot.EquipablePets.CreatePet
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.26219400000081805 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:35
-- Luau version 6, Types version 3
-- Time taken: 0.002911 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_upvr = {"Normal", "Golden"}
local Pets_upvr = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Pets")
local CollectionService_upvr = game:GetService("CollectionService")
local EvolveTypeConfig_upvr = require(ReplicatedStorage.Configs.EvolveTypeConfig)
local function CreatePetMesh_upvr(arg1, arg2) -- Line 14, Named "CreatePetMesh"
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: Pets_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
		[4]: EvolveTypeConfig_upvr (readonly)
	]]
	local table_find_result1 = table.find(tbl_upvr, arg1)
	local var7
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var7 = arg1..' '..arg2
		return var7
	end
	if not table_find_result1 or not INLINED() then
		var7 = "Custom"..' '..arg2
	end
	local SOME = Pets_upvr:FindFirstChild(var7)
	if not SOME then return end
	local clone = SOME:Clone()
	if not table_find_result1 then
		if arg1 == "Rainbow" then
			CollectionService_upvr:AddTag(clone, "RainbowPet")
		else
			local var10 = EvolveTypeConfig_upvr[arg1]
			if var10 then
				local PetColor = var10.ColorTheme.PetColor
				if not PetColor then
					PetColor = Color3.fromRGB(255, 255, 255)
				end
				clone.Color = PetColor
			end
		end
	end
	clone.Size = Vector3.new(clone.Size.X * 0.85, clone.Size.Y * 0.85, clone.Size.Z * 0.85)
	return clone
end
local GetPetNameInfo_upvr = require(ReplicatedStorage.Utilities.GetPetNameInfo)
return function(arg1) -- Line 39
	--[[ Upvalues[2]:
		[1]: GetPetNameInfo_upvr (readonly)
		[2]: CreatePetMesh_upvr (readonly)
	]]
	local GetPetNameInfo_upvr_result1, GetPetNameInfo_upvr_result2 = GetPetNameInfo_upvr(arg1)
	local CreatePetMesh_upvr_result1 = CreatePetMesh_upvr(GetPetNameInfo_upvr_result1, GetPetNameInfo_upvr_result2)
	if not CreatePetMesh_upvr_result1 then return end
	return CreatePetMesh_upvr_result1
end