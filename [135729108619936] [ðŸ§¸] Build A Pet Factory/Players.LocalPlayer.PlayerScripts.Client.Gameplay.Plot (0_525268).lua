-- Name: Plot
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Plot
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 1.104808199999752 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:29
-- Luau version 6, Types version 3
-- Time taken: 0.059439 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local Players_upvr = game:GetService("Players")
local var4_upvw
local var5_upvw
local var6_upvw
local Events_upvr = ReplicatedStorage_upvr.Events
local ClientSignals_upvr = require(ReplicatedStorage_upvr.Utilities.ClientSignals)
local ClientData_upvr = require(ReplicatedStorage_upvr.Utilities.ClientData)
local PlaySound_upvr = require(ReplicatedStorage_upvr.Utilities.PlaySound)
local TimerFormat_upvr = require(ReplicatedStorage_upvr.Utilities.TimerFormat)
local ConfettiPopup_upvr = require(ReplicatedStorage_upvr.Utilities.ConfettiPopup)
local Debris_upvr = game:GetService("Debris")
local function AnimateButton_upvr(arg1) -- Line 50, Named "AnimateButton"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: Debris_upvr (readonly)
	]]
	TweenService_upvr:Create(arg1, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
		Position = arg1.Position - Vector3.new(0, 0.25, 0);
	}):Play()
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.CanCollide = false
	Part.Color = Color3.fromRGB(255, 255, 255)
	Part.CFrame = arg1.CFrame - Vector3.new(0, 0.20000, 0)
	TweenService_upvr:Create(Part, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = arg1.Size + Vector3.new(2, 0, 2);
		Transparency = 1;
	}):Play()
	Part.Parent = workspace
	Debris_upvr:AddItem(Part, 0.4)
