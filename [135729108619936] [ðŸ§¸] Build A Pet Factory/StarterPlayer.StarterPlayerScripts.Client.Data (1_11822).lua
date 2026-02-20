-- Name: Data
-- Path: game:GetService("StarterPlayer").StarterPlayerScripts.Client.Data
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.2636101000007329 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:26
-- Luau version 6, Types version 3
-- Time taken: 0.002109 seconds

local module = {
	Replica = nil;
	GetReplica = function(arg1, arg2) -- Line 11, Named "GetReplica"
		if not arg1.Replica then
			local os_clock_result1 = os.clock()
			repeat
				task.wait()
			until arg1.Replica and 15 <= os.clock() - os_clock_result1
			if not arg1.Replica then
				warn("[Data] Failed to retrieve replica within timeout.")
				arg2:Kick("Couldn't get player data. Try to rejoin.")
			else
				print("[Data] Retrieved replica in "..(os.clock() - os_clock_result1).." seconds.")
			end
		end
		return arg1.Replica
	end;
}
local ReplicaClient_upvr = require(game:GetService("ReplicatedStorage").Packages.ReplicaClient)
function module.Initialize(arg1, arg2) -- Line 33
	--[[ Upvalues[1]:
		[1]: ReplicaClient_upvr (readonly)
	]]
	ReplicaClient_upvr.OnNew("PlayerReplicas", function(arg1_2) -- Line 34
		--[[ Upvalues[2]:
			[1]: arg2 (readonly)
			[2]: arg1 (readonly)
		]]
		if arg2.UserId == arg1_2.Tags.UserId then
			arg1.Replica = arg1_2
		end
	end)
	ReplicaClient_upvr.RequestData()
	return arg1:GetReplica(arg2)
end
return module