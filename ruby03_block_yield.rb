def print_once
	yield
	puts ""
end

def print_twice
	yield
	yield
	puts ""
end

def print_twice_index
	yield 1
	yield 2
	puts ""
end

def print_twice_double_index
	yield 1, 1
	yield 1, 2
	print ""
end

print_once do 
	puts "(print_once) said Block is being run."
end

print_once do
	puts "(print_once) said Block is running again."
	puts "Wait! what?"
end

print_twice do
	puts "(print_twice) said Block is running twice"
end

print_twice_index do |num|
	puts "print_twice_index said Block is being run for time(s) #{num}"
end

print_twice_double_index do |blockNum, times|
	puts "print_twice_double_index said Block #{blockNum} is being run for times #{times}"
end
