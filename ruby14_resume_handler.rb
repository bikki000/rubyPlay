require "csv"
require_relative "ruby14_resume"

class Resume_Handler
	def initialize
		@database_name = "resumes.csv"
		if File.zero?(@database_name)
			headers = %w[name address e_mail contact_number objective experiences qualifications skills courses]
			data_file = CSV.open(@database_name, 'w')
			data_file << headers
			data_file.close
		end
	end

	def build (resume_fields)
		# puts resume_fields.class, resume_fields
		@resume = Resume.new(resume_fields)
		save
	end

	def save
		table = CSV.open(@database_name, 'a')
		table << @resume.to_csv_a
		table.close
	end

end




exps = [
	["Solarasis", "Intern", "3 Month"],
	["Mindfire Solutions", "Junior Software Engineer", "3 Years"]
]

qualifications = [
	["b.tect", "Kec", "67", "2014", "4"],
	["+2", "KV", "84", "2012", "2"],
	["10", "KV", "91", "2010", "2"]
]

skills = ["java", "C#"]

courses = [
	["java", "Seenet", "2 Months"],
	["C#", "Naresh IT", "3 Month"]
]
handler = Resume_Handler.new

# handler.build("Tanveer", "Bhubaneswar", "tnvr000@gmail.com", "8594976909", 
# 	"to grow", exps, qualifications, skills, courses)
# handler.save
