-- Name: Device
-- Path: game:GetService("ReplicatedStorage").Utilities.Device
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5472258999998303 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:31
-- Luau version 6, Types version 3
-- Time taken: 0.003109 seconds

local UserInputService_upvr = game:GetService("UserInputService")
return {
	ChangedSignal = require(game:GetService("ReplicatedStorage").Packages.Signal).new();
	CurrentDevice = nil;
	GetDeviceFromInput = function(arg1, arg2) -- Line 13, Named "GetDeviceFromInput"
		if arg2 == Enum.UserInputType.Touch then
			return "Mobile"
		end
		if tostring(arg2):find("Gamepad") then
			return "Console"
		end
		if arg2 == Enum.UserInputType.Keyboard or arg2 == Enum.UserInputType.MouseButton1 or arg2 == Enum.UserInputType.MouseMovement then
			return "PC"
		end
		return arg1.CurrentDevice
	end;
	Initialize = function(arg1) -- Line 25, Named "Initialize"
		--[[ Upvalues[1]:
			[1]: UserInputService_upvr (readonly)
		]]
		arg1.CurrentDevice = arg1:InitialDeviceCheck()
		UserInputService_upvr.LastInputTypeChanged:Connect(function(arg1_2) -- Line 28
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			local any_GetDeviceFromInput_result1 = arg1:GetDeviceFromInput(arg1_2)
			if any_GetDeviceFromInput_result1 ~= arg1.CurrentDevice then
				arg1.CurrentDevice = any_GetDeviceFromInput_result1
				arg1.ChangedSignal:Fire(any_GetDeviceFromInput_result1)
			end
		end)
	end;
	Get = function(arg1) -- Line 39, Named "Get"
		return arg1.CurrentDevice, arg1.ChangedSignal
	end;
	InitialDeviceCheck = function(arg1) -- Line 43, Named "InitialDeviceCheck"
		--[[ Upvalues[1]:
			[1]: UserInputService_upvr (readonly)
		]]
		local any_GetDeviceFromInput_result1_2 = arg1:GetDeviceFromInput(UserInputService_upvr:GetLastInputType())
		if any_GetDeviceFromInput_result1_2 then
			return any_GetDeviceFromInput_result1_2
		end
		if UserInputService_upvr.TouchEnabled and not UserInputService_upvr.KeyboardEnabled then
			return "Mobile"
		end
		if UserInputService_upvr.GamepadEnabled and not UserInputService_upvr.KeyboardEnabled and not UserInputService_upvr.MouseEnabled then
			return "Console"
		end
		return "PC"
	end;
}