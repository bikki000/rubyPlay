require "prawn"

module Document
	class Pdf
		def self.generate(filename, content)
			puts "creating #{filename}.pdf"
			Prawn::Document.generate(filename) do
				text content
			end
			puts "#{filename}.pdf created"
		end
	end

	class Plain_text
		def self.generate(filename, content)
			puts "creating #{filename}.txt"
			file = open(filename, 'w')
			file.write(content)
			puts "#{filename}.txt created"
		end
	end
end