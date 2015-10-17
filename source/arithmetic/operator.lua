arithmetic.operator = {}

arithmetic.operator.add = 1
arithmetic.operator.sub = 2
arithmetic.operator.mul = 3
arithmetic.operator.div = 4
arithmetic.operator.mod = 5
arithmetic.operator.pow = 6
arithmetic.operator.unp = 7
arithmetic.operator.unm = 8

arithmetic.operator.translation = {
	[arithmetic.operator.add] = "+",
	[arithmetic.operator.sub] = "-",
	[arithmetic.operator.mul] = "*",
	[arithmetic.operator.div] = "/",
	[arithmetic.operator.mod] = "%",
	[arithmetic.operator.pow] = "^",
	[arithmetic.operator.unp] = "+",
	[arithmetic.operator.unm] = "-",

	["+"] = arithmetic.operator.add,
	["-"] = arithmetic.operator.sub,
	["*"] = arithmetic.operator.mul,
	["/"] = arithmetic.operator.div,
	["%"] = arithmetic.operator.mod,
	["^"] = arithmetic.operator.pow,
	["#"] = arithmetic.operator.unp, -- only for internal usage
	["_"] = arithmetic.operator.unm  -- only for internal usage
}

arithmetic.operator.precedence = { -- pretty meaningless numbers, allows for adding other precedences in the middle
	[arithmetic.operator.add] = 20,
	[arithmetic.operator.sub] = 20,
	[arithmetic.operator.mul] = 40,
	[arithmetic.operator.div] = 40,
	[arithmetic.operator.mod] = 60,
	[arithmetic.operator.pow] = 80,
	[arithmetic.operator.unp] = 100,
	[arithmetic.operator.unm] = 100
}

arithmetic.operator.left = 1
arithmetic.operator.right = 2

arithmetic.operator.associativity = {
	[arithmetic.operator.add] = arithmetic.operator.left,
	[arithmetic.operator.sub] = arithmetic.operator.left,
	[arithmetic.operator.mul] = arithmetic.operator.left,
	[arithmetic.operator.div] = arithmetic.operator.left,
	[arithmetic.operator.mod] = arithmetic.operator.right,
	[arithmetic.operator.pow] = arithmetic.operator.right,
	[arithmetic.operator.unp] = arithmetic.operator.right,
	[arithmetic.operator.unm] = arithmetic.operator.right
}

arithmetic.operator.action = {
	[arithmetic.operator.add] = function(left, right) return left + right end,
	[arithmetic.operator.sub] = function(left, right) return left - right end,
	[arithmetic.operator.mul] = function(left, right) return left * right end,
	[arithmetic.operator.div] = function(left, right) return left / right end,
	[arithmetic.operator.mod] = function(left, right) return left % right end,
	[arithmetic.operator.pow] = function(left, right) return left ^ right end,
	[arithmetic.operator.unp] = function(expression) return expression end,
	[arithmetic.operator.unm] = function(expression) return -expression end
}

arithmetic.operator.arity = {
	[arithmetic.operator.add] = 2,
	[arithmetic.operator.sub] = 2,
	[arithmetic.operator.mul] = 2,
	[arithmetic.operator.div] = 2,
	[arithmetic.operator.mod] = 2,
	[arithmetic.operator.pow] = 2,
	[arithmetic.operator.unp] = 1,
	[arithmetic.operator.unm] = 1
}

require("arithmetic.operator.binary")
require("arithmetic.operator.unary")
