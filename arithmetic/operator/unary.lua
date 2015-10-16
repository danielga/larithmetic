local __unaop = {}
__unaop.__index = __unaop

function __unaop:__tostring()
	return arithmetic.operator.translation[self.value] .. tostring(self.expression)
end

function __unaop:type()
	return arithmetic.node_intermediary
end

function __unaop:value_type()
	return arithmetic.value_unary_operator
end

function __unaop:get_value()
	return self.value
end

function __unaop:calculate()
	return arithmetic.operator.action[self.value](self.expression:calculate())
end

function arithmetic.operator.unary(op, expression)
	return setmetatable({value = op, expression = expression}, __unaop)
end

return arithmetic.operator.unary
