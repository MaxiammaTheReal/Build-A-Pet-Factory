-- Name: init.spec
-- Path: game:GetService("ReplicatedStorage").Packages._Index['sleitnick_wait-for@0'].2.2['wait-for'].init.spec
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5508667000012792 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:51
-- Luau version 6, Types version 3
-- Time taken: 0.011375 seconds

return function() -- Line 1
	local tbl_3_upvr = {}
	local function Create_upvr(arg1, arg2) -- Line 7, Named "Create"
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		local Folder_4 = Instance.new("Folder")
		Folder_4.Name = arg1
		Folder_4.Parent = arg2
		table.insert(tbl_3_upvr, Folder_4)
		return Folder_4
	end
	afterEach(function() -- Line 15
		--[[ Upvalues[1]:
			[1]: tbl_3_upvr (readonly)
		]]
		for _, v_upvr in ipairs(tbl_3_upvr) do
			task.delay(0, function() -- Line 17
				--[[ Upvalues[1]:
					[1]: v_upvr (readonly)
				]]
				v_upvr:Destroy()
			end)
		end
		table.clear(tbl_3_upvr)
	end)
	local Parent_upvr = require(script.Parent)
	local Promise_upvr = require(script.Parent.Parent.Promise)
	describe("WaitFor", function() -- Line 24
		--[[ Upvalues[4]:
			[1]: Create_upvr (readonly)
			[2]: Parent_upvr (readonly)
			[3]: tbl_3_upvr (readonly)
			[4]: Promise_upvr (readonly)
		]]
		it("should wait for child", function() -- Line 25
			--[[ Upvalues[2]:
				[1]: Create_upvr (copied, readonly)
				[2]: Parent_upvr (copied, readonly)
			]]
			local workspace_4 = workspace
			task.delay(0.1, Create_upvr, "TestChild", workspace_4)
			local any_await_result1_6, any_await_result2_5 = Parent_upvr.Child(workspace_4, "TestChild"):await()
			expect(any_await_result1_6).to.equal(true)
			expect(typeof(any_await_result2_5)).to.equal("Instance")
			expect(any_await_result2_5.Name).to.equal("TestChild")
			expect(any_await_result2_5.Parent).to.equal(workspace_4)
		end)
		it("should stop waiting for child if parent is unparented", function() -- Line 38
			--[[ Upvalues[2]:
				[1]: tbl_3_upvr (copied, readonly)
				[2]: Parent_upvr (copied, readonly)
			]]
			local Folder_5 = Instance.new("Folder")
			Folder_5.Name = "SomeParent"
			Folder_5.Parent = workspace
			table.insert(tbl_3_upvr, Folder_5)
			local var20_upvr = Folder_5
			task.delay(0.1, function() -- Line 42
				--[[ Upvalues[1]:
					[1]: var20_upvr (readonly)
				]]
				var20_upvr:Destroy()
			end)
			local any_await_result1_3, any_await_result2_2 = Parent_upvr.Child(var20_upvr, "TestChild"):await()
			expect(any_await_result1_3).to.equal(false)
			expect(any_await_result2_2).to.equal(Parent_upvr.Error.Unparented)
		end)
		it("should stop waiting for child if timeout is reached", function() -- Line 51
			--[[ Upvalues[2]:
				[1]: Parent_upvr (copied, readonly)
				[2]: Promise_upvr (copied, readonly)
			]]
			local any_await_result1_7, any_await_result2_3 = Parent_upvr.Child(workspace, "InstanceThatDoesNotExist", 0.1):await()
			expect(any_await_result1_7).to.equal(false)
			expect(Promise_upvr.Error.isKind(any_await_result2_3, Promise_upvr.Error.Kind.TimedOut)).to.equal(true)
		end)
		it("should wait for children", function() -- Line 57
			--[[ Upvalues[2]:
				[1]: Create_upvr (copied, readonly)
				[2]: Parent_upvr (copied, readonly)
			]]
			local workspace_5 = workspace
			local tbl_2 = {"TestChild01", "TestChild02", "TestChild03"}
			task.delay(0.1, Create_upvr, tbl_2[1], workspace_5)
			task.delay(0.2, Create_upvr, tbl_2[2], workspace_5)
			task.delay(0.05, Create_upvr, tbl_2[3], workspace_5)
			local any_await_result1, any_await_result2 = Parent_upvr.Children(workspace_5, tbl_2):await()
			expect(any_await_result1).to.equal(true)
			for i_2, v_2 in ipairs(any_await_result2) do
				expect(typeof(v_2)).to.equal("Instance")
				expect(v_2.Name).to.equal(tbl_2[i_2])
				expect(v_2.Parent).to.equal(workspace_5)
			end
		end)
		it("should fail if any children are no longer parented in parent", function() -- Line 74
			--[[ Upvalues[3]:
				[1]: Create_upvr (copied, readonly)
				[2]: tbl_3_upvr (copied, readonly)
				[3]: Parent_upvr (copied, readonly)
			]]
			local workspace_3_upvr = workspace
			local tbl_4_upvr = {"TestChild04", "TestChild05", "TestChild06"}
			local var42_upvw
			task.delay(0.1, Create_upvr, tbl_4_upvr[1], workspace_3_upvr)
			task.delay(0.2, Create_upvr, tbl_4_upvr[2], workspace_3_upvr)
			task.delay(0.05, function() -- Line 82
				--[[ Upvalues[4]:
					[1]: var42_upvw (read and write)
					[2]: tbl_4_upvr (readonly)
					[3]: workspace_3_upvr (readonly)
					[4]: tbl_3_upvr (copied, readonly)
				]]
				local Folder_6 = Instance.new("Folder")
				Folder_6.Name = tbl_4_upvr[3]
				Folder_6.Parent = workspace_3_upvr
				table.insert(tbl_3_upvr, Folder_6)
				var42_upvw = Folder_6
			end)
			task.delay(0.1, function() -- Line 85
				--[[ Upvalues[1]:
					[1]: var42_upvw (read and write)
				]]
				var42_upvw:Destroy()
			end)
			local any_await_result1_5, any_await_result2_9 = Parent_upvr.Children(workspace_3_upvr, tbl_4_upvr):await()
			expect(any_await_result1_5).to.equal(false)
			expect(any_await_result2_9).to.equal(Parent_upvr.Error.ParentChanged)
		end)
		it("should wait for descendant", function() -- Line 94
			--[[ Upvalues[3]:
				[1]: Create_upvr (copied, readonly)
				[2]: tbl_3_upvr (copied, readonly)
				[3]: Parent_upvr (copied, readonly)
			]]
			local workspace_2 = workspace
			local Folder_7 = Instance.new("Folder")
			Folder_7.Name = "TestFolder"
			Folder_7.Parent = workspace_2
			table.insert(tbl_3_upvr, Folder_7)
			task.delay(0.1, Create_upvr, "TestDescendant", Folder_7)
			local any_await_result1_2, any_await_result2_7 = Parent_upvr.Descendant(workspace_2, "TestDescendant"):await()
			expect(any_await_result1_2).to.equal(true)
			expect(typeof(any_await_result2_7)).to.equal("Instance")
			expect(any_await_result2_7.Name).to.equal("TestDescendant")
			expect(any_await_result2_7:IsDescendantOf(workspace_2)).to.equal(true)
		end)
		it("should wait for many descendants", function() -- Line 107
			--[[ Upvalues[3]:
				[1]: Create_upvr (copied, readonly)
				[2]: tbl_3_upvr (copied, readonly)
				[3]: Parent_upvr (copied, readonly)
			]]
			local workspace = workspace
			local tbl = {"TestDescendant01", "TestDescendant02", "TestDescendant03"}
			local Folder_3 = Instance.new("Folder")
			Folder_3.Name = "TestFolder1"
			Folder_3.Parent = workspace
			table.insert(tbl_3_upvr, Folder_3)
			task.delay(0.1, Create_upvr, tbl[1], Folder_3)
			local Folder_9 = Instance.new("Folder")
			Folder_9.Name = "TestFolder2"
			Folder_9.Parent = workspace
			table.insert(tbl_3_upvr, Folder_9)
			task.delay(0.05, Create_upvr, tbl[2], Folder_9)
			local Folder = Instance.new("Folder")
			Folder.Name = "TestFolder3"
			Folder.Parent = workspace
			table.insert(tbl_3_upvr, Folder)
			local Folder_2 = Instance.new("Folder")
			Folder_2.Name = "TestFolder4"
			Folder_2.Parent = Folder
			table.insert(tbl_3_upvr, Folder_2)
			task.delay(0.2, Create_upvr, tbl[3], Folder_2)
			local any_await_result1_10, any_await_result2_8 = Parent_upvr.Descendants(workspace, tbl):await()
			expect(any_await_result1_10).to.equal(true)
			for i_3, v_3 in ipairs(any_await_result2_8) do
				local typeof_result1 = typeof(v_3)
				expect(typeof_result1).to.equal("Instance")
				if v_3.Name ~= tbl[i_3] then
					typeof_result1 = false
				else
					typeof_result1 = true
				end
				expect(typeof_result1).to.equal(true)
				expect(v_3:IsDescendantOf(workspace)).to.equal(true)
			end
		end)
		it("should wait for primarypart", function() -- Line 124
			--[[ Upvalues[1]:
				[1]: Parent_upvr (copied, readonly)
			]]
			local Model_upvr = Instance.new("Model")
			local Part_upvr = Instance.new("Part")
			Part_upvr.Anchored = true
			Part_upvr.Parent = Model_upvr
			Model_upvr.Parent = workspace
			task.delay(0.1, function() -- Line 132
				--[[ Upvalues[2]:
					[1]: Model_upvr (readonly)
					[2]: Part_upvr (readonly)
				]]
				Model_upvr.PrimaryPart = Part_upvr
			end)
			local any_await_result1_9, any_await_result2_10 = Parent_upvr.PrimaryPart(Model_upvr):await()
			expect(any_await_result1_9).to.equal(true)
			expect(typeof(any_await_result2_10)).to.equal("Instance")
			expect(any_await_result2_10).to.equal(Part_upvr)
			expect(Model_upvr.PrimaryPart).to.equal(any_await_result2_10)
			Model_upvr:Destroy()
		end)
		it("should wait for objectvalue", function() -- Line 145
			--[[ Upvalues[2]:
				[1]: tbl_3_upvr (copied, readonly)
				[2]: Parent_upvr (copied, readonly)
			]]
			local ObjectValue_upvr = Instance.new("ObjectValue")
			ObjectValue_upvr.Parent = workspace
			local Folder_10 = Instance.new("Folder")
			Folder_10.Name = "SomeInstance"
			Folder_10.Parent = workspace
			table.insert(tbl_3_upvr, Folder_10)
			local var79_upvr = Folder_10
			task.delay(0.1, function() -- Line 151
				--[[ Upvalues[2]:
					[1]: ObjectValue_upvr (readonly)
					[2]: var79_upvr (readonly)
				]]
				ObjectValue_upvr.Value = var79_upvr
			end)
			local any_await_result1_8, any_await_result2_6 = Parent_upvr.ObjectValue(ObjectValue_upvr):await()
			expect(any_await_result1_8).to.equal(true)
			expect(typeof(any_await_result2_6)).to.equal("Instance")
			local var83 = var79_upvr
			expect(any_await_result2_6).to.equal(var83)
			if ObjectValue_upvr.Value ~= any_await_result2_6 then
				var83 = false
			else
				var83 = true
			end
			expect(var83)
			ObjectValue_upvr:Destroy()
		end)
		it("should wait for custom predicate", function() -- Line 164
			--[[ Upvalues[2]:
				[1]: tbl_3_upvr (copied, readonly)
				[2]: Parent_upvr (copied, readonly)
			]]
			local var85_upvw
			task.delay(0.1, function() -- Line 166
				--[[ Upvalues[2]:
					[1]: var85_upvw (read and write)
					[2]: tbl_3_upvr (copied, readonly)
				]]
				local Folder_8 = Instance.new("Folder")
				Folder_8.Name = "CustomInstance"
				Folder_8.Parent = workspace
				table.insert(tbl_3_upvr, Folder_8)
				var85_upvw = Folder_8
			end)
			local any_await_result1_4, any_await_result2_4 = Parent_upvr.Custom(function() -- Line 170
				--[[ Upvalues[1]:
					[1]: var85_upvw (read and write)
				]]
				return var85_upvw
			end):await()
			expect(any_await_result1_4).to.equal(true)
			expect(typeof(any_await_result2_4)).to.equal("Instance")
			expect(any_await_result2_4).to.equal(var85_upvw)
		end)
	end)
end