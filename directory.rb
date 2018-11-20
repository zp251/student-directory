@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
    puts "I don't know that you meant, try again!"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"

  while !name.empty? do
    students_into_array(name, cohort)
    puts "Now we have #{@students.count} students"
    puts "Let's enter a new student: name?"
    name = STDIN.gets.chomp
  end
end

def students_into_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
    @students.each do |student|
      puts " #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    students_into_array(name, cohort)
  end
  file.close
end

def try_load_students
  if ARGV != nil
    filename = ARGV.first
  else
    filename = "students.csv"
  end

  if filename.nil?
    load_students
    puts "Data loaded from default .csv file: there are #{@students.count} students in your current directory."
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    load_students
    puts "Sorry, '#{filename}' does not seem to exist. Loaded data from default .csv file: there are #{@students.count} students in your current directory."
  end
end

try_load_students
interactive_menu
