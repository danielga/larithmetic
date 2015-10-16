local __integer = {}
__integer.__index = __integer

function __integer:__tostring()
	return tostring(self.value)
end

function __integer:type()
	return arithmetic.node_terminal
end

function __integer:value_type()
	return arithmetic.value_integer
end

function __integer:get_value()
	return self.value
end

function __integer:calculate()
	return self.value
end

function arithmetic.integer(int)
	return setmetatable({value = int}, __integer)
end

return arithmetic.integer
