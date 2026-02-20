-- Name: Settings
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Interface.Settings
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.56405740000082 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:43
-- Luau version 6, Types version 3
-- Time taken: 0.005844 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local var2_upvw
local var3_upvw
local var4_upvw
local tbl_upvr_2 = {
	Gradients = {
		[true] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(127, 255, 47)), ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 255, 1))});
		[false] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 76, 76)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 67, 67))});
	};
	TextGradient = {
		[true] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(159, 255, 152))});
		[false] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 155, 155))});
	};
	Text = {
		[true] = "ON";
		[false] = "OFF";
	};
}
local tbl_upvr = {
	Music = function(arg1) -- Line 42
		local script = script
		if arg1 then
			script = 0.15
		else
			script = 0
		end
		script.BackgroundMusic.Volume = script
	end;
}
local function SetToggleButton_upvr(arg1, arg2, arg3) -- Line 57, Named "SetToggleButton"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
	]]
	if arg1 == "DisableOthersPets" or arg1 == "DisableYourPets" or arg1 == "DisableUpgraderPopups" or arg1 == "DisableYourLuck" then
		local var16 = not arg3
	end
	local var17 = tbl_upvr[arg1]
	local var18 = tbl_upvr_2.Gradients[var16]
	arg2.Background.UIGradient.Color = var18
	arg2.Main.UIGradient.Color = var18
	arg2.Main.Headline.Text = tbl_upvr_2.Text[var16]
	arg2.Main.Headline.UIGradient.Color = tbl_upvr_2.TextGradient[var16]
	if var17 then
		var17(var16)
	end
end
local Serg_Button_upvr = require(ReplicatedStorage.Utilities.Serg_Button)
local Events_upvr = ReplicatedStorage.Events
local function SetupSettings_upvr() -- Line 79, Named "SetupSettings"
	--[[ Upvalues[6]:
		[1]: var3_upvw (read and write)
		[2]: var2_upvw (read and write)
		[3]: SetToggleButton_upvr (readonly)
		[4]: Serg_Button_upvr (readonly)
		[5]: Events_upvr (readonly)
		[6]: var4_upvw (read and write)
	]]
	for i_upvr, v in pairs(var3_upvw.Data.Settings) do
		local SOME_upvr = var2_upvw.Menus.Settings.SettingList:FindFirstChild(i_upvr)
		if SOME_upvr then
			SetToggleButton_upvr(i_upvr, SOME_upvr.Toggle, v)
			Serg_Button_upvr.New({
				Frame = SOME_upvr.Toggle;
				Callbacks = {
					Click = function() -- Line 89, Named "Click"
						--[[ Upvalues[2]:
							[1]: Events_upvr (copied, readonly)
							[2]: i_upvr (readonly)
						]]
						Events_upvr.ChangeSetting:FireServer(i_upvr)
					end;
				};
				EnabledTweens = {
					Click = true;
					Hover = true;
				};
			})
			var3_upvw:OnSet({"Settings", i_upvr}, function(arg1, arg2) -- Line 99
				--[[ Upvalues[3]:
					[1]: SetToggleButton_upvr (copied, readonly)
					[2]: i_upvr (readonly)
					[3]: SOME_upvr (readonly)
				]]
				SetToggleButton_upvr(i_upvr, SOME_upvr.Toggle, arg1)
			end)
		end
	end
	local var33_upvw = false
	var4_upvw.Idled:Connect(function(arg1) -- Line 105
		--[[ Upvalues[2]:
			[1]: var33_upvw (read and write)
			[2]: Events_upvr (copied, readonly)
		]]
		if 1020 <= arg1 and not var33_upvw then
			var33_upvw = true
			Events_upvr.IdleKick:FireServer()
		end
	end)
end
local function _() -- Line 114, Named "SetupVersion"
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	local var34 = game.PlaceVersion or 0
	var2_upvw.Menus.Settings.Version.Text = "Game Version: "..string.format("v%d.%d.%d", math.floor(var34 / 1000), math.floor(var34 % 1000 / 10), var34 % 10)
end
return function(arg1, arg2, arg3) -- Line 125
	--[[ Upvalues[4]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var4_upvw (read and write)
		[4]: SetupSettings_upvr (readonly)
	]]
	var2_upvw = arg1
	var3_upvw = arg2
	var4_upvw = arg3
	SetupSettings_upvr()
	local var36 = game.PlaceVersion or 0
	var2_upvw.Menus.Settings.Version.Text = "Game Version: "..string.format("v%d.%d.%d", math.floor(var36 / 1000), math.floor(var36 % 1000 / 10), var36 % 10)
	script.BackgroundMusic:Play()
end