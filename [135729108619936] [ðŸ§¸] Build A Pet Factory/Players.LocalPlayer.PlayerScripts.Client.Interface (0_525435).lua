-- Name: Interface
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 1.113740200000393 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:38
-- Luau version 6, Types version 3
-- Time taken: 0.108816 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local GuiService_upvr = game:GetService("GuiService")
local var4_upvw
local var5_upvw
local var6_upvw
local Device_upvr = require(ReplicatedStorage.Utilities.Device)
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local module = {}
local tbl_20_upvr = {}
local GamepadService_upvr = game:GetService("GamepadService")
local function ToggleMenu_upvr(arg1, arg2) -- Line 45, Named "ToggleMenu"
	--[[ Upvalues[8]:
		[1]: ClientData_upvr (readonly)
		[2]: ToggleMenu_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: tbl_20_upvr (readonly)
		[5]: TweenService_upvr (readonly)
		[6]: Device_upvr (readonly)
		[7]: GamepadService_upvr (readonly)
		[8]: GuiService_upvr (readonly)
	]]
	if arg1 == nil then
		if ClientData_upvr.CurrentMenu then
			ToggleMenu_upvr(ClientData_upvr.CurrentMenu, false)
		end
	else
		if ClientData_upvr.CurrentMenu then
			if ClientData_upvr.CurrentMenu ~= arg1 then
				ToggleMenu_upvr(ClientData_upvr.CurrentMenu, false)
			end
		end
		local SOME = var4_upvw.Menus:FindFirstChild(arg1)
		if not SOME then return end
		if not SOME:FindFirstChild("UIScale") then
			local UIScale_2 = Instance.new("UIScale")
			local var21 = UIScale_2
			UIScale_2.Parent = SOME
		end
		if tbl_20_upvr[arg1] then
			tbl_20_upvr[arg1]:Cancel()
			tbl_20_upvr[arg1] = nil
		end
		local var22 = arg2
		if not var22 then
			var22 = not SOME:GetAttribute("MenuState")
		end
		SOME:SetAttribute("MenuState", var22)
		if var22 then
			var21.Scale = 0.75
			SOME.Visible = true
			tbl_20_upvr[arg1] = TweenService_upvr:Create(var21, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0), {
				Scale = 1;
			})
			tbl_20_upvr[arg1]:Play()
		else
			SOME.Visible = false
		end
		if not var22 or not arg1 then
			local var24
		end
		ClientData_upvr.CurrentMenu = var24
		if Device_upvr.CurrentDevice == "Console" then
			GamepadService_upvr:DisableGamepadCursor()
			if var24 then
				if GuiService_upvr.SelectedObject then
					GuiService_upvr.SelectedObject = nil
				end
				task.wait()
				if SOME.Visible and ClientData_upvr.CurrentMenu == arg1 then
					GamepadService_upvr:EnableGamepadCursor(SOME)
				end
			end
		end
	end
