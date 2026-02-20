-- Name: EvolveTypeConfig
-- Path: game:GetService("ReplicatedStorage").Configs.EvolveTypeConfig
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5515582999996695 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:01
-- Luau version 6, Types version 3
-- Time taken: 0.003795 seconds

return {
	Normal = {
		PetValueMultiplier = 1;
		ColorTheme = {
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 225, 225))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(103, 103, 103)), ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 90, 90))});
		};
		Weight = 90;
	};
	Golden = {
		PetValueMultiplier = 3;
		ColorTheme = {
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 214, 131))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 226, 4)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 238, 0))});
		};
		Weight = 8;
	};
	Rainbow = {
		PetValueMultiplier = 8;
		ColorTheme = {
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 107, 107)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 214, 107)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(155, 246, 162)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(107, 203, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(178, 141, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 141, 228))});
		};
		Weight = 2;
	};
	Candy = {
		PetValueMultiplier = 10;
		ColorTheme = {
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 158, 255))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(165, 75, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 79, 240))});
			PetColor = Color3.fromHSV(0.8, 1, 1);
		};
		Weight = 0;
		EventOnly = true;
	};
	Lava = {
		PetValueMultiplier = 12;
		ColorTheme = {
			TextGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.375, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 187, 131))});
			BackgroundGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 81, 0))});
			PetColor = Color3.fromHSV(0.0529444, 1, 1);
		};
		Weight = 0;
		EventOnly = true;
	};
}