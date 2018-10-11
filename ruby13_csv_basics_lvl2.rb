require 'csv'

file_name = 'customers.csv'

data = CSV.read(file_name, headers: true)
data.each do |row|
	puts row.to_s
end
puts ""

puts data.headers.join(',')
puts data.first
puts ""

data.each do |row|
	p row[0]
end
puts ""


data.each do |row|
	p row['Name']
end
puts ""

data_file = CSV.open(file_name, 'a')
data_file << ["Eve", 28, 3000, 'pretty good']
data_file.close

data = CSV.read(file_name, headers: true)
data.each do |row|
	puts row.to_s
end



