local __variable = {__index = {}}
local __variable_index = __variable.__index

function __variable:__tostring()
	return self.value
end

function __variable_index:type()
	return arithmetic.node_terminal
end

function __variable_index:value_type()
	return arithmetic.value_variable
end

function __variable_index:get_value()
	return self.value
end

function __variable_index:calculate()
	return 0
end

function arithmetic.variable(var)
	return setmetatable({value = var}, __variable)
end

return arithmetic.variable
