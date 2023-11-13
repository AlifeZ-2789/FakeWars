local Frame = script.Parent
local Buy = Frame.Buy
local Data = Frame.Data


local ItemView = Frame.ItemView
local ItemNameLabel = Frame.ItemName
local ItemQuantity = Frame.ItemQuantity
local Cost = Frame.Cost


local data = ShopManager:getItem("wool_white")

Data.OnInvoke = function(_data)
	if _data then
		data = _data
	end
	return data
end

Buy.OnInvoke = function()
	ShopEvent:FireServer(data.item_name)
end

local function clearView() end

local lastData = data

local currentThread = coroutine.create(function()
	while true do
		task.wait()
		if lastData == nil or lastData == data then continue end
		
	end
end)
