class Post
	attr_accessor :title, :content, :author, :publish_date;

	def initialize(title, content, author, publish_date)
		@title = title
		@content = content
		@author = author
		@publish_date = publish_date
	end

	def block_inspect
		self.instance_variables.each do |instance_variable|
			instance_variable_name = instance_variable.to_s.sub('@', '')
			yield(instance_variable_name, self.instance_variable_get(instance_variable)) if block_given?
			# puts instance_variable_name
		end
	end

end

post = Post.new("Harry Potter", "The chamber of secret", "J. K. Rowling", "2018-09-23")
post.block_inspect do |variable_name, variable_value|
	puts "#{variable_name} : #{variable_value}"
end
post.block_inspect
