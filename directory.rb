=begin
students =[
{:name =>"Dr. Hannibal Lecter", :cohort=> :november},
{:name =>"Darth Vader", :cohort=> :november},
{:name =>"Nurse Ratched", :cohort=> :november},
{:name =>"Michael Corleone", :cohort=> :november},
{:name =>"Alex De Large", :cohort=> :november},
{:name =>"The Alien", :cohort=> :november},
{:name =>"Terminator", :cohort=> :november},
{:name =>"Freddy Kruger", :cohort=> :november},
{:name=>"The Joker", :cohort=> :november}
]



=end


def print_header
puts "The students of my cohort at Makers Academy"
puts "-----------"
end

def print(students)
students.each_with_index do |student, index| 
	if  student[:name].match('^A')
	puts "#{index+1}.#{student[:name]} (#{student[:cohort]}) cohort"
	end
end
end

def print_footer(names)
puts "Overall, we have #{names.length} great students"
end

def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	students = []
	name = gets.chomp
	name = name.capitalize
	while !name.empty? do 
		students << {:name => name, :cohort => :november}
		puts "Now we have #{students.length} students"
		name = gets.chomp
		name = name.capitalize
	end
	students
end

students = input_students
print_header
print(students)
print_footer(students)

