-- Name: Serg_Button
-- Path: game:GetService("ReplicatedStorage").Utilities.Serg_Button
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5755559999997786 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:11
-- Luau version 6, Types version 3
-- Time taken: 0.008235 seconds

local module = {}
local TweenService_upvr = game:GetService("TweenService")
local PlaySound_upvr = require(game:GetService("ReplicatedStorage").Utilities.PlaySound)
function module.New(arg1) -- Line 35
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: PlaySound_upvr (readonly)
	]]
	local Frame = arg1.Frame
	local Background = Frame:FindFirstChild("Background")
	local Main = Frame:FindFirstChild("Main")
	if not Background or not Main then
	else
		local Button = Main:FindFirstChild("Button")
		if not Button then return end
		local WhiteBackground = Button:FindFirstChild("WhiteBackground")
		if not WhiteBackground then return end
		local var10_upvr = arg1.ScalingMultiplier or 1
		assert(arg1.Callbacks, "[Serg_Button.New] Callbacks table is required")
		assert(arg1.EnabledTweens, "[Serg_Button.New] EnabledTweens table is required")
		local Size = Background.Size
		local Position = Main.Position
		local UIScale_upvr = Instance.new("UIScale")
		UIScale_upvr.Parent = Frame
		local function _(arg1_2, arg2) -- Line 60, Named "FireCallback"
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local var14 = arg1.Callbacks[arg1_2]
			if not var14 then
			else
				var14(arg2)
			end
		end
		local var15_upvw = false
		local tbl_2_upvr = {
			MouseButton1Down = {TweenService_upvr:Create(Main, TweenInfo.new(0.04, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = Background.Position;
			}), TweenService_upvr:Create(Background, TweenInfo.new(0.04, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(1, 0, 1, 0);
				Position = UDim2.new(0.5, 0, 0.5, 0);
			}), TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.07, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Scale = 1;
			})};
			MouseButton1Up = {TweenService_upvr:Create(Main, TweenInfo.new(0.04, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = Position;
			}), TweenService_upvr:Create(Background, TweenInfo.new(0.04, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = Size;
			})};
		}
		function tbl_2_upvr.MouseButton1Click() -- Line 90
			--[[ Upvalues[4]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: UIScale_upvr (readonly)
				[3]: var15_upvw (read and write)
				[4]: var10_upvr (readonly)
			]]
			local any_Create_result1 = TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.04, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Scale = 0.92;
			})
			local var27_upvw
			var27_upvw = any_Create_result1.Completed:Connect(function() -- Line 97
				--[[ Upvalues[5]:
					[1]: var27_upvw (read and write)
					[2]: TweenService_upvr (copied, readonly)
					[3]: UIScale_upvr (copied, readonly)
					[4]: var15_upvw (copied, read and write)
					[5]: var10_upvr (copied, readonly)
				]]
				var27_upvw:Disconnect()
				local tbl = {}
				local var29
				local function INLINED() -- Internal function, doesn't exist in bytecode
					var29 = 1.05 * var10_upvr
					return var29
				end
				if not var15_upvw or not INLINED() then
					var29 = 1
				end
				tbl.Scale = var29
				TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), tbl):Play()
			end)
			any_Create_result1:Play()
		end
		tbl_2_upvr.MouseEnter = {TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Scale = 1.05 * var10_upvr;
		}), TweenService_upvr:Create(WhiteBackground, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.85;
		})}
		tbl_2_upvr.MouseLeave = {TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Scale = 1;
		}), TweenService_upvr:Create(Main, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = Position;
		}), TweenService_upvr:Create(Background, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = Size;
		}), TweenService_upvr:Create(WhiteBackground, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1;
		})}
		if arg1.EnabledTweens.Click then
			Button.MouseButton1Down:Connect(function() -- Line 133
				--[[ Upvalues[1]:
					[1]: tbl_2_upvr (readonly)
				]]
				for _, v in pairs(tbl_2_upvr.MouseButton1Down) do
					v:Play()
				end
			end)
			Button.MouseButton1Up:Connect(function() -- Line 139
				--[[ Upvalues[1]:
					[1]: tbl_2_upvr (readonly)
				]]
				for _, v_2 in pairs(tbl_2_upvr.MouseButton1Up) do
					v_2:Play()
				end
			end)
			Button.MouseButton1Click:Connect(function() -- Line 145
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: PlaySound_upvr (copied, readonly)
					[3]: tbl_2_upvr (readonly)
				]]
				local Click = arg1.Callbacks.Click
				if not Click then
				else
					Click(nil)
				end
				if arg1.EnabledTweens.Click then
					PlaySound_upvr("ButtonClick")
					tbl_2_upvr.MouseButton1Click()
				end
			end)
		end
		Button.MouseEnter:Connect(function() -- Line 156
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: var15_upvw (read and write)
				[3]: PlaySound_upvr (copied, readonly)
				[4]: tbl_2_upvr (readonly)
			]]
			local Hover_2 = arg1.Callbacks.Hover
			if not Hover_2 then
			else
				Hover_2(true)
			end
			var15_upvw = true
			if arg1.EnabledTweens.Hover then
				PlaySound_upvr("ButtonHover")
				for _, v_3 in pairs(tbl_2_upvr.MouseEnter) do
					v_3:Play()
				end
			end
		end)
		Button.MouseLeave:Connect(function() -- Line 170
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: var15_upvw (read and write)
				[3]: PlaySound_upvr (copied, readonly)
				[4]: tbl_2_upvr (readonly)
			]]
			local Hover = arg1.Callbacks.Hover
			if not Hover then
			else
				Hover(false)
			end
			var15_upvw = false
			if arg1.EnabledTweens.Hover then
				PlaySound_upvr("ButtonHover")
				for _, v_4 in pairs(tbl_2_upvr.MouseLeave) do
					v_4:Play()
				end
			end
		end)
	end
end
return module