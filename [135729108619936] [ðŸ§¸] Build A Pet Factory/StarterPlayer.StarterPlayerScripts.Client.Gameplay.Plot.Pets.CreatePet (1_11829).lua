-- Name: CreatePet
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Gameplay.Plot.Pets.CreatePet
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2629512999992585 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:33
-- Luau version 6, Types version 3
-- Time taken: 0.002609 seconds

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
	local clone_2 = SOME:Clone()
	if not table_find_result1 then
		if arg1 == "Rainbow" then
			CollectionService_upvr:AddTag(clone_2, "RainbowPet")
			return clone_2
		end
		local var10 = EvolveTypeConfig_upvr[arg1]
		if var10 then
			local PetColor = var10.ColorTheme.PetColor
			if not PetColor then
				PetColor = Color3.fromRGB(255, 255, 255)
			end
			clone_2.Color = PetColor
		end
	end
	return clone_2
end
local GetPetNameInfo_upvr = require(ReplicatedStorage.Utilities.GetPetNameInfo)
return function(arg1, arg2) -- Line 37
	--[[ Upvalues[2]:
		[1]: GetPetNameInfo_upvr (readonly)
		[2]: CreatePetMesh_upvr (readonly)
	]]
	local GetPetNameInfo_upvr_result1, GetPetNameInfo_upvr_result2 = GetPetNameInfo_upvr(arg1)
	local CreatePetMesh_upvr_result1 = CreatePetMesh_upvr(GetPetNameInfo_upvr_result1, GetPetNameInfo_upvr_result2)
	if not CreatePetMesh_upvr_result1 then return end
	local var17 = CreatePetMesh_upvr_result1.Size.Y / 2
	if arg2 then
		local clone = script.BillboardGui:Clone()
		clone.StudsOffsetWorldSpace = Vector3.new(0, var17 + 1.25, 0)
		clone.Adornee = CreatePetMesh_upvr_result1
		clone.Parent = CreatePetMesh_upvr_result1
	end
	return CreatePetMesh_upvr_result1, var17, clone
end