local __stack = {}
__stack.__index = __stack

function __stack:__tostring()
	local str = "{"
	for i = 1, self:size() do
		str = (i ~= 1 and str .. ", " or str) .. tostring(self.table[i])
	end

	return str .. "}"
end

function __stack:size()
	return #self.table
end

function __stack:empty()
	return self:size() == 0
end

function __stack:push(item)
	self.table[self:size() + 1] = item
end

function __stack:top()
	return self.table[self:size()]
end

function __stack:pop()
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
