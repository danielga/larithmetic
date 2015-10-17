local __float = {}
__float.__index = __float

function __float:__tostring()
	return tostring(self.value)
end

function __float:type()
	return arithmetic.node_terminal
end

function __float:value_type()
	return arithmetic.value_float
end

function __float:get_value()
	return self.value
end

function __float:calculate()
	return self.value
end

function arithmetic.float(fp)
	return setmetatable({value = fp}, __float)
end

return arithmetic.float
