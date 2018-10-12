require_relative 'ruby14_dynamic_initialization'


class Experience
	include Dynamic_Property
end

class Qualification
	include Dynamic_Property
end

class Skill
	include Dynamic_Property
end

class Course
	include Dynamic_Property
end


class Resume

	attr_accessor :name, :address, :e_mail, :contact_number, :objective, :experiences, :qualifications, :skills, :courses 

	def initialize(resume_fields)
		@name = resume_fields[:name]
		@address = resume_fields[:address]
		@e_mail = resume_fields[:e_mail]
		@contact_number = resume_fields[:contact_number]
		@objective = resume_fields[:objective]

		@experiences = []
		resume_fields[:experiences].each { |experience| @experiences << Experience.new(experience) }

		@qualifications = []
		resume_fields[:qualifications].each { |qualification| @qualifications << Qualification.new(qualification)}

		@skills = []
		resume_fields[:skills].each {|skill| @skills << Skill.new(skill)}

		@courses = []
		resume_fields[:courses].each { |course| @courses << Course.new(course)}
	end
	# def initialize(name, address, e_mail, contact_number, objective, experiences, qualifications, skills, courses)
	# 	@name = name;
	# 	@address = address
	# 	@e_mail = e_mail
	# 	@contact_number = contact_number
	# 	@objective = objective
	# 	@experiences = []
	# 	experiences.each { |experience| @experiences << Experience.new(experience) }
	# 	@qualifications = []
	# 	qualifications.each { |qualification| @qualifications << Qualification.new(qualification)}
	# 	@skills = Skill.new(skills)
	# 	@courses = []
	# 	courses.each { |course| @courses << Course.new(course)}
	# end

	def to_csv_this elements
		elements_in_csv = ""
		if elements.respond_to?("each")
			elements.each do |element|
				elements_in_csv += element.to_a.join(':')
				elements_in_csv += ";"
			end
			# substring from index 0 to second last character
			elements_in_csv[0..-2]
		elsif elements.respond_to?("to_a")
			elements_in_csv = elements.to_a.join(":")
		else
			elements
		end
	end

	def to_csv_s
		resume_in_csv = ""
		instance_variables.each do |instance_variable|
			resume_in_csv = resume_in_csv + to_csv_this(instance_variable_get(instance_variable)) + ","
		end
		resume_in_csv[0..-2]
	end

	def to_csv_a
		to_csv_s.split(",")
	end

	def to_s
		instance_variables_data_array = []
		instance_variables.each do |instance_variable|
			if instance_variable_get(instance_variable).respond_to?('each')
				data = instance_variable_get(instance_variable)
				data.each do |datum|
					instance_variables_data_array << datum
				end
			else
				instance_variables_data_array << instance_variable_get(instance_variable)
			end
		end
		instance_variables_data_array
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

# resume = Resume.new("Tanveer", "Bhubaneswar", "tnvr000@gmail.com", "8594976909", 
# 	"to grow", exps, qualifications, skills, courses)
# resume.to_s.each do |field|
# 	puts field.to_s
# 	puts ""
# end

# puts resume.to_csv_this(resume.name)

# puts resume.skills.class
# p resume.to_csv_a