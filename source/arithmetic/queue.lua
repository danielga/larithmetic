local __queue = {__index = {}}
local __queue_index = __queue.__index

function __queue:__tostring()
	local str = "{"
	for i = 1, self:size() do
		str = (i ~= 1 and str .. ", " or str) .. tostring(self.table[i])
	end

	return str .. "}"
end

function __queue_index:size()
	return #self.table
end

function __queue_index:empty()
	return self:size() == 0
end

function __queue_index:push(item)
	self.table[self:size() + 1] = item
end

function __queue_index:top()
	return not self:empty() and self.table[1]
end

function __queue_index:pop()
	if self:empty() then
		return
	end

	local item = self.table[1]
	table.remove(self.table, 1)
	return item
end

function arithmetic.queue()
	return setmetatable({table = {}}, __queue)
end

return arithmetic.queue
