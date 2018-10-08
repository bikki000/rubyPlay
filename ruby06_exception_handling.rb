begin 
	3 / 0
rescue ZeroDivisionError => e 
	puts "#{e.class} #{e.message}"
end

begin
	"String".odd?
rescue NoMethodError => e
	puts "#{e.class} : #{e.message}"
end

div = $stdin.gets.chomp.to_i

begin
	puts "#{10 / div}"
	puts "#{"String".odd?}"
rescue ZeroDivisionError => e
	puts "#{e.class} : #{e.message}"
rescue NoMethodError => e
	puts "#{e.class} : #{e.message}"
end
