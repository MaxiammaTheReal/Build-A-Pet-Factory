-- Name: Index
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Interface.Index
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2590858000003209 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:40
-- Luau version 6, Types version 3
-- Time taken: 0.028793 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local tbl_2_upvr = {}
local PetsConfig_upvr = require(ReplicatedStorage.Configs.PetsConfig)
local EvolveTypeConfig_upvr = require(ReplicatedStorage.Configs.EvolveTypeConfig)
local RarityGradients_upvr = require(ReplicatedStorage.Configs.RarityGradients)
local GetPetNameInfo_upvr = require(ReplicatedStorage.Utilities.GetPetNameInfo)
local NumberValue_upvr = Instance.new("NumberValue")
NumberValue_upvr.Value = 0
local tbl_7_upvr = {}
local tbl_9_upvr = {}
local var12_upvw
local TweenService_upvr = game:GetService("TweenService")
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local function DiscoverPopup_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 36, Named "DiscoverPopup"
	--[[ Upvalues[13]:
		[1]: tbl_7_upvr (readonly)
		[2]: GetPetNameInfo_upvr (readonly)
		[3]: PetsConfig_upvr (readonly)
		[4]: tbl_9_upvr (readonly)
		[5]: var12_upvw (read and write)
		[6]: NumberValue_upvr (readonly)
		[7]: EvolveTypeConfig_upvr (readonly)
		[8]: var2_upvw (read and write)
		[9]: RarityGradients_upvr (readonly)
		[10]: TweenService_upvr (readonly)
		[11]: AbbreviateNumber_upvr (readonly)
		[12]: PlaySound_upvr (readonly)
		[13]: DiscoverPopup_upvr (readonly)
	]]
	if not arg1 then
	else
		if not arg3 then
			for _, v_4 in pairs(tbl_7_upvr) do
				if v_4.PetName == arg1 then return end
			end
			local tbl = {}
			tbl.PetName = arg1
			tbl.PetValue = arg2
			tbl.IsEggHatch = arg4
			tbl.IsNewPet = arg5
			table.insert(tbl_7_upvr, tbl)
			if 1 < #tbl_7_upvr then return end
		end
		local GetPetNameInfo_upvr_result1_2_upvr, GetPetNameInfo_upvr_result2_upvr = GetPetNameInfo_upvr(arg1)
		local var59_upvr = PetsConfig_upvr[GetPetNameInfo_upvr_result2_upvr]
		if not var59_upvr then return end
		local function ToggleDiscoverMenu(arg1_3, arg2_3) -- Line 61
			--[[ Upvalues[16]:
				[1]: arg3 (readonly)
				[2]: tbl_9_upvr (copied, readonly)
				[3]: var12_upvw (copied, read and write)
				[4]: NumberValue_upvr (copied, readonly)
				[5]: GetPetNameInfo_upvr_result1_2_upvr (readonly)
				[6]: EvolveTypeConfig_upvr (copied, readonly)
				[7]: var2_upvw (copied, read and write)
				[8]: var59_upvr (readonly)
				[9]: RarityGradients_upvr (copied, readonly)
				[10]: arg4 (readonly)
				[11]: GetPetNameInfo_upvr_result2_upvr (readonly)
				[12]: TweenService_upvr (copied, readonly)
				[13]: arg2 (readonly)
				[14]: AbbreviateNumber_upvr (copied, readonly)
				[15]: PlaySound_upvr (copied, readonly)
				[16]: arg5 (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [3] 4. Error Block 84 start (CF ANALYSIS FAILED)
			if not arg1_3 then
				-- KONSTANTERROR: [4] 5. Error Block 67 start (CF ANALYSIS FAILED)
				for i_5, v_5 in pairs(tbl_9_upvr) do
					if v_5 and v_5.PlaybackState == Enum.PlaybackState.Playing then
						v_5:Cancel()
					end
				end
				table.clear(tbl_9_upvr)
				-- KONSTANTERROR: [4] 5. Error Block 67 end (CF ANALYSIS FAILED)
			end
			-- KONSTANTERROR: [3] 4. Error Block 84 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [25] 19. Error Block 85 start (CF ANALYSIS FAILED)
			if var12_upvw then
				var12_upvw:Disconnect()
				var12_upvw = nil
				NumberValue_upvr.Value = 0
			end
			if arg1_3 then
				if GetPetNameInfo_upvr_result1_2_upvr ~= "Normal" then
					local var71 = EvolveTypeConfig_upvr[GetPetNameInfo_upvr_result1_2_upvr]
					if var71 then
						local ColorTheme_2 = var71.ColorTheme
						v_5 = var2_upvw.Notifications.PetNotification.Background
						i_5 = v_5.NormalIcon
						v_5 = var59_upvr.Icon
						i_5 = v_5.WhiteImage
						i_5.WhiteIcon.Image = i_5
						v_5 = var2_upvw.Notifications.PetNotification.Background.NormalIcon
						i_5 = v_5.WhiteIcon
						i_5 = ColorTheme_2.BackgroundGradient
						i_5.UIGradient.Color = i_5
						v_5 = var2_upvw.Notifications.PetNotification
						i_5 = v_5.Background
						i_5 = GetPetNameInfo_upvr_result1_2_upvr
						i_5.EvolveType.Text = i_5
						v_5 = var2_upvw.Notifications.PetNotification.Background
						i_5 = v_5.EvolveType
						i_5 = ColorTheme_2.BackgroundGradient
						i_5.UIGradient.Color = i_5
						v_5 = var2_upvw.Notifications.PetNotification.Background.EvolveType
						i_5 = v_5.UIStroke
						i_5 = ColorTheme_2.BackgroundGradient
						i_5.UIGradient.Color = i_5
						-- KONSTANTWARNING: GOTO [153] #96
					end
				else
					v_5 = var2_upvw.Notifications
					i_5 = v_5.PetNotification
					i_5.Background.NormalIcon.WhiteIcon.Image = ""
					v_5 = var2_upvw
					i_5 = v_5.Notifications
					i_5.PetNotification.Background.EvolveType.Text = ""
				end
				local Rarity = var59_upvr.Rarity
				local var74 = RarityGradients_upvr[Rarity]
				if var74 then
					v_5 = var2_upvw.Notifications.PetNotification
					i_5 = v_5.Background
					i_5.Rarity.Text = Rarity
					v_5 = var2_upvw.Notifications.PetNotification.Background
					i_5 = v_5.Rarity
					i_5.UIGradient.Color = var74
					v_5 = var2_upvw.Notifications.PetNotification.Background.Rarity
					i_5 = v_5.UIStroke
					i_5.UIGradient.Color = var74
				end
				if arg4 then
					v_5 = var2_upvw.Notifications.PetNotification
					i_5 = v_5.Background
					i_5 = "x0"
					i_5.PetValue.Text = i_5
				else
					v_5 = var2_upvw.Notifications.PetNotification
					i_5 = v_5.Background
					i_5 = "$0"
					i_5.PetValue.Text = i_5
				end
				var2_upvw.Notifications.PetNotification.Background.PetName.Text = GetPetNameInfo_upvr_result2_upvr
				var2_upvw.Notifications.PetNotification.Background.NormalIcon.Image = var59_upvr.Icon.NormalImage
				local tbl_13 = {}
				tbl_13.Value = arg2
				table.insert(tbl_9_upvr, TweenService_upvr:Create(NumberValue_upvr, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl_13))
				var12_upvw = NumberValue_upvr.Changed:Connect(function() -- Line 117
					--[[ Upvalues[4]:
						[1]: arg4 (copied, readonly)
						[2]: NumberValue_upvr (copied, readonly)
						[3]: var2_upvw (copied, read and write)
						[4]: AbbreviateNumber_upvr (copied, readonly)
					]]
					if arg4 then
						var2_upvw.Notifications.PetNotification.Background.PetValue.Text = 'x'..string.format("%."..2..'f', NumberValue_upvr.Value):gsub("%.?0+$", "")
					else
						var2_upvw.Notifications.PetNotification.Background.PetValue.Text = '$'..AbbreviateNumber_upvr(NumberValue_upvr.Value, true)
					end
				end)
				if Rarity == "Legendary" or Rarity == "Mythic" or Rarity == "Secret" or Rarity == "HyperSecret" then
					PlaySound_upvr("Discovered")
				else
					PlaySound_upvr("Achievement")
					local var77
				end
			end
			if arg2_3 then
				var77 = var2_upvw
				var77 = Enum.EasingStyle.Back
				local tbl_12 = {}
				var77 = UDim2.new(0.8, 0, 0.74, 0)
				tbl_12.Size = var77
				table.insert(tbl_9_upvr, TweenService_upvr:Create(var77.Notifications.PetNotification.Background, TweenInfo.new(0.15, var77, Enum.EasingDirection.Out), tbl_12))
			else
				var77 = var2_upvw
				var77 = Enum.EasingStyle.Sine
				local tbl_3 = {}
				local function INLINED_2() -- Internal function, doesn't exist in bytecode
					var77 = UDim2.new(0.714, 0, 0.662, 0)
					return var77
				end
				if not arg1_3 or not INLINED_2() then
					var77 = UDim2.new(0, 0, 0, 0)
				end
				tbl_3.Size = var77
				table.insert(tbl_9_upvr, TweenService_upvr:Create(var77.Notifications.PetNotification.Background, TweenInfo.new(0.2, var77, Enum.EasingDirection.Out), tbl_3))
			end
			if arg4 then
				local var80 = arg1_3
				if var80 then
					var80 = arg5
				end
				var2_upvw.Notifications.PetNotification.Background.NewPet.Visible = var80
			else
				var2_upvw.Notifications.PetNotification.Background.NewPet.Visible = arg1_3
			end
			var2_upvw.Notifications.PetNotification.Background.PetName.Visible = arg1_3
			var2_upvw.Notifications.PetNotification.Background.PetValue.Visible = arg1_3
			var2_upvw.Notifications.PetNotification.Background.Rarity.Visible = arg1_3
			var2_upvw.Notifications.PetNotification.Background.EvolveType.Visible = arg1_3
			for i_6, v_6 in pairs(tbl_9_upvr) do
				v_6:Play()
			end
			if arg2_3 then
				task.wait(0.15)
				v_6 = var2_upvw.Notifications
				i_6 = v_6.PetNotification
				i_6 = TweenInfo.new
				v_6 = 0.15
				i_6 = i_6(v_6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				v_6 = {}
				var77 = 0
				v_6.Size = UDim2.new(0.714, var77, 0.662, 0)
				TweenService_upvr:Create(i_6.Background, i_6, v_6):Play()
			end
			-- KONSTANTERROR: [25] 19. Error Block 85 end (CF ANALYSIS FAILED)
		end
		if arg3 then
			ToggleDiscoverMenu(true, true)
		else
			ToggleDiscoverMenu(true, false)
		end
		var2_upvw.Notifications.PetNotification.Visible = true
		task.wait(2.25)
		table.remove(tbl_7_upvr, 1)
		local _1_2 = tbl_7_upvr[1]
		if _1_2 then
			DiscoverPopup_upvr(_1_2.PetName, _1_2.PetValue, true, _1_2.IsEggHatch, _1_2.IsNewPet)
			return
		end
		ToggleDiscoverMenu(false, false)
		local _1_4 = tbl_9_upvr[1]
		if _1_4 then
			_1_4.Completed:Wait()
		end
		if #tbl_7_upvr == 0 then
			var2_upvw.Notifications.PetNotification.Visible = false
			var2_upvw.Notifications.PetNotification.Background.NormalIcon.Image = ""
		end
	end
end
local function UnlockPet_upvr(arg1, arg2) -- Line 201, Named "UnlockPet"
	--[[ Upvalues[2]:
		[1]: GetPetNameInfo_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
	]]
	if not arg1 and arg2 then
		local GetPetNameInfo_upvr_result1, _ = GetPetNameInfo_upvr(arg2)
		local var88 = tbl_2_upvr[GetPetNameInfo_upvr_result1]
		if not var88 then return end
		local SOME = var88.ListUi:FindFirstChild(arg2)
		if not SOME then return end
		local var90 = SOME
	end
	var90.Frame.Main.NormalIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	var90.Frame.Main.NormalIcon.WhiteIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	var90.Frame.Main.NormalIcon.Questionmark.Visible = false
end
local function _() -- Line 219, Named "UpdateCurrentLuck"
	--[[ Upvalues[2]:
		[1]: var3_upvw (read and write)
		[2]: var2_upvw (read and write)
	]]
	var2_upvw.Menus.Index.CurrentLuck.Text = string.format("You have: <font color='#74ff42'>%s Luck</font>!", '+'..(#var3_upvw.Data.Index)..'%')
end
local var91_upvw = "Normal"
local Serg_AutomaticList_upvr = require(ReplicatedStorage.Utilities.Serg_AutomaticList)
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Events_upvr = ReplicatedStorage.Events
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local function LoadIndex_upvr() -- Line 225, Named "LoadIndex"
	--[[ Upvalues[13]:
		[1]: var3_upvw (read and write)
		[2]: EvolveTypeConfig_upvr (readonly)
		[3]: var91_upvw (read and write)
		[4]: tbl_2_upvr (readonly)
		[5]: Serg_AutomaticList_upvr (readonly)
		[6]: PetsConfig_upvr (readonly)
		[7]: RarityGradients_upvr (readonly)
		[8]: UnlockPet_upvr (readonly)
		[9]: Serg_Button_upvr (readonly)
		[10]: var2_upvw (read and write)
		[11]: Events_upvr (readonly)
		[12]: DiscoverPopup_upvr (readonly)
		[13]: ClientSignals_upvr (readonly)
	]]
	for i_upvr, v in pairs(EvolveTypeConfig_upvr) do
		local clone_3_upvr = script.EvolveTypeList:Clone()
		local clone_2 = script.EvolveTypeButtonFrame:Clone()
		local ColorTheme_3 = v.ColorTheme
		clone_2.LayoutOrder = v.PetValueMultiplier * 10
		clone_2.Name = i_upvr
		clone_3_upvr.Name = i_upvr
		local var114
		if i_upvr == var91_upvw then
			clone_3_upvr.Visible = true
		end
		var114 = Serg_AutomaticList_upvr.new(clone_3_upvr, i_upvr, 4)
		tbl_2_upvr[i_upvr] = var114
		var114 = PetsConfig_upvr
		local pairs_result1, pairs_result2_2, pairs_result3_5 = pairs(var114)
		for i_2, v_2 in pairs_result1, pairs_result2_2, pairs_result3_5 do
			local var118 = i_upvr..' '..i_2
			local clone = script.PetTemplate:Clone()
			clone.LayoutOrder = v_2.PetValue
			clone.Name = i_upvr..' '..i_2
			clone.Frame.Main.NormalIcon.Image = v_2.Icon.NormalImage
			clone.Frame.Main.PetName.Text = i_2
			local var120 = RarityGradients_upvr[v_2.Rarity]
			if var120 then
				clone.Frame.Main.UIGradient.Color = var120
				clone.Frame.Background.UIGradient.Color = var120
				clone.Frame.Background.UIStroke.UIGradient.Color = var120
			end
			if i_upvr ~= "Normal" then
				clone.Frame.Main.NormalIcon.WhiteIcon.Image = v_2.Icon.WhiteImage
				clone.Frame.Main.NormalIcon.WhiteIcon.UIGradient.Color = ColorTheme_3.BackgroundGradient
				clone.Frame.Main.NormalIcon.WhiteIcon.Visible = true
			end
			if table.find(var3_upvw.Data.Index, var118) then
				UnlockPet_upvr(clone, var118)
			end
			local tbl_10 = {
				Frame = clone.Frame;
			}
			local tbl_5 = {}
			local function Click() -- Line 277
			end
			tbl_5.Click = Click
			tbl_10.Callbacks = tbl_5
			tbl_10.EnabledTweens = {
				Click = false;
				Hover = true;
			}
			tbl_10.ScalingMultiplier = 0.98
			Serg_Button_upvr.New(tbl_10)
			clone.Parent = clone_3_upvr
		end
		pairs_result2_2 = Serg_Button_upvr
		pairs_result2_2 = {}
		pairs_result2_2.Frame = clone_2
		pairs_result2_2.Callbacks = {
			Click = function() -- Line 294, Named "Click"
				--[[ Upvalues[4]:
					[1]: tbl_2_upvr (copied, readonly)
					[2]: var91_upvw (copied, read and write)
					[3]: i_upvr (readonly)
					[4]: clone_3_upvr (readonly)
				]]
				tbl_2_upvr[var91_upvw].ListUi.Visible = false
				var91_upvw = i_upvr
				clone_3_upvr.Visible = true
			end;
		}
		pairs_result2_2.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		pairs_result2_2.New(pairs_result2_2)
		pairs_result2_2 = clone_2.Main
		pairs_result2_2 = true
		if i_upvr ~= "Candy" then
			if i_upvr ~= "Lava" then
				pairs_result2_2 = false
			else
				pairs_result2_2 = true
			end
		end
		pairs_result2_2.EventOnly.Visible = pairs_result2_2
		pairs_result2_2 = v.PetValueMultiplier
		clone_2.LayoutOrder = pairs_result2_2 * 10
		clone_2.ZIndex = v.PetValueMultiplier
		pairs_result2_2 = clone_2.Main
		pairs_result2_2.Headline.Text = i_upvr
		pairs_result2_2 = clone_2.Background
		pairs_result2_2 = ColorTheme_3.BackgroundGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Background.UIStroke
		pairs_result2_2 = ColorTheme_3.BackgroundGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main
		pairs_result2_2 = ColorTheme_3.BackgroundGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main.Headline.UIStroke
		pairs_result2_2 = ColorTheme_3.BackgroundGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main.Headline
		pairs_result2_2 = ColorTheme_3.TextGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main.Multiplier.UIStroke
		pairs_result2_2 = ColorTheme_3.BackgroundGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main.Multiplier
		pairs_result2_2 = ColorTheme_3.TextGradient
		pairs_result2_2.UIGradient.Color = pairs_result2_2
		pairs_result2_2 = clone_2.Main
		pairs_result2_2 = 'x'..v.PetValueMultiplier
		pairs_result2_2.Multiplier.Text = pairs_result2_2
		pairs_result2_2 = var2_upvw.Menus.Index
		clone_2.Parent = pairs_result2_2.EvolveTypeButtons
		pairs_result2_2 = var2_upvw.Menus.Index
		clone_3_upvr.Parent = pairs_result2_2.ScrollingFrame
	end
	clone_3_upvr = '+'
	var2_upvw.Menus.Index.CurrentLuck.Text = string.format("You have: <font color='#74ff42'>%s Luck</font>!", clone_3_upvr..(#var3_upvw.Data.Index)..'%')
	for _, v_3 in pairs(tbl_2_upvr) do
		clone_3_upvr = v_3:Update
		clone_3_upvr()
	end
	Events_upvr.NewPet.OnClientEvent:Connect(function(arg1, arg2) -- Line 337
		--[[ Upvalues[1]:
			[1]: DiscoverPopup_upvr (copied, readonly)
		]]
		DiscoverPopup_upvr(arg1, arg2)
	end)
	var3_upvw:OnChange(function(arg1, arg2, arg3, arg4) -- Line 341
		--[[ Upvalues[3]:
			[1]: UnlockPet_upvr (copied, readonly)
			[2]: var3_upvw (copied, read and write)
			[3]: var2_upvw (copied, read and write)
		]]
		if arg1 == "TableInsert" and arg2[1] == "Index" then
			UnlockPet_upvr(false, arg3)
			var2_upvw.Menus.Index.CurrentLuck.Text = string.format("You have: <font color='#74ff42'>%s Luck</font>!", '+'..(#var3_upvw.Data.Index)..'%')
		end
	end)
	ClientSignals_upvr.HatchPet:Connect(function(arg1, arg2, arg3) -- Line 351
		--[[ Upvalues[1]:
			[1]: DiscoverPopup_upvr (copied, readonly)
		]]
		DiscoverPopup_upvr(arg1, arg2, nil, true, arg3)
	end)
end
local var133_upvw
return function(arg1, arg2, arg3) -- Line 356
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var133_upvw (read and write)
		[4]: LoadIndex_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var133_upvw = arg3
	LoadIndex_upvr()
end