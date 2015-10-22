-- fix the intermediary representation of data
-- using numbers, and strings for operators is ridiculous

local __parser = {__index = {}}
local __parser_index = __parser.__index

function __parser_index:first_pass(str)
	local outqueue = arithmetic.queue()
	local tempstack = arithmetic.stack()
	local reader = arithmetic.reader(str)
	local cur = reader:read()
	local nline, ncol = 1, 1
	local last
	while cur ~= nil do
		local read = true
		if cur == " " or cur == "\t" then
			-- do nothing and break processing
		elseif cur == "\n" then
			nline = nline + 1
			ncol = 0
		elseif cur >= "0" and cur <= "9" then
			local num = cur
			last = cur
			cur = reader:read()
			ncol = ncol + 1
			local dotted = false
			while cur ~= nil and ((cur >= "0" and cur <= "9") or cur == ".") do
				if cur == "." then
					if dotted then
						return nil, "badly formatted number (multiple dots)", ncol
					else
						dotted = true
					end
				end

				num = num .. cur
				last = cur
				cur = reader:read()
				ncol = ncol + 1
			end

			outqueue:push(tonumber(num))
			read = false
		elseif arithmetic.operator.translation[cur] ~= nil then
			local trac = arithmetic.operator.translation[cur]

			if (cur == "+" or cur == "-") and (last == nil or arithmetic.operator.translation[last] ~= nil or last == "(") then
				cur = cur == "+" and "#" or "_"
			else
				local top = tempstack:top()
				local trat = arithmetic.operator.translation[top]
				while top ~= nil and trat ~= nil do
					if (arithmetic.operator.associativity[trac] == arithmetic.operator.left and arithmetic.operator.precedence[trac] > arithmetic.operator.precedence[trat]) or
						(arithmetic.operator.associativity[trac] == arithmetic.operator.right and arithmetic.operator.precedence[trac] >= arithmetic.operator.precedence[trat]) then
						break
					end

					tempstack:pop()
					outqueue:push(top)

					top = tempstack:top()
					trat = arithmetic.operator.translation[top]
				end
			end

			tempstack:push(cur)
		elseif cur == "(" then
			tempstack:push(cur)
		elseif cur == ")" then
			local top = tempstack:pop()
			while top ~= "(" do
				if top == nil then
					return nil, "mismatched parenthesis", ncol
				end

				outqueue:push(top)
				top = tempstack:pop()
			end
		else
			return nil, "unrecognized character", ncol
		end

		if read then
			last = (cur ~= " " and cur ~= "\t") and cur or last
			cur = reader:read()
			ncol = ncol + 1
		end
	end

	local top = tempstack:pop()
	while top ~= nil do
		if top == "(" or top == ")" then
			return nil, "mismatched parenthesis", ncol
		end

		outqueue:push(top)
		top = tempstack:pop()
	end

	return outqueue
end

function __parser_index:second_pass(queue)
	local tempstack = arithmetic.stack()

	local top = queue:pop()
	while top ~= nil do
		if type(top) == "number" then
			tempstack:push(arithmetic.float(top))
		else
			local tra = arithmetic.operator.translation[top]
			if arithmetic.operator.arity[tra] == 2 then
				local second, first = tempstack:pop(), tempstack:pop()
				tempstack:push(arithmetic.operator.binary(tra, first, second))
			else
				tempstack:push(arithmetic.operator.unary(tra, tempstack:pop()))
			end
		end

		top = queue:pop()
	end

	return tempstack:pop()
end

function __parser_index:parse(str)
	if str == nil or #str == 0 then
		return nil
	end

	local queue, err, col = self:first_pass(str)
	if queue == nil then
		return nil, err, col
	end

	return self:second_pass(queue)
end

function arithmetic.parser()
	return setmetatable({}, __parser)
end

return arithmetic.parser
