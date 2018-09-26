require "prawn"

module Document
	class Pdf
		def initialize()
			puts "Object created"
		end

		def self.generate(filename, content)
			puts "creating file"
			Prawn::Document.generate(filename) do
				text content
			end
		end
	end

	class Plain_text
		def initialize()
			puts "Object created"
		end
		def self.generate(filename, content)
			puts "creating file"
			file = open(filename, 'w')
			file.write(content)
		end
	end
	def generate(filename, content)
		puts "creating file"
		file = open(filename, 'w')
		file.write(content)
	end

end