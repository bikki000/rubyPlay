require_relative "ruby11_number_translator"

prompt = "> "
num = Number_Translator.new("number_names.txt")

puts "Enter name of a number (1-10)"
print prompt
number_name = $stdin.gets.chomp

num.synonym(number_name)