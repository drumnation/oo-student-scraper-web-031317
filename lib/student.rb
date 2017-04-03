class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute.to_s}=", value)
    end
    @@all << self
    # take in an argument of a hash and use metaprogramming
      # to assign the newly created student attributes and
      # values in accordance with the key/value pairs of the hash
    # also add the newly created student to the Student class' @@all array of all students
    # class variable and set it equal to an empty array at
      # the top of your class and push self into the array at the end
  end

  def self.create_from_collection(students_array)
    students_array.each do |student_hash|
      self.new(student_hash)
    end
    # pass in a hash with the return value of the Scraper.scrape_index_page method as the argument.
    # iterate over the array of hashes and create a new individual student using each hash
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |attribute, value|
      self.send("#{attribute.to_s}=", value)
    end
    self
  end

  def self.all
    @@all
  end
end
