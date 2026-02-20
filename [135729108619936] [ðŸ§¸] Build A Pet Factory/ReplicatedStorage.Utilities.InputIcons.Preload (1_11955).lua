-- Name: Preload
-- Path: game:GetService("ReplicatedStorage").Utilities.InputIcons.Preload
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5447390999997879 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:44
-- Luau version 6, Types version 3
-- Time taken: 0.002829 seconds

local tbl_upvr = {}
for _, v in pairs(require(script.Parent.Dark)) do
	for _, v_2 in pairs(v) do
		local ImageLabel_2 = Instance.new("ImageLabel")
		ImageLabel_2.Image = v_2
		table.insert(tbl_upvr, ImageLabel_2)
	end
end
for _, v_3 in pairs(require(script.Parent.Light)) do
	for _, v_4 in v_3 do
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Image = v_4
		table.insert(tbl_upvr, ImageLabel)
	end
end
game:GetService("ContentProvider"):PreloadAsync(tbl_upvr, function(arg1, arg2) -- Line 26
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	for i_5, v_5 in tbl_upvr do
		if v_5.Image == arg1 then
			v_5:Destroy()
			table.remove(tbl_upvr, i_5)
		end
	end
end)
return nil