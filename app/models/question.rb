class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :question_votes
  has_many :answer_votes, through: :answers
  belongs_to :user
end
