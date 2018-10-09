class Number_Translator
	@numbers_data
	def initialize(data_file_name)
		data_file = open(data_file_name)
		@numbers_data = numbers_data_structure(data_file.read)
		data_file.close
	end

	def print_data
		@numbers_data.each do |numbers_hash|
			numbers_hash.each do |key, value|
				print "#{key}=>#{value}, "
			end
			puts ""
		end
	end

	def numbers_data_structure(numbers_data_string)
		numbers = []
		numbers_data_2d_array(numbers_data_string).map.with_index do |numbers_array, i|
			numbers[i] = {}
			numbers_array.map.with_index do |number, j|
				numbers[i]["#{j}"] = "#{number}"
				numbers[i]["#{number}"] = "#{j}"
			end
		end
		numbers
	end

	def find(number_name)
		number_name = number_name.to_s
		@numbers_data.each_with_index do |number_hash, i|
			if number_hash.key?(number_name)
				return i, number_hash[number_name].to_i
			end
		end
		return -1
	end

	def language(number)
		i, j = find(number)
		if i >= 0
			@numbers_data[i]["0"]
		else
			i
		end
	end

	def info_about(number)
		i, j = find(number)
		if i>= 0
			puts "#{number} is #{language(number)} word, a number equal to #{j}"
		else
			puts "#{numbers} not found in database"
		end
	end

	def synonym(number)
		i, j = find(number)
		if i < 0
			puts "#{number} not found in database"
			return
		end

		info_about(number)
		@numbers_data.each_with_index do |numbers_hash, index|
			if index == i
				next
			end
			in_language = @numbers_data[index]["0"]
			synonym_number = @numbers_data[index]["#{j}"]
			puts "in #{in_language}, it is called #{synonym_number}"
		end
	end

	private
	def numbers_data_2d_array(numbers_data_string)
		numbers_2d_array = numbers_data_string.split("\n").map do |language_numbers|
			language_numbers.split(" ")
		end
	end

end