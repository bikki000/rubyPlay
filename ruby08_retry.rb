i = 0

begin
	i += 1
	puts "Attempt ##{i}"

	raise RuntimeError
rescue RuntimeError => e
	puts "Attemp fail"
	puts ""
	retry if i < 3
end
puts "Attemp Success"	