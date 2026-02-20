-- Name: ItemConfig
-- Path: game:GetService("ReplicatedStorage").Configs.ItemConfig
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.8453847000000678 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:36:56
-- Luau version 6, Types version 3
-- Time taken: 0.020076 seconds

local tbl = {
	["Pet Spawner"] = Color3.fromRGB(112, 255, 51);
	Conveyor = Color3.fromRGB(255, 141, 41);
	Upgrader = Color3.fromRGB(255, 208, 37);
	["Pet Collector"] = Color3.fromRGB(210, 119, 255);
	BackupColor = Color3.fromRGB(153, 153, 153);
}
return {
	["Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns a pet every %s!", "6 seconds", tbl["Pet Spawner"]};
		Rarity = "Basic";
		Stock = {
			Min = 3;
			Max = 4;
		};
		Icon = "rbxassetid://126760900219753";
		Cost = 250;
		SpawnInterval = 6;
		LuckMultiplier = 1;
		LayoutOrder = 1;
	};
	Conveyor = {
		Type = "Conveyor";
		Description = {"Moves pets %s per second!", "10 studs", tbl.Conveyor};
		Rarity = "Basic";
		Stock = {
			Min = 5;
			Max = 8;
		};
		Icon = "rbxassetid://130361629417853";
		Cost = 20;
		Speed = 10;
		LayoutOrder = 2;
	};
	["Lightning Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x1.5", tbl.Upgrader};
		Rarity = "Basic";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://109783450085499";
		Cost = 500;
		ValueMultiplier = 1.5;
		Speed = 10;
		LayoutOrder = 3;
	};
	["Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "10 pets", tbl["Pet Collector"]};
		Rarity = "Basic";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://119120692863798";
		Cost = 750;
		MaxPets = 10;
		LayoutOrder = 4;
	};
	["Better Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x2 luck", tbl["Pet Spawner"]};
		Rarity = "Rare";
		Stock = {
			Min = 2;
			Max = 3;
		};
		Icon = "rbxassetid://112071531180081";
		Cost = 2000;
		SpawnInterval = 6;
		LuckMultiplier = 2;
		LayoutOrder = 1;
	};
	["Faster Conveyor"] = {
		Type = "Conveyor";
		Description = {"Moves pets %s per second!", "12 studs", tbl.Conveyor};
		Rarity = "Rare";
		Stock = {
			Min = 4;
			Max = 6;
		};
		Icon = "rbxassetid://74088851498414";
		Cost = 300;
		Speed = 12;
		LayoutOrder = 2;
	};
	["Toxic Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x2.5", tbl.Upgrader};
		Rarity = "Rare";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://79996957995931";
		Cost = 4000;
		ValueMultiplier = 2.5;
		Speed = 12;
		LayoutOrder = 3;
	};
	["Bigger Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "25 pets", tbl["Pet Collector"]};
		Rarity = "Rare";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://118145608096970";
		Cost = 6000;
		MaxPets = 25;
		LayoutOrder = 4;
	};
	["Slide Ramp Conveyor"] = {
		Type = "Slide Ramp Conveyor";
		Description = {"Moves a pet %s one grid level!", "down", tbl.BackupColor};
		Rarity = "Rare";
		Stock = {
			Min = 2;
			Max = 3;
		};
		Icon = "rbxassetid://112219158672833";
		Cost = 500;
		Speed = 12;
		LayoutOrder = 5;
	};
	["Stair Ramp Conveyor"] = {
		Type = "Stair Ramp Conveyor";
		Description = {"Moves a pet %s one grid level!", "up", tbl.BackupColor};
		Rarity = "Rare";
		Stock = {
			Min = 2;
			Max = 3;
		};
		Icon = "rbxassetid://100833793936806";
		Cost = 500;
		Speed = 12;
		LayoutOrder = 6;
	};
	["Conveyor Splitter"] = {
		Type = "Conveyor Splitter";
		Description = {"Randomly splits pets into %s!", "two paths", tbl.BackupColor};
		Rarity = "Rare";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://134320482938819";
		Cost = 1000;
		Speed = 12;
		LayoutOrder = 7;
	};
	["Elite Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x3 luck", tbl["Pet Spawner"]};
		Rarity = "Legendary";
		Stock = {
			Min = 2;
			Max = 3;
		};
		Icon = "rbxassetid://90409619670958";
		Cost = 25000;
		SpawnInterval = 6;
		LuckMultiplier = 3;
		LayoutOrder = 1;
	};
	["Rapid Conveyor"] = {
		Type = "Conveyor";
		Description = {"Moves pets %s per second!", "15 studs", tbl.Conveyor};
		Rarity = "Legendary";
		Stock = {
			Min = 3;
			Max = 4;
		};
		Icon = "rbxassetid://118693312058774";
		Cost = 4000;
		Speed = 15;
		LayoutOrder = 2;
	};
	["Fire Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x4", tbl.Upgrader};
		Rarity = "Legendary";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://80628655200456";
		Cost = 50000;
		ValueMultiplier = 4;
		Speed = 15;
		LayoutOrder = 3;
	};
	["Gigantic Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "50 pets", tbl["Pet Collector"]};
		Rarity = "Legendary";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://73322409008723";
		Cost = 150000;
		MaxPets = 50;
		LayoutOrder = 4;
	};
	["Supreme Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x4 luck", tbl["Pet Spawner"]};
		Rarity = "Mythical";
		Stock = {
			Min = 2;
			Max = 2;
		};
		Icon = "rbxassetid://102458190898570";
		Cost = 250000;
		SpawnInterval = 6;
		LuckMultiplier = 4;
		LayoutOrder = 1;
	};
	["Flash Conveyor"] = {
		Type = "Conveyor";
		Description = {"Moves pets %s per second!", "20 studs", tbl.Conveyor};
		Rarity = "Mythical";
		Stock = {
			Min = 3;
			Max = 4;
		};
		Icon = "rbxassetid://119891261573659";
		Cost = 75000;
		Speed = 20;
		LayoutOrder = 2;
	};
	["Volcanic Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x7.5", tbl.Upgrader};
		Rarity = "Mythical";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://121602821604564";
		Cost = 500000;
		ValueMultiplier = 7.5;
		Speed = 20;
		LayoutOrder = 3;
	};
	["Colossal Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "100 pets", tbl["Pet Collector"]};
		Rarity = "Mythical";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://115774082071172";
		Cost = 1500000;
		MaxPets = 100;
		LayoutOrder = 4;
	};
	["Omega Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x5 luck", tbl["Pet Spawner"]};
		Rarity = "Exotic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://109562337189601";
		Cost = 2500000;
		SpawnInterval = 6;
		LuckMultiplier = 5;
		LayoutOrder = 1;
	};
	["Quantum Conveyor"] = {
		Type = "Conveyor";
		Description = {"Moves pets %s per second!", "25 studs", tbl.Conveyor};
		Rarity = "Exotic";
		Stock = {
			Min = 3;
			Max = 4;
		};
		Icon = "rbxassetid://106988589753840";
		Cost = 400000;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Obsidian Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x12.5", tbl.Upgrader};
		Rarity = "Exotic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://131704368012953";
		Cost = 3500000;
		ValueMultiplier = 12.5;
		Speed = 25;
		LayoutOrder = 3;
	};
	["Titanic Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "200 pets", tbl["Pet Collector"]};
		Rarity = "Exotic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://104636130329923";
		Cost = 7500000;
		MaxPets = 200;
		LayoutOrder = 4;
	};
	["Quantum Slide Ramp"] = {
		Type = "Slide Ramp Conveyor";
		Description = {"Moves a pet fast %s one grid level!", "down", tbl.BackupColor};
		Rarity = "Exotic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://103626771653445";
		Cost = 1500000;
		Speed = 25;
		LayoutOrder = 5;
	};
	["Quantum Stair Ramp"] = {
		Type = "Stair Ramp Conveyor";
		Description = {"Moves a pet fast %s one grid level!", "up", tbl.BackupColor};
		Rarity = "Exotic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://117151992048917";
		Cost = 1500000;
		Speed = 25;
		LayoutOrder = 6;
	};
	["Godly Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x8 luck", tbl["Pet Spawner"]};
		Rarity = "Godly";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://137425799236919";
		Cost = 40000000;
		SpawnInterval = 6;
		LuckMultiplier = 8;
		LayoutOrder = 1;
	};
	["Godly Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x20", tbl.Upgrader};
		Rarity = "Godly";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://134581961160860";
		Cost = 60000000;
		ValueMultiplier = 20;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Godly Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "400 pets", tbl["Pet Collector"]};
		Rarity = "Godly";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://117350014679638";
		Cost = 250000000;
		MaxPets = 400;
		LayoutOrder = 3;
	};
	["Futuristic Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x10 luck", tbl["Pet Spawner"]};
		Rarity = "Futuristic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://127644052637971";
		Cost = 2500000000;
		SpawnInterval = 6;
		LuckMultiplier = 10;
		LayoutOrder = 1;
	};
	["Futuristic Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x30", tbl.Upgrader};
		Rarity = "Futuristic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://98874946159030";
		Cost = 3500000000;
		ValueMultiplier = 30;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Futuristic Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "600 pets", tbl["Pet Collector"]};
		Rarity = "Futuristic";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://91925337840680";
		Cost = 12500000000;
		MaxPets = 600;
		LayoutOrder = 3;
	};
	["Ruby Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x12 luck", tbl["Pet Spawner"]};
		Rarity = "Ruby";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://113053918791847";
		Cost = 1000000000000;
		SpawnInterval = 6;
		LuckMultiplier = 12;
		LayoutOrder = 1;
	};
	["Ruby Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x50", tbl.Upgrader};
		Rarity = "Ruby";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://133398491736444";
		Cost = 2000000000000;
		ValueMultiplier = 50;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Ruby Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "800 pets", tbl["Pet Collector"]};
		Rarity = "Ruby";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://83099270675282";
		Cost = 6000000000000;
		MaxPets = 800;
		LayoutOrder = 3;
	};
	["Emerald Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x15 luck", tbl["Pet Spawner"]};
		Rarity = "Emerald";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://83600069175032";
		Cost = 200000000000000;
		SpawnInterval = 6;
		LuckMultiplier = 15;
		LayoutOrder = 1;
	};
	["Emerald Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x75", tbl.Upgrader};
		Rarity = "Emerald";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://87846562899489";
		Cost = 400000000000000;
		ValueMultiplier = 75;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Emerald Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "1000 pets", tbl["Pet Collector"]};
		Rarity = "Emerald";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://106977132105943";
		Cost = 1500000000000000;
		MaxPets = 1000;
		LayoutOrder = 3;
	};
	["Galaxy Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x20 luck", tbl["Pet Spawner"]};
		Rarity = "Galaxy";
		Stock = {
			Min = 0;
			Max = 1;
		};
		Icon = "rbxassetid://112772288075680";
		Cost = 80000000000000000;
		SpawnInterval = 6;
		LuckMultiplier = 20;
		LayoutOrder = 1;
	};
	["Galaxy Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x100", tbl.Upgrader};
		Rarity = "Galaxy";
		Stock = {
			Min = 0;
			Max = 1;
		};
		Icon = "rbxassetid://124282470400497";
		Cost = 150000000000000000;
		ValueMultiplier = 100;
		Speed = 25;
		LayoutOrder = 2;
	};
	["Galaxy Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "1200 pets", tbl["Pet Collector"]};
		Rarity = "Galaxy";
		Stock = {
			Min = 0;
			Max = 1;
		};
		Icon = "rbxassetid://116731563096977";
		Cost = 600000000000000000;
		MaxPets = 1200;
		LayoutOrder = 3;
	};
	["Rainbow Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x60 luck", tbl["Pet Spawner"]};
		Rarity = "Limited";
		Stock = {
			Min = 0;
			Max = 0;
		};
		Icon = "rbxassetid://134300497809163";
		Cost = 0;
		SpawnInterval = 6;
		LuckMultiplier = 60;
		LayoutOrder = 1;
		IsRobuxOnly = true;
	};
	["Rainbow Pet Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x250", tbl.Upgrader};
		Rarity = "Limited";
		Stock = {
			Min = 0;
			Max = 0;
		};
		Icon = "rbxassetid://129224204930962";
		Cost = 0;
		ValueMultiplier = 250;
		Speed = 25;
		LayoutOrder = 2;
		IsRobuxOnly = true;
	};
	["Rainbow Pet Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds an %s number of pets!", "INFINITE", tbl["Pet Collector"]};
		Rarity = "Limited";
		Stock = {
			Min = 0;
			Max = 0;
		};
		Icon = "rbxassetid://129046673707217";
		Cost = 0;
		MaxPets = 10000000000000000000;
		LayoutOrder = 3;
		IsRobuxOnly = true;
	};
	["67 Admin Abuse Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x25 luck", tbl["Pet Spawner"]};
		Rarity = "Limited";
		Stock = {
			Min = 0;
			Max = 0;
		};
		Icon = "rbxassetid://110067761128515";
		Cost = 0;
		SpawnInterval = 6;
		LuckMultiplier = 25;
		LayoutOrder = 4;
		DisabledGifting = true;
	};
	["67 Admin Abuse Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x100", tbl.Upgrader};
		Rarity = "Limited";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://86684987342104";
		Cost = 0;
		ValueMultiplier = 100;
		Speed = 25;
		LayoutOrder = 5;
		DisabledGifting = true;
	};
	["67 Admin Abuse Collector"] = {
		Type = "Pet Collector";
		Description = {"Holds up to %s at once!", "670 pets", tbl["Pet Collector"]};
		Rarity = "Limited";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://71022228781743";
		Cost = 0;
		MaxPets = 670;
		LayoutOrder = 6;
	};
	["Valentine Pet Spawner"] = {
		Type = "Pet Spawner";
		Description = {"Spawns pets with %s!", "x30 luck", tbl["Pet Spawner"]};
		Rarity = "Limited";
		Stock = {
			Min = 0;
			Max = 0;
		};
		Icon = "rbxassetid://127017094447708";
		Cost = 0;
		SpawnInterval = 6;
		LuckMultiplier = 30;
		LayoutOrder = 7;
		DisabledGifting = true;
	};
	["Valentine Upgrader"] = {
		Type = "Upgrader";
		Description = {"Boosts value by %s of its base value!", "x125", tbl.Upgrader};
		Rarity = "Limited";
		Stock = {
			Min = 1;
			Max = 1;
		};
		Icon = "rbxassetid://102099593752490";
		Cost = 0;
		ValueMultiplier = 125;
		Speed = 25;
		LayoutOrder = 8;
		DisabledGifting = true;
	};
	Block = {
		Type = "Decoration";
		Stock = {
			Min = 7;
			Max = 10;
		};
		Icon = "rbxassetid://76586850036282";
		Cost = 40000;
		LayoutOrder = 1;
	};
	Glass = {
		Type = "Decoration";
		Stock = {
			Min = 4;
			Max = 5;
		};
		Icon = "rbxassetid://84534808384032";
		Cost = 60000;
		LayoutOrder = 2;
	};
	["Top Plate"] = {
		Type = "Decoration";
		Stock = {
			Min = 4;
			Max = 6;
		};
		Icon = "rbxassetid://79266071840759";
		Cost = 75000;
		LayoutOrder = 3;
	};
	Stairs = {
		Type = "Decoration";
		Stock = {
			Min = 4;
			Max = 5;
		};
		Icon = "rbxassetid://106829938099656";
		Cost = 150000;
		LayoutOrder = 4;
	};
	["Corner Stairs"] = {
		Type = "Decoration";
		Stock = {
			Min = 3;
			Max = 4;
		};
		Icon = "rbxassetid://113111671191922";
		Cost = 250000;
		LayoutOrder = 5;
	};
	Tree = {
		Type = "Decoration";
		Stock = {
			Min = 1;
			Max = 2;
		};
		Icon = "rbxassetid://139354158854477";
		Cost = 600000;
		LayoutOrder = 6;
	};
	Ladder = {
		Type = "Decoration";
		Stock = {
			Min = 2;
			Max = 4;
		};
		Icon = "rbxassetid://132316307025249";
		Cost = 1000000;
		LayoutOrder = 7;
	};
	Railing = {
		Type = "Decoration";
		Stock = {
			Min = 2;
			Max = 4;
		};
		Icon = "rbxassetid://104173012718790";
		Cost = 2500000;
		LayoutOrder = 8;
	};
}