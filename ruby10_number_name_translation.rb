data_file_name = "number_names.txt"
file = open(data_file_name)
prompt = "> "

numbers = file.read.split("\n").map do |numbers|
	numbers = numbers.chomp.split(" ")
end

# numbers.each do |number|
# 	number.each do |number|
# 		print "#{number} "
# 	end
# 	puts ""
# end


def get_index_of(key, numbers)
	numbers.each_with_index do |numbers, rowIndex|
		if numbers.include?(key)
			return rowIndex, numbers.index(key)
		end
	end
	return -1, -1
end

puts "Enter name of a number : "
print prompt
number = $stdin.gets.chomp

i, j = get_index_of(number, numbers)

puts "#{i} : #{j}"

puts "#{numbers.index("one")}"

numbers.each_with_index do |number, rowIndex|
	if rowIndex == i
		next
	end
	puts "#{numbers[i][j]} is #{number[j]} in #{number[0]}"
end
