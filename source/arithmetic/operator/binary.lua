local __binop = {__index = {}}
local __binop_index = __binop.__index

function __binop:__tostring()
	return tostring(self.left) .. arithmetic.operator.translation[self.value] .. tostring(self.right)
end

function __binop_index:type()
	return arithmetic.node_intermediary
end

function __binop_index:value_type()
	return arithmetic.value_binary_operator
end

function __binop_index:get_value()
	return self.value
end

function __binop_index:calculate()
	return arithmetic.operator.action[self.value](self.left:calculate(), self.right:calculate())
end

function arithmetic.operator.binary(op, left, right)
	return setmetatable({value = op, left = left, right = right}, __binop)
end

return arithmetic.operator.binary
