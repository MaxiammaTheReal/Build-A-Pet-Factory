-- Name: ConfettiPopup
-- Path: game:GetService("ReplicatedStorage").Utilities.ConfettiPopup
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5414314999998169 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:46
-- Luau version 6, Types version 3
-- Time taken: 0.003600 seconds

local tbl_upvr = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(85, 255, 0), Color3.fromRGB(0, 170, 255), Color3.fromRGB(255, 217, 24), Color3.fromRGB(170, 85, 255)}
local random_state_upvr = Random.new()
local ConfettiTemplate_upvr = script.ConfettiTemplate
local function getRandomConfetti_upvr(arg1) -- Line 32, Named "getRandomConfetti"
	--[[ Upvalues[3]:
		[1]: ConfettiTemplate_upvr (readonly)
		[2]: random_state_upvr (readonly)
		[3]: tbl_upvr (readonly)
	]]
	local clone = ConfettiTemplate_upvr:Clone()
	clone.Size = UDim2.fromScale(random_state_upvr:NextNumber(0.015, 0.025), random_state_upvr:NextNumber(0.015, 0.025))
	clone.BackgroundColor3 = tbl_upvr[math.random(#tbl_upvr)]
	clone.Position = UDim2.fromScale(math.random(), -0.2)
	clone.Rotation = math.random(-360, 360)
	clone.Parent = arg1
	return clone
end
local var5_upvw = 0
local TweenService_upvr = game:GetService("TweenService")
return function(arg1) -- Line 48, Named "pop"
	--[[ Upvalues[4]:
		[1]: var5_upvw (read and write)
		[2]: random_state_upvr (readonly)
		[3]: getRandomConfetti_upvr (readonly)
		[4]: TweenService_upvr (readonly)
	]]
	local os_clock_result1 = os.clock()
	if os_clock_result1 < var5_upvw then
	else
		var5_upvw = os_clock_result1 + 1.5
		task.spawn(function() -- Line 53
			--[[ Upvalues[4]:
				[1]: random_state_upvr (copied, readonly)
				[2]: getRandomConfetti_upvr (copied, readonly)
				[3]: arg1 (readonly)
				[4]: TweenService_upvr (copied, readonly)
			]]
			for _ = 1, 3 do
				local tbl_upvr_2 = {}
				for _ = 1, math.random(60, 90) do
					local TweenInfo_new_result1 = TweenInfo.new(random_state_upvr:NextNumber(1, 2.6))
					local getRandomConfetti_upvr_result1 = getRandomConfetti_upvr(arg1)
					table.insert(tbl_upvr_2, getRandomConfetti_upvr_result1)
					TweenService_upvr:Create(getRandomConfetti_upvr_result1, TweenInfo_new_result1, {
						Position = UDim2.fromScale(getRandomConfetti_upvr_result1.Position.X.Scale, 1.5);
						Rotation = math.random(-360, 360);
					}):Play()
					TweenService_upvr:Create(getRandomConfetti_upvr_result1, TweenInfo.new(random_state_upvr:NextNumber(0.2, 0.5), Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, true), {
						Size = UDim2.new(getRandomConfetti_upvr_result1.Size.X.Scale);
					}):Play()
					task.delay(TweenInfo_new_result1.Time + 5, function() -- Line 80
						--[[ Upvalues[1]:
							[1]: tbl_upvr_2 (readonly)
						]]
						for _, v in tbl_upvr_2 do
							v:Destroy()
						end
						table.clear(tbl_upvr_2)
					end)
					task.wait()
				end
				task.wait(0.25)
			end
		end)
	end
end