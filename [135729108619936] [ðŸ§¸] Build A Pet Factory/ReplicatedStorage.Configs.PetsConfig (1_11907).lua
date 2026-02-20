-- Name: PetsConfig
-- Path: game:GetService("ReplicatedStorage").Configs.PetsConfig
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5751359000005323 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:00
-- Luau version 6, Types version 3
-- Time taken: 0.017798 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_5_upvr = {
	Basic = 20;
	Uncommon = 50;
	Rare = 150;
	Epic = 500;
	Legendary = 4000;
	Mythic = 30000;
	Secret = 250000;
	HyperSecret = 2000000;
}
local tbl_7_upvr = {
	Basic = 1.25;
	Uncommon = 1.5;
	Rare = 1.75;
	Epic = 2.5;
	Legendary = 4;
	Mythic = 6;
	Secret = 9;
	HyperSecret = 15;
}
local tbl_8_upvr = {1, 1.05, 1.1, 1.15, 1.2, 1.25, 1.3, 1.35, 1.4, 1.45, 1.5, 1.55}
local tbl_2_upvr = {1, 0.98, 0.96, 0.94, 0.92, 0.9, 0.88, 0.86, 0.84, 0.82, 0.8, 0.78}
local tbl = {
	Basic = {{
		Name = "Pig";
		Icons = {
			NormalImage = "rbxassetid://73761813447029";
			WhiteImage = "rbxassetid://120073082417914";
		};
	}, {
		Name = "Cat";
		Icons = {
			NormalImage = "rbxassetid://77046701299559";
			WhiteImage = "rbxassetid://133029102668839";
		};
	}, {
		Name = "Dog";
		Icons = {
			NormalImage = "rbxassetid://95467817432555";
			WhiteImage = "rbxassetid://99174737669645";
		};
	}, {
		Name = "Bunny";
		Icons = {
			NormalImage = "rbxassetid://138594539801215";
			WhiteImage = "rbxassetid://114492003645264";
		};
	}, {
		Name = "Bear";
		Icons = {
			NormalImage = "rbxassetid://74162508501049";
			WhiteImage = "rbxassetid://80106159213101";
		};
	}};
	Uncommon = {{
		Name = "Camel";
		Icons = {
			NormalImage = "rbxassetid://91638580116267";
			WhiteImage = "rbxassetid://121525744301533";
		};
	}, {
		Name = "Walrus";
		Icons = {
			NormalImage = "rbxassetid://117435772362909";
			WhiteImage = "rbxassetid://134869042572381";
		};
	}, {
		Name = "Penguin";
		Icons = {
			NormalImage = "rbxassetid://131301374905210";
			WhiteImage = "rbxassetid://128258251375630";
		};
	}, {
		Name = "Monkey";
		Icons = {
			NormalImage = "rbxassetid://107886786759577";
			WhiteImage = "rbxassetid://92277588312021";
		};
	}};
	Rare = {{
		Name = "Turkey";
		Icons = {
			NormalImage = "rbxassetid://125322178211560";
			WhiteImage = "rbxassetid://91349812238279";
		};
	}, {
		Name = "Pink Fox";
		Icons = {
			NormalImage = "rbxassetid://85259564120944";
			WhiteImage = "rbxassetid://89629075230814";
		};
	}, {
		Name = "Yellow Pufferfish";
		Icons = {
			NormalImage = "rbxassetid://103511244011767";
			WhiteImage = "rbxassetid://78098973958514";
		};
	}, {
		Name = "Pink Squid";
		Icons = {
			NormalImage = "rbxassetid://140123557801423";
			WhiteImage = "rbxassetid://103024752638447";
		};
	}, {
		Name = "Hippo";
		Icons = {
			NormalImage = "rbxassetid://117092711469084";
			WhiteImage = "rbxassetid://124321931838694";
		};
	}, {
		Name = "Limey Fish";
		Icons = {
			NormalImage = "rbxassetid://79933828945950";
			WhiteImage = "rbxassetid://101890756808383";
		};
	}};
	Epic = {{
		Name = "Ocean Shark";
		Icons = {
			NormalImage = "rbxassetid://71535040479668";
			WhiteImage = "rbxassetid://122588731124383";
		};
	}, {
		Name = "Red Butterfly";
		Icons = {
			NormalImage = "rbxassetid://104000032020885";
			WhiteImage = "rbxassetid://103558868894693";
		};
	}, {
		Name = "Blossom Axolotl";
		Icons = {
			NormalImage = "rbxassetid://104235012127026";
			WhiteImage = "rbxassetid://97584815766690";
		};
	}, {
		Name = "CloverMoo";
		Icons = {
			NormalImage = "rbxassetid://79043841441497";
			WhiteImage = "rbxassetid://101688448425098";
		};
	}, {
		Name = "Neon Bear";
		Icons = {
			NormalImage = "rbxassetid://121759775747341";
			WhiteImage = "rbxassetid://117521869388518";
		};
	}, {
		Name = "Dino";
		Icons = {
			NormalImage = "rbxassetid://115539911782748";
			WhiteImage = "rbxassetid://89880901573457";
		};
	}, {
		Name = "Red Dragon";
		Icons = {
			NormalImage = "rbxassetid://131926912087703";
			WhiteImage = "rbxassetid://84532057350814";
		};
	}};
	Legendary = {{
		Name = "Scarlet Macaw";
		Icons = {
			NormalImage = "rbxassetid://120420511096563";
			WhiteImage = "rbxassetid://72720894223521";
		};
	}, {
		Name = "Festive Elf";
		Icons = {
			NormalImage = "rbxassetid://121297708467938";
			WhiteImage = "rbxassetid://112067353150320";
		};
	}, {
		Name = "Totem Trickster";
		Icons = {
			NormalImage = "rbxassetid://104372671832057";
			WhiteImage = "rbxassetid://103456228729232";
		};
	}, {
		Name = "Cyber Spider";
		Icons = {
			NormalImage = "rbxassetid://132022226505724";
			WhiteImage = "rbxassetid://136943972633860";
		};
	}, {
		Name = "Spiky Cactus";
		Icons = {
			NormalImage = "rbxassetid://82416521299062";
			WhiteImage = "rbxassetid://136072736378691";
		};
	}};
	Mythic = {{
		Name = "Icy Golem";
		Icons = {
			NormalImage = "rbxassetid://107686936417498";
			WhiteImage = "rbxassetid://128310053319872";
		};
	}, {
		Name = "Lava Golem";
		Icons = {
			NormalImage = "rbxassetid://118741003888810";
			WhiteImage = "rbxassetid://123447930962862";
		};
	}, {
		Name = "Robotic Squid";
		Icons = {
			NormalImage = "rbxassetid://77175059166903";
			WhiteImage = "rbxassetid://139300527041944";
		};
	}, {
		Name = "Spiky Wyvern";
		Icons = {
			NormalImage = "rbxassetid://97735705857487";
			WhiteImage = "rbxassetid://128729872540397";
		};
	}, {
		Name = "Diamond Dragon";
		Icons = {
			NormalImage = "rbxassetid://91021256061944";
			WhiteImage = "rbxassetid://98016196298228";
		};
	}, {
		Name = "Samurai Warrior";
		Icons = {
			NormalImage = "rbxassetid://132456366825025";
			WhiteImage = "rbxassetid://119030619567686";
		};
	}};
	Secret = {{
		Name = "Void Dominus";
		Icons = {
			NormalImage = "rbxassetid://109467730994504";
			WhiteImage = "rbxassetid://125140619222832";
		};
	}, {
		Name = "Lava Dominus";
		Icons = {
			NormalImage = "rbxassetid://104708566883199";
			WhiteImage = "rbxassetid://129087622381410";
		};
	}, {
		Name = "Void Watcher";
		Icons = {
			NormalImage = "rbxassetid://99286220035672";
			WhiteImage = "rbxassetid://118149704494887";
		};
	}};
}
local tbl_3 = {}
local tbl_6 = {
	Name = "Ice Yeti";
	Icons = {
		NormalImage = "rbxassetid://130087829562387";
		WhiteImage = "rbxassetid://114281117294425";
	};
}
tbl_3[1] = {
	Name = "Inferno Chomper";
	Icons = {
		NormalImage = "rbxassetid://89178968627316";
		WhiteImage = "rbxassetid://117814090257577";
	};
}
tbl_3[2] = tbl_6
tbl_3[3] = {
	Name = "Icy Dominus";
	Icons = {
		NormalImage = "rbxassetid://135479623386656";
		WhiteImage = "rbxassetid://86713319471666";
	};
}
tbl_3[4] = {
	Name = "Pixel Dragon";
	Icons = {
		NormalImage = "rbxassetid://136460912198416";
		WhiteImage = "rbxassetid://91148383805422";
	};
}
tbl.HyperSecret = tbl_3
tbl_6 = {}
local var145 = tbl_6
local tbl_4 = {}
for i, v in pairs(tbl) do
	tbl_4[i] = {}
	local ipairs_result1, ipairs_result2_3, ipairs_result3_3 = ipairs(v)
	for i_2, v_2 in ipairs_result1, ipairs_result2_3, ipairs_result3_3 do
		local createPet_result1 = (function(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 156, Named "createPet"
			--[[ Upvalues[4]:
				[1]: tbl_8_upvr (readonly)
				[2]: tbl_2_upvr (readonly)
				[3]: tbl_5_upvr (readonly)
				[4]: tbl_7_upvr (readonly)
			]]
			local var143 = tbl_8_upvr[(arg3 - 1) % #tbl_8_upvr + 1]
			local module = {}
			module.Rarity = arg2
			module.Icon = arg4
			module.PetValue = math.round(arg6 or tbl_5_upvr[arg2] * var143)
			module.PetMultiplier = tbl_7_upvr[arg2] * var143
			module.RawWeight = arg5 * tbl_2_upvr[(arg3 - 1) % #tbl_2_upvr + 1]
			return module
		end)(v_2.Name, i, i_2, v_2.Icons, 1)
		;({})[v_2.Name] = createPet_result1
		table.insert(tbl_4[i], createPet_result1)
		for _, v_3 in pairs(v_2.Icons) do
			table.insert(var145, v_3)
		end
	end
end
for i_4, v_4 in pairs(tbl_4) do
	ipairs_result1 = 0
	local var160 = ipairs_result1
	for _, v_5 in ipairs(v_4) do
		var160 += v_5.RawWeight
	end
	for _, v_6 in ipairs(v_4) do
		v_6.Weight = v_6.RawWeight / var160 * require(ReplicatedStorage.Configs.RarityWeights)[i_4]
		v_6.RawWeight = nil
		local _
	end
end
if game:GetService("RunService"):IsClient() then
	require(ReplicatedStorage.Utilities.IconPreloader).PreloadIcons(var145)
end
-- KONSTANTERROR: Expression was reused, decompilation is incorrect
return {}