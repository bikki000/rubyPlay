require_relative "ruby14_resume_handler"


class Resume_Handler_Interface
	class << self
		def run
			prompt = "> "
			clear_screen = "clear"
			choice = 0
			while(choice.to_i <= 4)
				print clear_screen
				puts "1 : New\n2 : Show\n3 : Export\n4 : Edit"
				puts "So, what do you want to do with resume"
				print prompt
				choice = $stdin.gets.chomp.strip
				case choice
				when "1"
					@builder = Resume_Handler.new
					@builder.build new_resume
				when "2"
					show_resume
				when "3"
					export_resume
				when "4"
					edit_resume
				else
					bye
				end
			end
		end
		def new_resume
			puts "New Resume implementation is incomplete"
			prompt = "> "
			clear_screen = "clear"
			resume_fields = {}

			print clear_screen
			puts "New Resume"

			puts "Enter Name"
			print prompt
			name = $stdin.gets.chomp.strip

			resume_fields[:name] = name

			puts "\nEnter Address"
			print prompt
			address = $stdin.gets.chomp.strip

			resume_fields[:address] = address

			puts "\nEnter Email address"
			print prompt
			e_mail = $stdin.gets.chomp.strip

			resume_fields[:e_mail] = e_mail

			puts "\nEnter contact number"
			print prompt
			contact_number = $stdin.gets.chomp.strip

			resume_fields[:contact_number] = contact_number

			puts "\nEnter Career objective"
			print prompt
			objective = $stdin.gets.chomp.strip

			resume_fields[:objective] = objective

			# gets experience
			puts "\nDo You have any experience(yes/no) ?"
			print prompt
			choice = $stdin.gets.chomp.strip.downcase
			if choice == "yes"
				experiences = []
				while choice == "yes"
					tempRow = {}
					
					puts "Enter the name of the company"
					print prompt
					company_name = $stdin.gets.chomp.strip
					tempRow[:company_name] = company_name

					puts "Enter the post"
					print prompt
					post = $stdin.gets.chomp.strip
					tempRow[:post] = post

					puts "Enter the duration you work"
					print prompt
					duration = $stdin.gets.chomp.strip
					tempRow[:duration] = duration

					experiences << tempRow
					puts ""
					puts "Do you have more experience(yes/no)?"
					print prompt
					choice = $stdin.gets.chomp.strip.downcase
				end
			else
				experiences = [{}]
			end

			resume_fields[:experiences] = experiences

			# gets qualification
			choice = "yes"
			qualifications = []
			puts "Recall you most recent qualification"
			while choice == "yes"
				tempRow = {}

				puts "Enter name of degree"
				print prompt
				degree_name = $stdin.gets.chomp.strip
				tempRow[:degree_name] = degree_name

				puts "Enter name of institute"
				print prompt
				institute_name = $stdin.gets.chomp.strip
				tempRow[:institute_name] = institute_name

				puts "Enter name of board"
				print prompt
				board_name = $stdin.gets.chomp.strip
				tempRow[:board_name] = board_name

				puts "Enter the batch(year of joining(course))"
				print prompt
				batch_year = $stdin.gets.chomp.strip
				tempRow[:batch_year] = batch_year

				puts "Enter the duration of course"
				print prompt
				course_duration = $stdin.gets.chomp.strip
				tempRow[:course_duration] = course_duration

				puts "Enter percentage obtained(convert CGPA to %)"
				print prompt
				percentage = $stdin.gets.chomp.strip
				tempRow[:percentage] = percentage
				puts ""

				qualifications << tempRow
				puts "Do you have any other qualification(recent first)"
				print prompt
				choice = $stdin.gets.chomp.strip.downcase
			end

			resume_fields[:qualifications] = qualifications

			# gets skills
			puts "Enter all your skills seperated by commas(,)"
			print prompt
			skills_str = $stdin.gets.chomp.strip
			skills = []
			skills_str.split(",").each do |skill|
				skills << {skilled_in: skill.strip}
			end

			resume_fields[:skills] = skills

			# gets all the relavent courses
			puts "Have you done any relevent courses(yes/no)?"
			print prompt
			choice = $stdin.gets.chomp.strip.downcase

			if choice == "yes"
				courses = []
				while choice == "yes"
					tempRow = {}
					
					puts "Enter the name course"
					print prompt
					course_name = $stdin.gets.chomp.strip
					tempRow[:course_name] = course_name

					puts "Enter the name of the institute"
					print prompt
					institute_name = $stdin.gets.chomp.strip
					tempRow[:institute_name] = institute_name

					puts "Enter the duaration of the course"
					print prompt
					duration = $stdin.gets.chomp.strip
					tempRow[:duration] = duration
					puts ""
					
					courses << tempRow

					puts "Have you done any other relevnet course(yes/no)?"
					print prompt
					choice = $stdin.gets.chomp.strip.downcase
				end
			else
				courses = [{}]
			end

			resume_fields[:courses] = courses

			puts ""
			puts "That was it. We got all the required information."
			puts "Here have look at your resume"

			hold = $stdin.gets
			resume_fields
		end

		def show_resume
			puts "Show Resume not implemented yet"
			prompt = "> "
			clear_screen = "clear"
			hold = $stdin.gets
		end

		def export_resume
			puts "Export Resume not implemented yet"	
			prompt = "> "
			clear_screen = "clear"
			hold = $stdin.gets
		end

		def edit_resume
			puts "Edit Resume not implemented yet"
			prompt = "> "
			clear_screen = "clear"
			hold = $stdin.gets
		end

		def bye
			puts "Bye not implemented yet"
			prompt = "> "
			clear_screen = "clear"
			hold = $stdin.gets
		end

	end

end

Resume_Handler_Interface.run