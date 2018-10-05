require_relative "ruby01_doc_gen"
prompt = "> "

puts "What do you want to create\n1 : Text file\n2 : PDF file"
print prompt

file_type = $stdin.gets.chomp

puts "Enter the name of the file"
print prompt

filename = $stdin.gets.chomp

puts "Enter the content and hit ENTER/RETURN"
print prompt

file_content = $stdin.gets.chomp

case file_type
when "1"
	Document::Plain_text.generate(filename, file_content)
when "2"
	Document::Pdf.generate(filename, file_content)
else
	puts "Not a supportable filr type"
end