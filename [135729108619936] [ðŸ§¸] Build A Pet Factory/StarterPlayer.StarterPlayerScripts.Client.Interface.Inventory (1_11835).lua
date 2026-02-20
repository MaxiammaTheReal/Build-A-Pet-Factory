-- Name: Inventory
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Interface.Inventory
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.25687070000094536 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:39
-- Luau version 6, Types version 3
-- Time taken: 0.023695 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContextActionService_upvr = game:GetService("ContextActionService")
local GamepadService_upvr = game:GetService("GamepadService")
local var4_upvw
local var5_upvw
local var6_upvw
local var7_upvw
local var8_upvw = 0
local var9_upvw
local var10_upvw = false
local var11_upvw = "Main"
local tbl_8_upvr = {
	Main = {
		StrokeColor = Color3.fromRGB(49, 104, 31);
		TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(161, 255, 151))});
		BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 255, 76)), ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 255, 0))});
	};
	Decor = {
		StrokeColor = Color3.fromRGB(27, 71, 112);
		TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(143, 167, 255))});
		BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 180, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(34, 152, 255))});
	};
}
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local function _() -- Line 68, Named "ItemCooldownCheck"
	--[[ Upvalues[1]:
		[1]: var8_upvw (read and write)
	]]
	local workspace_GetServerTimeNow_result1_2 = workspace:GetServerTimeNow()
	if workspace_GetServerTimeNow_result1_2 - var8_upvw <= 0.1 then
		return false
	end
	var8_upvw = workspace_GetServerTimeNow_result1_2
	return true
