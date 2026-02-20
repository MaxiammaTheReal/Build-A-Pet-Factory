-- Name: Tutorial
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Tutorial
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.7674124999994092 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:37
-- Luau version 6, Types version 3
-- Time taken: 0.030280 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local var3_upvw
local var4_upvw
local var5_upvw
local tbl_upvr_3 = {
	Spawner = "Pet Spawner";
	Upgrader = "Lightning Upgrader";
}
local var7_upvw = false
local VisualCursorFrame_upvr = script.VisualCursorFrame
local RedArrow_upvr = script.RedArrow
local Beam_upvr = script.Beam
local tbl_upvr = {
	Attachment0 = Beam_upvr.Attachment0;
	Attachment1 = Beam_upvr.Attachment1;
}
Beam_upvr.Parent = workspace:WaitForChild("Temporary")
TweenService_upvr:Create(RedArrow_upvr, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {
	Position = UDim2.new(0.5, 0, -0.5, 0);
}):Play()
local function _(arg1) -- Line 50, Named "CreateBeamArrow"
	--[[ Upvalues[3]:
		[1]: var5_upvw (read and write)
		[2]: tbl_upvr (readonly)
		[3]: var7_upvw (read and write)
	]]
	if not arg1 then
	else
		local Character_6 = var5_upvw.Character
		if not Character_6 then
			Character_6 = var5_upvw.CharacterAdded:Wait()
		end
		if not Character_6 then return end
		local HumanoidRootPart_9 = Character_6:WaitForChild("HumanoidRootPart")
		if not HumanoidRootPart_9 then return end
		tbl_upvr.Attachment1.Parent = HumanoidRootPart_9
		tbl_upvr.Attachment0.Parent = arg1
		var7_upvw = arg1
	end
end
local function _() -- Line 65, Named "DeleteBeamArrow"
	--[[ Upvalues[3]:
		[1]: var7_upvw (read and write)
		[2]: tbl_upvr (readonly)
		[3]: Beam_upvr (readonly)
	]]
	if not var7_upvw then
	else
		for _, v in pairs(tbl_upvr) do
			v.Parent = Beam_upvr
		end
		var7_upvw = false
	end
