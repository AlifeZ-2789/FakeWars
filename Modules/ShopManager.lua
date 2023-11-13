local ShopManager = {}
ShopManager.__index = ShopManager

_G.shopItems = _G.shopItems or {}

function ShopManager:buyItem(plr, shop_item)
	if typeof(shop_item) ~= "table" then
		shop_item = _G.shopItems[shop_item]
	end
	local cost_item = shop_item.cost_item
	local cost = shop_item.cost
	if not plr:GetAttribute(cost_item) or plr:GetAttribute(cost_item) >= cost then return end
	plr:SetAttribute(cost_item, plr:GetAttribute(cost_item) - cost)
	shop_item.buy(plr)
end

function ShopManager:addItem(item_name, item_quantity, cost_item, cost, bought_function)
	bought_function = bought_function or function(plr)
		plr:SetAttribute(item_name, (plr:GetAttribute(item_name) or 0) + quantity)
	end
	local shop_item = {}
	shop_item.item_name = item_name
	shop_item.item_quantity = item_quantity
	shop_item.cost_item = cost_item
	shop_item.cost = cost
	shop_item.buy = bought_function
	_G.shopItems[item_name] = shop_item
end

function ShopManager:hasItem(item_name)
		

return ShopManager
	
