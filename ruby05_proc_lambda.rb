proc1 = Proc.new do
	puts "This is a proc"
end
proc2 = proc do |num1, num2|
	puts "Argument: Expected=2, Given=0, Damn given=none"
end
sad_soul = proc {puts "No one thinks about me. Do any one?"}


say_something = ->{puts "This is a lambda"}


def receptive(p)
	p.call if p != nil
	puts "I, the receptive"
	puts ""
end

def proc_collector(p)
	p.call
	puts "#{p.object_id} is added in collection"
	puts ""
end

def proc_distributor
	proc {puts "This is a proc. Again"}
end

proc1.call
proc2.call
say_something.call
receptive(sad_soul)
proc_collector(proc_distributor)