-- tiny test script

require("arithmetic")

print(arithmetic.parser():parse("-3+4*2 / ( 1 - 5 ) ^ 2 ^ 3"):calculate())
print(arithmetic.parser():parse("-1-1"):calculate())
