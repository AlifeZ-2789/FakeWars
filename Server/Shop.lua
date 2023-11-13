local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ShopEvent = ReplicatedStorage:WaitForChild("ShopEvent")
local ShopManager = require(ReplicatedStorage.Modules.ShopManager)

-- adding items
local items = {}

for i,v in pairs(items) do
	ShopManager:addItem(table.unpack(v))
end

ShopEvent.OnServerEvent:Connect(function(plr, item_name)
	local success, e = ShopManager:buyItem(plr, item_name)
	if not success and e then
		warn(e)
	else
		print("Success!")
	end
end
	
