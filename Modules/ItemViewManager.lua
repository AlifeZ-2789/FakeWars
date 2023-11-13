local ItemViewManager = {Views = _G.itemViews or {}}

function ItemViewManager:getPreviewName(item_name)
	local result = ""
	local segments = item_name:split("_")
	for i,v in pairs(segments) do
		local first = v:sub(1,1):upper()
		local rest = v:sub(2)
		local segment = first..rest
		result ..= segment .. " "
	end
	return result:sub(1,-2)
end

function ItemViewManager:getView(item_name)
	local id = ItemViewManager.Views[item_name]
	if id then
		local ImgLabel = Instance.new("ImageLabel")
		ImgLabel.Image = "rbxasset://" .. id
		ImgLabel.Size = Udim2.new(1,0,1,0)
		ImgLabel.BackgroundTransparency = 1
		return ImgLabel
	end
	local Text = Instance.new("TextLabel")
	Text.Text = ItemViewManager:getPreviewName(item_name)
	Text.Font = Enum.Font.Code
	Text.TextScaled = true
	Text.RichText = true
	Text.Size = Udim2.new(1,0,1,0)
	Text.BackgroundTransparency = 1
	return Text
end

return ItemViewManager
