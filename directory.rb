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

@students= []

def print_header
	width =50
	puts "The students of my cohort at Makers Academy".center(width)
	puts "-----------".center(width)
end
#ADD SORTING BY NAME WITHIN COHORT SORT
def print_student_list(students)
	width =50
	students_by_cohort = students.sort_by {|a| a[:cohort]}
	students_by_cohort.each do |student|
		puts "#{student[:name]} (#{student[:cohort]}) cohort".center(width)
	end
end

def print_footer(names)
	width =50
	if names.length == 1
		puts "Overall, we have #{names.length} great student".center(width)
	else
		puts "Overall, we have #{names.length} great students".center(width)
	end
end
#CAPITALIZE FULL NAME
def input_students
	require 'date'
	width =50
	puts "Please enter the name of the students".center(width)
	puts "To finish, just hit return twice".center(width)
	name = gets.chomp
	name = name.capitalize
	while !name.empty? do
		puts "What cohort is the student in?".center(width)
		cohort=gets.chomp
			until Date::MONTHNAMES.include?(cohort.capitalize) || cohort.empty?
				puts "Please enter again what cohort is the student in?".center(width)
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
		origin = gets.chop
		puts "What is the students height?".center(width)
		height = gets.chomp
		@students << {:name => name, :cohort => cohort, :hobbies => hobbies, :origin=>origin, :height=> height}
		if @students.length == 1
			puts "Now we have #{@students.length} student".center(width)
		else
			puts "Now we have #{@students.length} students".center(width)
		end
		puts "Please enter the name of the students".center(width)
		puts "To finish, just hit return twice".center(width)
		name = gets.chomp
		name = name.capitalize
	end
	@students
end

def print_menu
   puts "1. Input students"
    puts "2. Show students"
    puts "9. Exit"
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file << csv_line + "\n"
  end
  file.close
end

def process(selection)
	case selection
    when "1"
      input_students
      save_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
 loop do
   print_menu
   process(gets.chomp)
  end
end

interactive_menu