end
local StoreConfig_upvr = require(ReplicatedStorage_upvr.Configs.StoreConfig)
local CollectionService_upvr = game:GetService("CollectionService")
local FloatAnimation_upvr = require(ReplicatedStorage_upvr.Utilities.FloatAnimation)
local function SetupPlotMonetization_upvr(arg1) -- Line 74, Named "SetupPlotMonetization"
	--[[ Upvalues[14]:
		[1]: var4_upvw (read and write)
		[2]: ClientData_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
		[4]: Players_upvr (readonly)
		[5]: var6_upvw (read and write)
		[6]: AnimateButton_upvr (readonly)
		[7]: var5_upvw (read and write)
		[8]: PlaySound_upvr (readonly)
		[9]: ConfettiPopup_upvr (readonly)
		[10]: StoreConfig_upvr (readonly)
		[11]: CollectionService_upvr (readonly)
		[12]: TweenService_upvr (readonly)
		[13]: TimerFormat_upvr (readonly)
		[14]: FloatAnimation_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 106 start (CF ANALYSIS FAILED)
	local tbl_13_upvr = {}
	local function _(arg1_7, arg2) -- Line 93, Named "UnlockPack"
		--[[ Upvalues[4]:
			[1]: tbl_13_upvr (readonly)
			[2]: var4_upvw (copied, read and write)
			[3]: ClientData_upvr (copied, readonly)
			[4]: ClientSignals_upvr (copied, readonly)
		]]
		if tbl_13_upvr[arg1_7] then
			task.cancel(tbl_13_upvr[arg1_7])
			tbl_13_upvr[arg1_7] = nil
		end
		if arg2 and arg2.Parent then
			arg2:Destroy()
		end
		local SOME_2 = var4_upvw.RightButtons:FindFirstChild(arg1_7)
		if SOME_2 then
			SOME_2.Visible = false
			if ClientData_upvr.CurrentMenu == arg1_7 then
				ClientSignals_upvr.ToggleMenu:Fire(arg1_7)
			end
		end
	end
	local var52
	if not var5_upvw.Data.ClaimedGroupRewards then
		local GroupRewards_upvr_2 = arg1:WaitForChild("GroupRewards")
		if GroupRewards_upvr_2 then
			if GroupRewards_upvr_2 then
				({})[GroupRewards_upvr_2.Top] = GroupRewards_upvr_2:FindFirstChild("BillboardGui")
			end
			;(function(arg1_8, arg2) -- Line 113, Named "SetupButton"
				--[[ Upvalues[3]:
					[1]: Players_upvr (copied, readonly)
					[2]: var6_upvw (copied, read and write)
					[3]: AnimateButton_upvr (copied, readonly)
				]]
				local Top_upvr = arg1_8.Top
				local Decal_2 = Top_upvr:FindFirstChild("Decal")
				if Decal_2 then
					Decal_2.Transparency = 0
				end
				Top_upvr.Transparency = 0
				Top_upvr.CanCollide = true
				arg1_8.Bottom.Transparency = 0
				arg1_8.Bottom.CanCollide = true
				local BillboardGui_2 = arg1_8:FindFirstChild("BillboardGui")
				if BillboardGui_2 then
					BillboardGui_2.Enabled = true
				end
				local var46_upvw = 0
				Top_upvr.Touched:Connect(function(arg1_9) -- Line 133
					--[[ Upvalues[6]:
						[1]: Players_upvr (copied, readonly)
						[2]: var6_upvw (copied, read and write)
						[3]: var46_upvw (read and write)
						[4]: arg2 (readonly)
						[5]: AnimateButton_upvr (copied, readonly)
						[6]: Top_upvr (readonly)
					]]
					if Players_upvr:GetPlayerFromCharacter(arg1_9.Parent) ~= var6_upvw then
					else
						local workspace_GetServerTimeNow_result1_2 = workspace:GetServerTimeNow()
						if 0.5 < workspace_GetServerTimeNow_result1_2 - var46_upvw then
							var46_upvw = workspace_GetServerTimeNow_result1_2
							arg2()
							AnimateButton_upvr(Top_upvr)
						end
					end
				end)
			end)(GroupRewards_upvr_2, function() -- Line 154
				--[[ Upvalues[2]:
					[1]: ClientData_upvr (copied, readonly)
					[2]: ClientSignals_upvr (copied, readonly)
				]]
				if ClientData_upvr.CurrentMenu ~= "GroupRewards" then
					ClientSignals_upvr.ToggleMenu:Fire("GroupRewards")
				end
			end)
			local tbl_8 = {}
			var52 = "ClaimedGroupRewards"
			tbl_8[1] = var52
			function var52(arg1_10, arg2) -- Line 160
				--[[ Upvalues[6]:
					[1]: GroupRewards_upvr_2 (readonly)
					[2]: ClientData_upvr (copied, readonly)
					[3]: ClientSignals_upvr (copied, readonly)
					[4]: PlaySound_upvr (copied, readonly)
					[5]: ConfettiPopup_upvr (copied, readonly)
					[6]: var4_upvw (copied, read and write)
				]]
				if arg1_10 and not arg2 then
					GroupRewards_upvr_2:Destroy()
					if ClientData_upvr.CurrentMenu == "GroupRewards" then
						ClientSignals_upvr.ToggleMenu:Fire("GroupRewards")
					end
					ClientSignals_upvr.Notification:Fire({
						Message = "Successfully claimed Group Rewards!";
						IsWarning = false;
					})
					PlaySound_upvr("Victory")
					ConfettiPopup_upvr(var4_upvw)
				end
			end
			var5_upvw:OnSet(tbl_8, var52)
		end
	end
	function GroupRewards_upvr_2(arg1_11) -- Line 180, Named "PackOfferEnded"
		--[[ Upvalues[1]:
			[1]: var5_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 11 start (CF ANALYSIS FAILED)
		if arg1_11 == "StarterPack" then
			if 600 < var5_upvw.Data.TimePlayed then
				do
					return true
				end
				-- KONSTANTWARNING: GOTO [20] #15
			end
		elseif arg1_11 == "ProPack" then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if 1500 < var5_upvw.Data.TimePlayed then
				return true
			end
		end
		-- KONSTANTERROR: [0] 1. Error Block 11 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 15. Error Block 7 start (CF ANALYSIS FAILED)
		do
			return false
		end
		-- KONSTANTERROR: [20] 15. Error Block 7 end (CF ANALYSIS FAILED)
	end
	local pairs_result1, pairs_result2_10, pairs_result3_3 = pairs({"StarterPack", "ProPack", "x3Cash", "x3Gems", "x10Luck", "GroupRewards", "RainbowPetSpawner", "RainbowPetCollector", "RainbowPetUpgrader"})
	-- KONSTANTERROR: [0] 1. Error Block 106 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [311] 242. Error Block 45 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [311] 242. Error Block 45 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [74] 62. Error Block 129 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.12]
	if nil then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.13]
		if nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.14]
			if nil then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.15]
				if nil then
				end
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.16]
				if nil ~= nil then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					if not nil then
						if var52 == "StarterPack" then
							-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.19]
							-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [311.18]
							if nil < nil then
								-- KONSTANTWARNING: GOTO [123] #99
							end
							-- KONSTANTWARNING: GOTO [122] #98
						end
						-- KONSTANTWARNING: GOTO [115] #93
					end
					-- KONSTANTWARNING: GOTO [124] #100
				end
				-- KONSTANTWARNING: GOTO [268] #208
			end
			-- KONSTANTWARNING: GOTO [311] #242
		end
		-- KONSTANTWARNING: GOTO [311] #242
	end
	-- KONSTANTERROR: [74] 62. Error Block 129 end (CF ANALYSIS FAILED)
