local ShopManager = {}
ShopManager.__index = ShopManager

_G.shopItems = _G.shopItems or {}

function ShopManager:buyItem(plr, shop_item)
	if typeof(shop_item) ~= "table" then
		shop_item = ShopManager:getItem(shop_item)
		if not shop_item then
			return false, "Item doesn't exist"
		end
	end
	if not ShopManager:hasItem(shop.item_name or "nil") then return false, "Item doesn't exist" end
	local cost_item = shop_item.cost_item
	local cost = shop_item.cost
	if not plr:GetAttribute(cost_item) or plr:GetAttribute(cost_item) >= cost then return false, "Insufficient funds" end
	plr:SetAttribute(cost_item, plr:GetAttribute(cost_item) - cost)
	shop_item.buy(plr)
	return true
end

function ShopManager:addItem(item_name, item_quantity, cost_item, cost, bought_function)
	if ShopManager:getItem(item_name) then return false, "Item already exists" end
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
	return true
end

function ShopManager:getItem(item_name)
	return _G.shopItems[item_name]
end

function ShopManager:hasItem(item_name)
	return ShopManager:getItem(item_name) ~= nil
end

function ShopManager:removeItem(item_name)
	if ShopManager:hasItem(item_name) then
		_G.shopItems[item_name] = nil
		return true
	end
	return false, "Item doesn't exist"
end

return ShopManager
	
