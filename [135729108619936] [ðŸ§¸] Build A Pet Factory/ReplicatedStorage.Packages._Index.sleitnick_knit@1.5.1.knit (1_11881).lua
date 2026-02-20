-- Name: knit
-- Path: game:GetService("ReplicatedStorage").Packages._Index.sleitnick_knit@1.5.1.knit
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5407352000001993 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:36
-- Luau version 6, Types version 3
-- Time taken: 0.000571 seconds

if game:GetService("RunService"):IsServer() then
	return require(script.KnitServer)
end
local KnitServer = script:FindFirstChild("KnitServer")
if KnitServer then
	KnitServer:Destroy()
end
return require(script.KnitClient)