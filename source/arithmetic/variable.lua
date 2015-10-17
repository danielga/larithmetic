local __variable = {}
__variable.__index = __variable

function __variable:__tostring()
	return self.value
end

function __variable:type()
	return arithmetic.node_terminal
end

function __variable:value_type()
	return arithmetic.value_variable
end

function __variable:get_value()
	return self.value
end

function __variable:calculate()
	return 0
end

function arithmetic.variable(var)
	return setmetatable({value = var}, __variable)
end

return arithmetic.variable
