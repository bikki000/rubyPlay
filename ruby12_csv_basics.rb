require 'csv'

customers = CSV.read('customers.csv')
column_name = {name: 0, visits: 1, spent: 2, review: 3}

CSV.foreach('customers.csv') do |row|
	puts row.to_s
end

average_money_spent = []

CSV.foreach('customers.csv', converters: :numeric) do |row|
	average_money_spent << row[column_name[:spent]] / row[column_name[:visits]]
end

puts average_money_spent