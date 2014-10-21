@students= []
@width =50
def print_header
	puts "The students of my cohort at Makers Academy".center(@width)
	puts "-----------".center(@width)
end
#ADD SORTING BY NAME WITHIN COHORT SORT
def print_student_list(students)
	students_by_cohort = students.sort_by {|a| a[:cohort]}
	students_by_cohort.each do |student|
		puts "#{student[:name]} (#{student[:cohort]}) cohort".center(@width)
	end
end

def print_footer(names)
	if names.length == 1
		puts "Overall, we have #{names.length} great student".center(@width)
	else
		puts "Overall, we have #{names.length} great students".center(@width)
	end
end

def ask_student_name
	puts "Please enter the name of the students".center(@width)
	puts "To finish, just hit return twice".center(@width)
	name = STDIN.gets.chomp
	@name = name.capitalize
end

def ask_cohort
	puts "What cohort is the student in?".center(@width)
	cohort=STDIN.gets.chomp
	until Date::MONTHNAMES.include?(cohort.capitalize) || cohort.empty?
		puts "Please enter again what cohort is the student in?".center(@width)
		cohort=STDIN.gets.chomp
		cohort = cohort.downcase
	end

	if cohort.empty? 
		@cohort = :november
	else 
		@cohort = cohort.to_sym
	end
end

def ask_other_info
	puts "What are the student's hobbies?".center(@width)
		@hobbies = STDIN.gets.chomp
		puts "Where is the student's country of birth?".center(@width)
		@origin = STDIN.gets.chop
		puts "What is the students height?".center(@width)
		@height = STDIN.gets.chomp
end

def input_students
	require 'date'
	ask_student_name
	while !@name.empty? do
		ask_cohort
		ask_other_info
		add_student(@name, @cohort)
		if @students.length == 1
			puts "Now we have #{@students.length} student".center(@width)
		else
			puts "Now we have #{@students.length} students".center(@width)
		end
		ask_student_name
	end
	@students
end

def print_menu
	puts "1. Input students"
    puts "2. Show students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

def save_students
  File.open("students.csv", "a") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file << csv_line + "\n"
  end
  end
end

def add_student(name, cohort)
  @students << {:name => name, :cohort => cohort.to_sym}
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    add_student(@name, @cohort)
  end
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process(selection)
	case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
    	save_students
    when "4"
    	load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
 loop do
   print_menu
   process(STDIN.gets.chomp)
  end
end

file = File.open(__FILE__,"r")
code =file.read
puts code
file.close

try_load_students
interactive_menu