end
local Events_upvr = ReplicatedStorage.Events
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Debris_upvr = game:GetService("Debris")
local AbbreviateNumber_upvr = require(ReplicatedStorage.Utilities.AbbreviateNumber)
local random_state_upvr = Random.new()
local PlaySound_upvr = require(ReplicatedStorage.Utilities.PlaySound)
local RNGSparkles_upvr = require(ReplicatedStorage.Utilities.RNGSparkles)
local TimerFormat_upvr = require(ReplicatedStorage.Utilities.TimerFormat)
local RunService_upvr = game:GetService("RunService")
local Lighting_upvr = game:GetService("Lighting")
local StoreConfig_upvr = require(ReplicatedStorage.Configs.StoreConfig)
local MarketplaceService_upvr = game:GetService("MarketplaceService")
local CollectionService_upvr = game:GetService("CollectionService")
local TopBar_upvr = require(ReplicatedStorage.Utilities.TopBar)
local SocialService_upvr = game:GetService("SocialService")
local AnnouncementThemeConfig_upvr = require(ReplicatedStorage.Configs.AnnouncementThemeConfig)
local TextChatService_upvr = game:GetService("TextChatService")
local Players_upvr = game:GetService("Players")
local ConfettiPopup_upvr = require(ReplicatedStorage.Utilities.ConfettiPopup)
local function SetupFrontUi_upvr() -- Line 114, Named "SetupFrontUi"
	--[[ Upvalues[28]:
		[1]: var5_upvw (read and write)
		[2]: ToggleMenu_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
		[4]: Events_upvr (readonly)
		[5]: Serg_Button_upvr (readonly)
		[6]: var4_upvw (read and write)
		[7]: ClientData_upvr (readonly)
		[8]: TweenService_upvr (readonly)
		[9]: Debris_upvr (readonly)
		[10]: AbbreviateNumber_upvr (readonly)
		[11]: random_state_upvr (readonly)
		[12]: PlaySound_upvr (readonly)
		[13]: RNGSparkles_upvr (readonly)
		[14]: TimerFormat_upvr (readonly)
		[15]: RunService_upvr (readonly)
		[16]: Lighting_upvr (readonly)
		[17]: StoreConfig_upvr (readonly)
		[18]: MarketplaceService_upvr (readonly)
		[19]: var6_upvw (read and write)
		[20]: CollectionService_upvr (readonly)
		[21]: Device_upvr (readonly)
		[22]: TopBar_upvr (readonly)
		[23]: SocialService_upvr (readonly)
		[24]: AnnouncementThemeConfig_upvr (readonly)
		[25]: GuiService_upvr (readonly)
		[26]: TextChatService_upvr (readonly)
		[27]: Players_upvr (readonly)
		[28]: ConfettiPopup_upvr (readonly)
	]]
	local tbl_10_upvr = {
		Pets = function() -- Line 118
			--[[ Upvalues[3]:
				[1]: var5_upvw (copied, read and write)
				[2]: ToggleMenu_upvr (copied, readonly)
				[3]: ClientSignals_upvr (copied, readonly)
			]]
			if 5 <= var5_upvw.Data.Rebirths then
				ToggleMenu_upvr("Pets")
			else
				ClientSignals_upvr.Notification:Fire({
					Message = "5 Rebirths Required!";
					IsWarning = false;
				})
			end
		end;
	}
	local var48_upvw = 0
	function tbl_10_upvr.Home() -- Line 128
		--[[ Upvalues[2]:
			[1]: var48_upvw (read and write)
			[2]: Events_upvr (copied, readonly)
		]]
		local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
		if 1 <= workspace_GetServerTimeNow_result1 - var48_upvw then
			var48_upvw = workspace_GetServerTimeNow_result1
			Events_upvr.TeleportHome:FireServer()
		end
	end
	local function AddButtonConnection_upvr(arg1, arg2) -- Line 141, Named "AddButtonConnection"
		--[[ Upvalues[3]:
			[1]: tbl_10_upvr (readonly)
			[2]: Serg_Button_upvr (copied, readonly)
			[3]: ToggleMenu_upvr (copied, readonly)
		]]
		local tbl_31 = {}
		tbl_31.Frame = arg1
		local tbl_25 = {}
		local var52_upvr = tbl_10_upvr[arg2]
		local function Click() -- Line 147
			--[[ Upvalues[4]:
				[1]: var52_upvr (readonly)
				[2]: arg1 (readonly)
				[3]: ToggleMenu_upvr (copied, readonly)
				[4]: arg2 (readonly)
			]]
			if var52_upvr then
				var52_upvr(arg1)
			else
				ToggleMenu_upvr(arg2)
			end
		end
		tbl_25.Click = Click
		tbl_31.Callbacks = tbl_25
		tbl_31.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl_31)
	end
	local function AddButtonFrames(arg1) -- Line 162
		--[[ Upvalues[1]:
			[1]: AddButtonConnection_upvr (readonly)
		]]
		for _, v in pairs(arg1:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "ButtonHolder" then
				AddButtonConnection_upvr(v, tostring(v))
			end
		end
	end
	local function AnimatePopup_upvr(arg1, arg2, arg3, arg4) -- Line 208, Named "AnimatePopup"
		--[[ Upvalues[2]:
			[1]: TweenService_upvr (copied, readonly)
			[2]: Debris_upvr (copied, readonly)
		]]
		local any_Create_result1_8 = TweenService_upvr:Create(arg1, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Position = UDim2.new(arg2.X.Scale, 0, arg2.Y.Scale - 0.08, 0);
		})
		local var74_upvw
		var74_upvw = any_Create_result1_8.Completed:Connect(function() -- Line 214
			--[[ Upvalues[6]:
				[1]: var74_upvw (read and write)
				[2]: TweenService_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: arg4 (readonly)
				[5]: arg3 (readonly)
				[6]: Debris_upvr (copied, readonly)
			]]
			var74_upvw:Disconnect()
			var74_upvw = nil
			TweenService_upvr:Create(arg1, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				Size = UDim2.new(0.11, 0, 0.11, 0);
			}):Play()
			task.wait(0.55)
			if arg4 then
				TweenService_upvr:Create(arg1.Amount, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
					TextTransparency = 1;
				}):Play()
				TweenService_upvr:Create(arg1.Amount.UIStroke, TweenInfo.new(0.3375, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
					Transparency = 1;
				}):Play()
			end
			local tbl_14 = {}
			tbl_14.Position = arg3
			TweenService_upvr:Create(arg1, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), tbl_14):Play()
			TweenService_upvr:Create(arg1, TweenInfo.new(0.475, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				ImageTransparency = 1;
			}):Play()
			Debris_upvr:AddItem(arg1, 0.5)
		end)
		any_Create_result1_8:Play()
	end
	local function GemsPopup_upvr(arg1) -- Line 243, Named "GemsPopup"
		--[[ Upvalues[4]:
			[1]: var4_upvw (copied, read and write)
			[2]: AbbreviateNumber_upvr (copied, readonly)
			[3]: random_state_upvr (copied, readonly)
			[4]: AnimatePopup_upvr (readonly)
		]]
		if not var4_upvw:FindFirstChild("LeftButtons") then
		else
			local clone_2 = script.Assets.GemsPopup:Clone()
			clone_2.Amount.Text = AbbreviateNumber_upvr(arg1, true)
			local udim2_2 = UDim2.new(random_state_upvr:NextNumber(0.3, 0.7), 0, random_state_upvr:NextNumber(0.4, 0.6), 0)
			clone_2.Position = udim2_2
			clone_2.Parent = var4_upvw
			AnimatePopup_upvr(clone_2, udim2_2, var4_upvw.LeftButtons.Position - UDim2.new(0, 0, 0.18, 0), true)
		end
	end
	local function CashPopups_upvr(arg1) -- Line 255, Named "CashPopups"
		--[[ Upvalues[4]:
			[1]: var4_upvw (copied, read and write)
			[2]: AbbreviateNumber_upvr (copied, readonly)
			[3]: random_state_upvr (copied, readonly)
			[4]: AnimatePopup_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local randint = math.random(6, 7)
		local var95 = arg1 / randint
		local var96 = var4_upvw.TopUi.Position + UDim2.new(0, 0, 0.025, 0)
		local tbl_5 = {}
		for i_3 = 1, randint do
			table.insert(tbl_5, i_3)
		end
		for i_4 = #tbl_5, 2, -1 do
			local randint_from_1 = math.random(i_4)
			tbl_5[i_4] = tbl_5[randint_from_1]
			tbl_5[randint_from_1] = tbl_5[i_4]
		end
		for i_5 = 1, randint do
			local clone = script.Assets.CashPopup:Clone()
			clone.Amount.Text = '$'..AbbreviateNumber_upvr(var95, true)
			local var100 = tbl_5[i_5]
			local var101 = 1 / randint
			local udim2 = UDim2.new(random_state_upvr:NextNumber(math.max((var100 - 1) * var101, 0.2), math.min(var100 * var101, 0.8)), 0, random_state_upvr:NextNumber(0.25, 0.65), 0)
			clone.Position = udim2
			clone.Parent = var4_upvw
			AnimatePopup_upvr(clone, udim2, var96, true)
			task.wait(0.1 / i_5)
		end
	end
	local function _(arg1) -- Line 704, Named "UpdateFriendsBoost"
		--[[ Upvalues[1]:
			[1]: var4_upvw (copied, read and write)
		]]
		var4_upvw.BottomLeft.FriendsBoost.Text = "Friends Boost: "..arg1..'%'
	end
	local function _() -- Line 1254, Named "SetupChats"
		--[[ Upvalues[2]:
			[1]: TextChatService_upvr (copied, readonly)
			[2]: Players_upvr (copied, readonly)
		]]
		function TextChatService_upvr.OnIncomingMessage(arg1) -- Line 1255
			--[[ Upvalues[1]:
				[1]: Players_upvr (copied, readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [12] 9. Error Block 3 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [12] 9. Error Block 3 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [20] 14. Error Block 4 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [20] 14. Error Block 4 end (CF ANALYSIS FAILED)
		end
	end
	Events_upvr.PlaySound.OnClientEvent:Connect(function(arg1) -- Line 1291
		--[[ Upvalues[3]:
			[1]: PlaySound_upvr (copied, readonly)
			[2]: ConfettiPopup_upvr (copied, readonly)
			[3]: var4_upvw (copied, read and write)
		]]
		PlaySound_upvr(arg1)
		if arg1 == "Victory" then
			ConfettiPopup_upvr(var4_upvw)
		end
	end)
	var5_upvw:OnSet({"FriendsBoost"}, function(arg1, arg2) -- Line 1299
		--[[ Upvalues[1]:
			[1]: var4_upvw (copied, read and write)
		]]
		var4_upvw.BottomLeft.FriendsBoost.Text = "Friends Boost: "..arg1..'%'
	end)
	ClientSignals_upvr.GetCurrency:Connect(function(arg1, arg2) -- Line 1303
		--[[ Upvalues[1]:
			[1]: var5_upvw (copied, read and write)
		]]
		local var396 = var5_upvw.Data[arg1]
		if arg2 then
			if var396 then
				arg2(var396)
				return
			end
			arg2(0)
		end
	end)
	;(function() -- Line 296, Named "SetupCashUpdater"
		--[[ Upvalues[5]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
			[3]: AbbreviateNumber_upvr (copied, readonly)
			[4]: var5_upvw (copied, read and write)
			[5]: CashPopups_upvr (readonly)
		]]
		local Size = var4_upvw.TopUi.Cash.Size
		local any_Create_result1_7_upvr = TweenService_upvr:Create(var4_upvw.TopUi.Cash, TweenInfo.new(0.075, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
			Size = UDim2.fromScale(Size.X.Scale * 1.1, Size.Y.Scale * 1.1);
		})
		local function _(arg1, arg2) -- Line 303, Named "SetCash"
			--[[ Upvalues[3]:
				[1]: var4_upvw (copied, read and write)
				[2]: AbbreviateNumber_upvr (copied, readonly)
				[3]: any_Create_result1_7_upvr (readonly)
			]]
			var4_upvw.TopUi.Cash.Text = '$'..AbbreviateNumber_upvr(arg1, true)
			if not arg2 and any_Create_result1_7_upvr.PlaybackState ~= Enum.PlaybackState.Playing then
				any_Create_result1_7_upvr:Play()
			end
		end
		var4_upvw.TopUi.Cash.Text = '$'..AbbreviateNumber_upvr(var5_upvw.Data.Cash, true)
		var5_upvw:OnSet({"Cash"}, function(arg1, arg2) -- Line 313
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: AbbreviateNumber_upvr (copied, readonly)
				[3]: any_Create_result1_7_upvr (readonly)
				[4]: CashPopups_upvr (copied, readonly)
			]]
			var4_upvw.TopUi.Cash.Text = '$'..AbbreviateNumber_upvr(arg1, true)
			if any_Create_result1_7_upvr.PlaybackState ~= Enum.PlaybackState.Playing then
				any_Create_result1_7_upvr:Play()
			end
			if arg2 < arg1 then
				CashPopups_upvr(arg1 - arg2)
			end
		end)
	end)()
	;(function() -- Line 324, Named "SetupGemsUpdater"
		--[[ Upvalues[6]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
			[3]: AbbreviateNumber_upvr (copied, readonly)
			[4]: var5_upvw (copied, read and write)
			[5]: GemsPopup_upvr (readonly)
			[6]: PlaySound_upvr (copied, readonly)
		]]
		local tbl_upvr = {}
		local function SetGems_upvr(arg1, arg2) -- Line 327, Named "SetGems"
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: tbl_upvr (readonly)
				[3]: TweenService_upvr (copied, readonly)
				[4]: AbbreviateNumber_upvr (copied, readonly)
			]]
			if not var4_upvw:FindFirstChild("LeftButtons") then
			else
				if not arg2 then
					if tbl_upvr then
						for _, v_15 in pairs(tbl_upvr) do
							v_15:Cancel()
						end
						table.clear(tbl_upvr)
						var4_upvw.LeftButtons.ButtonHolder.Gems.Icon.Size = UDim2.new(0.225, 0, 0.225, 0)
						var4_upvw.LeftButtons.ButtonHolder.Gems.Amount.Size = UDim2.new(1.1, 0, 0.897, 0)
					end
					tbl_upvr.TextLabel = TweenService_upvr:Create(var4_upvw.LeftButtons.ButtonHolder.Gems.Amount, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
						Size = UDim2.new(1.1, 0, 1.1, 0);
					})
					tbl_upvr.Icon = TweenService_upvr:Create(var4_upvw.LeftButtons.ButtonHolder.Gems.Icon, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
						Size = UDim2.new(0.275, 0, 0.275, 0);
					})
					for _, v_16 in pairs(tbl_upvr) do
						v_16:Play()
					end
				end
				var4_upvw.LeftButtons.ButtonHolder.Gems.Amount.Text = AbbreviateNumber_upvr(arg1, true)
			end
		end
		if not var4_upvw:FindFirstChild("LeftButtons") then
		else
			var4_upvw.LeftButtons.ButtonHolder.Gems.Amount.Text = AbbreviateNumber_upvr(var5_upvw.Data.Gems, true)
		end
		var5_upvw:OnSet({"Gems"}, function(arg1, arg2) -- Line 359
			--[[ Upvalues[3]:
				[1]: GemsPopup_upvr (copied, readonly)
				[2]: PlaySound_upvr (copied, readonly)
				[3]: SetGems_upvr (readonly)
			]]
			if arg2 < arg1 then
				local var124 = arg1 - arg2
				if 1 <= var124 then
					GemsPopup_upvr(var124)
					PlaySound_upvr("Gem")
				end
			end
			if arg1 >= arg2 then
			else
			end
			SetGems_upvr(arg1, true)
		end)
	end)()
	;(function() -- Line 708, Named "SetupPurchases"
		--[[ Upvalues[11]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
			[3]: PlaySound_upvr (copied, readonly)
			[4]: Lighting_upvr (copied, readonly)
			[5]: StoreConfig_upvr (copied, readonly)
			[6]: MarketplaceService_upvr (copied, readonly)
			[7]: Events_upvr (copied, readonly)
			[8]: var6_upvw (copied, read and write)
			[9]: CollectionService_upvr (copied, readonly)
			[10]: Serg_Button_upvr (copied, readonly)
			[11]: ClientSignals_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local tbl_16_upvr = {}
		for _, v_8 in pairs(var4_upvw.PromptGradient:GetChildren()) do
			table.insert(tbl_16_upvr, {
				RotationTween = TweenService_upvr:Create(v_8.UIGradient, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
					Rotation = 360;
				});
				RainbowIcon = v_8;
			})
		end
		local tbl_27_upvr = {
			LeftButtons = {
				In = TweenService_upvr:Create(var4_upvw.LeftButtons, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Position = var4_upvw.LeftButtons.Position;
					Size = var4_upvw.LeftButtons.Size;
				});
				Out = TweenService_upvr:Create(var4_upvw.LeftButtons, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					Position = var4_upvw.LeftButtons.Position - UDim2.new(0.2, 0, 0, 0);
					Size = UDim2.new(0, 0, 0, 0);
				});
			};
			RightButtons = {
				In = TweenService_upvr:Create(var4_upvw.RightButtons, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Position = var4_upvw.RightButtons.Position;
					Size = var4_upvw.RightButtons.Size;
				});
				Out = TweenService_upvr:Create(var4_upvw.RightButtons, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					Position = var4_upvw.RightButtons.Position + UDim2.new(0.2, 0, 0, 0);
					Size = UDim2.new(0, 0, 0, 0);
				});
			};
			BottomLeft = {
				In = TweenService_upvr:Create(var4_upvw.BottomLeft, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Position = var4_upvw.BottomLeft.Position;
					Size = var4_upvw.BottomLeft.Size;
				});
				Out = TweenService_upvr:Create(var4_upvw.BottomLeft, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					Position = var4_upvw.BottomLeft.Position - UDim2.new(0.2, 0, 0, 0);
					Size = UDim2.new(0, 0, 0, 0);
				});
			};
			Inventory = {
				In = TweenService_upvr:Create(var4_upvw.Inventory, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Position = var4_upvw.Inventory.Position;
					Size = var4_upvw.Inventory.Size;
				});
				Out = TweenService_upvr:Create(var4_upvw.Inventory, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					Position = var4_upvw.Inventory.Position + UDim2.new(0, 0, 0.2, 0);
					Size = UDim2.new(0, 0, 0, 0);
				});
			};
		}
		local function TweenInOutFrames_upvr(arg1) -- Line 764, Named "TweenInOutFrames"
			--[[ Upvalues[2]:
				[1]: tbl_27_upvr (readonly)
				[2]: var4_upvw (copied, read and write)
			]]
			local var259
			for _, v_9 in pairs(tbl_27_upvr) do
				if arg1 then
					var259 = "Out"
				else
					var259 = "In"
				end
				v_9[var259]:Play()
			end
			if arg1 then
				var4_upvw.Inventory.Backpack.Visible = false
			end
		end
		local var260_upvw
		local function ToggleIsPurchasing_upvr(arg1) -- Line 775, Named "ToggleIsPurchasing"
			--[[ Upvalues[6]:
				[1]: var260_upvw (read and write)
				[2]: PlaySound_upvr (copied, readonly)
				[3]: TweenInOutFrames_upvr (readonly)
				[4]: TweenService_upvr (copied, readonly)
				[5]: Lighting_upvr (copied, readonly)
				[6]: tbl_16_upvr (readonly)
			]]
			if var260_upvw == arg1 then
			else
				var260_upvw = arg1
				if arg1 then
					PlaySound_upvr("Purchasing")
				end
				TweenInOutFrames_upvr(arg1)
				local Quad = Enum.EasingStyle.Quad
				local tbl_32 = {}
				if arg1 then
					Quad = 14
				else
					Quad = 0
				end
				tbl_32.Size = Quad
				TweenService_upvr:Create(Lighting_upvr.Blur, TweenInfo.new(0.25, Quad, Enum.EasingDirection.Out), tbl_32):Play()
				for _, v_17 in pairs(tbl_16_upvr) do
					local Quad_2 = Enum.EasingStyle.Quad
					local tbl_23 = {}
					if arg1 then
						Quad_2 = 0
					else
						Quad_2 = 1
					end
					tbl_23.ImageTransparency = Quad_2
					TweenService_upvr:Create(v_17.RainbowIcon, TweenInfo.new(0.25, Quad_2, Enum.EasingDirection.Out), tbl_23):Play()
					if arg1 then
						v_17.RotationTween:Play()
					else
						v_17.RotationTween:Pause()
					end
				end
			end
		end
		local tbl_15_upvr = {}
		local function _(arg1) -- Line 806, Named "GetCostInRobux"
			--[[ Upvalues[1]:
				[1]: tbl_15_upvr (readonly)
			]]
			if not arg1 then return end
			if tbl_15_upvr[arg1] then
				return tbl_15_upvr[arg1]
			end
			return nil
		end
		local tbl_30_upvr = {}
		local function FetchPriceAsync_upvr(arg1) -- Line 816, Named "FetchPriceAsync"
			--[[ Upvalues[4]:
				[1]: tbl_15_upvr (readonly)
				[2]: tbl_30_upvr (readonly)
				[3]: StoreConfig_upvr (copied, readonly)
				[4]: MarketplaceService_upvr (copied, readonly)
			]]
			if not arg1 then return end
			if tbl_15_upvr[arg1] then
				return tbl_15_upvr[arg1]
			end
			if tbl_30_upvr[arg1] then
				return tbl_30_upvr[arg1]
			end
			local var274_upvr = StoreConfig_upvr[arg1]
			if not var274_upvr then return end
			local BindableEvent_upvr = Instance.new("BindableEvent")
			tbl_30_upvr[arg1] = BindableEvent_upvr
			task.spawn(function() -- Line 833
				--[[ Upvalues[6]:
					[1]: var274_upvr (readonly)
					[2]: MarketplaceService_upvr (copied, readonly)
					[3]: tbl_15_upvr (copied, readonly)
					[4]: arg1 (readonly)
					[5]: BindableEvent_upvr (readonly)
					[6]: tbl_30_upvr (copied, readonly)
				]]
				local pcall_result1, pcall_result2 = pcall(function() -- Line 834
					--[[ Upvalues[2]:
						[1]: var274_upvr (copied, readonly)
						[2]: MarketplaceService_upvr (copied, readonly)
					]]
					local var278
					if var274_upvr.Type == "Product" then
						var278 = "Product"
					else
						var278 = "GamePass"
					end
					local any_GetProductInfoAsync_result1 = MarketplaceService_upvr:GetProductInfoAsync(var274_upvr.Id, Enum.InfoType[var278])
					var278 = any_GetProductInfoAsync_result1
					if var278 then
						var278 = any_GetProductInfoAsync_result1.PriceInRobux
					end
					return var278
				end)
				if pcall_result1 and pcall_result2 then
					tbl_15_upvr[arg1] = pcall_result2
					BindableEvent_upvr:Fire(pcall_result2)
				else
					warn("Failed to fetch price for:", arg1, pcall_result2)
					BindableEvent_upvr:Fire(nil)
				end
				tbl_30_upvr[arg1] = nil
				BindableEvent_upvr:Destroy()
			end)
			return BindableEvent_upvr
		end
		local function PromptPurchase_upvr(arg1) -- Line 855, Named "PromptPurchase"
			--[[ Upvalues[5]:
				[1]: Events_upvr (copied, readonly)
				[2]: ToggleIsPurchasing_upvr (readonly)
				[3]: StoreConfig_upvr (copied, readonly)
				[4]: MarketplaceService_upvr (copied, readonly)
				[5]: var6_upvw (copied, read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [2] 2. Error Block 19 start (CF ANALYSIS FAILED)
			if arg1 == "x3CashDiscount" then
				-- KONSTANTERROR: [4] 3. Error Block 15 start (CF ANALYSIS FAILED)
				Events_upvr.ServerProductPrompt:FireServer(arg1)
				ToggleIsPurchasing_upvr(true)
				do
					return
				end
				-- KONSTANTERROR: [4] 3. Error Block 15 end (CF ANALYSIS FAILED)
			end
			local var282 = StoreConfig_upvr[arg1]
			if not var282 then
			else
				if var282.Type == "Gamepass" then
					MarketplaceService_upvr:PromptGamePassPurchase(var6_upvw, var282.Id)
				elseif var282.Type == "Product" then
					MarketplaceService_upvr:PromptProductPurchase(var6_upvw, var282.Id)
				end
				ToggleIsPurchasing_upvr(true)
				-- KONSTANTERROR: [2] 2. Error Block 19 end (CF ANALYSIS FAILED)
			end
		end
		for _, v_10_upvr in pairs(CollectionService_upvr:GetTagged("PromptButton")) do
			local PromptName_upvr = v_10_upvr:GetAttribute("PromptName")
			if PromptName_upvr then
				local FetchPriceAsync_result1 = FetchPriceAsync_upvr(PromptName_upvr)
				local tbl_22 = {
					Frame = v_10_upvr;
				}
				local tbl_17 = {}
				local function Click() -- Line 885
					--[[ Upvalues[2]:
						[1]: PromptPurchase_upvr (readonly)
						[2]: PromptName_upvr (readonly)
					]]
					PromptPurchase_upvr(PromptName_upvr)
				end
				tbl_17.Click = Click
				tbl_22.Callbacks = tbl_17
				tbl_22.EnabledTweens = {
					Click = true;
					Hover = true;
				}
				Serg_Button_upvr.New(tbl_22)
				local typeof_result1 = typeof(FetchPriceAsync_result1)
				if typeof_result1 == "Instance" then
					typeof_result1 = FetchPriceAsync_result1.Event
					local utf8_char_result1_upvr = utf8.char(57346)
					typeof_result1 = typeof_result1:Once
					typeof_result1(function(arg1) -- Line 896
						--[[ Upvalues[2]:
							[1]: v_10_upvr (readonly)
							[2]: utf8_char_result1_upvr (readonly)
						]]
						if arg1 then
							v_10_upvr.Main.Headline.Text = utf8_char_result1_upvr..arg1
						end
					end)
				else
					if not PromptName_upvr then
						typeof_result1 = nil
					elseif tbl_15_upvr[PromptName_upvr] then
						typeof_result1 = tbl_15_upvr[PromptName_upvr]
					else
						typeof_result1 = nil
					end
					if typeof_result1 then
						v_10_upvr.Main.Headline.Text = utf8_char_result1_upvr..typeof_result1
					end
				end
			end
		end
		for _, v_11 in pairs(CollectionService_upvr:GetTagged("PromptCost")) do
			(function(arg1) -- Line 909, Named "SetPromptCost"
				--[[ Upvalues[3]:
					[1]: FetchPriceAsync_upvr (readonly)
					[2]: utf8_char_result1_upvr (readonly)
					[3]: tbl_15_upvr (readonly)
				]]
				local PromptName = arg1:GetAttribute("PromptName")
				local var295
				if not PromptName then
				else
					var295 = PromptName
					local FetchPriceAsync_result1_2 = FetchPriceAsync_upvr(var295)
					var295 = typeof(FetchPriceAsync_result1_2)
					if var295 == "Instance" then
						var295 = FetchPriceAsync_result1_2.Event
						var295 = var295:Once
						var295(function(arg1_4) -- Line 916
							--[[ Upvalues[2]:
								[1]: arg1 (readonly)
								[2]: utf8_char_result1_upvr (copied, readonly)
							]]
							if arg1_4 then
								arg1.Text = utf8_char_result1_upvr..arg1_4
							end
						end)
						return
					end
					if not PromptName then
						var295 = nil
					elseif tbl_15_upvr[PromptName] then
						var295 = tbl_15_upvr[PromptName]
					else
						var295 = nil
					end
					if var295 then
						arg1.Text = utf8_char_result1_upvr..var295
					end
				end
			end)(v_11)
			local var301_upvr
		end
		CollectionService_upvr:GetInstanceAddedSignal("PromptCost"):Connect(function(arg1) -- Line 933
			--[[ Upvalues[1]:
				[1]: var301_upvr (readonly)
			]]
			var301_upvr(arg1)
		end)
		local tbl_28 = {
			Frame = var4_upvw.Menus.GroupRewards.Buy;
		}
		local tbl_3 = {}
		local function Click() -- Line 940
			--[[ Upvalues[1]:
				[1]: Events_upvr (copied, readonly)
			]]
			Events_upvr.ClaimGroupRewards:FireServer()
		end
		tbl_3.Click = Click
		tbl_28.Callbacks = tbl_3
		tbl_28.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl_28)
		ClientSignals_upvr.PromptPurchase:Connect(PromptPurchase_upvr)
		MarketplaceService_upvr.PromptGamePassPurchaseFinished:Connect(function() -- Line 952
			--[[ Upvalues[1]:
				[1]: ToggleIsPurchasing_upvr (readonly)
			]]
			ToggleIsPurchasing_upvr(false)
		end)
		MarketplaceService_upvr.PromptProductPurchaseFinished:Connect(function() -- Line 956
			--[[ Upvalues[1]:
				[1]: ToggleIsPurchasing_upvr (readonly)
			]]
			ToggleIsPurchasing_upvr(false)
		end)
	end)()
	;(function() -- Line 587, Named "SetupNotifications"
		--[[ Upvalues[5]:
			[1]: TweenService_upvr (copied, readonly)
			[2]: var4_upvw (copied, read and write)
			[3]: PlaySound_upvr (copied, readonly)
			[4]: ClientSignals_upvr (copied, readonly)
			[5]: Events_upvr (copied, readonly)
		]]
		local tbl_29_upvr = {}
		local tbl_21_upvr = {
			[true] = {
				TextColor = Color3.fromRGB(255, 98, 98);
				StrokeColor = Color3.fromRGB(86, 29, 29);
				TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 158, 158))});
			};
			[false] = {
				TextColor = Color3.fromRGB(112, 255, 96);
				StrokeColor = Color3.fromRGB(30, 83, 28);
				TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 255, 153))});
			};
		}
		local var189_upvw = 0
		local function _() -- Line 612, Named "GetTopNotificationPosition"
			--[[ Upvalues[1]:
				[1]: var189_upvw (read and write)
			]]
			var189_upvw -= 1
			return var189_upvw
		end
		local function TweenNotification_upvr(arg1, arg2, arg3) -- Line 618, Named "TweenNotification"
			--[[ Upvalues[2]:
				[1]: tbl_29_upvr (readonly)
				[2]: TweenService_upvr (copied, readonly)
			]]
			if tbl_29_upvr[arg1] then
				for _, v_6 in pairs(tbl_29_upvr[arg1]) do
					v_6:Cancel()
				end
				tbl_29_upvr[arg1] = {}
				arg1.Size = UDim2.new(1.2, 0, 1, 0)
				arg1.UIStroke.Transparency = 0
				arg1.TextTransparency = 0
			else
				tbl_29_upvr[arg1] = {}
			end
			if arg2 == "Bounce" then
				table.insert(tbl_29_upvr[arg1], TweenService_upvr:Create(arg1, TweenInfo.new(arg3 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
					Size = UDim2.new(1.2, 0, 1.15, 0);
				}))
			elseif arg2 == "Decay" then
				table.insert(tbl_29_upvr[arg1], TweenService_upvr:Create(arg1, TweenInfo.new(arg3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					TextTransparency = 1;
					Size = UDim2.new(1.2, 0, 0, 0);
				}))
				table.insert(tbl_29_upvr[arg1], TweenService_upvr:Create(arg1.UIStroke, TweenInfo.new(arg3 * 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					Transparency = 1;
				}))
			end
			for _, v_7 in pairs(tbl_29_upvr[arg1]) do
				v_7:Play()
			end
		end
		local tbl_26_upvr = {}
		local function DisplayNotification(arg1) -- Line 652
			--[[ Upvalues[7]:
				[1]: var4_upvw (copied, read and write)
				[2]: PlaySound_upvr (copied, readonly)
				[3]: tbl_26_upvr (readonly)
				[4]: TweenNotification_upvr (readonly)
				[5]: tbl_21_upvr (readonly)
				[6]: var189_upvw (read and write)
				[7]: tbl_29_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var204
			if not var4_upvw.Notifications:FindFirstChild(arg1.Message) then
				var204 = script
				local clone_upvr = var204.Assets.NotificationTemplate:Clone()
			end
			if arg1.IsWarning then
				var204 = "Error"
			else
				var204 = "Reward"
			end
			PlaySound_upvr(var204)
			var204 = var4_upvw.Notifications
			if clone_upvr.Parent == var204 then
				var204 = tbl_26_upvr
				if var204[arg1.Message] then
					var204 = tbl_26_upvr[arg1.Message]
					task.cancel(var204)
				end
				var204 = clone_upvr
				TweenNotification_upvr(var204, nil, 1)
				var204 = clone_upvr:GetAttribute("Amount") or 0
				local var206 = var204 + 1
				var204 = clone_upvr:SetAttribute
				var204("Amount", var206)
				var204 = arg1.Message.." (x"..var206..')'
				clone_upvr.Text = var204
			else
				var204 = tbl_21_upvr
				local var207 = var204[arg1.IsWarning]
				var204 = var207.TextColor
				clone_upvr.TextColor3 = var204
				var204 = clone_upvr.UIGradient
				var204.Color = var207.TextGradient
				var204 = clone_upvr.UIStroke
				var204.Color = var207.StrokeColor
				var204 = arg1.Message
				clone_upvr.Name = var204
				var204 = arg1.Message
				clone_upvr.Text = var204
				var204 = var4_upvw.Notifications
				clone_upvr.Parent = var204
			end
			var204 = var189_upvw
			var204 -= 1
			var189_upvw = var204
			clone_upvr.LayoutOrder = var189_upvw
			var204 = clone_upvr
			TweenNotification_upvr(var204, "Bounce", 0.125)
			var204 = arg1.Message
			tbl_26_upvr[var204] = task.delay(2.5, function() -- Line 687
				--[[ Upvalues[5]:
					[1]: TweenNotification_upvr (copied, readonly)
					[2]: clone_upvr (readonly)
					[3]: tbl_29_upvr (copied, readonly)
					[4]: tbl_26_upvr (copied, readonly)
					[5]: arg1 (readonly)
				]]
				TweenNotification_upvr(clone_upvr, "Decay", 0.15)
				task.wait(0.15)
				tbl_29_upvr[clone_upvr] = nil
				clone_upvr:Destroy()
				tbl_26_upvr[arg1.Message] = nil
			end)
		end
		ClientSignals_upvr.Notification:Connect(DisplayNotification)
		Events_upvr.Notification.OnClientEvent:Connect(DisplayNotification)
	end)()
	;(function() -- Line 999, Named "SetupRayBackgrounds"
		--[[ Upvalues[2]:
			[1]: TweenService_upvr (copied, readonly)
			[2]: CollectionService_upvr (copied, readonly)
		]]
		local function SetupRayIcon_upvr(arg1) -- Line 1000, Named "SetupRayIcon"
			--[[ Upvalues[1]:
				[1]: TweenService_upvr (copied, readonly)
			]]
			if arg1:IsA("ImageLabel") then
				arg1.Image = "rbxassetid://75051045879851"
			end
			TweenService_upvr:Create(arg1, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false), {
				Rotation = 360;
			}):Play()
		end
		for _, v_13 in pairs(CollectionService_upvr:GetTagged("RayBackground")) do
			SetupRayIcon_upvr(v_13)
		end
		CollectionService_upvr:GetInstanceAddedSignal("RayBackground"):Connect(function(arg1) -- Line 1014
			--[[ Upvalues[1]:
				[1]: SetupRayIcon_upvr (readonly)
			]]
			SetupRayIcon_upvr(arg1)
		end)
	end)()
	;(function() -- Line 1019, Named "SetupGlobalAnnoucementNotification"
		--[[ Upvalues[5]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
			[3]: AnnouncementThemeConfig_upvr (copied, readonly)
			[4]: Events_upvr (copied, readonly)
			[5]: ClientSignals_upvr (copied, readonly)
		]]
		local GlobalAnnouncement_upvr = var4_upvw.Notifications.GlobalAnnouncement
		local function ToggleUI_upvr(arg1) -- Line 1024, Named "ToggleUI"
			--[[ Upvalues[2]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: GlobalAnnouncement_upvr (readonly)
			]]
			if arg1 then
				local _ = 0
			else
			end
			TweenService_upvr:Create(GlobalAnnouncement_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				BackgroundTransparency = 1;
			}):Play()
			local tbl_18 = {}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl_18.TextTransparency = 1
			TweenService_upvr:Create(GlobalAnnouncement_upvr.Message, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), tbl_18):Play()
			local tbl_7 = {}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			tbl_7.Transparency = 1
			TweenService_upvr:Create(GlobalAnnouncement_upvr.Message.UIStroke, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), tbl_7):Play()
			if not arg1 then
				task.wait(0.25)
			end
			GlobalAnnouncement_upvr.Visible = arg1
		end
		local function TypewriterEffect_upvr(arg1) -- Line 1044, Named "TypewriterEffect"
			--[[ Upvalues[1]:
				[1]: GlobalAnnouncement_upvr (readonly)
			]]
			task.wait(0.25)
			for i_17 = 1, #arg1 do
				GlobalAnnouncement_upvr.Message.Text = arg1:sub(1, i_17)
				task.wait(0.04)
			end
		end
		local var351_upvw
		local function ShowGlobalAnnouncement(arg1, arg2, arg3) -- Line 1053
			--[[ Upvalues[5]:
				[1]: var351_upvw (read and write)
				[2]: AnnouncementThemeConfig_upvr (copied, readonly)
				[3]: GlobalAnnouncement_upvr (readonly)
				[4]: ToggleUI_upvr (readonly)
				[5]: TypewriterEffect_upvr (readonly)
			]]
			if var351_upvw then
				task.cancel(var351_upvw)
				var351_upvw = nil
			end
			local var352 = AnnouncementThemeConfig_upvr[arg3 or "Default"]
			GlobalAnnouncement_upvr.Message.Text = ""
			GlobalAnnouncement_upvr.Message.UIGradient.Color = var352
			local UIGradient_upvr = GlobalAnnouncement_upvr.Message.UIStroke.UIGradient
			UIGradient_upvr.Color = var352
			if arg3 then
				UIGradient_upvr = " 🎉"
			else
				UIGradient_upvr = " 🔨"
			end
			local string_upper_result1_upvw = string.upper(arg1)
			var351_upvw = task.spawn(function() -- Line 1069
				--[[ Upvalues[5]:
					[1]: UIGradient_upvr (readonly)
					[2]: arg2 (readonly)
					[3]: string_upper_result1_upvw (read and write)
					[4]: ToggleUI_upvr (copied, readonly)
					[5]: TypewriterEffect_upvr (copied, readonly)
				]]
				ToggleUI_upvr(true)
				TypewriterEffect_upvr('['..UIGradient_upvr..' '..arg2.."]: "..string_upper_result1_upvw)
				task.wait(3.5)
				ToggleUI_upvr(false)
			end)
		end
		Events_upvr.GlobalAnnouncement.OnClientEvent:Connect(ShowGlobalAnnouncement)
		ClientSignals_upvr.GlobalAnnouncementNotification:Connect(ShowGlobalAnnouncement)
	end)()
	;(function() -- Line 373, Named "SetupGiftGiftButton"
		--[[ Upvalues[3]:
			[1]: var4_upvw (copied, read and write)
			[2]: RNGSparkles_upvr (copied, readonly)
			[3]: TweenService_upvr (copied, readonly)
		]]
		local udim2_3 = UDim2.new(0.5, 0, 0.525, 0)
		for _, v_3 in pairs({var4_upvw.LeftButtons.ButtonHolder.Gift.Main, var4_upvw.Menus.Gift.CurrentGift.CurrentTier}) do
			RNGSparkles_upvr.Start(v_3, 3)
			v_3.Icon.Position = udim2_3
			TweenService_upvr:Create(v_3.Icon, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
				Position = udim2_3 - UDim2.new(0, 0, 0.05, 0);
			}):Play()
		end
	end)()
	;(function() -- Line 389, Named "SetupShopButton"
		--[[ Upvalues[2]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
		]]
		local Icon_upvr = var4_upvw.LeftButtons.ButtonHolder.Shop.Main.Icon
		local function rotationSequence_upvr() -- Line 392, Named "rotationSequence"
			--[[ Upvalues[2]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: Icon_upvr (readonly)
			]]
			TweenService_upvr:Create(Icon_upvr, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Rotation = 15;
			}):Play()
			task.wait(0.2)
			TweenService_upvr:Create(Icon_upvr, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Rotation = -15;
			}):Play()
			task.wait(0.2)
			TweenService_upvr:Create(Icon_upvr, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Rotation = 0;
			}):Play()
			task.wait(0.2)
		end
		task.spawn(function() -- Line 412
			--[[ Upvalues[1]:
				[1]: rotationSequence_upvr (readonly)
			]]
			while true do
				rotationSequence_upvr()
				task.wait(4)
			end
		end)
	end)()
	;(function() -- Line 420, Named "SetupDiscountButtons"
		--[[ Upvalues[8]:
			[1]: var4_upvw (copied, read and write)
			[2]: TimerFormat_upvr (copied, readonly)
			[3]: RunService_upvr (copied, readonly)
			[4]: Serg_Button_upvr (copied, readonly)
			[5]: ClientSignals_upvr (copied, readonly)
			[6]: RNGSparkles_upvr (copied, readonly)
			[7]: var5_upvw (copied, read and write)
			[8]: TweenService_upvr (copied, readonly)
		]]
		local tbl_8_upvr = {"RainbowPetSpawner", "RainbowPetUpgrader", "RainbowPetCollector"}
		local Discounts = var4_upvw:WaitForChild("Discounts")
		local RainbowItems_upvr = Discounts:WaitForChild("RainbowItems")
		local function StartTimer_upvr(arg1, arg2, arg3) -- Line 429, Named "StartTimer"
			--[[ Upvalues[2]:
				[1]: TimerFormat_upvr (copied, readonly)
				[2]: RunService_upvr (copied, readonly)
			]]
			if arg2 <= 0 then
				return false
			end
			local Timer_upvr = arg1.Main.Timer
			Timer_upvr.Visible = true
			Timer_upvr.Text = TimerFormat_upvr(arg2, false, true)
			local os_clock_result1_upvr = os.clock()
			local var146_upvw
			var146_upvw = RunService_upvr.RenderStepped:Connect(function() -- Line 441
				--[[ Upvalues[6]:
					[1]: os_clock_result1_upvr (readonly)
					[2]: arg2 (readonly)
					[3]: Timer_upvr (readonly)
					[4]: TimerFormat_upvr (copied, readonly)
					[5]: var146_upvw (read and write)
					[6]: arg3 (readonly)
				]]
				local var149 = os.clock() - os_clock_result1_upvr
				if var149 < 0.1 then
				else
					local var150 = arg2 - var149
					Timer_upvr.Text = TimerFormat_upvr(var150, false, true)
					if var150 <= 0 then
						Timer_upvr.Text = ""
						Timer_upvr.Visible = false
						var146_upvw:Disconnect()
						if arg3 then
							arg3()
						end
					end
				end
			end)
			return var146_upvw
		end
		local function SetupDiscountButton_upvr(arg1, arg2, arg3, arg4) -- Line 462, Named "SetupDiscountButton"
			--[[ Upvalues[5]:
				[1]: StartTimer_upvr (readonly)
				[2]: Serg_Button_upvr (copied, readonly)
				[3]: ClientSignals_upvr (copied, readonly)
				[4]: RNGSparkles_upvr (copied, readonly)
				[5]: var5_upvw (copied, read and write)
			]]
			if not arg1 then
			elseif StartTimer_upvr(arg1, arg3, function(arg1_2) -- Line 465, Named "onThisFinished"
				--[[ Upvalues[2]:
					[1]: arg1 (readonly)
					[2]: arg4 (readonly)
				]]
				if arg1_2 then
					arg1_2:Disconnect()
				end
				arg1:Destroy()
				if arg4 then
					arg4()
				end
			end) then
				arg1.Visible = true
				local tbl = {}
				tbl.Frame = arg1
				local tbl_11 = {}
				local function Click() -- Line 482
					--[[ Upvalues[2]:
						[1]: ClientSignals_upvr (copied, readonly)
						[2]: arg2 (readonly)
					]]
					ClientSignals_upvr.PromptPurchase:Fire(arg2)
				end
				tbl_11.Click = Click
				tbl.Callbacks = tbl_11
				tbl.EnabledTweens = {
					Click = true;
					Hover = true;
				}
				Serg_Button_upvr.New(tbl)
				RNGSparkles_upvr.Start(arg1, 3)
				local tbl_6 = {"SpecialDeals"}
				tbl_6[2] = arg2
				tbl_6[3] = "Claimed"
				local var156_upvw
				var156_upvw = var5_upvw:OnSet(tbl_6, function(arg1_3) -- Line 491
					--[[ Upvalues[3]:
						[1]: arg1 (readonly)
						[2]: arg4 (readonly)
						[3]: var156_upvw (read and write)
					]]
					if arg1_3 then
						arg1.Visible = false
						local var157
						if var157 then
							var157:Disconnect()
						end
						arg1:Destroy()
						if arg4 then
							arg4()
						end
						if var156_upvw then
							var156_upvw:Disconnect()
						end
					end
				end)
			end
		end
		local function SetupNewRainbowRotation_upvr(arg1, arg2) -- Line 503, Named "SetupNewRainbowRotation"
			--[[ Upvalues[2]:
				[1]: RainbowItems_upvr (readonly)
				[2]: TweenService_upvr (copied, readonly)
			]]
			for _, v_4 in pairs(RainbowItems_upvr:GetChildren()) do
				local children = v_4:IsA("Frame")
				if children then
					if v_4.Name ~= arg1 then
						children = false
					else
						children = true
					end
					v_4.Visible = children
					if children and not arg2 then
						TweenService_upvr:Create(v_4, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
							Size = UDim2.new(0.9, 0, 0.9, 0);
						}):Play()
					end
				end
			end
		end
		local var168_upvw = 1
		local LuckDiscount_upvr = Discounts:WaitForChild("LuckDiscount")
		local CashDiscount_upvr = Discounts:WaitForChild("CashDiscount")
		task.spawn(function() -- Line 519
			--[[ Upvalues[11]:
				[1]: var5_upvw (copied, read and write)
				[2]: RainbowItems_upvr (readonly)
				[3]: Serg_Button_upvr (copied, readonly)
				[4]: ClientSignals_upvr (copied, readonly)
				[5]: RNGSparkles_upvr (copied, readonly)
				[6]: SetupNewRainbowRotation_upvr (readonly)
				[7]: tbl_8_upvr (readonly)
				[8]: var168_upvw (read and write)
				[9]: SetupDiscountButton_upvr (readonly)
				[10]: LuckDiscount_upvr (readonly)
				[11]: CashDiscount_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local SpecialDeals = var5_upvw.Data.SpecialDeals
			if not SpecialDeals then
				SpecialDeals = {}
			end
			if not SpecialDeals.x3CashDiscount then
				local tbl_9_upvr = {}
			end
			if not SpecialDeals.x10LuckDiscount then
				local tbl_19_upvr = {}
			end
			local function startRainbowRotation_upvr(arg1) -- Line 524, Named "startRainbowRotation"
				--[[ Upvalues[7]:
					[1]: RainbowItems_upvr (copied, readonly)
					[2]: Serg_Button_upvr (copied, readonly)
					[3]: ClientSignals_upvr (copied, readonly)
					[4]: RNGSparkles_upvr (copied, readonly)
					[5]: SetupNewRainbowRotation_upvr (copied, readonly)
					[6]: tbl_8_upvr (copied, readonly)
					[7]: var168_upvw (copied, read and write)
				]]
				for i_8, v_5 in pairs(RainbowItems_upvr:GetChildren()) do
					if v_5:IsA("Frame") then
						local tbl_12 = {
							Frame = v_5;
						}
						local tbl_35 = {}
						local Name_upvr = v_5.Name
						local function Click() -- Line 533
							--[[ Upvalues[2]:
								[1]: ClientSignals_upvr (copied, readonly)
								[2]: Name_upvr (readonly)
							]]
							ClientSignals_upvr.PromptPurchase:Fire(Name_upvr)
						end
						tbl_35.Click = Click
						tbl_12.Callbacks = tbl_35
						tbl_12.EnabledTweens = {
							Click = true;
							Hover = true;
						}
						Serg_Button_upvr.New(tbl_12)
						RNGSparkles_upvr.Start(v_5, 3)
					end
				end
				RainbowItems_upvr.Visible = true
				while true do
					i_8 = var168_upvw
					SetupNewRainbowRotation_upvr(tbl_8_upvr[i_8], arg1)
					if arg1 then
					end
					var168_upvw += 1
					if #tbl_8_upvr < var168_upvw then
						var168_upvw = 1
					end
					task.wait(30)
				end
			end
			local function tryStartLuck_upvr() -- Line 565, Named "tryStartLuck"
				--[[ Upvalues[4]:
					[1]: tbl_19_upvr (readonly)
					[2]: SetupDiscountButton_upvr (copied, readonly)
					[3]: LuckDiscount_upvr (copied, readonly)
					[4]: startRainbowRotation_upvr (readonly)
				]]
				if tbl_19_upvr.Timer and 1 <= tbl_19_upvr.Timer and not tbl_19_upvr.Claimed then
					SetupDiscountButton_upvr(LuckDiscount_upvr, "x10LuckDiscount", tbl_19_upvr.Timer, startRainbowRotation_upvr)
				else
					LuckDiscount_upvr.Visible = false
					startRainbowRotation_upvr(true)
				end
			end
			local function _() -- Line 574, Named "tryStartCash"
				--[[ Upvalues[7]:
					[1]: tbl_9_upvr (readonly)
					[2]: SetupDiscountButton_upvr (copied, readonly)
					[3]: CashDiscount_upvr (copied, readonly)
					[4]: tryStartLuck_upvr (readonly)
					[5]: tbl_19_upvr (readonly)
					[6]: LuckDiscount_upvr (copied, readonly)
					[7]: startRainbowRotation_upvr (readonly)
				]]
				if tbl_9_upvr.Timer and 1 <= tbl_9_upvr.Timer and not tbl_9_upvr.Claimed then
					SetupDiscountButton_upvr(CashDiscount_upvr, "x3CashDiscount", tbl_9_upvr.Timer, tryStartLuck_upvr)
				else
					CashDiscount_upvr.Visible = false
					if tbl_19_upvr.Timer and 1 <= tbl_19_upvr.Timer and not tbl_19_upvr.Claimed then
						SetupDiscountButton_upvr(LuckDiscount_upvr, "x10LuckDiscount", tbl_19_upvr.Timer, startRainbowRotation_upvr)
						return
					end
					LuckDiscount_upvr.Visible = false
					startRainbowRotation_upvr(true)
				end
			end
			if tbl_9_upvr.Timer and 1 <= tbl_9_upvr.Timer and not tbl_9_upvr.Claimed then
				SetupDiscountButton_upvr(CashDiscount_upvr, "x3CashDiscount", tbl_9_upvr.Timer, tryStartLuck_upvr)
			else
				CashDiscount_upvr.Visible = false
				if tbl_19_upvr.Timer and 1 <= tbl_19_upvr.Timer and not tbl_19_upvr.Claimed then
					SetupDiscountButton_upvr(LuckDiscount_upvr, "x10LuckDiscount", tbl_19_upvr.Timer, startRainbowRotation_upvr)
					return
				end
				LuckDiscount_upvr.Visible = false
				startRainbowRotation_upvr(true)
			end
		end)
	end)()
	;(function() -- Line 1086, Named "SetupLeavingReward"
		--[[ Upvalues[10]:
			[1]: var4_upvw (copied, read and write)
			[2]: TweenService_upvr (copied, readonly)
			[3]: Events_upvr (copied, readonly)
			[4]: ClientSignals_upvr (copied, readonly)
			[5]: PlaySound_upvr (copied, readonly)
			[6]: Serg_Button_upvr (copied, readonly)
			[7]: var6_upvw (copied, read and write)
			[8]: GuiService_upvr (copied, readonly)
			[9]: ClientData_upvr (copied, readonly)
			[10]: var5_upvw (copied, read and write)
		]]
		local GiftIcon_upvr = var4_upvw.LeavingReward.Frame.GiftIcon
		local var357_upvw
		local function AnimateGiftShake_upvr() -- Line 1094, Named "AnimateGiftShake"
			--[[ Upvalues[2]:
				[1]: GiftIcon_upvr (readonly)
				[2]: TweenService_upvr (copied, readonly)
			]]
			local Rotation = GiftIcon_upvr.Rotation
			local TweenInfo_new_result1 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0)
			local any_Create_result1_4 = TweenService_upvr:Create(GiftIcon_upvr, TweenInfo_new_result1, {
				Rotation = Rotation - 12;
			})
			local any_Create_result1_3 = TweenService_upvr:Create(GiftIcon_upvr, TweenInfo_new_result1, {
				Rotation = Rotation + 12;
			})
			local any_Create_result1_6 = TweenService_upvr:Create(GiftIcon_upvr, TweenInfo_new_result1, {
				Rotation = Rotation - 8;
			})
			local any_Create_result1 = TweenService_upvr:Create(GiftIcon_upvr, TweenInfo_new_result1, {
				Rotation = Rotation + 8;
			})
			local any_Create_result1_2 = TweenService_upvr:Create(GiftIcon_upvr, TweenInfo_new_result1, {
				Rotation = Rotation;
			})
			any_Create_result1_4:Play()
			any_Create_result1_4.Completed:Wait()
			any_Create_result1_3:Play()
			any_Create_result1_3.Completed:Wait()
			any_Create_result1_6:Play()
			any_Create_result1_6.Completed:Wait()
			any_Create_result1:Play()
			any_Create_result1.Completed:Wait()
			any_Create_result1_2:Play()
			any_Create_result1_2.Completed:Wait()
		end
		local function _() -- Line 1124, Named "StartShakeLoop"
			--[[ Upvalues[2]:
				[1]: AnimateGiftShake_upvr (readonly)
				[2]: var357_upvw (read and write)
			]]
			AnimateGiftShake_upvr()
			var357_upvw = task.spawn(function() -- Line 1127
				--[[ Upvalues[1]:
					[1]: AnimateGiftShake_upvr (copied, readonly)
				]]
				while true do
					task.wait(1.5)
					AnimateGiftShake_upvr()
				end
			end)
		end
		local function _() -- Line 1135, Named "StopShakeLoop"
			--[[ Upvalues[2]:
				[1]: var357_upvw (read and write)
				[2]: GiftIcon_upvr (readonly)
			]]
			if var357_upvw then
				task.cancel(var357_upvw)
				var357_upvw = nil
			end
			GiftIcon_upvr.Rotation = 0
		end
		local function GiveReward_upvr() -- Line 1144, Named "GiveReward"
			--[[ Upvalues[5]:
				[1]: var4_upvw (copied, read and write)
				[2]: var357_upvw (read and write)
				[3]: GiftIcon_upvr (readonly)
				[4]: Events_upvr (copied, readonly)
				[5]: ClientSignals_upvr (copied, readonly)
			]]
			var4_upvw.LeavingReward.Visible = false
			if var357_upvw then
				task.cancel(var357_upvw)
				var357_upvw = nil
			end
			GiftIcon_upvr.Rotation = 0
			Events_upvr.ClaimLeavingReward:FireServer()
			ClientSignals_upvr.DisplayRewards:Fire({
				CashMultiplier = {
					RewardName = nil;
					Amount = 5;
				};
				LuckMultiplier = {
					RewardName = nil;
					Amount = 10;
				};
			})
		end
		local function _() -- Line 1164, Named "ShowReward"
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: PlaySound_upvr (copied, readonly)
				[3]: AnimateGiftShake_upvr (readonly)
				[4]: var357_upvw (read and write)
			]]
			var4_upvw.LeavingReward.Visible = true
			PlaySound_upvr("Reward")
			AnimateGiftShake_upvr()
			var357_upvw = task.spawn(function() -- Line 1127
				--[[ Upvalues[1]:
					[1]: AnimateGiftShake_upvr (copied, readonly)
				]]
				while true do
					task.wait(1.5)
					AnimateGiftShake_upvr()
				end
			end)
		end
		local tbl_33 = {
			Frame = var4_upvw.LeavingReward.Frame.Close;
		}
		local tbl_2 = {}
		local function Click() -- Line 1173
			--[[ Upvalues[1]:
				[1]: GiveReward_upvr (readonly)
			]]
			GiveReward_upvr()
		end
		tbl_2.Click = Click
		tbl_33.Callbacks = tbl_2
		tbl_33.EnabledTweens = {
			Click = true;
			Hover = true;
		}
		Serg_Button_upvr.New(tbl_33)
		Serg_Button_upvr.New({
			Frame = var4_upvw.LeavingReward.Frame.Open;
			Callbacks = {
				Click = function() -- Line 1186, Named "Click"
					--[[ Upvalues[1]:
						[1]: GiveReward_upvr (readonly)
					]]
					GiveReward_upvr()
				end;
			};
			EnabledTweens = {
				Click = true;
				Hover = true;
			};
		})
		local TweenInfo_new_result1_upvr = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local function ToggleOfflineEarning_upvr(arg1) -- Line 1202, Named "ToggleOfflineEarning"
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: var6_upvw (copied, read and write)
				[3]: TweenService_upvr (copied, readonly)
				[4]: TweenInfo_new_result1_upvr (readonly)
			]]
			var4_upvw.OfflineEarning.Visible = true
			var4_upvw.TopUi.Visible = not arg1
			local TopbarStandard = var6_upvw.PlayerGui:FindFirstChild("TopbarStandard")
			local var383
			if TopbarStandard then
				var383 = not arg1
				TopbarStandard.Enabled = var383
			end
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var383 = UDim2.new(0, 0, 0, 0)
				return var383
			end
			if not arg1 or not INLINED_2() then
				var383 = UDim2.new(0, 0, -0.25, 0)
			end
			local any_Create_result1_5 = TweenService_upvr:Create(var4_upvw.OfflineEarning, TweenInfo_new_result1_upvr, {
				Position = var383;
			})
			any_Create_result1_5:Play()
			if not arg1 then
				any_Create_result1_5.Completed:Connect(function() -- Line 1222
					--[[ Upvalues[1]:
						[1]: var4_upvw (copied, read and write)
					]]
					var4_upvw.OfflineEarning.Visible = false
				end)
			end
		end
		local var388_upvw = false
		GuiService_upvr.MenuOpened:Connect(function() -- Line 1230
			--[[ Upvalues[8]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: var388_upvw (read and write)
				[3]: var5_upvw (copied, read and write)
				[4]: var4_upvw (copied, read and write)
				[5]: PlaySound_upvr (copied, readonly)
				[6]: AnimateGiftShake_upvr (readonly)
				[7]: var357_upvw (read and write)
				[8]: ToggleOfflineEarning_upvr (readonly)
			]]
			if ClientData_upvr.LoadingComplete then
				if not var388_upvw and ClientData_upvr.CurrentMenu ~= "OfflineReward" and 7200 <= workspace:GetServerTimeNow() - var5_upvw.Data.LastClaimedLeavingReward then
					var4_upvw.LeavingReward.Visible = true
					PlaySound_upvr("Reward")
					AnimateGiftShake_upvr()
					var357_upvw = task.spawn(function() -- Line 1127
						--[[ Upvalues[1]:
							[1]: AnimateGiftShake_upvr (copied, readonly)
						]]
						while true do
							task.wait(1.5)
							AnimateGiftShake_upvr()
						end
					end)
					var388_upvw = true
				end
				ToggleOfflineEarning_upvr(true)
			end
		end)
		GuiService_upvr.MenuClosed:Connect(function() -- Line 1249
			--[[ Upvalues[1]:
				[1]: ToggleOfflineEarning_upvr (readonly)
			]]
			ToggleOfflineEarning_upvr(false)
		end)
	end)()
	function TextChatService_upvr.OnIncomingMessage(arg1) -- Line 1255
		--[[ Upvalues[1]:
			[1]: Players_upvr (copied, readonly)
		]]
		local TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties")
		local TextSource = arg1.TextSource
		if TextSource then
			TextSource = arg1.TextSource.UserId
			if TextSource then
				TextSource = Players_upvr:GetPlayerByUserId(arg1.TextSource.UserId)
				local var406
			end
		end
		if TextSource then
			var406 = ""
			local Rebirths_2 = TextSource:GetAttribute("Rebirths")
			local TimePlayed_2 = TextSource:GetAttribute("TimePlayed")
			if Rebirths_2 then
				var406 = var406..string.format("<font color='#e548d8'>[🌟%s]</font> ", '#'..Rebirths_2)
			end
			if TimePlayed_2 then
				var406 = var406..string.format("<font color='#4bd8ff'>[⏰%s]</font> ", '#'..TimePlayed_2)
			end
			local UserId = TextSource.UserId
			if UserId == 33163025 then
				var406 = var406.."<font color='#FF0000'>[Owner]</font> "
			elseif UserId == 355796381 or UserId == 196979938 then
				var406 = var406.."<font color='#52ffa0'>[Manager]</font> "
			elseif UserId == 1751256409 or UserId == 884395826 or UserId == 8860746925 or UserId == 320763835 or UserId == 1544827891 or UserId == 1060384309 then
				var406 = var406.."<font color='#33beff'>[Trial Mod]</font> "
			end
			TextChatMessageProperties_2.PrefixText = var406..arg1.PrefixText
		end
		return TextChatMessageProperties_2
	end
	var4_upvw.BottomLeft.FriendsBoost.Text = "Friends Boost: "..var5_upvw.Data.FriendsBoost..'%'
	AddButtonFrames(var4_upvw.LeftButtons.ButtonHolder)
	AddButtonFrames(var4_upvw.RightButtons)
	;(function() -- Line 174, Named "SetupMenus"
		--[[ Upvalues[4]:
			[1]: var4_upvw (copied, read and write)
			[2]: Serg_Button_upvr (copied, readonly)
			[3]: ClientData_upvr (copied, readonly)
			[4]: ToggleMenu_upvr (copied, readonly)
		]]
		for _, v_2 in pairs(var4_upvw.Menus:GetChildren()) do
			if v_2:IsA("Frame") then
				local HeadlineFrame = v_2:FindFirstChild("HeadlineFrame")
				if HeadlineFrame then
					Serg_Button_upvr.New({
						Frame = HeadlineFrame;
						Callbacks = {};
						EnabledTweens = {
							Click = false;
							Hover = true;
						};
					})
				end
				local CloseFrame = v_2:FindFirstChild("CloseFrame")
				if CloseFrame then
					local tbl_34 = {
						Frame = CloseFrame;
					}
					local tbl_13 = {}
					local function Click() -- Line 195
						--[[ Upvalues[2]:
							[1]: ClientData_upvr (copied, readonly)
							[2]: ToggleMenu_upvr (copied, readonly)
						]]
						if ClientData_upvr.CurrentMenu then
							ToggleMenu_upvr(ClientData_upvr.CurrentMenu, false)
						end
					end
					tbl_13.Click = Click
					tbl_34.Callbacks = tbl_13
					tbl_34.EnabledTweens = {
						Click = true;
						Hover = true;
					}
					Serg_Button_upvr.New(tbl_34)
				end
			end
		end
	end)()
	;(function() -- Line 961, Named "SetupTopBar"
		--[[ Upvalues[7]:
			[1]: Device_upvr (copied, readonly)
			[2]: TopBar_upvr (copied, readonly)
			[3]: PlaySound_upvr (copied, readonly)
			[4]: SocialService_upvr (copied, readonly)
			[5]: var6_upvw (copied, read and write)
			[6]: ClientData_upvr (copied, readonly)
			[7]: ClientSignals_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 25 start (CF ANALYSIS FAILED)
		local var316
		if Device_upvr.CurrentDevice ~= "Mobile" then
			var316 = false
		else
			var316 = true
		end
		local tbl_24 = {}
		if var316 then
			-- KONSTANTWARNING: GOTO [90] #67
		end
		-- KONSTANTERROR: [0] 1. Error Block 25 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [89] 66. Error Block 27 start (CF ANALYSIS FAILED)
		if var316 then
		else
		end
		tbl_24[1] = TopBar_upvr.new():setImage(71705366448415):modifyTheme({{"IconSpot", "BackgroundTransparency", 1, "Selected"}, {"IconLabel", "Font", Enum.Font.FredokaOne}, {"IconButton", "BackgroundColor3", Color3.fromRGB(31, 31, 31), "Deselected"}, {"IconButton", "BackgroundTransparency", 0.06, "Deselected"}, {"IconButton", "BackgroundColor3", Color3.fromRGB(31, 31, 31), "Selected"}, {"IconButton", "BackgroundTransparency", 0.06, "Selected"}}):setLabel(""):align("Right")
		tbl_24[2] = TopBar_upvr.new():setImage(126649035992371):modifyTheme({{"IconSpot", "BackgroundTransparency", 1, "Selected"}, {"IconLabel", "Font", Enum.Font.FredokaOne}, {"IconButton", "BackgroundColor3", Color3.fromRGB(31, 31, 31), "Deselected"}, {"IconButton", "BackgroundTransparency", 0.06, "Deselected"}, {"IconButton", "BackgroundColor3", Color3.fromRGB(31, 31, 31), "Selected"}, {"IconButton", "BackgroundTransparency", 0.06, "Selected"}}):setLabel(""):align("Right")
		for i_15_upvr, v_12 in ipairs(tbl_24) do
			v_12:getInstance("IconSpot"):WaitForChild("ClickRegion").MouseButton1Click:Connect(function() -- Line 985
				--[[ Upvalues[6]:
					[1]: PlaySound_upvr (copied, readonly)
					[2]: i_15_upvr (readonly)
					[3]: SocialService_upvr (copied, readonly)
					[4]: var6_upvw (copied, read and write)
					[5]: ClientData_upvr (copied, readonly)
					[6]: ClientSignals_upvr (copied, readonly)
				]]
				PlaySound_upvr("ButtonClick")
				if i_15_upvr == 1 then
					SocialService_upvr:PromptGameInvite(var6_upvw)
				elseif i_15_upvr == 2 and ClientData_upvr.CurrentMenu ~= "Settings" then
					ClientSignals_upvr.ToggleMenu:Fire("Settings")
				end
			end)
		end
		-- KONSTANTERROR: [89] 66. Error Block 27 end (CF ANALYSIS FAILED)
	end)()
end
function module.Initialize(arg1, arg2, arg3, arg4) -- Line 1337
	--[[ Upvalues[7]:
		[1]: var4_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: Device_upvr (readonly)
		[5]: SetupFrontUi_upvr (readonly)
		[6]: ClientSignals_upvr (readonly)
		[7]: ToggleMenu_upvr (readonly)
	]]
	var4_upvw = arg2
	var5_upvw = arg3
	var6_upvw = arg4
	Device_upvr:Initialize()
	SetupFrontUi_upvr()
	ClientSignals_upvr.ToggleMenu:Connect(ToggleMenu_upvr)
	for _, v_14 in pairs(script:GetChildren()) do
		if v_14:IsA("ModuleScript") then
			require(v_14)(var4_upvw, var5_upvw, var6_upvw)
			task.wait()
		end
	end
end
local Serg_UIStrokeScale_upvr = require(ReplicatedStorage.Utilities.Serg_UIStrokeScale)
function module.Start(arg1) -- Line 1359
	--[[ Upvalues[1]:
		[1]: Serg_UIStrokeScale_upvr (readonly)
	]]
	Serg_UIStrokeScale_upvr.Init()
end
return module