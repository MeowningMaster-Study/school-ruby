class Student
  attr_accessor :name, :surname, :patronymic, :sex, :age, :course

  def initialize(name, surname, patronymic, sex, age, course)
    @name = name
    @surname = surname
    @patronymic = patronymic
    @sex = sex
    @age = age
    @course = course
  end

  # Номер курса з найбільшим процентом чоловіків
  def self.t1(arr)
    # Hash<course, [M, F]>
    stats = Hash.new

    arr.each do |s|
      course = s.course
      i = s.sex == "M" ? 0 : 1
      unless stats.has_key?(course)
        stats[course] = [0, 0]
      end
      stats[course][i] += 1
    end

    max_course = -Float::INFINITY
    max_part = -Float::INFINITY
    stats.each_pair do |course, counts|
      m, f  = counts
      part = m.to_f / (m + f)
      if part > max_part
        max_course = course
        max_part = part
      end
    end

    max_course
  end

  # Найрозповсюдженіші чоловічі та жіночі імена
  def self.t2(arr)
    # [M: Hash<name, count>, F: Hash<name, count>]
    stats = [Hash.new, Hash.new]

    arr.each do |s|
      name = s.name
      i = s.sex == "M" ? 0 : 1
      stats_sex = stats[i]
      unless stats_sex.has_key?(name)
        stats_sex[name] = 0
      end
      stats_sex[name] += 1
    end

    stats.map do |stats_sex|
      max_name = "None"
      max_count = -Float::INFINITY
      stats_sex.each_pair do |name, count|
        if count > max_count
          max_name = name
          max_count = count
        end
      end
      max_name
    end
  end

  # Прізвища в алфавітному порядку
  def self.t3(arr)
    arr.map{|x| x.surname }.sort
  end

  # Ініціали студенток з найрозповсюдженішим віком
  def self.t4(arr)
    # Hash<age, count>
    stats = Hash.new

    arr.each do |s|
      if s.sex == "F"
        age = s.age
        unless stats.has_key?(age)
          stats[age] = 0
        end
        stats[age] += 1
      end
    end

    age_mode = -Float::INFINITY
    max_count = -Float::INFINITY
    stats.each_pair do |age, count|
      if count > max_count
        max_count = count
        age_mode = age
      end
    end

    arr.select { |s| s.sex == "F" && s.age == age_mode }
       .map{ |s| "%s %s. %s." % [s.surname, s.name[0], s.patronymic[0]] }
  end
end

if $PROGRAM_NAME == __FILE__
  arr = [
    Student.new("N_A", "S_A", "P_A", "M", 20, 3),
    Student.new("N_A", "S_C", "P_A", "M", 20, 3),
    Student.new("N_B", "S_F", "P_A", "M", 19, 2),
    Student.new("N_B", "S_B", "P_A", "F", 20, 3),
    Student.new("N_B", "S_D", "P_A", "F", 18, 1),
    Student.new("N_C", "S_B", "P_A", "F", 20, 2),
  ]

  r1 = Student::t1(arr)
  printf("t1: %d\n", r1)

  r2_m, r2_f = Student::t2(arr)
  printf("t2: male -> %s, female -> %s\n", r2_m, r2_f)

  r3 = Student::t3(arr)
  printf("t3: %s\n", r3)

  r4 = Student::t4(arr)
  printf("t4: %s\n", r4)
end
