require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, :grade
  def initialize(id = nil,name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      )
      SQL
      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students
    SQL
    DB[:conn].execute(sql)
  end

  def self.create(name,grade)
    student = Student.new(name,grade)
    student.save
    student
  end

  def self.save
    if self.id
      self.update
    else
      sql = <<-SQL
      INSERT INTO students (name,grade)
      VALUES (?,?)
    SQL
    DB[:conn].execute(sql,)
  end
end
