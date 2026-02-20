-- Name: IconPreloader
-- Path: game:GetService("ReplicatedStorage").Utilities.IconPreloader
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5539762999997038 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:41
-- Luau version 6, Types version 3
-- Time taken: 0.001682 seconds

local module = {}
local ContentProvider_upvr = game:GetService("ContentProvider")
function module.PreloadIcons(arg1) -- Line 6
	--[[ Upvalues[1]:
		[1]: ContentProvider_upvr (readonly)
	]]
	local tbl_upvr = {}
	local function flatten_upvr(arg1_2) -- Line 9, Named "flatten"
		--[[ Upvalues[2]:
			[1]: flatten_upvr (readonly)
			[2]: tbl_upvr (readonly)
		]]
		for _, v in pairs(arg1_2) do
			if type(v) == "table" then
				flatten_upvr(v)
			else
				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Image = tostring(v)
				table.insert(tbl_upvr, ImageLabel)
			end
		end
	end
	flatten_upvr(arg1)
	task.spawn(function() -- Line 23
		--[[ Upvalues[2]:
			[1]: ContentProvider_upvr (copied, readonly)
			[2]: tbl_upvr (readonly)
		]]
		ContentProvider_upvr:PreloadAsync(tbl_upvr)
		for _, v_2 in ipairs(tbl_upvr) do
			v_2:Destroy()
		end
	end)
end
return module