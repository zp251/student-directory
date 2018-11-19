def input_students
  students = []

  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.tr("\n\r", "")
  puts "Please enter the cohort of the student"
  cohort = gets.tr("\n\r", "")

  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"

    puts "Let's enter a new student: name?"
    name = gets.tr("\n\r", "")

    if name == ""
      break
    end

    puts "cohort?"
    cohort = gets.tr("\n\r", "")
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  cohorts = []

    students.each do |student| cohorts.push(student[:cohort])
    end

      cohorts.uniq.each do |cohort|
        puts "Cohort: #{cohort}"
        students.map do |student|
          if student[:cohort] == cohort
            puts student[:name]
          end
        end
      end
end


def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
# finally, we call the methods
if students.empty?
  puts "There is no student!"
else
print_header
print(students)
print_footer(students)
end
