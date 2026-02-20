-- Name: EquipablePets
-- Path: game:GetService("Players").LocalPlayer.PlayerScripts.Client.Gameplay.Plot.EquipablePets
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.6059208000006038 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:35:34
-- Luau version 6, Types version 3
-- Time taken: 0.027260 seconds

local Players_upvr = game:GetService("Players")
local PlayerPets_upvr = workspace.PlayerPets
local tbl_2_upvr = {}
local tbl_upvr_2 = {}
local PetOffsets_upvr = require(script.PetOffsets)
local cframe_upvr = CFrame.Angles(0, (-math.pi/2), 0)
local function RenderPets_upvr(arg1) -- Line 34, Named "RenderPets"
	--[[ Upvalues[6]:
		[1]: Players_upvr (readonly)
		[2]: PlayerPets_upvr (readonly)
		[3]: PetOffsets_upvr (readonly)
		[4]: cframe_upvr (readonly)
		[5]: tbl_2_upvr (readonly)
		[6]: tbl_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	for _, v in Players_upvr:GetPlayers() do
		local SOME = PlayerPets_upvr:FindFirstChild(tostring(v.UserId))
		if SOME then
			local Character_2 = v.Character
			if Character_2 then
				local class_Humanoid = Character_2:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart_2 = Character_2:FindFirstChild("HumanoidRootPart")
				if class_Humanoid and HumanoidRootPart_2 then
					local tbl_4 = {}
					for i_2, v_2 in SOME:GetChildren(), nil do
						if v_2:IsA("Folder") then
							local class_MeshPart = v_2:FindFirstChildOfClass("MeshPart")
							if class_MeshPart then
								tbl_4[#tbl_4 + 1] = class_MeshPart
							end
						end
					end
					local len = #tbl_4
					if len ~= 0 then
						local var84 = PetOffsets_upvr[len]
						local var85
						if var84 then
							local Position = HumanoidRootPart_2.Position
							i_2 = HumanoidRootPart_2.Velocity
							v_2 = Position.Y - class_Humanoid.HipHeight - HumanoidRootPart_2.Size.Y * 0.5
							local var87 = CFrame.new(Position.X, v_2, Position.Z) * HumanoidRootPart_2.CFrame.Rotation
							local Position_4 = var87.Position
							var85 = i_2.X
							var85 = i_2.Z * i_2.Z
							local var89 = true
							var85 = class_Humanoid.MoveDirection
							var85 = 0.01
							if var85 >= var85.Magnitude then
								if 0.01 >= math.sqrt(var85 * i_2.X + var85) then
									var89 = false
								else
									var89 = true
								end
							end
							var85 = var87 - Position_4
							local var90 = var85 * cframe_upvr
							var85 = tbl_2_upvr[v]
							if not var85 then
								var85 = {}
								tbl_2_upvr[v] = var85
							end
							if not tbl_upvr_2[v] then
								local tbl_3 = {}
								tbl_upvr_2[v] = tbl_3
							end
							for i_3 = 1, len do
								local var92 = tbl_4[i_3]
								local var93 = var84[i_3]
								local var94 = var85[var92]
								if not var94 then
									var94 = math.random() * (-math.pi*2)
								else
									var94 += arg1
								end
								var85[var92] = var94
								local var95 = var92:GetAttribute("CanFly") or false
								local var96 = tbl_3[var92] or 0
								if var89 then
								else
								end
								local var97 = var96 + (0 - var96) * math.clamp(15 * arg1, 0, 1)
								tbl_3[var92] = var97
								if var95 then
								end
								local var98 = 0
								local var99 = 0
								if var95 then
									var98 = math.sin(var94 * 2) * 0.5
								elseif 0 < var97 then
									local sine = math.sin(var94 * 10)
									var98 = math.abs(sine) * 1.5 * var97
									var99 = sine * 0.1 * var97
								end
								local var101 = var90
								if var95 then
									var101 = var90 * CFrame.Angles(0, 0, -(math.cos(var94 * 2) * 0.08726646259971647))
								elseif 0 < var97 then
									var101 = var90 * CFrame.Angles(sine * 0.17453292519943295 * var97, 0, 0)
								end
								var92.CFrame = CFrame.new(Position_4 + var87:VectorToWorldSpace(Vector3.new(var93.x, var92.Size.Y * 0.5 + 3, var93.z)) + Vector3.new(var99, var98, 0)) * var92.CFrame - var92.CFrame.Position:Lerp(var101, math.clamp(6 * arg1, 0, 1))
							end
						end
					end
				end
			end
		end
	end
end
local CreatePet_upvr = require(script.CreatePet)
local tbl_upvr = {}
local function LoadPets_upvr() -- Line 144, Named "LoadPets"
	--[[ Upvalues[6]:
		[1]: Players_upvr (readonly)
		[2]: CreatePet_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_2_upvr (readonly)
		[5]: tbl_upvr_2 (readonly)
		[6]: PlayerPets_upvr (readonly)
	]]
	local tbl_5_upvr = {}
	local function SetupNewPetMesh_upvr(arg1, arg2) -- Line 147, Named "SetupNewPetMesh"
		--[[ Upvalues[3]:
			[1]: Players_upvr (copied, readonly)
			[2]: CreatePet_upvr (copied, readonly)
			[3]: tbl_upvr (copied, readonly)
		]]
		if not arg1:IsA("Folder") or arg1:FindFirstChildOfClass("MeshPart") then
		else
			local any_GetPlayerByUserId_result1_2 = Players_upvr:GetPlayerByUserId(tonumber(arg2.Name))
			if not any_GetPlayerByUserId_result1_2 then return end
			local var102_result1 = CreatePet_upvr(arg1.Name)
			if not var102_result1 then return end
			var102_result1.Parent = arg1
			if not tbl_upvr[any_GetPlayerByUserId_result1_2] then
				tbl_upvr[any_GetPlayerByUserId_result1_2] = {}
			end
			tbl_upvr[any_GetPlayerByUserId_result1_2][arg1] = var102_result1
		end
	end
	local function CleanUpPetMesh_upvr(arg1, arg2) -- Line 166, Named "CleanUpPetMesh"
		--[[ Upvalues[3]:
			[1]: tbl_upvr (copied, readonly)
			[2]: tbl_2_upvr (copied, readonly)
			[3]: tbl_upvr_2 (copied, readonly)
		]]
		if tbl_upvr[arg1] then
			tbl_upvr[arg1][arg2] = nil
		end
		if tbl_2_upvr[arg1] then
			for i_4 in pairs(tbl_2_upvr[arg1]) do
				if not i_4.Parent or not i_4.Parent.Parent then
					tbl_2_upvr[arg1][i_4] = nil
				end
			end
		end
		if tbl_upvr_2[arg1] then
			for i_5 in pairs(tbl_upvr_2[arg1]) do
				if not i_5.Parent or not i_5.Parent.Parent then
					tbl_upvr_2[arg1][i_5] = nil
				end
			end
		end
	end
	local function AddedPlayerFolder(arg1) -- Line 188
		--[[ Upvalues[4]:
			[1]: Players_upvr (copied, readonly)
			[2]: SetupNewPetMesh_upvr (readonly)
			[3]: tbl_5_upvr (readonly)
			[4]: CleanUpPetMesh_upvr (readonly)
		]]
		local any_GetPlayerByUserId_result1_3_upvr = Players_upvr:GetPlayerByUserId(tonumber(arg1.Name))
		if not any_GetPlayerByUserId_result1_3_upvr then
		else
			for _, v_4 in arg1:GetChildren() do
				SetupNewPetMesh_upvr(v_4, arg1)
			end
			tbl_5_upvr[arg1] = {
				ChildAdded = arg1.ChildAdded:Connect(function(arg1_2) -- Line 197
					--[[ Upvalues[2]:
						[1]: SetupNewPetMesh_upvr (copied, readonly)
						[2]: arg1 (readonly)
					]]
					SetupNewPetMesh_upvr(arg1_2, arg1)
				end);
				ChildRemoved = arg1.ChildRemoved:Connect(function(arg1_3) -- Line 200
					--[[ Upvalues[2]:
						[1]: CleanUpPetMesh_upvr (copied, readonly)
						[2]: any_GetPlayerByUserId_result1_3_upvr (readonly)
					]]
					CleanUpPetMesh_upvr(any_GetPlayerByUserId_result1_3_upvr, arg1_3)
				end);
			}
		end
	end
	Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 222
		--[[ Upvalues[3]:
			[1]: tbl_2_upvr (copied, readonly)
			[2]: tbl_upvr_2 (copied, readonly)
			[3]: tbl_upvr (copied, readonly)
		]]
		tbl_2_upvr[arg1] = nil
		tbl_upvr_2[arg1] = nil
		tbl_upvr[arg1] = nil
	end)
	for _, v_3 in PlayerPets_upvr:GetChildren() do
		AddedPlayerFolder(v_3)
	end
	PlayerPets_upvr.ChildAdded:Connect(AddedPlayerFolder)
	PlayerPets_upvr.ChildRemoved:Connect(function(arg1) -- Line 206, Named "RemovedPlayerFolder"
		--[[ Upvalues[5]:
			[1]: Players_upvr (copied, readonly)
			[2]: tbl_5_upvr (readonly)
			[3]: tbl_2_upvr (copied, readonly)
			[4]: tbl_upvr_2 (copied, readonly)
			[5]: tbl_upvr (copied, readonly)
		]]
		local any_GetPlayerByUserId_result1 = Players_upvr:GetPlayerByUserId(tonumber(arg1.Name))
		if tbl_5_upvr[arg1] then
			tbl_5_upvr[arg1].ChildAdded:Disconnect()
			tbl_5_upvr[arg1].ChildRemoved:Disconnect()
			tbl_5_upvr[arg1] = nil
		end
		if any_GetPlayerByUserId_result1 then
			tbl_2_upvr[any_GetPlayerByUserId_result1] = nil
			tbl_upvr_2[any_GetPlayerByUserId_result1] = nil
			tbl_upvr[any_GetPlayerByUserId_result1] = nil
		end
	end)
end
local var134_upvw
local var135_upvw
local var136_upvw
local RunService_upvr = game:GetService("RunService")
return function(arg1, arg2, arg3) -- Line 236
	--[[ Upvalues[6]:
		[1]: var134_upvw (read and write)
		[2]: var135_upvw (read and write)
		[3]: var136_upvw (read and write)
		[4]: LoadPets_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: RenderPets_upvr (readonly)
	]]
	var134_upvw = arg1
	var135_upvw = arg2
	var136_upvw = arg3
	LoadPets_upvr()
	RunService_upvr.RenderStepped:Connect(RenderPets_upvr)
end