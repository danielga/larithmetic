local __stack = {__index = {}}
local __stack_index = __stack.__index

function __stack:__tostring()
	local str = "{"
	for i = 1, self:size() do
		str = (i ~= 1 and str .. ", " or str) .. tostring(self.table[i])
	end

	return str .. "}"
end

function __stack_index:size()
	return #self.table
end

function __stack_index:empty()
	return self:size() == 0
end

function __stack_index:push(item)
	self.table[self:size() + 1] = item
end

function __stack_index:top()
	return self.table[self:size()]
end

function __stack_index:pop()
	local size = self:size()
	if size == 0 then
		return
	end

	local item = self.table[size]
	self.table[size] = nil
	return item
end

function arithmetic.stack()
	return setmetatable({table = {}}, __stack)
end

return arithmetic.stack
