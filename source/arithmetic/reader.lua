local __reader = {}
__reader.__index = __reader

function __reader:tell()
	return self.offset
end

function __reader:seek(offset)
	if offset > #self.data then
		offset = #self.data + 1
	end

	self.offset = offset
end

function __reader:eof()
	return self.data == nil or self.offset > #self.data
end

function __reader:get()
	return self.data
end

function __reader:set(data)
	self.data = data
	self.offset = 1
end

function __reader:read(num)
	if self:eof() then
		return
	end

	num = math.min(num or 1, #self.data - self.offset + 1)
	local data = string.sub(self.data, self.offset, self.offset + num - 1)
	self.offset = self.offset + num
	return data
end

function __reader:peek(num)
	if self:eof() then
		return
	end

	num = math.min(num or 1, #self.data - self.offset + 1)
	return string.sub(self.data, self.offset, self.offset + num - 1)
end

function arithmetic.reader(str)
	return setmetatable({data = str, offset = 1}, __reader)
end

return arithmetic.reader
