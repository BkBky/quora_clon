class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_many :questions
  has_many :questions, through: :question_votes
  has_many :answers, through: :questions
  has_many :answers, through: :answer_votes
  has_many :answer_votes
  has_many :question_votes
  # Don't exist question_answered, but is useful when i want to find all question_answered from a particular user. That why i declared a "responder_id" on class "Answer" 
  # "=>"" is rocket
  has_many :questions_answered, :foreign_key => :responder_id, :class_name => "Answer"


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end  
  
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
