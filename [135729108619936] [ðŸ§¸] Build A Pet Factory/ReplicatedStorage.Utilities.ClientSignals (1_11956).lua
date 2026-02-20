-- Name: ClientSignals
-- Path: game:GetService("ReplicatedStorage").Utilities.ClientSignals
-- Class: ModuleScript
-- Exploit: Xeno 
-- Time to decompile: 0.5467107000004034 seconds

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-20 08:37:45
-- Luau version 6, Types version 3
-- Time taken: 0.000902 seconds

local Signal = require(game:GetService("ReplicatedStorage").Packages.Signal)
return {
	CharacterAdded = Signal.new();
	CharacterRemoving = Signal.new();
	HumanoidDied = Signal.new();
	ToggleMenu = Signal.new();
	PromptPurchase = Signal.new();
	Notification = Signal.new();
	PlaceMode = Signal.new();
	PickupMode = Signal.new();
	StopAnyMode = Signal.new();
	ResetInventoryItem = Signal.new();
	CurrentBuyingFrame = Signal.new();
	GiftPlayerItem = Signal.new();
	DisplayRewards = Signal.new();
	GlobalAnnouncementNotification = Signal.new();
	GetCurrency = Signal.new();
	HatchPet = Signal.new();
}