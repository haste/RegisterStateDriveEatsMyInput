local header = CreateFrame('Frame', 'RegisterStateDriverEatsMyInput', UIParent, 'SecureGroupHeaderTemplate')
header:SetPoint('LEFT', 150, 0)
header:SetAttribute('showSolo', true)
header:SetAttribute('template', 'SecureUnitButtonTemplate')
header:SetAttribute('initialConfigFunction', [[
	self:SetHeight(64)
	self:SetWidth(64)

	self:SetAttribute('type1', 'target')

	-- So we can actually do something useful with it:
	self:GetParent():CallMethod('Fluff', self:GetName())
]])

function header:Fluff(frame, ...)
	frame = _G[frame]

	frame:HookScript('OnClick', function(...)
		print('OnClick', ...)
	end)

	frame:HookScript('OnMouseDown', function(...)
		print('OnMouseDown', ...)
	end)

	frame:HookScript('OnMouseUp', function(...)
		print('OnMouseUp', ...)
	end)

	local bg = frame:CreateTexture()
	bg:SetTexture(0, 1, 1)
	bg:SetAllPoints(frame)
end

header:HookScript('OnAttributeChanged', function(...)
	print('OnAttributeChanged', ...)
end)

-- RegisterStateDriver is the reason our OnMouseUp and OnClick get absorbed once
-- in a while.
-- header:Show()
RegisterStateDriver(header, 'visibility', '[@player,exists] show; hide')