end
local ItemConfig_upvr = require(ReplicatedStorage_upvr.Configs.ItemConfig)
local function SetupTrashCan_upvr(arg1) -- Line 427, Named "SetupTrashCan"
	--[[ Upvalues[5]:
		[1]: var6_upvw (read and write)
		[2]: ClientData_upvr (readonly)
		[3]: ClientSignals_upvr (readonly)
		[4]: ItemConfig_upvr (readonly)
		[5]: var4_upvw (read and write)
	]]
	local Main_3 = arg1:FindFirstChild("Main")
	if not Main_3 then
	else
		local BillboardGui_3 = Main_3.Parent:FindFirstChild("BillboardGui")
		if BillboardGui_3 then
			BillboardGui_3.Enabled = true
		end
		local ProximityPrompt = Instance.new("ProximityPrompt")
		ProximityPrompt.RequiresLineOfSight = false
		ProximityPrompt.HoldDuration = 0.5
		ProximityPrompt.MaxActivationDistance = 15
		ProximityPrompt.ActionText = "Sell"
		ProximityPrompt.ObjectText = "Hold Item"
		local function _() -- Line 444, Named "GetHoldingInventoryItem"
			--[[ Upvalues[1]:
				[1]: var6_upvw (copied, read and write)
			]]
			local Character_2 = var6_upvw.Character
			if not Character_2 then return end
			local class_Tool = Character_2:FindFirstChildWhichIsA("Tool")
			if not class_Tool then return end
			return class_Tool.Name
		end
		for _, v_6 in pairs(arg1:GetChildren()) do
			if v_6:IsA("Part") then
				v_6.Transparency = 0
				v_6.CanCollide = true
			end
		end
		ProximityPrompt.Triggered:Connect(function(arg1_12) -- Line 461
			--[[ Upvalues[5]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
				[3]: ClientSignals_upvr (copied, readonly)
				[4]: ItemConfig_upvr (copied, readonly)
				[5]: var4_upvw (copied, read and write)
			]]
			local CurrentMenu = ClientData_upvr.CurrentMenu
			if CurrentMenu ~= "Sell" then
				local Character_3 = var6_upvw.Character
				if not Character_3 then
					CurrentMenu = nil
				else
					local class_Tool_2 = Character_3:FindFirstChildWhichIsA("Tool")
					if not class_Tool_2 then
						CurrentMenu = nil
					else
						CurrentMenu = class_Tool_2.Name
					end
				end
				if not CurrentMenu then
					ClientSignals_upvr.Notification:Fire({
						Message = "Hold the item you want to delete!";
						IsWarning = true;
					})
					return
				end
				local var73 = ItemConfig_upvr[CurrentMenu]
				if not var73 then return end
				if var73.IsRobuxOnly then
					ClientSignals_upvr.Notification:Fire({
						Message = "Can't sell rainbow items!";
						IsWarning = true;
					})
					return
				end
				if var73.DisabledGifting then
					ClientSignals_upvr.Notification:Fire({
						Message = "Can't sell that item!";
						IsWarning = true;
					})
					return
				end
				var4_upvw.Menus.Sell:SetAttribute("CurrentItemName", CurrentMenu)
				var4_upvw.Menus.Sell.ItemIcon.Image = var73.Icon
				var4_upvw.Menus.Sell.ItemNameHolder.ItemName.Text = CurrentMenu
				ClientSignals_upvr.ToggleMenu:Fire("Sell")
			end
		end)
		ProximityPrompt.Parent = Main_3
	end
end
local GetMultiplier_upvr = require(ReplicatedStorage_upvr.Utilities.GetMultiplier)
local AbbreviateNumber_upvr = require(ReplicatedStorage_upvr.Utilities.AbbreviateNumber)
local function SetupTotalMultipliers_upvr(arg1) -- Line 506, Named "SetupTotalMultipliers"
	--[[ Upvalues[3]:
		[1]: GetMultiplier_upvr (readonly)
		[2]: AbbreviateNumber_upvr (readonly)
		[3]: var5_upvw (read and write)
	]]
	local DisabledLuck_upvr = arg1:WaitForChild("BillboardGuiPart"):WaitForChild("DisabledLuck")
	local SurfaceGui1 = arg1:WaitForChild("Main"):WaitForChild("SurfaceGui1")
	local SurfaceGui2 = arg1:WaitForChild("Main"):WaitForChild("SurfaceGui2")
	local tbl_12_upvr = {SurfaceGui1:WaitForChild("MultiplierList"), SurfaceGui2:WaitForChild("MultiplierList")}
	local function UpdateMultipliers_upvr() -- Line 513, Named "UpdateMultipliers"
		--[[ Upvalues[4]:
			[1]: tbl_12_upvr (readonly)
			[2]: GetMultiplier_upvr (copied, readonly)
			[3]: AbbreviateNumber_upvr (copied, readonly)
			[4]: var5_upvw (copied, read and write)
		]]
		for _, v in pairs(tbl_12_upvr) do
			for _, v_2 in pairs(v:GetChildren()) do
				if v_2:IsA("Frame") then
					local var105 = GetMultiplier_upvr[v_2.Name]
					if var105 then
						v_2.List.Multiplier.Text = 'x'..AbbreviateNumber_upvr(var105(var5_upvw) or 1)
					end
				end
			end
		end
	end
	for _, v_3 in pairs(arg1:GetChildren()) do
		if v_3:IsA("Part") then
			v_3.Transparency = 0
		end
	end
	arg1:WaitForChild("BillboardGuiPart"):WaitForChild("BillboardGui").Enabled = true
	SurfaceGui1.Enabled = true
	SurfaceGui2.Enabled = true
	DisabledLuck_upvr.Enabled = var5_upvw.Data.Settings.DisableYourLuck
	var5_upvw:OnSet({"Settings", "DisableYourLuck"}, function(arg1_13) -- Line 540
		--[[ Upvalues[1]:
			[1]: DisabledLuck_upvr (readonly)
		]]
		DisabledLuck_upvr.Enabled = arg1_13
	end)
	task.spawn(function() -- Line 544
		--[[ Upvalues[1]:
			[1]: UpdateMultipliers_upvr (readonly)
		]]
		while task.wait(1) do
			UpdateMultipliers_upvr()
		end
	end)