end
local PlacementUtil_upvr = require(ReplicatedStorage.Utilities.PlacementUtil)
local Assets_upvr = ReplicatedStorage.Assets
local any_Create_result1_upvw = TweenService_upvr:Create(VisualCursorFrame_upvr:WaitForChild("Cursor"), TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, -1, true, 0.1), {
	Size = UDim2.new(0.25, 0, 0.25, 0);
})
local Device_upvr = require(ReplicatedStorage.Utilities.Device)
local ClientSignals_upvr = require(ReplicatedStorage.Utilities.ClientSignals)
local TutorialConfig_upvr = require(ReplicatedStorage.Configs.TutorialConfig)
local ClientData_upvr = require(ReplicatedStorage.Utilities.ClientData)
local function SetupTutorial_upvr() -- Line 75, Named "SetupTutorial"
	--[[ Upvalues[17]:
		[1]: PlacementUtil_upvr (readonly)
		[2]: var5_upvw (read and write)
		[3]: tbl_upvr_3 (readonly)
		[4]: Assets_upvr (readonly)
		[5]: TweenService_upvr (readonly)
		[6]: VisualCursorFrame_upvr (readonly)
		[7]: any_Create_result1_upvw (read and write)
		[8]: Device_upvr (readonly)
		[9]: var3_upvw (read and write)
		[10]: ClientSignals_upvr (readonly)
		[11]: var4_upvw (read and write)
		[12]: RedArrow_upvr (readonly)
		[13]: tbl_upvr (readonly)
		[14]: var7_upvw (read and write)
		[15]: TutorialConfig_upvr (readonly)
		[16]: Beam_upvr (readonly)
		[17]: ClientData_upvr (readonly)
	]]
	local any_GetPlotFolder_result1_upvr = PlacementUtil_upvr.GetPlotFolder(var5_upvw)
	if not any_GetPlotFolder_result1_upvr then
	else
		local tbl_upvw = {}
		local function PlaceTransparentPlacement_upvr(arg1) -- Line 81, Named "PlaceTransparentPlacement"
			--[[ Upvalues[4]:
				[1]: tbl_upvr_3 (copied, readonly)
				[2]: Assets_upvr (copied, readonly)
				[3]: any_GetPlotFolder_result1_upvr (readonly)
				[4]: TweenService_upvr (copied, readonly)
			]]
			local var34 = tbl_upvr_3[arg1]
			if not var34 then
			else
				local SOME_3 = Assets_upvr.Placements:FindFirstChild(var34)
				if not SOME_3 then return end
				local SOME_2 = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:FindFirstChild(arg1)
				if not SOME_2 then return end
				local clone_2 = SOME_3:Clone()
				local ArrowAttachments = clone_2:FindFirstChild("ArrowAttachments")
				if ArrowAttachments then
					ArrowAttachments:Destroy()
				end
				local TargetAttachment = clone_2:FindFirstChild("TargetAttachment")
				if TargetAttachment then
					TargetAttachment:Destroy()
				end
				for _, v_8 in pairs(clone_2:GetDescendants()) do
					local children = v_8:IsA("Part")
					if children or v_8:IsA("Decal") then
						if children then
							v_8.CanCollide = false
							v_8.CanQuery = false
							v_8.CanTouch = false
						end
						v_8.Transparency = 0.7
					end
					if v_8:IsA("ParticleEmitter") then
						v_8:Destroy()
					end
				end
				local clone = script.Cursor:Clone()
				local HitBox = clone_2:FindFirstChild("HitBox")
				if HitBox then
					local SelectionBox = HitBox:FindFirstChild("SelectionBox")
					if SelectionBox then
						HitBox.Transparency = 1
						SelectionBox.Transparency = 0.9
					else
						HitBox:Destroy()
					end
				end
				local var47 = SOME_2.CFrame + Vector3.new(0, 2, 0)
				clone_2:PivotTo(var47)
				clone.Adornee = SOME_2
				clone.Parent = clone_2
				local clone_upvr = script.Arrow:Clone()
				local CFrameValue_upvr = Instance.new("CFrameValue")
				local var50 = var47 + Vector3.new(0, 4.5, 0)
				CFrameValue_upvr.Value = var50
				clone_upvr:PivotTo(var50)
				local var52_upvw = 0
				CFrameValue_upvr:GetPropertyChangedSignal("Value"):Connect(function() -- Line 149
					--[[ Upvalues[3]:
						[1]: var52_upvw (read and write)
						[2]: clone_upvr (readonly)
						[3]: CFrameValue_upvr (readonly)
					]]
					var52_upvw += 0.5
					clone_upvr:PivotTo(CFrameValue_upvr.Value * CFrame.Angles(0, math.rad(var52_upvw % 360), 0))
				end)
				TweenService_upvr:Create(CFrameValue_upvr, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true), {
					Value = var50 + Vector3.new(0, 1, 0);
				}):Play()
				CFrameValue_upvr.Parent = clone_upvr
				clone_upvr.Parent = clone_2
				clone_2.Parent = SOME_2
			end
		end
		local function _(arg1) -- Line 166, Named "DeleteTransparentPlacement"
			--[[ Upvalues[1]:
				[1]: any_GetPlotFolder_result1_upvr (readonly)
			]]
			local SOME = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:WaitForChild(arg1)
			if not SOME then
			else
				local class_Model_2 = SOME:FindFirstChildWhichIsA("Model")
				if not class_Model_2 then return end
				class_Model_2:Destroy()
			end
		end
		local function _() -- Line 176, Named "RemoveVisualCursorFrame"
			--[[ Upvalues[2]:
				[1]: VisualCursorFrame_upvr (copied, readonly)
				[2]: any_Create_result1_upvw (copied, read and write)
			]]
			VisualCursorFrame_upvr.Parent = script
			any_Create_result1_upvw:Pause()
		end
		local function DisplayVisualCursorFrame_upvr(arg1) -- Line 182, Named "DisplayVisualCursorFrame"
			--[[ Upvalues[2]:
				[1]: VisualCursorFrame_upvr (copied, readonly)
				[2]: any_Create_result1_upvw (copied, read and write)
			]]
			local X = arg1.Size.X
			local Y = arg1.Size.Y
			local var58 = arg1:FindFirstChild("Main") or arg1
			local var59 = VisualCursorFrame_upvr
			if X ~= Y then
				var59 = true
			else
				var59 = false
			end
			var59.Cursor.Visible = var59
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var59 = var58.Size
				return var59
			end
			if X == Y or not INLINED() then
				var59 = UDim2.new(var58.Size.X.Scale + 0.1, 0, var58.Size.Y.Scale + 0.1, 0)
			end
			VisualCursorFrame_upvr.Size = var59
			VisualCursorFrame_upvr.Parent = var58
			any_Create_result1_upvw:Play()
		end
		local function _(arg1) -- Line 196, Named "TogglePlaceArrow"
			--[[ Upvalues[2]:
				[1]: Device_upvr (copied, readonly)
				[2]: var3_upvw (copied, read and write)
			]]
			if Device_upvr.CurrentDevice == "Mobile" then
				var3_upvw.MobilePlacementButtons.Place.Main.RedArrow.Visible = arg1
			end
		end
		table.insert(tbl_upvw, ClientSignals_upvr.PlaceMode:Connect(function(arg1) -- Line 202
			--[[ Upvalues[5]:
				[1]: var4_upvw (copied, read and write)
				[2]: tbl_upvr_3 (copied, readonly)
				[3]: RedArrow_upvr (copied, readonly)
				[4]: Device_upvr (copied, readonly)
				[5]: var3_upvw (copied, read and write)
			]]
			local TutorialStep_5 = var4_upvw.Data.TutorialStep
			if TutorialStep_5 == 2 and arg1 == tbl_upvr_3.Spawner or TutorialStep_5 == 7 and arg1 == tbl_upvr_3.Upgrader then
				RedArrow_upvr.Visible = false
			else
				RedArrow_upvr.Visible = true
			end
			if Device_upvr.CurrentDevice == "Mobile" then
				var3_upvw.MobilePlacementButtons.Place.Main.RedArrow.Visible = not RedArrow_upvr.Visible
			end
		end))
		table.insert(tbl_upvw, ClientSignals_upvr.StopAnyMode:Connect(function() -- Line 213
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: RedArrow_upvr (copied, readonly)
				[3]: Device_upvr (copied, readonly)
				[4]: var3_upvw (copied, read and write)
			]]
			local TutorialStep_4 = var4_upvw.Data.TutorialStep
			if TutorialStep_4 == 2 or TutorialStep_4 == 7 then
				RedArrow_upvr.Visible = true
			else
				RedArrow_upvr.Visible = false
			end
			if Device_upvr.CurrentDevice == "Mobile" then
				var3_upvw.MobilePlacementButtons.Place.Main.RedArrow.Visible = not RedArrow_upvr.Visible
			end
		end))
		table.insert(tbl_upvw, ClientSignals_upvr.PickupMode:Connect(function() -- Line 224
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: RedArrow_upvr (copied, readonly)
				[3]: Device_upvr (copied, readonly)
				[4]: var3_upvw (copied, read and write)
			]]
			local TutorialStep_2 = var4_upvw.Data.TutorialStep
			if TutorialStep_2 == 2 or TutorialStep_2 == 7 then
				RedArrow_upvr.Visible = true
			else
				RedArrow_upvr.Visible = false
			end
			if Device_upvr.CurrentDevice == "Mobile" then
				var3_upvw.MobilePlacementButtons.Place.Main.RedArrow.Visible = not RedArrow_upvr.Visible
			end
		end))
		local tbl_upvr_2 = {function() -- Line 236
			--[[ Upvalues[7]:
				[1]: any_GetPlotFolder_result1_upvr (readonly)
				[2]: var5_upvw (copied, read and write)
				[3]: tbl_upvr (copied, readonly)
				[4]: var7_upvw (copied, read and write)
				[5]: DisplayVisualCursorFrame_upvr (readonly)
				[6]: var3_upvw (copied, read and write)
				[7]: tbl_upvr_3 (copied, readonly)
			]]
			local BuildingShop_2 = any_GetPlotFolder_result1_upvr.Interactables:WaitForChild("BuildingShop")
			local var69
			if not BuildingShop_2 then
			else
				var69 = var5_upvw.Character
				if not var69 then
					var69 = var5_upvw.CharacterAdded:Wait()
				end
				if not var69 then
				else
					local HumanoidRootPart_2 = var69:WaitForChild("HumanoidRootPart")
					if not HumanoidRootPart_2 then
					else
						tbl_upvr.Attachment1.Parent = HumanoidRootPart_2
						tbl_upvr.Attachment0.Parent = BuildingShop_2
						var7_upvw = BuildingShop_2
					end
				end
			end
			DisplayVisualCursorFrame_upvr(var3_upvw.Menus.Buildings.MainList:WaitForChild(tbl_upvr_3.Spawner))
		end, function() -- Line 241
			--[[ Upvalues[7]:
				[1]: PlaceTransparentPlacement_upvr (readonly)
				[2]: var3_upvw (copied, read and write)
				[3]: RedArrow_upvr (copied, readonly)
				[4]: any_GetPlotFolder_result1_upvr (readonly)
				[5]: var5_upvw (copied, read and write)
				[6]: tbl_upvr (copied, readonly)
				[7]: var7_upvw (copied, read and write)
			]]
			PlaceTransparentPlacement_upvr("Spawner")
			task.delay(0.5, function() -- Line 245
				--[[ Upvalues[2]:
					[1]: var3_upvw (copied, read and write)
					[2]: RedArrow_upvr (copied, readonly)
				]]
				for _, v_2 in pairs(var3_upvw.Inventory.Hotkeys:GetChildren()) do
					if v_2:IsA("Frame") and v_2:GetAttribute("ItemName") == "Pet Spawner" then
						RedArrow_upvr.Parent = v_2
						RedArrow_upvr.Visible = true
					end
				end
			end)
			local Spawner_2 = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:WaitForChild("Spawner")
			if not Spawner_2 then
			else
				local Character_4 = var5_upvw.Character
				if not Character_4 then
					Character_4 = var5_upvw.CharacterAdded:Wait()
				end
				if not Character_4 then return end
				local HumanoidRootPart_8 = Character_4:WaitForChild("HumanoidRootPart")
				if not HumanoidRootPart_8 then return end
				tbl_upvr.Attachment1.Parent = HumanoidRootPart_8
				tbl_upvr.Attachment0.Parent = Spawner_2
				var7_upvw = Spawner_2
			end
		end, function() -- Line 260
			--[[ Upvalues[2]:
				[1]: RedArrow_upvr (copied, readonly)
				[2]: any_GetPlotFolder_result1_upvr (readonly)
			]]
			RedArrow_upvr.Parent = script
			local Spawner = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:WaitForChild("Spawner")
			if not Spawner then
			else
				local class_Model_3 = Spawner:FindFirstChildWhichIsA("Model")
				if not class_Model_3 then return end
				class_Model_3:Destroy()
			end
		end, function() -- Line 265
			--[[ Upvalues[4]:
				[1]: any_GetPlotFolder_result1_upvr (readonly)
				[2]: var5_upvw (copied, read and write)
				[3]: tbl_upvr (copied, readonly)
				[4]: var7_upvw (copied, read and write)
			]]
			local Collector = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:WaitForChild("Collector")
			if not Collector then
			else
				local Character_2 = var5_upvw.Character
				if not Character_2 then
					Character_2 = var5_upvw.CharacterAdded:Wait()
				end
				if not Character_2 then return end
				local HumanoidRootPart_4 = Character_2:WaitForChild("HumanoidRootPart")
				if not HumanoidRootPart_4 then return end
				tbl_upvr.Attachment1.Parent = HumanoidRootPart_4
				tbl_upvr.Attachment0.Parent = Collector
				var7_upvw = Collector
			end
		end, function() -- Line 268
			--[[ Upvalues[4]:
				[1]: any_GetPlotFolder_result1_upvr (readonly)
				[2]: var5_upvw (copied, read and write)
				[3]: tbl_upvr (copied, readonly)
				[4]: var7_upvw (copied, read and write)
			]]
			local SellButton = any_GetPlotFolder_result1_upvr.Interactables:WaitForChild("SellButton")
			if not SellButton then
			else
				local Character = var5_upvw.Character
				if not Character then
					Character = var5_upvw.CharacterAdded:Wait()
				end
				if not Character then return end
				local HumanoidRootPart_6 = Character:WaitForChild("HumanoidRootPart")
				if not HumanoidRootPart_6 then return end
				tbl_upvr.Attachment1.Parent = HumanoidRootPart_6
				tbl_upvr.Attachment0.Parent = SellButton
				var7_upvw = SellButton
			end
		end, function() -- Line 271
			--[[ Upvalues[7]:
				[1]: any_GetPlotFolder_result1_upvr (readonly)
				[2]: var5_upvw (copied, read and write)
				[3]: tbl_upvr (copied, readonly)
				[4]: var7_upvw (copied, read and write)
				[5]: DisplayVisualCursorFrame_upvr (readonly)
				[6]: var3_upvw (copied, read and write)
				[7]: tbl_upvr_3 (copied, readonly)
			]]
			local BuildingShop = any_GetPlotFolder_result1_upvr.Interactables:WaitForChild("BuildingShop")
			local var94
			if not BuildingShop then
			else
				var94 = var5_upvw.Character
				if not var94 then
					var94 = var5_upvw.CharacterAdded:Wait()
				end
				if not var94 then
				else
					local HumanoidRootPart_3 = var94:WaitForChild("HumanoidRootPart")
					if not HumanoidRootPart_3 then
					else
						tbl_upvr.Attachment1.Parent = HumanoidRootPart_3
						tbl_upvr.Attachment0.Parent = BuildingShop
						var7_upvw = BuildingShop
					end
				end
			end
			DisplayVisualCursorFrame_upvr(var3_upvw.Menus.Buildings.MainList:WaitForChild(tbl_upvr_3.Upgrader))
		end, function() -- Line 276
			--[[ Upvalues[7]:
				[1]: PlaceTransparentPlacement_upvr (readonly)
				[2]: var3_upvw (copied, read and write)
				[3]: RedArrow_upvr (copied, readonly)
				[4]: any_GetPlotFolder_result1_upvr (readonly)
				[5]: var5_upvw (copied, read and write)
				[6]: tbl_upvr (copied, readonly)
				[7]: var7_upvw (copied, read and write)
			]]
			PlaceTransparentPlacement_upvr("Upgrader")
			task.delay(0.5, function() -- Line 280
				--[[ Upvalues[2]:
					[1]: var3_upvw (copied, read and write)
					[2]: RedArrow_upvr (copied, readonly)
				]]
				for _, v_3 in pairs(var3_upvw.Inventory.Hotkeys:GetChildren()) do
					if v_3:IsA("Frame") and v_3:GetAttribute("ItemName") == "Lightning Upgrader" then
						RedArrow_upvr.Parent = v_3
						RedArrow_upvr.Visible = true
					end
				end
			end)
			local Upgrader = any_GetPlotFolder_result1_upvr.Interactables.TutorialPlacements:WaitForChild("Upgrader")
			if not Upgrader then
			else
				local Character_5 = var5_upvw.Character
				if not Character_5 then
					Character_5 = var5_upvw.CharacterAdded:Wait()
				end
				if not Character_5 then return end
				local HumanoidRootPart = Character_5:WaitForChild("HumanoidRootPart")
				if not HumanoidRootPart then return end
				tbl_upvr.Attachment1.Parent = HumanoidRootPart
				tbl_upvr.Attachment0.Parent = Upgrader
				var7_upvw = Upgrader
			end
		end}
		table.insert(tbl_upvw, ClientSignals_upvr.CurrentBuyingFrame:Connect(function(arg1, arg2, arg3) -- Line 297
			--[[ Upvalues[4]:
				[1]: var4_upvw (copied, read and write)
				[2]: tbl_upvr_3 (copied, readonly)
				[3]: DisplayVisualCursorFrame_upvr (readonly)
				[4]: var3_upvw (copied, read and write)
			]]
			local TutorialStep_3 = var4_upvw.Data.TutorialStep
			if not TutorialStep_3 then
			elseif TutorialStep_3 == 1 or TutorialStep_3 == 6 then
				if arg1 then
					if TutorialStep_3 == 1 and arg3 == tbl_upvr_3.Spawner or TutorialStep_3 == 6 and arg3 == tbl_upvr_3.Upgrader then
						DisplayVisualCursorFrame_upvr(arg2.Frame.CashPurchase)
						return
					end
				end
				if TutorialStep_3 == 1 then
					DisplayVisualCursorFrame_upvr(var3_upvw.Menus.Buildings.MainList:WaitForChild(tbl_upvr_3.Spawner))
					return
				end
				if TutorialStep_3 == 6 then
					DisplayVisualCursorFrame_upvr(var3_upvw.Menus.Buildings.MainList:WaitForChild(tbl_upvr_3.Upgrader))
				end
			end
		end))
		local function _(arg1) -- Line 314, Named "UpdateTutorialDescription"
			--[[ Upvalues[8]:
				[1]: TutorialConfig_upvr (copied, readonly)
				[2]: var3_upvw (copied, read and write)
				[3]: tbl_upvr_2 (readonly)
				[4]: VisualCursorFrame_upvr (copied, readonly)
				[5]: any_Create_result1_upvw (copied, read and write)
				[6]: var7_upvw (copied, read and write)
				[7]: tbl_upvr (copied, readonly)
				[8]: Beam_upvr (copied, readonly)
			]]
			local var110 = TutorialConfig_upvr[arg1]
			if not var110 then
			else
				var3_upvw.Notifications.TutorialDescription.Text = var110
				var3_upvw.Notifications.TutorialDescription.Visible = true
				local var111 = tbl_upvr_2[arg1]
				if var111 then
					VisualCursorFrame_upvr.Parent = script
					any_Create_result1_upvw:Pause()
					if not var7_upvw then
					else
						for _, v_9 in pairs(tbl_upvr) do
							v_9.Parent = Beam_upvr
						end
						var7_upvw = false
					end
					var111()
				end
			end
		end
		local TutorialStep = var4_upvw.Data.TutorialStep
		local var116 = TutorialConfig_upvr[TutorialStep]
		if not var116 then
		else
			var3_upvw.Notifications.TutorialDescription.Text = var116
			var3_upvw.Notifications.TutorialDescription.Visible = true
			local var117 = tbl_upvr_2[TutorialStep]
			if var117 then
				VisualCursorFrame_upvr.Parent = script
				any_Create_result1_upvw:Pause()
				if not var7_upvw then
				else
					for _, v_4 in pairs(tbl_upvr) do
						v_4.Parent = Beam_upvr
					end
					var7_upvw = false
				end
				var117()
			end
		end
		table.insert(tbl_upvw, var4_upvw:OnSet({"TutorialStep"}, function(arg1, arg2) -- Line 332
			--[[ Upvalues[17]:
				[1]: var7_upvw (copied, read and write)
				[2]: tbl_upvr (copied, readonly)
				[3]: Beam_upvr (copied, readonly)
				[4]: any_GetPlotFolder_result1_upvr (readonly)
				[5]: Device_upvr (copied, readonly)
				[6]: var3_upvw (copied, read and write)
				[7]: RedArrow_upvr (copied, readonly)
				[8]: ClientSignals_upvr (copied, readonly)
				[9]: tbl_upvw (read and write)
				[10]: any_Create_result1_upvw (copied, read and write)
				[11]: VisualCursorFrame_upvr (copied, readonly)
				[12]: TweenService_upvr (copied, readonly)
				[13]: var4_upvw (copied, read and write)
				[14]: var5_upvw (copied, read and write)
				[15]: ClientData_upvr (copied, readonly)
				[16]: TutorialConfig_upvr (copied, readonly)
				[17]: tbl_upvr_2 (readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [1] 2. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [1] 2. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [28] 23. Error Block 52 start (CF ANALYSIS FAILED)
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [29.2]
			local class_Model = nil:FindFirstChildWhichIsA("Model")
			if not class_Model then
			else
				class_Model:Destroy()
			end
			if Device_upvr.CurrentDevice == "Mobile" then
				var3_upvw.MobilePlacementButtons.Place.Main.RedArrow.Visible = false
			end
			RedArrow_upvr:Destroy()
			ClientSignals_upvr.Notification:Fire({
				Message = "Keep building to unlock what’s next!";
				IsWarning = false;
			})
			for _, v_5 in pairs(tbl_upvw) do
				v_5:Disconnect()
			end
			tbl_upvw = nil
			any_Create_result1_upvw:Cancel()
			any_Create_result1_upvw = nil
			var3_upvw.Notifications.TutorialDescription.Visible = false
			VisualCursorFrame_upvr:Destroy()
			var3_upvw.LeftButtons.ButtonHolder.RebirthProgress.Visible = true
			var3_upvw.LeftButtons.ButtonHolder.Visible = true
			TweenService_upvr:Create(var3_upvw.LeftButtons.ButtonHolder.RebirthProgress, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Position = UDim2.new(0, 0, -1.55, 0);
			}):Play()
			local var135_upvw = false
			local var136_upvw
			local var137_upvw
			var137_upvw = var4_upvw:OnSet({"Cash"}, function(arg1_2, arg2_2) -- Line 368
				--[[ Upvalues[10]:
					[1]: var4_upvw (copied, read and write)
					[2]: any_GetPlotFolder_result1_upvr (copied, readonly)
					[3]: var7_upvw (copied, read and write)
					[4]: var135_upvw (read and write)
					[5]: var5_upvw (copied, read and write)
					[6]: tbl_upvr (copied, readonly)
					[7]: var3_upvw (copied, read and write)
					[8]: var136_upvw (read and write)
					[9]: Beam_upvr (copied, readonly)
					[10]: var137_upvw (read and write)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [8] 6. Error Block 2 start (CF ANALYSIS FAILED)
				local var142 = 2000
				-- KONSTANTERROR: [8] 6. Error Block 2 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [21] 15. Error Block 52 start (CF ANALYSIS FAILED)
				var135_upvw = true
				local var143
				if not var142 then
				else
					var143 = var5_upvw.Character
					if not var143 then
						var143 = var5_upvw.CharacterAdded:Wait()
					end
					if not var143 then
					else
						local HumanoidRootPart_7 = var143:WaitForChild("HumanoidRootPart")
						if not HumanoidRootPart_7 then
						else
							tbl_upvr.Attachment1.Parent = HumanoidRootPart_7
							tbl_upvr.Attachment0.Parent = var142
							var7_upvw = var142
						end
					end
				end
				var3_upvw.Notifications.TutorialDescription.Text = "You can rebirth!"
				var3_upvw.Notifications.TutorialDescription.Visible = true
				var136_upvw = var3_upvw.Menus.Rebirth:GetPropertyChangedSignal("Visible"):Connect(function() -- Line 380
					--[[ Upvalues[5]:
						[1]: var3_upvw (copied, read and write)
						[2]: var136_upvw (copied, read and write)
						[3]: var7_upvw (copied, read and write)
						[4]: tbl_upvr (copied, readonly)
						[5]: Beam_upvr (copied, readonly)
					]]
					if var3_upvw.Menus.Rebirth.Visible then
						if var136_upvw then
							var136_upvw:Disconnect()
							var136_upvw = nil
						end
						if not var7_upvw then
						else
							for _, v_6 in pairs(tbl_upvr) do
								v_6.Parent = Beam_upvr
							end
							var7_upvw = false
						end
						var3_upvw.Notifications.TutorialDescription.Visible = false
					end
				end)
				do
					return
				end
				-- KONSTANTERROR: [21] 15. Error Block 52 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [90] 66. Error Block 50 start (CF ANALYSIS FAILED)
				if var135_upvw and (1 <= var4_upvw.Data.Rebirths or arg1_2 < 2000) then
					if var136_upvw then
						var136_upvw:Disconnect()
						var136_upvw = nil
					end
					if var137_upvw then
						var137_upvw:Disconnect()
						var137_upvw = nil
					end
					if not var7_upvw then
					else
						for _, v_7 in pairs(tbl_upvr) do
							v_7.Parent = Beam_upvr
						end
						var7_upvw = false
					end
					var3_upvw.Notifications.TutorialDescription.Visible = false
				end
				-- KONSTANTERROR: [90] 66. Error Block 50 end (CF ANALYSIS FAILED)
			end)
			task.delay(270, function() -- Line 414
				--[[ Upvalues[4]:
					[1]: var4_upvw (copied, read and write)
					[2]: var3_upvw (copied, read and write)
					[3]: ClientData_upvr (copied, readonly)
					[4]: ClientSignals_upvr (copied, readonly)
				]]
				if var4_upvw.Data.TutorialStep then
				else
					if var4_upvw.Data.TimePlayed < 450 then
						if not var3_upvw.RightButtons.StarterPack.Visible then return end
						if not ClientData_upvr.CurrentMenu and not var4_upvw.Data.OwnedPacks.StarterPack then
							ClientSignals_upvr.ToggleMenu:Fire("StarterPack")
						end
					end
					task.delay(720, function() -- Line 427
						--[[ Upvalues[4]:
							[1]: var4_upvw (copied, read and write)
							[2]: var3_upvw (copied, read and write)
							[3]: ClientData_upvr (copied, readonly)
							[4]: ClientSignals_upvr (copied, readonly)
						]]
						if var4_upvw.Data.TimePlayed < 1200 then
							if not var3_upvw.RightButtons.ProPack.Visible then return end
							if not ClientData_upvr.CurrentMenu and not var4_upvw.Data.OwnedPacks.ProPack then
								ClientSignals_upvr.ToggleMenu:Fire("ProPack")
							end
						end
					end)
				end
			end)
			do
				return
			end
			-- KONSTANTERROR: [28] 23. Error Block 52 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [186] 138. Error Block 55 start (CF ANALYSIS FAILED)
			local var156 = TutorialConfig_upvr[arg1]
			if not var156 then
			else
				var3_upvw.Notifications.TutorialDescription.Text = var156
				var3_upvw.Notifications.TutorialDescription.Visible = true
				local var157 = tbl_upvr_2[arg1]
				if var157 then
					VisualCursorFrame_upvr.Parent = script
					any_Create_result1_upvw:Pause()
					if not var7_upvw then
					else
						for _, v_10 in pairs(tbl_upvr) do
							v_10.Parent = Beam_upvr
						end
						var7_upvw = false
					end
					var157()
				end
				-- KONSTANTERROR: [186] 138. Error Block 55 end (CF ANALYSIS FAILED)
			end
		end))
		ClientSignals_upvr.CharacterAdded:Connect(function(arg1) -- Line 444
			--[[ Upvalues[3]:
				[1]: var7_upvw (copied, read and write)
				[2]: var5_upvw (copied, read and write)
				[3]: tbl_upvr (copied, readonly)
			]]
			local var162 = var7_upvw
			if not var162 then
			else
				local Character_3 = var5_upvw.Character
				if not Character_3 then
					Character_3 = var5_upvw.CharacterAdded:Wait()
				end
				if not Character_3 then return end
				local HumanoidRootPart_5 = Character_3:WaitForChild("HumanoidRootPart")
				if not HumanoidRootPart_5 then return end
				tbl_upvr.Attachment1.Parent = HumanoidRootPart_5
				tbl_upvr.Attachment0.Parent = var162
				var7_upvw = var162
			end
		end)
	end
end
return function(arg1, arg2, arg3) -- Line 449
	--[[ Upvalues[4]:
		[1]: var3_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: SetupTutorial_upvr (readonly)
	]]
	var3_upvw = arg1
	var4_upvw = arg2
	var5_upvw = arg3
	SetupTutorial_upvr()
end