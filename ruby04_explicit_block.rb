def explicit_block(&block)
	block.call #Same as yield. Or is it?
	puts ""
end

def broker_block(&block)
	puts "That way"
	broker_connection do 
		block.call
	end
end

def broker_connection(&block)
	block.call
	puts "You haaaavvvve to make complicated. Don't you"
	puts ""
end

explicit_block do 
	puts "explicit_block : Hey fellas. Have you seen yield somewhere nearby"
end

broker_block do 
	puts "It's a broker I am telling"
end
a = 10
pc = proc do
	puts "#{a}"
end
pc.call

module B
	def func
		puts "Hello M"
	end
end

class A
	def func
		puts "Hello"
	end
end

a = A.new
a.func
puts "#{A.object_id} #{A.class}"
puts "#{B.object_id} #{B.class}"