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
	width =50
	puts "The students of my cohort at Makers Academy".center(width)
	puts "-----------".center(width)
end

def print(students)
	width =50
	students_by_cohort = students.sort_by {|a| a[:cohort]}
	students_by_cohort.each do |student|
		puts "#{student[:name]} (#{student[:cohort]}) cohort".center(width)
	end
end

def print_footer(names)
	width =50
	puts "Overall, we have #{names.length} great students".center(width)
end

def input_students
	require 'date'
	width =50
	puts "Please enter the name of the students".center(width)
	puts "To finish, just hit return twice".center(width)
	students = []
	name = gets.chomp
	name = name.capitalize
	while !name.empty? do
		puts "What cohort is the student in?".center(width)
		cohort=gets.chomp
			until Date::MONTHNAMES.include?(cohort.capitalize) || cohort.empty?
				puts "Please eneter again what cohort is the student in?".center(width)
				cohort=gets.chomp
				cohort = cohort.downcase
			end

			if cohort.empty? 
				cohort = :november
			else 
				cohort = cohort.to_sym
			end
		puts "What are the student's hobbies?".center(width)
		hobbies = gets.chomp
		puts "Where is the student's country of birth?".center(width)
		origin = gets.chomp
		puts "What is the students height?".center(width)
		height = gets.chomp
		students << {:name => name, :cohort => cohort, :hobbies => hobbies, :origin=>origin, :height=> height}
		puts "Now we have #{students.length} students".center(width)
		puts "Please enter the name of the students".center(width)
		puts "To finish, just hit return twice".center(width)
		name = gets.chomp
		name = name.capitalize
	end
	students
end

students = input_students
print_header
print(students)
print_footer(students)
