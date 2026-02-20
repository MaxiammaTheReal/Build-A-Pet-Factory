-- Name: Dropdown
-- Path: game:GetService("ReplicatedStorage").Utilities.TopBar.Elements.Dropdown
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5535176000012143 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:54
-- Luau version 6, Types version 3
-- Time taken: 0.008504 seconds

return function(arg1) -- Line 1
	local Frame_upvr = Instance.new("Frame")
	Frame_upvr.Name = "Dropdown"
	Frame_upvr.AutomaticSize = Enum.AutomaticSize.XY
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.BorderSizePixel = 0
	Frame_upvr.AnchorPoint = Vector2.new(0.5, 0)
	Frame_upvr.Position = UDim2.new(0.5, 0, 1, 10)
	Frame_upvr.ZIndex = -2
	Frame_upvr.ClipsDescendants = true
	Frame_upvr.Parent = arg1.widget
	local UICorner = Instance.new("UICorner")
	UICorner.Name = "DropdownCorner"
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Frame_upvr
	local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
	ScrollingFrame_upvr.Name = "DropdownScroller"
	ScrollingFrame_upvr.AutomaticSize = Enum.AutomaticSize.X
	ScrollingFrame_upvr.BackgroundTransparency = 1
	ScrollingFrame_upvr.BorderSizePixel = 0
	ScrollingFrame_upvr.AnchorPoint = Vector2.new(0, 0)
	ScrollingFrame_upvr.Position = UDim2.new(0, 0, 0, 0)
	ScrollingFrame_upvr.ZIndex = -1
	ScrollingFrame_upvr.ClipsDescendants = true
	ScrollingFrame_upvr.Visible = true
	ScrollingFrame_upvr.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	ScrollingFrame_upvr.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	ScrollingFrame_upvr.Active = false
	ScrollingFrame_upvr.ScrollingEnabled = true
	ScrollingFrame_upvr.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollingFrame_upvr.ScrollBarThickness = 5
	ScrollingFrame_upvr.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_upvr.ScrollBarImageTransparency = 0.8
	ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame_upvr.Selectable = false
	ScrollingFrame_upvr.Active = true
	ScrollingFrame_upvr.Parent = Frame_upvr
	local UIPadding_upvr = Instance.new("UIPadding")
	UIPadding_upvr.Name = "DropdownPadding"
	UIPadding_upvr.PaddingTop = UDim.new(0, 8)
	UIPadding_upvr.PaddingBottom = UDim.new(0, 8)
	UIPadding_upvr.Parent = ScrollingFrame_upvr
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Name = "DropdownList"
	UIListLayout.FillDirection = Enum.FillDirection.Vertical
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	UIListLayout.Parent = ScrollingFrame_upvr
	local dropdownJanitor = arg1.dropdownJanitor
	local iconModule_upvr = require(arg1.iconModule)
	arg1.dropdownChildAdded:Connect(function(arg1_2) -- Line 58
		local _, any_modifyTheme_result2_upvr = arg1_2:modifyTheme({{"Widget", "BorderSize", 0}, {"IconCorners", "CornerRadius", UDim.new(0, 4)}, {"Widget", "MinimumWidth", 190}, {"Widget", "MinimumHeight", 56}, {"IconLabel", "TextSize", 19}, {"PaddingLeft", "Size", UDim2.fromOffset(25, 0)}, {"Notice", "Position", UDim2.new(1, -24, 0, 5)}, {"ContentsList", "HorizontalAlignment", Enum.HorizontalAlignment.Left}, {"Selection", "Size", UDim2.new(1, -8, 1, -8)}, {"Selection", "Position", UDim2.new(0, 4, 0, 4)}})
		task.defer(function() -- Line 72
			--[[ Upvalues[2]:
				[1]: arg1_2 (readonly)
				[2]: any_modifyTheme_result2_upvr (readonly)
			]]
			arg1_2.joinJanitor:add(function() -- Line 73
				--[[ Upvalues[2]:
					[1]: arg1_2 (copied, readonly)
					[2]: any_modifyTheme_result2_upvr (copied, readonly)
				]]
				arg1_2:removeModification(any_modifyTheme_result2_upvr)
			end)
		end)
	end)
	arg1.dropdownSet:Connect(function(arg1_3) -- Line 78
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: iconModule_upvr (readonly)
		]]
		for _, v in pairs(arg1.dropdownIcons) do
			iconModule_upvr.getIconByUID(v):destroy()
		end
		if type(arg1_3) == "table" then
			for _, v_2 in pairs(arg1_3) do
				v_2:joinDropdown(arg1)
			end
		end
	end)
	local Utility_upvr = require(script.Parent.Parent.Utility)
	dropdownJanitor:add(arg1.toggled:Connect(function() -- Line 95, Named "updateVisibility"
		--[[ Upvalues[3]:
			[1]: Utility_upvr (readonly)
			[2]: Frame_upvr (readonly)
			[3]: arg1 (readonly)
		]]
		Utility_upvr.setVisible(Frame_upvr, arg1.isSelected, "InternalDropdown")
	end))
	Utility_upvr.setVisible(Frame_upvr, arg1.isSelected, "InternalDropdown")
	local var37_upvw = 0
	local var38_upvw = false
	local function updateMaxIcons_upvr() -- Line 107, Named "updateMaxIcons"
		--[[ Upvalues[8]:
			[1]: var37_upvw (read and write)
			[2]: var38_upvw (read and write)
			[3]: updateMaxIcons_upvr (readonly)
			[4]: Frame_upvr (readonly)
			[5]: ScrollingFrame_upvr (readonly)
			[6]: iconModule_upvr (readonly)
			[7]: arg1 (readonly)
			[8]: UIPadding_upvr (readonly)
		]]
		var37_upvw += 1
		local var45
		if var38_upvw then
		else
			var38_upvw = true
			task.defer(function() -- Line 116
				--[[ Upvalues[4]:
					[1]: var38_upvw (copied, read and write)
					[2]: var37_upvw (copied, read and write)
					[3]: var37_upvw (readonly)
					[4]: updateMaxIcons_upvr (copied, readonly)
				]]
				var38_upvw = false
				if var37_upvw ~= var37_upvw then
					updateMaxIcons_upvr()
				end
			end)
			var45 = "MaxIcons"
			local attribute = Frame_upvr:GetAttribute(var45)
			if not attribute then return end
			local tbl = {}
			var45 = pairs(ScrollingFrame_upvr:GetChildren())
			local pairs_result1, pairs_result2_2, pairs_result3 = pairs(ScrollingFrame_upvr:GetChildren())
			for _, v_3 in pairs_result1, pairs_result2_2, pairs_result3 do
				if v_3:IsA("GuiObject") then
					table.insert(tbl, {v_3, v_3.AbsolutePosition.Y})
				end
			end
			pairs_result1 = table.sort
			pairs_result1(tbl, function(arg1_4, arg2) -- Line 133
				local var54
				if arg1_4[2] >= arg2[2] then
					var54 = false
				else
					var54 = true
				end
				return var54
			end)
			pairs_result1 = 0
			for i_4 = 1, attribute do
				local var55 = tbl[i_4]
				local var56
				if not var55 then break end
				local _1 = var55[1]
				pairs_result1 += _1.AbsoluteSize.Y
				local WidgetUID = _1:GetAttribute("WidgetUID")
				var56 = WidgetUID
				if var56 then
					var56 = iconModule_upvr.getIconByUID(WidgetUID)
				end
				if var56 then
					local var59
					if not false then
						var59 = arg1:getInstance("ClickRegion")
					end
					var56:getInstance("ClickRegion").NextSelectionUp = var59
				end
			end
			pairs_result1 += UIPadding_upvr.PaddingTop.Offset
			pairs_result1 += UIPadding_upvr.PaddingBottom.Offset
			ScrollingFrame_upvr.Size = UDim2.fromOffset(0, pairs_result1)
		end
	end
	dropdownJanitor:add(ScrollingFrame_upvr:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateMaxIcons_upvr))
	dropdownJanitor:add(ScrollingFrame_upvr.ChildAdded:Connect(updateMaxIcons_upvr))
	dropdownJanitor:add(ScrollingFrame_upvr.ChildRemoved:Connect(updateMaxIcons_upvr))
	dropdownJanitor:add(Frame_upvr:GetAttributeChangedSignal("MaxIcons"):Connect(updateMaxIcons_upvr))
	dropdownJanitor:add(arg1.childThemeModified:Connect(updateMaxIcons_upvr))
	updateMaxIcons_upvr()
	return Frame_upvr
end