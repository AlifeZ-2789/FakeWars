local Frame = script.Parent
local Buy = Frame.Buy
local Data = Frame.Data

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

local currentThread = coroutine.create(function()
	while true do
		task.wait()
		
	end
end)
