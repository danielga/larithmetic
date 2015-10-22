local __integer = {__index = {}}
local __integer_index = __integer.__index

function __integer:__tostring()
	return tostring(self.value)
end

function __integer_index:type()
	return arithmetic.node_terminal
end

function __integer_index:value_type()
	return arithmetic.value_integer
end

function __integer_index:get_value()
	return self.value
end

function __integer_index:calculate()
	return self.value
end

function arithmetic.integer(int)
	return setmetatable({value = int}, __integer)
end

return arithmetic.integer
