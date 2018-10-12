module Dynamic_Property
	def initialize(args)
		args.each do |key, value|
			instance_variable_set("@#{key}", value)
		end
	end


	def to_a
		instance_variables_data_array = []
		instance_variables.each do |instance_variable|
			instance_variables_data_array << instance_variable_get(instance_variable)
		end
		instance_variables_data_array
	end

	def to_s
		to_a.join(", ")
	end

	# def self.included(base) # built-in Ruby hook for modules
	# 	base.class_eval do    
	# 		original_method = instance_method(:initialize)
	# 		define_method(:initialize) do |*args, &block|
	# 			original_method.bind(self).call(*args, &block)
	# 			# (your module code here)
	# 			puts "what"
	# 		end
	# 	end
	# end

end