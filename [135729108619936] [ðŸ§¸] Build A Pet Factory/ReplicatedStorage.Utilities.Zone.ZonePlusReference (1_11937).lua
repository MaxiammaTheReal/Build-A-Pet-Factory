-- Name: ZonePlusReference
-- Path: game:GetService("ReplicatedStorage").Utilities.Zone.ZonePlusReference
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5467188999991777 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:28
-- Luau version 6, Types version 3
-- Time taken: 0.001726 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
return {
	addToReplicatedStorage = function() -- Line 9, Named "addToReplicatedStorage"
		--[[ Upvalues[1]:
			[1]: ReplicatedStorage_upvr (readonly)
		]]
		if ReplicatedStorage_upvr:FindFirstChild(script.Name) then
			return false
		end
		local ObjectValue = Instance.new("ObjectValue")
		ObjectValue.Name = script.Name
		ObjectValue.Value = script.Parent
		ObjectValue.Parent = ReplicatedStorage_upvr
		local var4 = "BoolValue"
		local any = Instance.new(var4)
		if game:GetService("RunService"):IsClient() then
			var4 = "Client"
		else
			var4 = "Server"
		end
		any.Name = var4
		any.Value = true
		any.Parent = ObjectValue
		return ObjectValue
	end;
	getObject = function() -- Line 25, Named "getObject"
		--[[ Upvalues[1]:
			[1]: ReplicatedStorage_upvr (readonly)
		]]
		local SOME = ReplicatedStorage_upvr:FindFirstChild(script.Name)
		if SOME then
			return SOME
		end
		return false
	end;
}