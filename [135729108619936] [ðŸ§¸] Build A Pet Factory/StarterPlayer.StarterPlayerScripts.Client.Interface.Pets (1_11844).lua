-- Name: Pets
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Interface.Pets
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2584876999990229 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:48
-- Luau version 6, Types version 3
-- Time taken: 0.026535 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local Serg_AutomaticList_upvr = require(ReplicatedStorage.Utilities.Serg_AutomaticList)
local PetsConfig_upvr = require(ReplicatedStorage.Configs.PetsConfig)
local EggsConfig_upvr = require(ReplicatedStorage.Configs.EggsConfig)
local GetPetNameInfo_upvr = require(ReplicatedStorage.Utilities.GetPetNameInfo)
local RarityGradients_upvr = require(ReplicatedStorage.Configs.RarityGradients)
local EvolveTypeConfig_upvr = require(ReplicatedStorage.Configs.EvolveTypeConfig)
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local PetsUtil_upvr = require(ReplicatedStorage.Utilities.PetsUtil)
local CollectionService_upvr = game:GetService("CollectionService")
local Events_upvr = ReplicatedStorage.Events
function SetupPets() -- Line 24
	--[[ Upvalues[12]:
		[1]: Serg_AutomaticList_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: PetsConfig_upvr (readonly)
		[4]: EggsConfig_upvr (readonly)
		[5]: GetPetNameInfo_upvr (readonly)
		[6]: RarityGradients_upvr (readonly)
		[7]: EvolveTypeConfig_upvr (readonly)
		[8]: Serg_Button_upvr (readonly)
		[9]: PetsUtil_upvr (readonly)
		[10]: var3_upvw (read and write)
		[11]: CollectionService_upvr (readonly)
		[12]: Events_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local tbl_5_upvr = {
		EquippedPets = Serg_AutomaticList_upvr.new(var2_upvw.Menus.Pets.List.EquippedPets, nil, 5);
		InventoryPets = Serg_AutomaticList_upvr.new(var2_upvw.Menus.Pets.List.InventoryPets);
	}
	local function UpdateLists_upvr(arg1) -- Line 30, Named "UpdateLists"
		--[[ Upvalues[1]:
			[1]: tbl_5_upvr (readonly)
		]]
		if arg1 and tbl_5_upvr[arg1] then
			tbl_5_upvr[arg1]:Update()
		else
			for _, v_6 in pairs(tbl_5_upvr) do
				v_6:Update()
			end
		end
	end
	local function _(arg1, arg2) -- Line 40, Named "GetPetMultiplier"
		--[[ Upvalues[2]:
			[1]: PetsConfig_upvr (copied, readonly)
			[2]: EggsConfig_upvr (copied, readonly)
		]]
		local var44 = PetsConfig_upvr[arg2]
		if not var44 then return end
		local var45 = EggsConfig_upvr[arg1.." Egg"]
		if not var45 then return end
		return var44.PetMultiplier * var45.EvolvePetMultiplier
	end
	local function CreatePetFrame_upvr(arg1, arg2) -- Line 50, Named "CreatePetFrame"
		--[[ Upvalues[6]:
			[1]: GetPetNameInfo_upvr (copied, readonly)
			[2]: PetsConfig_upvr (copied, readonly)
			[3]: EggsConfig_upvr (copied, readonly)
			[4]: RarityGradients_upvr (copied, readonly)
			[5]: EvolveTypeConfig_upvr (copied, readonly)
			[6]: Serg_Button_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
		local var7_result1, GetPetNameInfo_upvr_result2 = GetPetNameInfo_upvr(arg1)
		local var48 = PetsConfig_upvr[GetPetNameInfo_upvr_result2]
		local var49
		if not var48 then return end
		local var50 = PetsConfig_upvr[GetPetNameInfo_upvr_result2]
		if not var50 then
			var49 = nil
			-- KONSTANTWARNING: GOTO [25] #24
		end
		-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 13. Error Block 24 start (CF ANALYSIS FAILED)
		local var51 = EggsConfig_upvr[var7_result1.." Egg"]
		if not var51 then
			var49 = nil
		else
			var49 = var50.PetMultiplier * var51.EvolvePetMultiplier
		end
		local clone = script.PetTemplate:Clone()
		clone.LayoutOrder = -(var49 * 100)
		clone.Name = arg1
		clone.Frame.Main.NormalIcon.Image = var48.Icon.NormalImage
		clone.Frame.Main.PetMultiplier.Text = 'x'..string.format("%."..2..'f', var49):gsub("%.?0+$", "")
		local var53 = RarityGradients_upvr[var48.Rarity]
		if var53 then
			clone.Frame.Main.UIGradient.Color = var53
			clone.Frame.Background.UIGradient.Color = var53
			clone.Frame.Background.UIStroke.UIGradient.Color = var53
		end
		if var7_result1 ~= "Normal" then
			clone.Frame.Main.NormalIcon.WhiteIcon.Image = var48.Icon.WhiteImage
			clone.Frame.Main.NormalIcon.WhiteIcon.UIGradient.Color = EvolveTypeConfig_upvr[var7_result1].ColorTheme.BackgroundGradient
			clone.Frame.Main.NormalIcon.WhiteIcon.Visible = true
		end
		local tbl = {
			Frame = clone.Frame;
		}
		local tbl_3 = {}
		local function Click() -- Line 88
			--[[ Upvalues[1]:
				[1]: arg2 (readonly)
			]]
			arg2()
		end
		tbl_3.Click = Click
		tbl.Callbacks = tbl_3
		tbl.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl)
		do
			return clone
		end
		-- KONSTANTERROR: [12] 13. Error Block 24 end (CF ANALYSIS FAILED)
	end
	local function UpdateEquippedAmount_upvr() -- Line 103, Named "UpdateEquippedAmount"
		--[[ Upvalues[5]:
			[1]: PetsUtil_upvr (copied, readonly)
			[2]: var3_upvw (copied, read and write)
			[3]: tbl_5_upvr (readonly)
			[4]: CollectionService_upvr (copied, readonly)
			[5]: var2_upvw (copied, read and write)
		]]
		local var64
		for _, v in pairs(tbl_5_upvr.EquippedPets.ListUi:GetChildren()) do
			if v:IsA("Frame") and CollectionService_upvr:HasTag(v, "PetFrame") then
				var64 += 1
			end
		end
		var2_upvw.Menus.Pets.List.Seperator_Equipped.Headline.Text = "Equipped Pets ["..var64..'/'..PetsUtil_upvr:GetTotalEquipSlots(var3_upvw)..']'
	end
	local function AddPetToEquipped_upvr(arg1, arg2) -- Line 117, Named "AddPetToEquipped"
		--[[ Upvalues[5]:
			[1]: CreatePetFrame_upvr (readonly)
			[2]: Events_upvr (copied, readonly)
			[3]: tbl_5_upvr (readonly)
			[4]: UpdateLists_upvr (readonly)
			[5]: UpdateEquippedAmount_upvr (readonly)
		]]
		local CreatePetFrame_result1_2 = CreatePetFrame_upvr(arg1, function() -- Line 118
			--[[ Upvalues[2]:
				[1]: Events_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			Events_upvr.UnequipPet:FireServer(arg1)
		end)
		if not CreatePetFrame_result1_2 then
		else
			CreatePetFrame_result1_2.Frame.Main.Amount.Text = ""
			CreatePetFrame_result1_2.Parent = tbl_5_upvr.EquippedPets.ListUi
			if arg2 then
				UpdateLists_upvr("EquippedPets")
				UpdateEquippedAmount_upvr()
			end
		end
	end
	local function _(arg1) -- Line 135, Named "RemovePetFromEquipped"
		--[[ Upvalues[3]:
			[1]: tbl_5_upvr (readonly)
			[2]: UpdateLists_upvr (readonly)
			[3]: UpdateEquippedAmount_upvr (readonly)
		]]
		local SOME = tbl_5_upvr.EquippedPets.ListUi:FindFirstChild(arg1)
		if not SOME then
		else
			SOME:Destroy()
			UpdateLists_upvr("EquippedPets")
			UpdateEquippedAmount_upvr()
		end
	end
	local function ClearAllEquippedPets_upvr() -- Line 146, Named "ClearAllEquippedPets"
		--[[ Upvalues[4]:
			[1]: tbl_5_upvr (readonly)
			[2]: CollectionService_upvr (copied, readonly)
			[3]: UpdateLists_upvr (readonly)
			[4]: UpdateEquippedAmount_upvr (readonly)
		]]
		for _, v_2 in pairs(tbl_5_upvr.EquippedPets.ListUi:GetChildren()) do
			if v_2:IsA("Frame") and CollectionService_upvr:HasTag(v_2, "PetFrame") then
				v_2:Destroy()
			end
		end
		UpdateLists_upvr("EquippedPets")
		UpdateEquippedAmount_upvr()
	end
	local tbl_2_upvr = {{
		Name = "PetEquip_Gems1";
		Type = "Gems";
		Cost = 50000;
	}, {
		Name = "PetEquip_Gems2";
		Type = "Gems";
		Cost = 250000;
	}, {
		Name = "PetEquip_Tier1";
		Type = "Robux";
		Cost = nil;
	}, {
		Name = "PetEquip_Tier2";
		Type = "Robux";
		Cost = nil;
	}}
	local function ShowPetEquipButtons_upvr() -- Line 169, Named "ShowPetEquipButtons"
		--[[ Upvalues[3]:
			[1]: tbl_2_upvr (readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: var3_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local pairs_result1_4, pairs_result2, pairs_result3_3 = pairs(tbl_2_upvr)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [95] 62. Error Block 26 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [95] 62. Error Block 26 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [95.5]
		-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
	end
	for _, v_3_upvr in pairs(tbl_2_upvr) do
		local SOME_3_upvr = var2_upvw.Menus.Pets.List.EquippedPets:FindFirstChild(v_3_upvr.Name)
		if SOME_3_upvr then
			local tbl_6 = {
				Frame = SOME_3_upvr.Frame;
			}
			local tbl_4 = {}
			local function Click() -- Line 215
				--[[ Upvalues[2]:
					[1]: v_3_upvr (readonly)
					[2]: Events_upvr (copied, readonly)
				]]
				if v_3_upvr.Type == "Robux" then
					Events_upvr.ServerProductPrompt:FireServer(v_3_upvr.Name)
				elseif v_3_upvr.Type == "Gems" then
					Events_upvr.BuyPetEquipSlot:FireServer(v_3_upvr.Name)
				end
			end
			tbl_4.Click = Click
			tbl_6.Callbacks = tbl_4
			tbl_6.EnabledTweens = {
				Click = true;
				Hover = true;
			}
			Serg_Button_upvr.New(tbl_6)
			local var90_upvw
			var90_upvw = var3_upvw:OnSet({"OwnedPetEquips", v_3_upvr.Type, v_3_upvr.Name}, function(arg1, arg2) -- Line 230
				--[[ Upvalues[4]:
					[1]: UpdateEquippedAmount_upvr (readonly)
					[2]: ShowPetEquipButtons_upvr (readonly)
					[3]: SOME_3_upvr (readonly)
					[4]: var90_upvw (read and write)
				]]
				if arg1 then
					UpdateEquippedAmount_upvr()
					ShowPetEquipButtons_upvr()
					SOME_3_upvr:Destroy()
					var90_upvw:Disconnect()
					var90_upvw = nil
				end
			end)
		end
	end
	ShowPetEquipButtons_upvr()
	local function _(arg1) -- Line 267, Named "RemovePetFromInventory"
		--[[ Upvalues[2]:
			[1]: tbl_5_upvr (readonly)
			[2]: UpdateLists_upvr (readonly)
		]]
		local SOME_2 = tbl_5_upvr.InventoryPets.ListUi:FindFirstChild(arg1)
		if not SOME_2 then
		else
			SOME_2:Destroy()
			UpdateLists_upvr("InventoryPets")
		end
	end
	SOME_3_upvr = var3_upvw.Data
	for i_4, v_4 in pairs(SOME_3_upvr.PetInventory) do
		(function(arg1, arg2, arg3) -- Line 247, Named "UpdateInventoryPet"
			--[[ Upvalues[4]:
				[1]: tbl_5_upvr (readonly)
				[2]: CreatePetFrame_upvr (readonly)
				[3]: Events_upvr (copied, readonly)
				[4]: UpdateLists_upvr (readonly)
			]]
			local SOME_5 = tbl_5_upvr.InventoryPets.ListUi:FindFirstChild(arg1)
			if not SOME_5 then
				SOME_5 = CreatePetFrame_upvr
				SOME_5 = SOME_5(arg1, function() -- Line 248
					--[[ Upvalues[2]:
						[1]: Events_upvr (copied, readonly)
						[2]: arg1 (readonly)
					]]
					Events_upvr.EquipPet:FireServer(arg1)
				end)
			end
			if not SOME_5 then
			else
				SOME_5.Frame.Main.Amount.Text = 'x'..arg2
				if not SOME_5.Parent then
					SOME_5.Parent = tbl_5_upvr.InventoryPets.ListUi
					if arg3 then
						UpdateLists_upvr("InventoryPets")
					end
				end
			end
		end)(i_4, v_4)
		local var99_upvr
	end
	for _, v_5_upvr in pairs(var3_upvw.Data.EquippedPets) do
		local CreatePetFrame_result1 = CreatePetFrame_upvr(v_5_upvr, function() -- Line 118
			--[[ Upvalues[2]:
				[1]: Events_upvr (copied, readonly)
				[2]: v_5_upvr (readonly)
			]]
			Events_upvr.UnequipPet:FireServer(v_5_upvr)
		end)
		if not CreatePetFrame_result1 then
		else
			CreatePetFrame_result1.Frame.Main.Amount.Text = ""
			CreatePetFrame_result1.Parent = tbl_5_upvr.EquippedPets.ListUi
		end
	end
	UpdateLists_upvr()
	UpdateEquippedAmount_upvr()
	Serg_Button_upvr.New({
		Frame = var2_upvw.Menus.Pets.EquipBest;
		Callbacks = {
			Click = function() -- Line 290, Named "Click"
				--[[ Upvalues[1]:
					[1]: Events_upvr (copied, readonly)
				]]
				Events_upvr.EquipBestPets:FireServer()
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
	var3_upvw:OnChange(function(arg1, arg2, arg3, arg4) -- Line 300
		--[[ Upvalues[6]:
			[1]: tbl_5_upvr (readonly)
			[2]: UpdateLists_upvr (readonly)
			[3]: var99_upvr (readonly)
			[4]: AddPetToEquipped_upvr (readonly)
			[5]: UpdateEquippedAmount_upvr (readonly)
			[6]: ClearAllEquippedPets_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 29 start (CF ANALYSIS FAILED)
		local _2 = arg2[2]
		local var110 = arg3
		if not var110 then
			local SOME_7 = tbl_5_upvr.InventoryPets.ListUi:FindFirstChild(_2)
			if not SOME_7 then
			else
				SOME_7:Destroy()
				UpdateLists_upvr("InventoryPets")
			end
		end
		var99_upvr(_2, var110, true)
		do
			return
		end
		-- KONSTANTERROR: [5] 4. Error Block 29 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [32] 27. Error Block 31 start (CF ANALYSIS FAILED)
		if arg2[1] == "EquippedPets" then
			if arg1 == "TableInsert" then
				AddPetToEquipped_upvr(arg3, true)
				return
			end
			if arg1 == "TableRemove" then
				local SOME_6 = tbl_5_upvr.EquippedPets.ListUi:FindFirstChild(arg3)
				if not SOME_6 then
				else
					SOME_6:Destroy()
					UpdateLists_upvr("EquippedPets")
					UpdateEquippedAmount_upvr()
				end
			end
			if arg1 == "Set" and arg3 and typeof(arg3) == "table" and #arg3 == 0 then
				ClearAllEquippedPets_upvr()
			end
		end
		-- KONSTANTERROR: [32] 27. Error Block 31 end (CF ANALYSIS FAILED)
	end)
end
local var114_upvw
return function(arg1, arg2, arg3) -- Line 327
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var114_upvw (read and write)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var114_upvw = arg3
	SetupPets()
end