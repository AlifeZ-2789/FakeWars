local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ShopEvent = ReplicatedStorage:WaitForChild("ShopEvent")
local ShopManager = require(ReplicatedStorage.Modules.ShopManager)

-- adding items
local items = {}

for i,v in pairs(items) do
	ShopManager:addItem(table.unpack(v))
end