end
local tbl_3_upvr = {
	[true] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 255, 76)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(130, 255, 76)), ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 213, 70))});
	[false] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 167, 167))});
}
local tbl_6_upvr = {
	Background = Color3.fromRGB(255, 56, 56);
	Stroke = Color3.fromRGB(135, 39, 39);
}
local ColorSequence_new_result1_upvr = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 88, 88)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 94, 94)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 97, 97))})
local function ChangeSelectFrameAppearence_upvr(arg1, arg2) -- Line 102, Named "ChangeSelectFrameAppearence"
	--[[ Upvalues[3]:
		[1]: ColorSequence_new_result1_upvr (readonly)
		[2]: tbl_3_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	local var28
	if arg1.Name ~= "Hotkey1" then
		var28 = false
	else
		var28 = true
	end
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 32 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 32 end (CF ANALYSIS FAILED)
end
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local function ToggleTool_upvr(arg1, arg2) -- Line 122, Named "ToggleTool"
	--[[ Upvalues[3]:
		[1]: var6_upvw (read and write)
		[2]: ClientData_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
	]]
	if not arg1 then
		local const_string = "Hammer"
	end
	local Backpack = var6_upvw:FindFirstChild("Backpack")
	if not Backpack then
	else
		local Character = var6_upvw.Character
		if not Character then return end
		local class_Tool = Character:FindFirstChildWhichIsA("Tool")
		if const_string then
			local SOME_2 = Backpack:FindFirstChild(const_string)
		end
		if arg2 and SOME_2 then
			SOME_2.Parent = Character
		end
		if class_Tool then
			class_Tool.Parent = Backpack
		end
		if ClientData_upvr.CurrentMenu == "Sell" then
			ClientSignals_upvr.ToggleMenu:Fire("Sell")
		end
	end
end
local function _(arg1, arg2) -- Line 149, Named "Unselect"
	--[[ Upvalues[4]:
		[1]: ChangeSelectFrameAppearence_upvr (readonly)
		[2]: ClientSignals_upvr (readonly)
		[3]: ToggleTool_upvr (readonly)
		[4]: var7_upvw (read and write)
	]]
	if not arg1 then
	else
		ChangeSelectFrameAppearence_upvr(arg1, false)
		if arg2 then
			ClientSignals_upvr.StopAnyMode:Fire()
			ToggleTool_upvr(nil, false)
		end
		var7_upvw = nil
	end
end
local function _(arg1, arg2, arg3) -- Line 163, Named "Select"
	--[[ Upvalues[4]:
		[1]: ChangeSelectFrameAppearence_upvr (readonly)
		[2]: ToggleTool_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
		[4]: var7_upvw (read and write)
	]]
	if not arg1 then
	else
		ChangeSelectFrameAppearence_upvr(arg1, true)
		if arg3 then
			ToggleTool_upvr(arg2, true)
		end
		if arg2 then
			ClientSignals_upvr.PlaceMode:Fire(arg2)
		else
			ClientSignals_upvr.PickupMode:Fire()
		end
		var7_upvw = arg1
	end
end
local function _(arg1, arg2) -- Line 181, Named "ToggleItemSelect"
	--[[ Upvalues[4]:
		[1]: var7_upvw (read and write)
		[2]: ChangeSelectFrameAppearence_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
		[4]: ToggleTool_upvr (readonly)
	]]
	if var7_upvw then
		if var7_upvw == arg1 then
			if not arg1 then
			else
				ChangeSelectFrameAppearence_upvr(arg1, false)
				ClientSignals_upvr.StopAnyMode:Fire()
				ToggleTool_upvr(nil, false)
				var7_upvw = nil
			end
		end
		local var35 = var7_upvw
		if not var35 then
		else
			ChangeSelectFrameAppearence_upvr(var35, false)
			var7_upvw = nil
		end
	end
	if not arg1 then
	else
		ChangeSelectFrameAppearence_upvr(arg1, true)
		ToggleTool_upvr(arg2, true)
		if arg2 then
			ClientSignals_upvr.PlaceMode:Fire(arg2)
		else
			ClientSignals_upvr.PickupMode:Fire()
		end
		var7_upvw = arg1
	end
end
local ItemConfig_upvr = require(ReplicatedStorage.Configs.ItemConfig)
local RarityOrders_upvr = require(ReplicatedStorage.Configs.RarityOrders)
local TypeOrders_upvr = require(ReplicatedStorage.Configs.TypeOrders)
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local function UpdateOrderedList_upvr() -- Line 195, Named "UpdateOrderedList"
	--[[ Upvalues[16]:
		[1]: var5_upvw (read and write)
		[2]: ItemConfig_upvr (readonly)
		[3]: RarityOrders_upvr (readonly)
		[4]: TypeOrders_upvr (readonly)
		[5]: var11_upvw (read and write)
		[6]: var4_upvw (read and write)
		[7]: AbbreviateNumber_upvr (readonly)
		[8]: var7_upvw (read and write)
		[9]: ChangeSelectFrameAppearence_upvr (readonly)
		[10]: ClientSignals_upvr (readonly)
		[11]: ToggleTool_upvr (readonly)
		[12]: var9_upvw (read and write)
		[13]: Serg_Button_upvr (readonly)
		[14]: var10_upvw (read and write)
		[15]: var8_upvw (read and write)
		[16]: GamepadService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 171 start (CF ANALYSIS FAILED)
	local tbl_4 = {}
	for i, v in pairs(var5_upvw.Data.Inventory) do
		local var52 = ItemConfig_upvr[i]
		local var53
		if var52 then
			var53 = RarityOrders_upvr[var52.Rarity] or 999
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var53 = var52.LayoutOrder
				return var53
			end
			if var52.Type ~= "Decoration" or not INLINED() then
				var53 = 0
			end
			if var11_upvw == "Decor" then
			end
			var53 = tbl_4
			table.insert(var53, {
				ItemName = i;
				Type = var52.Type;
				Icon = var52.Icon;
				Stock = v;
				Order = -(var53 - TypeOrders_upvr[var52.Type] + var53);
			})
			var53 = {}
			table.insert(var53, i)
		end
	end
	table.sort(tbl_4, function(arg1, arg2) -- Line 220
		local var56
		if arg2.Order >= arg1.Order then
			var56 = false
		else
			var56 = true
		end
		return var56
	end)
	local _ = 1
	-- KONSTANTERROR: [0] 1. Error Block 171 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [338] 271. Error Block 87 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [338] 271. Error Block 87 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [79] 56. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [79] 56. Error Block 12 end (CF ANALYSIS FAILED)
end
local function SetupHotkeys_upvr() -- Line 324, Named "SetupHotkeys"
	--[[ Upvalues[10]:
		[1]: Serg_Button_upvr (readonly)
		[2]: var4_upvw (read and write)
		[3]: var10_upvw (read and write)
		[4]: var8_upvw (read and write)
		[5]: var7_upvw (read and write)
		[6]: ChangeSelectFrameAppearence_upvr (readonly)
		[7]: ClientSignals_upvr (readonly)
		[8]: ToggleTool_upvr (readonly)
		[9]: GamepadService_upvr (readonly)
		[10]: ContextActionService_upvr (readonly)
	]]
	local tbl_2 = {Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four, Enum.KeyCode.Five, Enum.KeyCode.Six, Enum.KeyCode.Seven, Enum.KeyCode.Eight, Enum.KeyCode.Nine}
	local tbl_9 = {
		Frame = var4_upvw.Inventory.Hotkeys.BackpackToggle;
	}
	local tbl = {}
	local function Click() -- Line 340
		--[[ Upvalues[1]:
			[1]: var4_upvw (copied, read and write)
		]]
		var4_upvw.Inventory.Backpack.Visible = not var4_upvw.Inventory.Backpack.Visible
	end
	tbl.Click = Click
	tbl_9.Callbacks = tbl
	tbl_9.EnabledTweens = {
		Click = true;
		Hover = true;
	}
	Serg_Button_upvr.New(tbl_9)
	for i_2_upvr = 1, 9 do
		local SOME_3_upvr = var4_upvw.Inventory.Hotkeys:FindFirstChild("Hotkey"..i_2_upvr)
		local function OnHotKeyPress_upvr(arg1, arg2) -- Line 353, Named "OnHotKeyPress"
			--[[ Upvalues[9]:
				[1]: var10_upvw (copied, read and write)
				[2]: var8_upvw (copied, read and write)
				[3]: i_2_upvr (readonly)
				[4]: SOME_3_upvr (readonly)
				[5]: var7_upvw (copied, read and write)
				[6]: ChangeSelectFrameAppearence_upvr (copied, readonly)
				[7]: ClientSignals_upvr (copied, readonly)
				[8]: ToggleTool_upvr (copied, readonly)
				[9]: GamepadService_upvr (copied, readonly)
			]]
			if arg2 and arg2 ~= Enum.UserInputState.Begin then
			else
				if not var10_upvw then return end
				local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
				if workspace_GetServerTimeNow_result1 - var8_upvw <= 0.1 then
				else
					var8_upvw = workspace_GetServerTimeNow_result1
				end
				if true then
					if i_2_upvr == 1 then
						local var66 = SOME_3_upvr
						if var7_upvw then
							if var7_upvw == var66 then
								if not var66 then
								else
									ChangeSelectFrameAppearence_upvr(var66, false)
									ClientSignals_upvr.StopAnyMode:Fire()
									ToggleTool_upvr(nil, false)
									var7_upvw = nil
								end
							end
							local var67 = var7_upvw
							if not var67 then
							else
								ChangeSelectFrameAppearence_upvr(var67, false)
								var7_upvw = nil
							end
						end
						if not var66 then
						else
							ChangeSelectFrameAppearence_upvr(var66, true)
							ToggleTool_upvr(nil, true)
							ClientSignals_upvr.PickupMode:Fire()
							var7_upvw = var66
						end
					end
					local ItemName = SOME_3_upvr:GetAttribute("ItemName")
					if ItemName then
						GamepadService_upvr:DisableGamepadCursor()
						local var69 = SOME_3_upvr
						if var7_upvw then
							if var7_upvw == var69 then
								if not var69 then
								else
									ChangeSelectFrameAppearence_upvr(var69, false)
									ClientSignals_upvr.StopAnyMode:Fire()
									ToggleTool_upvr(nil, false)
									var7_upvw = nil
								end
							end
							local var70 = var7_upvw
							if not var70 then
							else
								ChangeSelectFrameAppearence_upvr(var70, false)
								var7_upvw = nil
							end
						end
						if not var69 then return end
						ChangeSelectFrameAppearence_upvr(var69, true)
						ToggleTool_upvr(ItemName, true)
						if ItemName then
							ClientSignals_upvr.PlaceMode:Fire(ItemName)
						else
							ClientSignals_upvr.PickupMode:Fire()
						end
						var7_upvw = var69
					end
				end
			end
		end
		local tbl_7 = {
			Frame = SOME_3_upvr;
		}
		local tbl_5 = {}
		local function Click() -- Line 378
			--[[ Upvalues[1]:
				[1]: OnHotKeyPress_upvr (readonly)
			]]
			OnHotKeyPress_upvr()
		end
		tbl_5.Click = Click
		tbl_7.Callbacks = tbl_5
		tbl_7.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl_7)
		ContextActionService_upvr:BindAction("PC_"..i_2_upvr, OnHotKeyPress_upvr, false, tbl_2[i_2_upvr])
	end
end
local function SetupConsoleNavigation_upvr() -- Line 392, Named "SetupConsoleNavigation"
	--[[ Upvalues[7]:
		[1]: var4_upvw (read and write)
		[2]: ContextActionService_upvr (readonly)
		[3]: var10_upvw (read and write)
		[4]: var7_upvw (read and write)
		[5]: ChangeSelectFrameAppearence_upvr (readonly)
		[6]: ClientSignals_upvr (readonly)
		[7]: ToggleTool_upvr (readonly)
	]]
	local function getNextVisibleIndex_upvr(arg1, arg2) -- Line 393, Named "getNextVisibleIndex"
		--[[ Upvalues[1]:
			[1]: var4_upvw (copied, read and write)
		]]
		for _ = 1, 9 do
			local var76
			if 9 < var76 then
				var76 = 1
			elseif var76 < 1 then
				var76 = 9
			end
			local SOME = var4_upvw.Inventory.Hotkeys:FindFirstChild("Hotkey"..var76)
			if SOME and SOME.Visible then
				return var76
			end
		end
		return arg1
	end
	ContextActionService_upvr:BindAction("Console_HotbarLeft", function(arg1, arg2) -- Line 414
		--[[ Upvalues[7]:
			[1]: var10_upvw (copied, read and write)
			[2]: var7_upvw (copied, read and write)
			[3]: var4_upvw (copied, read and write)
			[4]: getNextVisibleIndex_upvr (readonly)
			[5]: ChangeSelectFrameAppearence_upvr (copied, readonly)
			[6]: ClientSignals_upvr (copied, readonly)
			[7]: ToggleTool_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 end (CF ANALYSIS FAILED)
	end, false, Enum.KeyCode.DPadLeft)
	ContextActionService_upvr:BindAction("Console_HotbarRight", function(arg1, arg2) -- Line 444
		--[[ Upvalues[7]:
			[1]: var10_upvw (copied, read and write)
			[2]: var7_upvw (copied, read and write)
			[3]: var4_upvw (copied, read and write)
			[4]: getNextVisibleIndex_upvr (readonly)
			[5]: ChangeSelectFrameAppearence_upvr (copied, readonly)
			[6]: ClientSignals_upvr (copied, readonly)
			[7]: ToggleTool_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [5] 4. Error Block 3 end (CF ANALYSIS FAILED)
	end, false, Enum.KeyCode.DPadRight)
end
local function SetupSorting_upvr() -- Line 473, Named "SetupSorting"
	--[[ Upvalues[5]:
		[1]: var11_upvw (read and write)
		[2]: tbl_8_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: Serg_Button_upvr (readonly)
		[5]: UpdateOrderedList_upvr (readonly)
	]]
	local var80_upvw = 0
	local function ApplySortTheme_upvr(arg1) -- Line 476, Named "ApplySortTheme"
		--[[ Upvalues[4]:
			[1]: var80_upvw (read and write)
			[2]: var11_upvw (copied, read and write)
			[3]: tbl_8_upvr (copied, readonly)
			[4]: var4_upvw (copied, read and write)
		]]
		local workspace_GetServerTimeNow_result1_3 = workspace:GetServerTimeNow()
		local var82
		if workspace_GetServerTimeNow_result1_3 - var80_upvw < var82 then
		else
			var80_upvw = workspace_GetServerTimeNow_result1_3
			if var11_upvw == "Main" then
				var82 = "Decor"
			else
				var82 = "Main"
			end
			var11_upvw = var82
			var82 = tbl_8_upvr[arg1]
			if not var82 then return end
			var4_upvw.Inventory.Backpack.Sort.Main.UIGradient.Color = var82.BackgroundGradient
			var4_upvw.Inventory.Backpack.Sort.Background.UIGradient.Color = var82.BackgroundGradient
			var4_upvw.Inventory.Backpack.Sort.Background.UIStroke.Color = var82.StrokeColor
			var4_upvw.Inventory.Backpack.Sort.Main.Headline.UIGradient.Color = var82.TextGradient
			var4_upvw.Inventory.Backpack.Sort.Main.OtherHeadline.UIGradient.Color = var82.TextGradient
			var4_upvw.Inventory.Backpack.Sort.Main.Headline.UIStroke.Color = var82.StrokeColor
			var4_upvw.Inventory.Backpack.Sort.Main.OtherHeadline.UIStroke.Color = var82.StrokeColor
			var4_upvw.Inventory.Backpack.Sort.Main.Headline.Text = arg1
		end
	end
	Serg_Button_upvr.New({
		Frame = var4_upvw.Inventory.Backpack.Sort;
		Callbacks = {
			Click = function() -- Line 506, Named "Click"
				--[[ Upvalues[3]:
					[1]: ApplySortTheme_upvr (readonly)
					[2]: var11_upvw (copied, read and write)
					[3]: UpdateOrderedList_upvr (copied, readonly)
				]]
				local var85
				if var11_upvw == "Main" then
					var85 = "Decor"
				else
					var85 = "Main"
				end
				ApplySortTheme_upvr(var85)
				UpdateOrderedList_upvr()
			end;
		};
		EnabledTweens = {
			Click = true;
			Hover = true;
		};
	})
end
local Serg_AutomaticList_upvr = require(ReplicatedStorage.Utilities.Serg_AutomaticList)
return function(arg1, arg2, arg3) -- Line 519
	--[[ Upvalues[14]:
		[1]: var4_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: var9_upvw (read and write)
		[5]: Serg_AutomaticList_upvr (readonly)
		[6]: UpdateOrderedList_upvr (readonly)
		[7]: SetupHotkeys_upvr (readonly)
		[8]: SetupConsoleNavigation_upvr (readonly)
		[9]: SetupSorting_upvr (readonly)
		[10]: ClientSignals_upvr (readonly)
		[11]: var7_upvw (read and write)
		[12]: ChangeSelectFrameAppearence_upvr (readonly)
		[13]: ToggleTool_upvr (readonly)
		[14]: var10_upvw (read and write)
	]]
	var4_upvw = arg1
	var5_upvw = arg2
	var6_upvw = arg3
	var9_upvw = Serg_AutomaticList_upvr.new(var4_upvw.Inventory.Backpack.ScrollingFrame.List, "BackpackList")
	UpdateOrderedList_upvr()
	SetupHotkeys_upvr()
	SetupConsoleNavigation_upvr()
	SetupSorting_upvr()
	ClientSignals_upvr.HumanoidDied:Connect(function() -- Line 534
		--[[ Upvalues[5]:
			[1]: var7_upvw (copied, read and write)
			[2]: ChangeSelectFrameAppearence_upvr (copied, readonly)
			[3]: ClientSignals_upvr (copied, readonly)
			[4]: ToggleTool_upvr (copied, readonly)
			[5]: var10_upvw (copied, read and write)
		]]
		local var90 = var7_upvw
		if not var90 then
		else
			ChangeSelectFrameAppearence_upvr(var90, false)
			ClientSignals_upvr.StopAnyMode:Fire()
			ToggleTool_upvr(nil, false)
			var7_upvw = nil
		end
		var10_upvw = false
	end)
	ClientSignals_upvr.CharacterAdded:Connect(function() -- Line 540
		--[[ Upvalues[1]:
			[1]: var10_upvw (copied, read and write)
		]]
		var10_upvw = true
	end)
	ClientSignals_upvr.ResetInventoryItem:Connect(function() -- Line 544
		--[[ Upvalues[4]:
			[1]: var7_upvw (copied, read and write)
			[2]: ChangeSelectFrameAppearence_upvr (copied, readonly)
			[3]: ClientSignals_upvr (copied, readonly)
			[4]: ToggleTool_upvr (copied, readonly)
		]]
		if not var7_upvw then
		else
			local Frame = var7_upvw:FindFirstChild("Frame")
			if not Frame then
				Frame = var7_upvw
			end
			if not Frame then return end
			ChangeSelectFrameAppearence_upvr(Frame, false)
			ClientSignals_upvr.StopAnyMode:Fire()
			ToggleTool_upvr(nil, false)
			var7_upvw = nil
		end
	end)
	var5_upvw:OnChange(function(arg1_2, arg2_2, arg3_2, arg4) -- Line 550
		--[[ Upvalues[1]:
			[1]: UpdateOrderedList_upvr (copied, readonly)
		]]
		if arg2_2[1] == "Inventory" then
			UpdateOrderedList_upvr()
		end
	end)
end