require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  def initialize(id = nil,name:, )
  end
end
