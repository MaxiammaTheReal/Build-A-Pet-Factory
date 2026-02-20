-- Name: Buildings
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.Buildings
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.8411667000000307 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:41
-- Luau version 6, Types version 3
-- Time taken: 0.036495 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local Events_upvr = ReplicatedStorage.Events
local Buying_upvr = script.Buying
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local StoreConfig_upvr = require(ReplicatedStorage.Configs.StoreConfig)
local MarketplaceService_upvr = game:GetService("MarketplaceService")
local RebirthConfig_upvr = require(ReplicatedStorage.Configs.RebirthConfig)
local RarityOrders_upvr = require(ReplicatedStorage.Configs.RarityOrders)
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local TweenService_upvr = game:GetService("TweenService")
local ItemConfig_upvr = require(ReplicatedStorage.Configs.ItemConfig)
local RarityGradients_upvr = require(ReplicatedStorage.Configs.RarityGradients)
local IconPreloader_upvr = require(ReplicatedStorage.Utilities.IconPreloader)
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local Players_upvr = game:GetService("Players")
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local function LoadBuildingMenu_upvr() -- Line 33, Named "LoadBuildingMenu"
	--[[ Upvalues[19]:
		[1]: var2_upvw (read and write)
		[2]: Serg_Button_upvr (readonly)
		[3]: var3_upvw (read and write)
		[4]: ClientSignals_upvr (readonly)
		[5]: Events_upvr (readonly)
		[6]: Buying_upvr (readonly)
		[7]: AbbreviateNumber_upvr (readonly)
		[8]: StoreConfig_upvr (readonly)
		[9]: MarketplaceService_upvr (readonly)
		[10]: RebirthConfig_upvr (readonly)
		[11]: RarityOrders_upvr (readonly)
		[12]: PlaySound_upvr (readonly)
		[13]: TweenService_upvr (readonly)
		[14]: ItemConfig_upvr (readonly)
		[15]: RarityGradients_upvr (readonly)
		[16]: IconPreloader_upvr (readonly)
		[17]: ClientData_upvr (readonly)
		[18]: Players_upvr (readonly)
		[19]: TimerFormat_upvr (readonly)
	]]
	local tbl_14_upvr = {
		MainList = {
			HeadlineGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 73)), ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 255, 83))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(202, 255, 193)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))});
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 255, 160))});
			StrokeColor = Color3.fromRGB(56, 113, 35);
		};
		DecorationList = {
			HeadlineGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 159, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 222, 255))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(193, 204, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))});
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 182, 255))});
			StrokeColor = Color3.fromRGB(9, 100, 156);
		};
	}
	local function _(arg1) -- Line 69, Named "UnlockDecor"
		--[[ Upvalues[1]:
			[1]: var2_upvw (copied, read and write)
		]]
		local Main_5 = var2_upvw.Menus.Buildings.RightButtons.DecorationList.Main
		if arg1 >= 5 then
			Main_5 = false
		else
			Main_5 = true
		end
		Main_5.Locked.Visible = Main_5
	end
	local function SwapList_upvr(arg1) -- Line 73, Named "SwapList"
		--[[ Upvalues[2]:
			[1]: var2_upvw (copied, read and write)
			[2]: tbl_14_upvr (readonly)
		]]
		local Buildings = var2_upvw.Menus.Buildings
		if arg1 ~= "MainList" then
			Buildings = false
		else
			Buildings = true
		end
		Buildings.SideButtons.Visible = Buildings
		for i, v in pairs(tbl_14_upvr) do
			local SOME = var2_upvw.Menus.Buildings:FindFirstChild(i)
			local var60
			if SOME then
				if arg1 ~= i then
					var60 = false
				else
					var60 = true
				end
				SOME.Visible = var60
				if var60 then
					var2_upvw.Menus.Buildings.HeadlineFrame.Background.UIGradient.Color = v.HeadlineGradient
					var2_upvw.Menus.Buildings.HeadlineFrame.Main.UIGradient.Color = v.HeadlineGradient
					var2_upvw.Menus.Buildings.HeadlineFrame.Background.UIStroke.Color = v.StrokeColor
					var2_upvw.Menus.Buildings.HeadlineFrame.Main.Headline.UIStroke.Color = v.StrokeColor
					var2_upvw.Menus.Buildings.HeadlineFrame.Main.Headline.UIGradient.Color = v.TextGradient
					var2_upvw.Menus.Buildings.UIStroke.Color = v.StrokeColor
					var2_upvw.Menus.Buildings.UIGradient.Color = v.BackgroundGradient
				end
			end
		end
	end
	for _, v_2 in pairs(var2_upvw.Menus.Buildings.RightButtons:GetChildren()) do
		local tbl_3 = {
			Frame = v_2;
		}
		local tbl = {}
		local tostring_result1_upvr = tostring(v_2)
		local function Click() -- Line 103
			--[[ Upvalues[4]:
				[1]: tostring_result1_upvr (readonly)
				[2]: var3_upvw (copied, read and write)
				[3]: ClientSignals_upvr (copied, readonly)
				[4]: SwapList_upvr (readonly)
			]]
			if tostring_result1_upvr == "DecorationList" and var3_upvw.Data.Rebirths < 5 then
				ClientSignals_upvr.Notification:Fire({
					Message = "5 Rebirths required!";
					IsWarning = true;
				})
			else
				SwapList_upvr(tostring_result1_upvr)
			end
		end
		tbl.Click = Click
		tbl_3.Callbacks = tbl
		tbl_3.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl_3)
	end
	for _, v_3 in pairs(var2_upvw.Menus.Sell.Buttons:GetChildren()) do
		tostring_result1_upvr = v_3:IsA("Frame")
		if tostring_result1_upvr then
			tostring_result1_upvr = v_3.Name
			local tbl_17 = {
				Frame = v_3;
			}
			local tbl_13 = {}
			local function Click() -- Line 133
				--[[ Upvalues[3]:
					[1]: var2_upvw (copied, read and write)
					[2]: Events_upvr (copied, readonly)
					[3]: tostring_result1_upvr (readonly)
				]]
				local CurrentItemName = var2_upvw.Menus.Sell:GetAttribute("CurrentItemName")
				local var75
				if not CurrentItemName then
				else
					if tostring_result1_upvr == "SellAll" then
						var75 = "ALL"
					else
						var75 = 1
					end
					Events_upvr.DeleteInventoryItem:FireServer(CurrentItemName, var75)
				end
			end
			tbl_13.Click = Click
			tbl_17.Callbacks = tbl_13
			tbl_17.EnabledTweens = {
				Click = true;
				Hover = true;
			}
			Serg_Button_upvr.New(tbl_17)
		end
	end
	local tbl_16 = {}
	tostring_result1_upvr = var2_upvw
	tbl_16.Frame = tostring_result1_upvr.Menus.Buildings.InstantRestock
	local tbl_20 = {}
	local function Click() -- Line 150
		--[[ Upvalues[1]:
			[1]: ClientSignals_upvr (copied, readonly)
		]]
		ClientSignals_upvr.PromptPurchase:Fire("Restock")
	end
	tbl_20.Click = Click
	tbl_16.Callbacks = tbl_20
	tbl_16.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_16)
	for i_4, v_4_upvr in pairs({
		CashPurchase = function(arg1) -- Line 161
			--[[ Upvalues[1]:
				[1]: Events_upvr (copied, readonly)
			]]
			Events_upvr.PurchaseBuilding:FireServer(arg1)
		end;
		Robux1 = function(arg1) -- Line 164
			--[[ Upvalues[1]:
				[1]: ClientSignals_upvr (copied, readonly)
			]]
			ClientSignals_upvr.PromptPurchase:Fire(arg1.." x1")
		end;
		Robux5 = function(arg1) -- Line 167
			--[[ Upvalues[1]:
				[1]: ClientSignals_upvr (copied, readonly)
			]]
			ClientSignals_upvr.PromptPurchase:Fire(arg1.." x5")
		end;
	}) do
		local SOME_3 = Buying_upvr.Frame:FindFirstChild(i_4)
		if SOME_3 then
			local tbl_18 = {
				Frame = SOME_3;
			}
			local tbl_15 = {}
			local function Click() -- Line 179
				--[[ Upvalues[2]:
					[1]: Buying_upvr (copied, readonly)
					[2]: v_4_upvr (readonly)
				]]
				local SelectedBuilding = Buying_upvr:GetAttribute("SelectedBuilding")
				if not SelectedBuilding then
				else
					v_4_upvr(SelectedBuilding)
				end
			end
			tbl_15.Click = Click
			tbl_18.Callbacks = tbl_15
			tbl_18.EnabledTweens = {
				Click = true;
				Hover = true;
			}
			Serg_Button_upvr.New(tbl_18)
		end
	end
	local var92_upvw = 0
	local utf8_char_result1_upvr = utf8.char(57346)
	local function SetupBuyingFrame_upvr(arg1, arg2, arg3) -- Line 197, Named "SetupBuyingFrame"
		--[[ Upvalues[8]:
			[1]: Buying_upvr (copied, readonly)
			[2]: ClientSignals_upvr (copied, readonly)
			[3]: var92_upvw (read and write)
			[4]: AbbreviateNumber_upvr (copied, readonly)
			[5]: StoreConfig_upvr (copied, readonly)
			[6]: utf8_char_result1_upvr (readonly)
			[7]: MarketplaceService_upvr (copied, readonly)
			[8]: var2_upvw (copied, read and write)
		]]
		if Buying_upvr:GetAttribute("SelectedBuilding") == arg2 then
			Buying_upvr.Parent = script
			Buying_upvr:SetAttribute("SelectedBuilding", nil)
			ClientSignals_upvr.CurrentBuyingFrame:Fire(false, Buying_upvr, arg2)
		else
			var92_upvw += 1
			local var94_upvr = var92_upvw
			Buying_upvr.Frame.CashPurchase.Main.Amount.Text = '$'..AbbreviateNumber_upvr(arg3.Cost, true)
			Buying_upvr.Frame.Robux1.Main.Cost.Text = utf8_char_result1_upvr.."..."
			Buying_upvr.Frame.Robux5.Main.Cost.Text = utf8_char_result1_upvr.."..."
			local var96_upvr = StoreConfig_upvr[arg2.." x1"]
			task.spawn(function() -- Line 220
				--[[ Upvalues[6]:
					[1]: MarketplaceService_upvr (copied, readonly)
					[2]: var96_upvr (readonly)
					[3]: var94_upvr (readonly)
					[4]: var92_upvw (copied, read and write)
					[5]: Buying_upvr (copied, readonly)
					[6]: utf8_char_result1_upvr (copied, readonly)
				]]
				local pcall_result1, pcall_result2_2 = pcall(function() -- Line 221
					--[[ Upvalues[2]:
						[1]: MarketplaceService_upvr (copied, readonly)
						[2]: var96_upvr (copied, readonly)
					]]
					return MarketplaceService_upvr:GetProductInfoAsync(var96_upvr.Id, Enum.InfoType.Product)
				end)
				if var94_upvr ~= var92_upvw then
				else
					if pcall_result1 and pcall_result2_2 then
						Buying_upvr.Frame.Robux1.Main.Cost.Text = utf8_char_result1_upvr..pcall_result2_2.PriceInRobux
						return
					end
					Buying_upvr.Frame.Robux1.Main.Cost.Text = utf8_char_result1_upvr..'?'
				end
			end)
			local var101_upvr = StoreConfig_upvr[arg2.." x5"]
			task.spawn(function() -- Line 234
				--[[ Upvalues[6]:
					[1]: MarketplaceService_upvr (copied, readonly)
					[2]: var101_upvr (readonly)
					[3]: var94_upvr (readonly)
					[4]: var92_upvw (copied, read and write)
					[5]: Buying_upvr (copied, readonly)
					[6]: utf8_char_result1_upvr (copied, readonly)
				]]
				local pcall_result1_2, pcall_result2 = pcall(function() -- Line 235
					--[[ Upvalues[2]:
						[1]: MarketplaceService_upvr (copied, readonly)
						[2]: var101_upvr (copied, readonly)
					]]
					return MarketplaceService_upvr:GetProductInfoAsync(var101_upvr.Id, Enum.InfoType.Product)
				end)
				if var94_upvr ~= var92_upvw then
				else
					if pcall_result1_2 and pcall_result2 then
						Buying_upvr.Frame.Robux5.Main.Cost.Text = utf8_char_result1_upvr..pcall_result2.PriceInRobux
						return
					end
					Buying_upvr.Frame.Robux5.Main.Cost.Text = utf8_char_result1_upvr..'?'
				end
			end)
			Buying_upvr:SetAttribute("SelectedBuilding", arg2)
			Buying_upvr.LayoutOrder = arg1.LayoutOrder + 1
			local Menus = var2_upvw.Menus
			if arg3.Type == "Decoration" then
				Menus = "DecorationList"
			else
				Menus = "MainList"
			end
			Buying_upvr.Parent = Menus.Buildings[Menus]
			ClientSignals_upvr.CurrentBuyingFrame:Fire(true, Buying_upvr, arg2)
		end
	end
	local function _(arg1, arg2) -- Line 257, Named "SetBuildingStock"
		if not arg2 then
		end
		if not arg1 then
		else
			arg1.Main.Stock.Text = 'x'..0.." Stock"
		end
	end
	local function SetupBuildingFrame(arg1, arg2) -- Line 267
		--[[ Upvalues[8]:
			[1]: AbbreviateNumber_upvr (copied, readonly)
			[2]: RebirthConfig_upvr (copied, readonly)
			[3]: RarityOrders_upvr (copied, readonly)
			[4]: var3_upvw (copied, read and write)
			[5]: PlaySound_upvr (copied, readonly)
			[6]: Serg_Button_upvr (copied, readonly)
			[7]: ClientSignals_upvr (copied, readonly)
			[8]: SetupBuyingFrame_upvr (readonly)
		]]
		local clone_2_upvr = script.BuildingTemplate:Clone()
		clone_2_upvr.Name = arg1
		clone_2_upvr.Main.Icon.Image = arg2.Icon
		clone_2_upvr.Main.BuildingName.Text = arg1
		clone_2_upvr.Main.Cost.Text = '$'..AbbreviateNumber_upvr(arg2.Cost, true)
		clone_2_upvr.ZIndex = 10 - arg2.LayoutOrder
		local var107
		if var107 then
			var107 = arg2.Description[3]
			if not var107 then
				var107 = Color3.fromRGB(90, 225, 49)
			end
			clone_2_upvr.Main.Description.Text = string.format(arg2.Description[1], string.format("<font color=\"%s\">%s</font>", string.format("rgb(%d,%d,%d)", var107.R * 255, var107.G * 255, var107.B * 255), arg2.Description[2]))
		end
		if arg2.Rarity then
			clone_2_upvr:SetAttribute("Rarity", arg2.Rarity)
			clone_2_upvr.Main.Locked.RequiredRebirths.Text = (RebirthConfig_upvr.Rarity[arg2.Rarity] or 1).." Rebirth(s) Required"
		end
		clone_2_upvr.LayoutOrder = (RarityOrders_upvr[arg2.Rarity] or 999) + arg2.LayoutOrder * 2
		if not var3_upvw.Data.BuildingStock[arg1] then
		end
		if not clone_2_upvr then
		else
			clone_2_upvr.Main.Stock.Text = 'x'..0.." Stock"
		end
		local tbl_2 = {"BuildingStock"}
		tbl_2[2] = arg1
		var3_upvw:OnSet(tbl_2, function(arg1_2, arg2_2) -- Line 308
			--[[ Upvalues[2]:
				[1]: PlaySound_upvr (copied, readonly)
				[2]: clone_2_upvr (readonly)
			]]
			PlaySound_upvr("Purchase")
			local var110 = clone_2_upvr
			local var111 = arg1_2
			if not var111 then
				var111 = 0
			end
			if not var110 then
			else
				var110.Main.Stock.Text = 'x'..var111.." Stock"
			end
		end)
		local tbl_19 = {
			Frame = clone_2_upvr;
		}
		local tbl_4 = {}
		local function Click() -- Line 317
			--[[ Upvalues[5]:
				[1]: clone_2_upvr (readonly)
				[2]: ClientSignals_upvr (copied, readonly)
				[3]: SetupBuyingFrame_upvr (copied, readonly)
				[4]: arg1 (readonly)
				[5]: arg2 (readonly)
			]]
			if clone_2_upvr.Main.Locked.Visible then
				ClientSignals_upvr.Notification:Fire({
					Message = "Rebirth More To Unlock!";
					IsWarning = true;
				})
			else
				SetupBuyingFrame_upvr(clone_2_upvr, arg1, arg2)
			end
		end
		tbl_4.Click = Click
		tbl_19.Callbacks = tbl_4
		tbl_19.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		tbl_19.ScalingMultiplier = 0.97
		Serg_Button_upvr.New(tbl_19)
		return clone_2_upvr
	end
	local function UpdateAllBuildingStock_upvr(arg1) -- Line 340, Named "UpdateAllBuildingStock"
		--[[ Upvalues[1]:
			[1]: var2_upvw (copied, read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		for i_5, v_5 in pairs(arg1) do
			local SOME_2 = var2_upvw.Menus.Buildings.MainList:FindFirstChild(i_5)
			if not SOME_2 then
				SOME_2 = var2_upvw.Menus.Buildings.DecorationList:FindFirstChild(i_5)
			end
			if not v_5 then
			end
			if not SOME_2 then
			else
				SOME_2.Main.Stock.Text = 'x'..0.." Stock"
			end
		end
	end
	local function UpdateUnlockedBuildings_upvr() -- Line 348, Named "UpdateUnlockedBuildings"
		--[[ Upvalues[3]:
			[1]: var3_upvw (copied, read and write)
			[2]: RebirthConfig_upvr (copied, readonly)
			[3]: var2_upvw (copied, read and write)
		]]
		local tbl_9 = {"Basic"}
		for i_6, v_6 in pairs(RebirthConfig_upvr.Rarity) do
			if v_6 <= (var3_upvw.Data.Rebirths or 0) then
				table.insert(tbl_9, i_6)
			end
		end
		for _, v_7 in pairs(var2_upvw.Menus.Buildings.MainList:GetChildren()) do
			if v_7:IsA("Frame") then
				local Rarity_2 = v_7:GetAttribute("Rarity")
				if Rarity_2 then
					local Main_3 = v_7.Main
					if not table.find(tbl_9, Rarity_2) then
						Main_3 = true
					else
						Main_3 = false
					end
					Main_3.Locked.Visible = Main_3
				end
			end
		end
	end
	local function TweenToRaritySection_upvr(arg1) -- Line 371, Named "TweenToRaritySection"
		--[[ Upvalues[2]:
			[1]: var2_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
		]]
		TweenService_upvr:Create(var2_upvw.Menus.Buildings.MainList, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			CanvasPosition = Vector2.new(0, arg1.AbsolutePosition.Y - var2_upvw.Menus.Buildings.MainList.AbsolutePosition.Y + var2_upvw.Menus.Buildings.MainList.CanvasPosition.Y - arg1.AbsoluteSize.Y / 4);
		}):Play()
	end
	for i_8, v_8 in pairs(ItemConfig_upvr) do
		if v_8.Rarity ~= "Limited" and SetupBuildingFrame(i_8, v_8) then
			table.insert({}, v_8.Icon)
			local Menus_2 = var2_upvw.Menus
			if v_8.Type == "Decoration" then
				Menus_2 = "DecorationList"
			else
				Menus_2 = "MainList"
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			SetupBuildingFrame(i_8, v_8).Parent = Menus_2.Buildings[Menus_2]
		end
	end
	local tbl_8_upvr = {}
	local var168_upvw = 1
	local tbl_12 = {
		Frame = var2_upvw.Menus.Buildings.SideButtons.Up;
	}
	local tbl_6 = {}
	local function Click() -- Line 412
		--[[ Upvalues[3]:
			[1]: var168_upvw (read and write)
			[2]: tbl_8_upvr (readonly)
			[3]: TweenToRaritySection_upvr (readonly)
		]]
		local var171 = var168_upvw + 1
		local var172 = tbl_8_upvr[var171]
		if not var172 then
			var172 = tbl_8_upvr[#tbl_8_upvr]
		end
		if var172 then
			var168_upvw = var171
			TweenToRaritySection_upvr(var172.HeadlineFrame)
		end
	end
	tbl_6.Click = Click
	tbl_12.Callbacks = tbl_6
	tbl_12.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_12)
	local tbl_11 = {
		Frame = var2_upvw.Menus.Buildings.SideButtons.Down;
	}
	local tbl_10 = {}
	local function Click() -- Line 430
		--[[ Upvalues[3]:
			[1]: var168_upvw (read and write)
			[2]: tbl_8_upvr (readonly)
			[3]: TweenToRaritySection_upvr (readonly)
		]]
		local var176 = var168_upvw - 1
		local var177 = tbl_8_upvr[var176]
		if not var177 then
			var177 = tbl_8_upvr[1]
		end
		if var177 then
			var168_upvw = var176
			TweenToRaritySection_upvr(var177.HeadlineFrame)
		end
	end
	tbl_10.Click = Click
	tbl_11.Callbacks = tbl_10
	tbl_11.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_11)
	local var179_upvw = false
	for i_9, v_9 in pairs(RarityOrders_upvr) do
		if i_9 ~= "Limited" then
			local clone = script.ListRarityHeadline:Clone()
			clone.LayoutOrder = v_9
			table.insert(tbl_8_upvr, {
				Order = v_9;
				HeadlineFrame = clone;
			})
			local var197 = RarityGradients_upvr[i_9]
			clone.Background.UIGradient.Color = var197
			clone.Background.UIStroke.UIGradient.Color = var197
			clone.Main.UIGradient.Color = var197
			clone.Main.Rarity.UIStroke.UIGradient.Color = var197
			clone.Main.Rarity.Text = i_9
			clone.Parent = var2_upvw.Menus.Buildings.MainList
		end
	end
	table.sort(tbl_8_upvr, function(arg1, arg2) -- Line 499
		local var199
		if arg2.Order >= arg1.Order then
			var199 = false
		else
			var199 = true
		end
		return var199
	end)
	if var179_upvw then
		-- KONSTANTWARNING: GOTO [645] #461
	end
	var179_upvw = true
	task.delay(0.1, function() -- Line 452
		--[[ Upvalues[4]:
			[1]: var2_upvw (copied, read and write)
			[2]: tbl_8_upvr (readonly)
			[3]: var168_upvw (read and write)
			[4]: var179_upvw (read and write)
		]]
		local MainList = var2_upvw.Menus.Buildings.MainList
		local Y = MainList.CanvasPosition.Y
		local var210
		for i_10, v_10 in pairs(tbl_8_upvr) do
			if math.abs((v_10.HeadlineFrame.AbsolutePosition.Y - MainList.AbsolutePosition.Y + Y + v_10.HeadlineFrame.AbsoluteSize.Y / 2) - (Y + MainList.AbsoluteSize.Y / 2)) < math.huge then
			end
		end
		var168_upvw = nil or 1
		var179_upvw = false
	end)
	var2_upvw.Menus.Buildings.MainList:GetPropertyChangedSignal("CanvasPosition"):Connect(function() -- Line 447, Named "FindClosestRarityHeadline"
		--[[ Upvalues[4]:
			[1]: var179_upvw (read and write)
			[2]: var2_upvw (copied, read and write)
			[3]: tbl_8_upvr (readonly)
			[4]: var168_upvw (read and write)
		]]
		if var179_upvw then
		else
			var179_upvw = true
			task.delay(0.1, function() -- Line 452
				--[[ Upvalues[4]:
					[1]: var2_upvw (copied, read and write)
					[2]: tbl_8_upvr (copied, readonly)
					[3]: var168_upvw (copied, read and write)
					[4]: var179_upvw (copied, read and write)
				]]
				local MainList_2 = var2_upvw.Menus.Buildings.MainList
				local Y_2 = MainList_2.CanvasPosition.Y
				local var190
				for i_11, v_11 in pairs(tbl_8_upvr) do
					if math.abs((v_11.HeadlineFrame.AbsolutePosition.Y - MainList_2.AbsolutePosition.Y + Y_2 + v_11.HeadlineFrame.AbsoluteSize.Y / 2) - (Y_2 + MainList_2.AbsoluteSize.Y / 2)) < math.huge then
					end
				end
				var168_upvw = nil or 1
				var179_upvw = false
			end)
		end
	end)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	IconPreloader_upvr.PreloadIcons({})
	UpdateUnlockedBuildings_upvr()
	local tbl_5_upvr = {
		UserId = nil;
		ItemName = nil;
	}
	Serg_Button_upvr.New({
		Frame = var2_upvw.Menus.ConfirmGift.Yes;
		Callbacks = {
			Click = function() -- Line 519, Named "Click"
				--[[ Upvalues[4]:
					[1]: tbl_5_upvr (readonly)
					[2]: Events_upvr (copied, readonly)
					[3]: ClientData_upvr (copied, readonly)
					[4]: ClientSignals_upvr (copied, readonly)
				]]
				if not tbl_5_upvr.UserId or not tbl_5_upvr.ItemName then
				else
					Events_upvr.GiftPlayerItem:FireServer(tbl_5_upvr)
					if ClientData_upvr.CurrentMenu == "ConfirmGift" then
						ClientSignals_upvr.ToggleMenu:Fire("ConfirmGift")
					end
				end
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
	ClientSignals_upvr.GiftPlayerItem:Connect(function(arg1, arg2) -- Line 535
		--[[ Upvalues[5]:
			[1]: Players_upvr (copied, readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: ClientData_upvr (copied, readonly)
			[4]: ClientSignals_upvr (copied, readonly)
			[5]: tbl_5_upvr (readonly)
		]]
		local any_GetPlayerByUserId_result1 = Players_upvr:GetPlayerByUserId(arg1)
		if not any_GetPlayerByUserId_result1 then
		else
			var2_upvw.Menus.ConfirmGift.Description.Text = string.format("Are you sure you want to gift <font color=\"rgb(88, 255, 79)\">%s</font> x1 <font color=\"rgb(255, 188, 143)\">%s</font>?", any_GetPlayerByUserId_result1.Name, arg2)
			if ClientData_upvr.CurrentMenu ~= "ConfirmGift" then
				ClientSignals_upvr.ToggleMenu:Fire("ConfirmGift")
			end
			tbl_5_upvr.UserId = arg1
			tbl_5_upvr.ItemName = arg2
		end
	end)
	local Main_4 = var2_upvw.Menus.Buildings.RightButtons.DecorationList.Main
	if var3_upvw.Data.Rebirths >= 5 then
		Main_4 = false
	else
		Main_4 = true
	end
	Main_4.Locked.Visible = Main_4
	local Size_upvr = var2_upvw.Menus.Buildings.RestockTimer.Size
	var3_upvw:OnSet({"RestockBuildingsTimer"}, function(arg1, arg2) -- Line 557
		--[[ Upvalues[4]:
			[1]: var2_upvw (copied, read and write)
			[2]: TimerFormat_upvr (copied, readonly)
			[3]: TweenService_upvr (copied, readonly)
			[4]: Size_upvr (readonly)
		]]
		var2_upvw.Menus.Buildings.RestockTimer.Text = "Restocks In <font color=\"rgb(255, 221, 0)\">"..TimerFormat_upvr(arg1).."</font>"
		if arg1 <= 120 then
			TweenService_upvr:Create(var2_upvw.Menus.Buildings.RestockTimer, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				TextColor3 = Color3.fromRGB(255, 236, 93);
			}):Play()
		end
		if arg1 <= 30 then
			TweenService_upvr:Create(var2_upvw.Menus.Buildings.RestockTimer, TweenInfo.new(0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				Size = Size_upvr + UDim2.new(0, 0, 0.02, 0);
			}):Play()
		end
	end)
	var3_upvw:OnSet({"Rebirths"}, function(arg1, arg2) -- Line 574
		--[[ Upvalues[2]:
			[1]: UpdateUnlockedBuildings_upvr (readonly)
			[2]: var2_upvw (copied, read and write)
		]]
		UpdateUnlockedBuildings_upvr()
		local Main_2 = var2_upvw.Menus.Buildings.RightButtons.DecorationList.Main
		if arg1 >= 5 then
			Main_2 = false
		else
			Main_2 = true
		end
		Main_2.Locked.Visible = Main_2
	end)
	var3_upvw:OnChange(function(arg1, arg2, arg3, arg4) -- Line 579
		--[[ Upvalues[2]:
			[1]: UpdateAllBuildingStock_upvr (readonly)
			[2]: ClientSignals_upvr (copied, readonly)
		]]
		if arg1 == "SetValues" and arg2[1] == "BuildingStock" then
			UpdateAllBuildingStock_upvr(arg3)
			ClientSignals_upvr.Notification:Fire({
				Message = "Building Shop Restocked!";
				IsWarning = false;
			})
		end
	end)
end
local var230_upvw
return function(arg1, arg2, arg3) -- Line 593
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var230_upvw (read and write)
		[4]: LoadBuildingMenu_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var230_upvw = arg3
	LoadBuildingMenu_upvr()
end