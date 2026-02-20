-- Name: LoadingScript
-- Path: game:GetService("Players").LocalPlayer.PlayerGui.LoadingScreen.LoadingScript
-- Class: LocalScript
-- Exploit: Xeno 
-- Time to decompile: 0.551317100000233 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:50
-- Luau version 6, Types version 3
-- Time taken: 0.004678 seconds

local TweenService_upvr = game:GetService("TweenService")
local Parent_upvr = script.Parent
local Frame = Parent_upvr:WaitForChild("Frame")
local MovingTiles = Frame:WaitForChild("MovingTiles")
local Icon = Frame:WaitForChild("Icon")
local Headline = Frame:WaitForChild("Headline")
local Camera = workspace:WaitForChild("Camera")
local Blur = game:GetService("Lighting"):WaitForChild("Blur")
local tbl_upvr = {}
local function _(arg1, arg2, arg3) -- Line 26, Named "PlayTween"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	local any_Create_result1_11 = TweenService_upvr:Create(arg1, arg2, arg3)
	table.insert(tbl_upvr, any_Create_result1_11)
	any_Create_result1_11:Play()
	return any_Create_result1_11
end
Parent_upvr.Parent = game:GetService("Players").LocalPlayer.PlayerGui
Parent_upvr.Enabled = true
local any_Create_result1_5 = TweenService_upvr:Create(MovingTiles, TweenInfo.new(20, Enum.EasingStyle.Linear), {
	Position = UDim2.new(-1, 0, -1, 0);
})
table.insert(tbl_upvr, any_Create_result1_5)
any_Create_result1_5:Play()
Icon.Rotation = -7
local any_Create_result1_7 = TweenService_upvr:Create(Icon, TweenInfo.new(1.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
	Rotation = 7;
})
table.insert(tbl_upvr, any_Create_result1_7)
any_Create_result1_7:Play()
repeat
	task.wait(0.3)
	Headline.Text = "Loading"..string.rep('.', (0 + 1 - 1) % 3 + 1)
until require(game:GetService("ReplicatedStorage"):WaitForChild("Utilities"):WaitForChild("ClientData")).LoadingComplete
local any_Create_result1_9 = TweenService_upvr:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	BackgroundTransparency = 1;
})
table.insert(tbl_upvr, any_Create_result1_9)
any_Create_result1_9:Play()
local any_Create_result1_6 = TweenService_upvr:Create(MovingTiles, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	ImageTransparency = 1;
})
table.insert(tbl_upvr, any_Create_result1_6)
any_Create_result1_6:Play()
local any_Create_result1_8 = TweenService_upvr:Create(Icon, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	ImageTransparency = 1;
})
table.insert(tbl_upvr, any_Create_result1_8)
any_Create_result1_8:Play()
local any_Create_result1_4 = TweenService_upvr:Create(Icon:WaitForChild("UIStroke"), TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	Transparency = 1;
})
table.insert(tbl_upvr, any_Create_result1_4)
any_Create_result1_4:Play()
local any_Create_result1 = TweenService_upvr:Create(Headline, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	TextTransparency = 1;
})
table.insert(tbl_upvr, any_Create_result1)
any_Create_result1:Play()
local any_Create_result1_10 = TweenService_upvr:Create(Headline:WaitForChild("UIStroke"), TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	Transparency = 1;
})
table.insert(tbl_upvr, any_Create_result1_10)
any_Create_result1_10:Play()
Blur.Size = 16
Camera.FieldOfView = 100
local any_Create_result1_2 = TweenService_upvr:Create(Blur, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	Size = 0;
})
table.insert(tbl_upvr, any_Create_result1_2)
any_Create_result1_2:Play()
local any_Create_result1_3 = TweenService_upvr:Create(Camera, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
	FieldOfView = 70;
})
table.insert(tbl_upvr, any_Create_result1_3)
any_Create_result1_3:Play()
task.delay(1.5, function() -- Line 33, Named "Cleanup"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: Parent_upvr (readonly)
	]]
	for _, v in ipairs(tbl_upvr) do
		if v.PlaybackState ~= Enum.PlaybackState.Completed then
			v:Cancel()
		end
	end
	table.clear(tbl_upvr)
	Parent_upvr.Enabled = false
end)