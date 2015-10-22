local __float = {__index = {}}
local __float_index = __float.__index

function __float:__tostring()
	return tostring(self.value)
end

function __float_index:type()
	return arithmetic.node_terminal
end

function __float_index:value_type()
	return arithmetic.value_float
end

function __float_index:get_value()
	return self.value
end

function __float_index:calculate()
	return self.value
end

function arithmetic.float(fp)
	return setmetatable({value = fp}, __float)
end

return arithmetic.float
