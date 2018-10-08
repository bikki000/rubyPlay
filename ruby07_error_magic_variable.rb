begin
	"string".odd?
rescue NoMethodError => e
	puts "#{$!.class} : #{$!.message}"
	$@.each { |loc| puts loc }

	# Same As
	# puts "#{e.class} : #{e.message}"
	# e.backtrace.each { |loc| puts loc }
end