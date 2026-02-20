-- Name: InputIcons
-- Path: game:GetService("ReplicatedStorage").Utilities.InputIcons
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5466036999987409 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:42
-- Luau version 6, Types version 3
-- Time taken: 0.000788 seconds

local Dark = require(script.Dark)
require(game:GetService("ReplicatedStorage").Utilities.IconPreloader).PreloadIcons({require(script.Dark), Dark})
return {
	Dark = Dark;
	Light = Dark;
}