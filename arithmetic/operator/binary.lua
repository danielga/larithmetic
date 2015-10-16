local __binop = {}
__binop.__index = __binop

function __binop:__tostring()
	return tostring(self.left) .. arithmetic.operator.translation[self.value] .. tostring(self.right)
end

function __binop:type()
	return arithmetic.node_intermediary
end

function __binop:value_type()
	return arithmetic.value_binary_operator
end

function __binop:get_value()
	return self.value
end

function __binop:calculate()
	return arithmetic.operator.action[self.value](self.left:calculate(), self.right:calculate())
end

function arithmetic.operator.binary(op, left, right)
	return setmetatable({value = op, left = left, right = right}, __binop)
end

return arithmetic.operator.binary
