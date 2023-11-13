local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ShopEvent = ReplicatedStorage:WaitForChild("ShopEvent")
local ShopManager = require(ReplicatedStorage.Modules.ShopManager)

-- adding items
local items = {}

for i,v in pairs(

ShopEvent.OnServerEvent:Connect(function(plr, item_name)
	
end
	
