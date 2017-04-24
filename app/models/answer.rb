class Answer < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answer_votes   
  belongs_to :question
  belongs_to :responder, class_name: "User"
end
