def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return three times"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the nationality of the student"
  nationality = gets.chomp
  puts "Please enter the favourite sport of the student"
  sport = gets.chomp
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, nationality: nationality, sport: sport }
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Let's enter a new student: name?"
    name = gets.chomp
    if name == "" 
      break
    end
    puts "nationality?"
    nationality = gets.chomp
    puts "sport?"
    sport = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  student_count = 0
  until student_count == students.count
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort), nationality: #{student[:nationality]}, favourite sport: #{student[:sport]}"
        if student_count == students.count
          break
        end
    student_count += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# finally, we call the methods
print_header
print(students)
print_footer(students)