end
local function SetupLeaderboards_upvr(arg1) -- Line 551, Named "SetupLeaderboards"
	--[[ Upvalues[5]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: TimerFormat_upvr (readonly)
		[3]: Players_upvr (readonly)
		[4]: var6_upvw (read and write)
		[5]: var5_upvw (read and write)
	]]
	local tbl_6_upvr = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 204, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 227, 15)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 204, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))}), ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(171, 163, 160)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(149, 142, 140)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(161, 154, 152)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(149, 142, 140)), ColorSequenceKeypoint.new(1, Color3.fromRGB(171, 163, 160))}), ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 133, 34)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 110, 38)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 124, 48)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 110, 38)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 133, 34))}), ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(192, 255, 251)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(178, 255, 249)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(161, 230, 224)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(178, 255, 249)), ColorSequenceKeypoint.new(1, Color3.fromRGB(192, 255, 251))})}
	local function _(arg1_14, arg2, arg3) -- Line 585, Named "UpdateLeaderboard"
		--[[ Upvalues[1]:
			[1]: TimerFormat_upvr (copied, readonly)
		]]
		if not arg1_14 then
		else
			if arg3 ~= "TimePlayed" or not TimerFormat_upvr(arg1_14, false, false, true) then
			end
			arg2.Frame.Amount.Text = arg1_14
		end
	end
	local function _(arg1_15, arg2) -- Line 591, Named "UpdateLeaderboardFrameTheme"
		--[[ Upvalues[1]:
			[1]: tbl_6_upvr (readonly)
		]]
		local var117 = tbl_6_upvr[arg2 or 4]
		if not var117 then
		else
			arg1_15.Frame.UIGradient.Color = var117
		end
	end
	local function _() -- Line 598, Named "GetPlayerIcon"
		--[[ Upvalues[2]:
			[1]: Players_upvr (copied, readonly)
			[2]: var6_upvw (copied, read and write)
		]]
		local pcall_result1_3, pcall_result2_3 = pcall(function() -- Line 599
			--[[ Upvalues[2]:
				[1]: Players_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
			]]
			return Players_upvr:GetUserThumbnailAsync(var6_upvw.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
		end)
		if pcall_result1_3 then
			return pcall_result2_3
		end
		return nil
	end
	local Leaderboards_upvr = ReplicatedStorage_upvr:WaitForChild("Assets"):WaitForChild("Leaderboards")
	task.spawn(function() -- Line 614
		--[[ Upvalues[7]:
			[1]: Players_upvr (copied, readonly)
			[2]: var6_upvw (copied, read and write)
			[3]: arg1 (readonly)
			[4]: Leaderboards_upvr (readonly)
			[5]: var5_upvw (copied, read and write)
			[6]: TimerFormat_upvr (copied, readonly)
			[7]: tbl_6_upvr (readonly)
		]]
		local pcall_result1, pcall_result2_2 = pcall(function() -- Line 599
			--[[ Upvalues[2]:
				[1]: Players_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
			]]
			return Players_upvr:GetUserThumbnailAsync(var6_upvw.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
		end)
		local var154
		if pcall_result1 then
			var154 = pcall_result2_2
		else
			var154 = nil
		end
		for _, v_4 in pairs(arg1:GetChildren()) do
			if v_4:IsA("Part") then
				local Name_2_upvr = v_4.Name
				local SOME_4 = Leaderboards_upvr:FindFirstChild(Name_2_upvr)
				if SOME_4 then
					SOME_4:PivotTo(v_4.CFrame)
					SOME_4.Parent = v_4
					local PlayerAmount_2 = SOME_4:FindFirstChild("PlayerAmount")
					if PlayerAmount_2 then
						local Main_2 = PlayerAmount_2:FindFirstChild("Main")
						if Main_2 then
							local class_SurfaceGui_2_upvr = Main_2:FindFirstChildWhichIsA("SurfaceGui")
							if class_SurfaceGui_2_upvr then
								local var163 = var5_upvw.Data[Name_2_upvr]
								local var164
								if var163 then
									if not var163 then
									else
										var164 = class_SurfaceGui_2_upvr.Frame
										local function INLINED_3() -- Internal function, doesn't exist in bytecode
											var164 = TimerFormat_upvr(var163, false, false, true)
											return var164
										end
										if Name_2_upvr ~= "TimePlayed" or not INLINED_3() then
											var164 = var163
										end
										var164.Amount.Text = var164
									end
									var5_upvw:OnSet({Name_2_upvr}, function(arg1_17) -- Line 642
										--[[ Upvalues[3]:
											[1]: class_SurfaceGui_2_upvr (readonly)
											[2]: Name_2_upvr (readonly)
											[3]: TimerFormat_upvr (copied, readonly)
										]]
										local var167
										if not arg1_17 then
										else
											var167 = class_SurfaceGui_2_upvr.Frame
											local function INLINED_4() -- Internal function, doesn't exist in bytecode
												var167 = TimerFormat_upvr(arg1_17, false, false, true)
												return var167
											end
											if Name_2_upvr ~= "TimePlayed" or not INLINED_4() then
												var167 = arg1_17
											end
											var167.Amount.Text = var167
										end
									end)
									if var154 then
										class_SurfaceGui_2_upvr.Frame.PlayerIcon.Image = var154 or ""
									end
									local var168 = tbl_6_upvr[var6_upvw:GetAttribute(Name_2_upvr) or 4]
									if not var168 then
									else
										class_SurfaceGui_2_upvr.Frame.UIGradient.Color = var168
									end
									var6_upvw:GetAttributeChangedSignal(Name_2_upvr):Connect(function() -- Line 652
										--[[ Upvalues[4]:
											[1]: class_SurfaceGui_2_upvr (readonly)
											[2]: var6_upvw (copied, read and write)
											[3]: Name_2_upvr (readonly)
											[4]: tbl_6_upvr (copied, readonly)
										]]
										local var170 = tbl_6_upvr[var6_upvw:GetAttribute(Name_2_upvr) or 4]
										if not var170 then
										else
											class_SurfaceGui_2_upvr.Frame.UIGradient.Color = var170
										end
									end)
								end
							end
						end
					end
				end
			end
		end
	end)
end
local PlotEggs_upvr = require(ReplicatedStorage_upvr.Utilities.PlotEggs)
local function SetupEggs_upvr(arg1) -- Line 660, Named "SetupEggs"
	--[[ Upvalues[2]:
		[1]: PlotEggs_upvr (readonly)
		[2]: var5_upvw (read and write)
	]]
	PlotEggs_upvr.Setup(arg1, var5_upvw.Data.Rebirths)
	var5_upvw:OnSet({"Rebirths"}, function(arg1_18, arg2) -- Line 663
		--[[ Upvalues[2]:
			[1]: PlotEggs_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		PlotEggs_upvr.Update(arg1, arg1_18)
	end)
end
local Serg_Button_upvr = require(ReplicatedStorage_upvr.Utilities.Serg_Button)
local function SetupGemsBoard_upvr(arg1) -- Line 668, Named "SetupGemsBoard"
	--[[ Upvalues[2]:
		[1]: Serg_Button_upvr (readonly)
		[2]: ClientSignals_upvr (readonly)
	]]
	local PrimaryPart_2 = arg1.PrimaryPart
	if not PrimaryPart_2 then
		PrimaryPart_2 = arg1:FindFirstChild("Main")
	end
	if not PrimaryPart_2 then
	else
		for _, v_7 in pairs(arg1:GetChildren()) do
			if v_7 == PrimaryPart_2 then
				(function(arg1_19) -- Line 672, Named "SetupGemButtons"
					--[[ Upvalues[2]:
						[1]: Serg_Button_upvr (copied, readonly)
						[2]: ClientSignals_upvr (copied, readonly)
					]]
					if not arg1_19 then
					else
						arg1_19.Enabled = true
						local List = arg1_19:FindFirstChild("List")
						if List then
							for _, v_10_upvr in pairs(List:GetChildren()) do
								if v_10_upvr:IsA("Frame") then
									local tbl_7 = {
										Frame = v_10_upvr;
									}
									local tbl = {}
									tbl.Click = function() -- Line 685, Named "Click"
										--[[ Upvalues[2]:
											[1]: ClientSignals_upvr (copied, readonly)
											[2]: v_10_upvr (readonly)
										]]
										ClientSignals_upvr.PromptPurchase:Fire(v_10_upvr.Name)
									end
									tbl_7.Callbacks = tbl
									tbl_7.EnabledTweens = {
										Click = true;
										Hover = true;
									}
									Serg_Button_upvr.New(tbl_7)
								end
							end
						end
					end
				end)(v_7:FindFirstChild("SurfaceGui"))
			end
			if v_7:IsA("Part") then
				v_7.Transparency = 0
				v_7.CanCollide = true
			end
		end
	end
end
local function SetupGamepassBoard_upvr(arg1) -- Line 710, Named "SetupGamepassBoard"
	--[[ Upvalues[1]:
		[1]: var5_upvw (read and write)
	]]
	local PrimaryPart = arg1.PrimaryPart
	if not PrimaryPart then
		PrimaryPart = arg1:FindFirstChild("Main")
	end
	if not PrimaryPart then
	else
		local class_SurfaceGui = PrimaryPart:FindFirstChildWhichIsA("SurfaceGui")
		local class_BillboardGui = PrimaryPart:FindFirstChildWhichIsA("BillboardGui")
		if not class_SurfaceGui or not class_BillboardGui then return end
		local Gamepasses_upvr = class_SurfaceGui:FindFirstChild("Gamepasses")
		if not Gamepasses_upvr then return end
		class_SurfaceGui.Enabled = true
		class_BillboardGui.Enabled = true
		local function _(arg1_20) -- Line 723, Named "OnGamepassBought"
			--[[ Upvalues[1]:
				[1]: Gamepasses_upvr (readonly)
			]]
			local SOME_8 = Gamepasses_upvr:FindFirstChild(arg1_20)
			if not SOME_8 then
			else
				SOME_8.Owned.Visible = true
				SOME_8.Buy.Visible = false
			end
		end
		for _, v_8 in pairs(var5_upvw.Data.Gamepasses) do
			local SOME_6 = Gamepasses_upvr:FindFirstChild(v_8)
			if not SOME_6 then
			else
				SOME_6.Owned.Visible = true
				SOME_6.Buy.Visible = false
			end
		end
		for _, v_9 in pairs(arg1:GetChildren()) do
			if v_9:IsA("Part") then
				v_9.Transparency = 0
				v_9.CanCollide = true
			end
		end
		var5_upvw:OnChange(function(arg1_21, arg2, arg3, arg4) -- Line 742
			--[[ Upvalues[1]:
				[1]: Gamepasses_upvr (readonly)
			]]
			if arg1_21 == "TableInsert" and arg2[1] == "Gamepasses" then
				local SOME_5 = Gamepasses_upvr:FindFirstChild(arg3)
				if not SOME_5 then return end
				SOME_5.Owned.Visible = true
				SOME_5.Buy.Visible = false
			end
		end)
	end
end
local PlacementUtil_upvr = require(ReplicatedStorage_upvr.Utilities.PlacementUtil)
local Zone_upvr = require(ReplicatedStorage_upvr.Utilities.Zone)
local var216_upvw = 0
local Customer_upvr = require(script.Customer)
local EventRSVP_upvr = require(ReplicatedStorage_upvr.Utilities.EventRSVP)
local function SetupTouchZones_upvr() -- Line 751, Named "SetupTouchZones"
	--[[ Upvalues[24]:
		[1]: PlacementUtil_upvr (readonly)
		[2]: var6_upvw (read and write)
		[3]: Zone_upvr (readonly)
		[4]: ClientData_upvr (readonly)
		[5]: ClientSignals_upvr (readonly)
		[6]: var5_upvw (read and write)
		[7]: var4_upvw (read and write)
		[8]: TweenService_upvr (readonly)
		[9]: Players_upvr (readonly)
		[10]: var216_upvw (read and write)
		[11]: Events_upvr (readonly)
		[12]: AnimateButton_upvr (readonly)
		[13]: PlaySound_upvr (readonly)
		[14]: TimerFormat_upvr (readonly)
		[15]: SetupTrashCan_upvr (readonly)
		[16]: SetupPlotMonetization_upvr (readonly)
		[17]: SetupLeaderboards_upvr (readonly)
		[18]: SetupTotalMultipliers_upvr (readonly)
		[19]: SetupEggs_upvr (readonly)
		[20]: SetupGemsBoard_upvr (readonly)
		[21]: SetupGamepassBoard_upvr (readonly)
		[22]: Customer_upvr (readonly)
		[23]: EventRSVP_upvr (readonly)
		[24]: ConfettiPopup_upvr (readonly)
	]]
	local any_GetPlotFolder_result1 = PlacementUtil_upvr.GetPlotFolder(var6_upvw)
	if not any_GetPlotFolder_result1 then
	else
		local Interactables = any_GetPlotFolder_result1:WaitForChild("Interactables")
		if not Interactables then return end
		local SellButton_upvr = Interactables:WaitForChild("SellButton")
		local BuildingShopGui_upvr = Interactables:WaitForChild("BuildingShopGui")
		Interactables:WaitForChild("PlotIcon"):WaitForChild("BillboardGui").Enabled = false
		Zone_upvr.new(Interactables:WaitForChild("BuildingShop")).localPlayerEntered:Connect(function() -- Line 769
			--[[ Upvalues[5]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: ClientSignals_upvr (copied, readonly)
				[3]: var5_upvw (copied, read and write)
				[4]: var4_upvw (copied, read and write)
				[5]: TweenService_upvr (copied, readonly)
			]]
			if ClientData_upvr.CurrentMenu ~= "Buildings" then
				ClientSignals_upvr.ToggleMenu:Fire("Buildings", true)
				if var5_upvw.Data.TutorialStep then
					if var5_upvw.Data.TutorialStep == 6 then
						local MainList_2 = var4_upvw.Menus.Buildings.MainList
						local Lightning_Upgrader = MainList_2:FindFirstChild("Lightning Upgrader")
						if Lightning_Upgrader then
							TweenService_upvr:Create(MainList_2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								CanvasPosition = Vector2.new(0, Lightning_Upgrader.AbsolutePosition.Y - MainList_2.AbsolutePosition.Y + MainList_2.CanvasPosition.Y + MainList_2.UIListLayout.Padding.Scale);
							}):Play()
						end
					end
				end
			end
		end)
		Zone_upvr.new(Interactables:WaitForChild("Rebirth")).localPlayerEntered:Connect(function() -- Line 801
			--[[ Upvalues[2]:
				[1]: ClientData_upvr (copied, readonly)
				[2]: ClientSignals_upvr (copied, readonly)
			]]
			if ClientData_upvr.CurrentMenu ~= "Rebirth" then
				ClientSignals_upvr.ToggleMenu:Fire("Rebirth", true)
			end
		end)
		SellButton_upvr.Touched:Connect(function(arg1) -- Line 807
			--[[ Upvalues[7]:
				[1]: Players_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
				[3]: var216_upvw (copied, read and write)
				[4]: Events_upvr (copied, readonly)
				[5]: AnimateButton_upvr (copied, readonly)
				[6]: SellButton_upvr (readonly)
				[7]: PlaySound_upvr (copied, readonly)
			]]
			local any_GetPlayerFromCharacter_result1 = Players_upvr:GetPlayerFromCharacter(arg1.Parent)
			if not any_GetPlayerFromCharacter_result1 then
			elseif var6_upvw == any_GetPlayerFromCharacter_result1 then
				local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
				if 1 < workspace_GetServerTimeNow_result1 - var216_upvw then
					var216_upvw = workspace_GetServerTimeNow_result1
					Events_upvr.CollectCash:FireServer()
					AnimateButton_upvr(SellButton_upvr)
					PlaySound_upvr("CollectCash")
				end
			end
		end)
		var5_upvw:OnSet({"RestockBuildingsTimer"}, function(arg1, arg2) -- Line 830
			--[[ Upvalues[3]:
				[1]: BuildingShopGui_upvr (readonly)
				[2]: TimerFormat_upvr (copied, readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			BuildingShopGui_upvr.RestockTimer.Text = "Restocks In <font color=\"rgb(255, 221, 0)\">"..TimerFormat_upvr(arg1).."</font>"
			if arg1 <= 120 then
				TweenService_upvr:Create(BuildingShopGui_upvr.RestockTimer, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
					TextColor3 = Color3.fromRGB(255, 236, 93);
				}):Play()
			end
		end)
		SetupTrashCan_upvr(Interactables:WaitForChild("TrashCan"))
		SetupPlotMonetization_upvr(Interactables:WaitForChild("Monetization"))
		SetupLeaderboards_upvr(Interactables:WaitForChild("LeaderboardPoints"))
		SetupTotalMultipliers_upvr(Interactables:WaitForChild("MultipliersBoard"))
		SetupEggs_upvr(Interactables:WaitForChild("Eggs"))
		SetupGemsBoard_upvr(Interactables:WaitForChild("GemsBoard"))
		SetupGamepassBoard_upvr(Interactables:WaitForChild("GamepassBoard"))
		Events_upvr.SpawnCustomer.OnClientEvent:Connect(function(...) -- Line 854
			--[[ Upvalues[1]:
				[1]: Customer_upvr (copied, readonly)
			]]
			Customer_upvr.SpawnCustomer(...)
		end)
		EventRSVP_upvr:Setup(Interactables:WaitForChild("NotifyBoard"), Interactables:WaitForChild("NotifyEvent"), "6480127902976049717", {
			ActionText = "Get notified for the BIG UPDATE!";
			ObjectText = "Upcoming Event";
			MaxActivationDistance = 15;
		}, function() -- Line 862
			--[[ Upvalues[2]:
				[1]: ConfettiPopup_upvr (copied, readonly)
				[2]: var4_upvw (copied, read and write)
			]]
			ConfettiPopup_upvr(var4_upvw)
		end)
	end
end
local function SetupGifting_upvr() -- Line 867, Named "SetupGifting"
	--[[ Upvalues[3]:
		[1]: var6_upvw (read and write)
		[2]: ClientSignals_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local tbl_9_upvr = {}
	local function _() -- Line 870, Named "GetHoldingTool"
		--[[ Upvalues[1]:
			[1]: var6_upvw (copied, read and write)
		]]
		local Character = var6_upvw.Character
		if not Character then return end
		return Character:FindFirstChildWhichIsA("Tool")
	end
	local function AddGiftingProximity_upvr(arg1) -- Line 877, Named "AddGiftingProximity"
		--[[ Upvalues[2]:
			[1]: var6_upvw (copied, read and write)
			[2]: ClientSignals_upvr (copied, readonly)
		]]
		local Character_5 = arg1.Character
		if not Character_5 then
		else
			local HumanoidRootPart = Character_5:WaitForChild("HumanoidRootPart", 1)
			if not HumanoidRootPart then return end
			if HumanoidRootPart:FindFirstChildWhichIsA("ProximityPrompt") then return end
			local ProximityPrompt_2 = Instance.new("ProximityPrompt")
			ProximityPrompt_2.ActionText = "Gift"
			ProximityPrompt_2.ObjectText = "Send Item"
			ProximityPrompt_2.MaxActivationDistance = 10
			ProximityPrompt_2.RequiresLineOfSight = false
			ProximityPrompt_2.Parent = HumanoidRootPart
			local UserId_upvr = arg1.UserId
			ProximityPrompt_2.Triggered:Connect(function() -- Line 897
				--[[ Upvalues[3]:
					[1]: var6_upvw (copied, read and write)
					[2]: ClientSignals_upvr (copied, readonly)
					[3]: UserId_upvr (readonly)
				]]
				local Character_4 = var6_upvw.Character
				local var252
				if not Character_4 then
					var252 = nil
				else
					var252 = Character_4:FindFirstChildWhichIsA("Tool")
				end
				if not var252 then
					ClientSignals_upvr.Notification:Fire({
						Message = "Hold the item you want to gift!";
						IsWarning = true;
					})
				else
					local Name = var252.Name
					if Name == "Hammer" then
						ClientSignals_upvr.Notification:Fire({
							Message = "Hold the item you want to gift!";
							IsWarning = true;
						})
						return
					end
					ClientSignals_upvr.GiftPlayerItem:Fire(UserId_upvr, Name)
				end
			end)
		end
	end
	for _, v_5_upvr in pairs(Players_upvr:GetPlayers()) do
		if v_5_upvr ~= var6_upvw then
			AddGiftingProximity_upvr(v_5_upvr)
			tbl_9_upvr[v_5_upvr] = v_5_upvr.CharacterAdded:Connect(function() -- Line 927
				--[[ Upvalues[2]:
					[1]: AddGiftingProximity_upvr (readonly)
					[2]: v_5_upvr (readonly)
				]]
				AddGiftingProximity_upvr(v_5_upvr)
			end)
		end
	end
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 932
		--[[ Upvalues[3]:
			[1]: var6_upvw (copied, read and write)
			[2]: tbl_9_upvr (readonly)
			[3]: AddGiftingProximity_upvr (readonly)
		]]
		if arg1 == var6_upvw then
		elseif not tbl_9_upvr[arg1] then
			tbl_9_upvr[arg1] = arg1.CharacterAdded:Connect(function() -- Line 936
				--[[ Upvalues[2]:
					[1]: AddGiftingProximity_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				AddGiftingProximity_upvr(arg1)
			end)
		end
	end)
	Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 942
		--[[ Upvalues[2]:
			[1]: var6_upvw (copied, read and write)
			[2]: tbl_9_upvr (readonly)
		]]
		if arg1 == var6_upvw then
		elseif tbl_9_upvr[arg1] then
			tbl_9_upvr[arg1]:Disconnect()
			tbl_9_upvr[arg1] = nil
		end
	end)
end
local VFX_upvr = require(ReplicatedStorage_upvr.Utilities.VFX)
local Spawners_upvr = require(script.Spawners)
local EquipablePets_upvr = require(script.EquipablePets)
local Pets_upvr = require(script.Pets)
local RainbowInstances_upvr = require(ReplicatedStorage_upvr.Utilities.RainbowInstances)
return function(arg1, arg2, arg3) -- Line 952
	--[[ Upvalues[11]:
		[1]: var4_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: SetupTouchZones_upvr (readonly)
		[5]: SetupGifting_upvr (readonly)
		[6]: Events_upvr (readonly)
		[7]: VFX_upvr (readonly)
		[8]: Spawners_upvr (readonly)
		[9]: EquipablePets_upvr (readonly)
		[10]: Pets_upvr (readonly)
		[11]: RainbowInstances_upvr (readonly)
	]]
	var4_upvw = arg1
	var5_upvw = arg2
	var6_upvw = arg3
	SetupTouchZones_upvr()
	SetupGifting_upvr()
	Events_upvr.ClientVFX.OnClientEvent:Connect(VFX_upvr)
	Spawners_upvr(arg1, arg2, arg3)
	EquipablePets_upvr(arg1, arg2, arg3)
	Pets_upvr.Load()
	RainbowInstances_upvr()
end