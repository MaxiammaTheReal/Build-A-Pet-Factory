-- Name: RNGSparkles
-- Path: game:GetService("ReplicatedStorage").Utilities.RNGSparkles
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5639664999998786 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:38:07
-- Luau version 6, Types version 3
-- Time taken: 0.002291 seconds

local module = {}
local clone_upvr_2 = script.Sparkle:Clone()
local random_state_upvr = Random.new()
local TweenService_upvr = game:GetService("TweenService")
local udim2_upvr = UDim2.new(0.2, 0, 0.2, 0)
local function CreateRNGSparkle_upvr(arg1) -- Line 11, Named "CreateRNGSparkle"
	--[[ Upvalues[4]:
		[1]: clone_upvr_2 (readonly)
		[2]: random_state_upvr (readonly)
		[3]: TweenService_upvr (readonly)
		[4]: udim2_upvr (readonly)
	]]
	if not arg1.Parent then
	else
		local clone_upvr = clone_upvr_2:Clone()
		clone_upvr.Position = UDim2.new(random_state_upvr:NextNumber(0.1, 0.9), 0, random_state_upvr:NextNumber(0.1, 0.9), 0)
		TweenService_upvr:Create(clone_upvr, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Size = udim2_upvr;
			Rotation = math.random(-90, 90);
			ImageTransparency = 0;
		}):Play()
		clone_upvr.Parent = arg1
		task.delay(0.9, function() -- Line 26
			--[[ Upvalues[2]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: clone_upvr (readonly)
			]]
			TweenService_upvr:Create(clone_upvr, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				ImageTransparency = 1;
				Size = UDim2.new(0, 0, 0, 0);
			}):Play()
			task.wait(0.5)
			clone_upvr:Destroy()
		end)
	end
end
function module.Start(arg1, arg2) -- Line 38
	--[[ Upvalues[1]:
		[1]: CreateRNGSparkle_upvr (readonly)
	]]
	if not arg1 or not arg2 then
	else
		task.spawn(function() -- Line 43
			--[[ Upvalues[3]:
				[1]: arg2 (readonly)
				[2]: CreateRNGSparkle_upvr (copied, readonly)
				[3]: arg1 (readonly)
			]]
			while true do
				task.wait(1 / arg2)
				CreateRNGSparkle_upvr(arg1)
			end
		end)
	end
end
return module