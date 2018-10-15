require "csv"
file_name = "resumes.csv"
data = CSV.read(file_name, headers: true)
puts data.inspect

names = data["name"]
names.each {|name| puts name}
data.each do |row|
	puts row.inspect
end