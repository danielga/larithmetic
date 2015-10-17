arithmetic = {}

arithmetic.node_intermediary = 1
arithmetic.node_terminal = 2

arithmetic.value_integer = 1
arithmetic.value_float = 2
arithmetic.value_variable = 3
arithmetic.value_binary_operator = 4
arithmetic.value_unary_operator = 5

require("arithmetic.integer")
require("arithmetic.float")
require("arithmetic.variable")
require("arithmetic.operator")
require("arithmetic.stack")
require("arithmetic.queue")
require("arithmetic.reader")
require("arithmetic.parser")
