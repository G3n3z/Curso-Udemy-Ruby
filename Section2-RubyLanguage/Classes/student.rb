class Student
  attr_accessor :email, :first_name, :last_name
  @email
  @first_name
  @last_name

  # def first_name=(name)
  #   @first_name = name;
  # end
  #
  # def first_name
  #   @first_name
  # end

  def to_s
    "First name #{@first_name}"
  end

end
